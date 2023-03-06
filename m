Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E860AC6FD1B
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvyn9YaeJ86q8W8Lig51PjsTK8zYrWmGcOa1PW4eicM=; b=rwG5Di+xbi8FIV5/v0DwaBJuip
	HypiDu4lG4PsRMaA8aart560d0tZapdyp0mpV+PufmplogZXmUG1YmFSZsPbLp+y/DBg9akc1P3Ud
	HKV+DEK/jIKF39/rSu30xfRSDISmlzoVOaK08P/TZiAAxYrutzDHpb2VomEfeIyHtGfGb9BED/Hrc
	s2SYysZBbM8tjx1ZblQQ/SMsdWL9M82Qryjx7KvT2OzNongo+Xr2/5n0bCb7KJ2cFzV7RLTN9gDAT
	5GUmQtOw758KOEqGX1QkIzqSXFxkYaEPNgohAU0w2b3Q5q8FBD4677GaJErKPxGz2QbMEma4yqb12
	IeZnR9eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZB9p-00CxfR-B4; Mon, 06 Mar 2023 13:45:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZB9k-00Cxdk-Mn
	for linux-mediatek@bombadil.infradead.org; Mon, 06 Mar 2023 13:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xvyn9YaeJ86q8W8Lig51PjsTK8zYrWmGcOa1PW4eicM=; b=HZ/qMmW6BSKvskMlEtWVVTX1qu
	CBlCZJqEOSc5ltIaIF4QxAb0SnO/oDCcbsgzAgNDloeEb97/B4lOA5cDaFubFHyN4W7ZBP11v+2MQ
	vI+7qzk/6mFxeqaUba6ROUSqdsYLzCujL57lIlq+MI6XzIylKvktTa5IXSQmJe834zvqSnWedfqPO
	pr0k01v/l5zbubIBHm4ofEJGwH48pFWLXtFUY/lQxA1Chn8b6eCLDOzOI3oQeGQdndziLnixl5TV6
	m36YdBdyXYGMmJFKvvPwm4+Ok3kprkk43+J5JArP4/34RrEs4vij84imNphisGc6Bt9bqkn37tgDz
	W3DUW2Kw==;
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZAoh-00GgRy-0K
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Mar 2023 13:23:53 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id t39so8065775ybi.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Mar 2023 05:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678109026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvyn9YaeJ86q8W8Lig51PjsTK8zYrWmGcOa1PW4eicM=;
        b=fx9JPxs8+fzKQ6JqYbK+ifFmBjQ8eiYWeu+QMPOh5aQDwncSjoIKNL+6iwAOjYGL09
         3Faqia2eMlfEynDpLbJsBSy18Shb+rKJvTtBtUgqrHGWJsxEBFUk5jymRW2ciTwgAkBj
         Po/2KOc34FC5F1VTHjYFGz/7k77mF4aZk6Xu1s8tuGev7TIh09D/mEHWsAaiA7Wq09Ff
         tvi4rLXv5h/JsFMe/neIUqta45IBBHusMEqepEMZjXSFb1OGWAJOTjlL6QCtSiCbozNh
         D//3aNiuN/Ed5uiK2252qkssT63iyt6DfhlB2t6qIaaMPbKb7TJO/3+omybR4yL88MJ/
         g/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678109026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvyn9YaeJ86q8W8Lig51PjsTK8zYrWmGcOa1PW4eicM=;
        b=v4Cb+RhnADrgPtASgBRDyVug0Bh0QI02aEmVNUIXFSiQfd8P3XwJlfEDPK2yIucOLD
         f3hI9toCtTtaRG69ra7wh/VXtWzE7LAisNNVCygqmeTWAGf0yCjw+cAuENogtsKqQw+Y
         cyxYqb8Q2y1nKSo2tg6vhHStAhdsEfWzMc5617jvgZw8r3mKz7PRRS75Hp26Uyc/1nfl
         Z37IZu97qdyZMa4PbnpT8iBb6zW8sLe4I+NZalylzdIyjPumHURsKar1vjOURbCeFy13
         MbA76+f1gBC0ezCxmAZN/IsjkAHLPOsfYSB0knDUyqntUY/r+KaoNQXrmvhs1Y6KZuIA
         o8Ng==
X-Gm-Message-State: AO0yUKXs3OIbAjkzYLiGW8SN/o+gZ9juhH4guAqp5OXZgCSDkL3dg3Dj
	sIxgJQGA9kxpeTNf+E0vDyjqzLgS+xDRrOoatOG65A==
X-Google-Smtp-Source: AK7set9u5szpr+wnH4nFcOvWFTNqyAYPnIW16Yn+p0DCJfxCmYIAe+HSI0DHLu7vDQphHfezI+/du5AHMakyD/+qNYI=
X-Received: by 2002:a05:6902:4c2:b0:ab8:1ed9:cfd6 with SMTP id
 v2-20020a05690204c200b00ab81ed9cfd6mr6273934ybs.5.1678109026098; Mon, 06 Mar
 2023 05:23:46 -0800 (PST)
MIME-Version: 1.0
References: <20230218065108.8958-1-arinc.unal@arinc9.com> <20230218065108.8958-2-arinc.unal@arinc9.com>
In-Reply-To: <20230218065108.8958-2-arinc.unal@arinc9.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 14:23:34 +0100
Message-ID: <CACRpkdb5vpTW+1VmYjm_28_rFNPpuD1fANdKXN-WdFiajoe30A@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: fix naming inconsistency
To: arinc9.unal@gmail.com
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	=?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_132351_494612_E987587E 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Feb 18, 2023 at 7:51 AM <arinc9.unal@gmail.com> wrote:

> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>
> Some options include "MediaTek", some "Mediatek". Rename all to "MediaTek=
"
> to address the naming inconsistency.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>

Patch applied for fixes.

Yours,
Linus Walleij

