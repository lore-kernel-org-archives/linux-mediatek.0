Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80121C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 06:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsVS/7R0dxzsikXc/PdT/FfkUVNz6uPz9eBYzTzhU4M=; b=oUu9vc/kvJTRJP
	daXw1dpsH6qkhGwnt2+lHQmTwANSoyMV5q5tcnzzvR1X2UnLd/lr1Otw8u8CYfLG8d6XtD5FyE+ht
	dRx/AxXk3BSnuBpSM5DZOynMcdT2996WtYeVhqWEWBcv9Sabtt8CYw1kQmXfYwgPUZCHY7DtOU+Ji
	sodLiPaTGmfyGycRan4vc1ZEsQLBNHVCI5dGgW/7qD8Dc1X4WEPvJpX/+L985RXYleqrpTXsb6GFK
	9Yv3UnWd6CQEFn3edJao0r5Iw2I5eEOFSVILe5Tw5Re3x5iSK2Fj8qnpUBosC8Sc1as+GzrUK79CW
	fF3re8X9Ze7JiQ5g9MYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXyUl-004xar-UG; Fri, 03 Mar 2023 06:02:19 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXyUj-004xYq-Qt; Fri, 03 Mar 2023 06:02:19 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-172afa7bee2so1911087fac.6;
        Thu, 02 Mar 2023 22:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677823333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsVS/7R0dxzsikXc/PdT/FfkUVNz6uPz9eBYzTzhU4M=;
        b=Kb/spSKSajU9LBD2Ef/KRzX5WzVnomBcbGnoMYe2t6dMNweIXJA6cdzDlxTB55DnlZ
         5FtUgkydpOajt1u77sQNJTIqcVNFDV7PdyfJzFiHCQFURS4vHRmtPsZCpQ1nP7QUo1Ve
         wi7qIGgaf20rY1FRouBjp00ML98nA/nZGyNnP2Ugl4WXf2yeLU46Xy4f4dIkvaK2dd4R
         fx9U0bADjnpT/LUlzk5GJTLf4yE8nSchRi1tEWIDyxVhHBra96P91j5dzlpiKk/3qRmJ
         vrgDcxFrty7EHKNOoFHiyTDCreNyD6eiWhB/MwYo+mnviHBjqAfUndJLyQgenUtjMdnn
         jIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677823333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsVS/7R0dxzsikXc/PdT/FfkUVNz6uPz9eBYzTzhU4M=;
        b=l1YnBcoa5bHiF5r5t7nSWq8kiHKqKubm+JHMR9qbpZGT03LfBue+FOphh3IkLbE1h5
         P9A9SS6F+BTSZ4IA1B6K2+mWE39iLscUBRwyzjM3Z+fXHNA9WntS57SDprbXWOQKdjpj
         xnCUGDA/scoRZURZkwbnp+gVkg9B+5gSdgn6llxJxQY9KY9OYK8KFup2Y5ete3pJM2+q
         2S6VN1oo2KOtwLcmyQoRtTimEWcmHpBkExykESb1c0vuR3cEVIXKMfEuRElCJ4fmU5Yf
         XFOKEEEDdktcL2eN1yOQrUI17zC5PXBhH9Q9hvq6YcJKc6+hpMnXB2TxZQJrr6ltz2b+
         dabg==
X-Gm-Message-State: AO0yUKW70YM9WKYicSaELbyA38xUDVVYpEgpoqSp9OHYO7UEjr7eZE3D
	5UL+ZtAc0XyiP12ic7/ANzD3D05bAEmFY1iiJ2A=
X-Google-Smtp-Source: AK7set9S4QcSuJePzBJR5ErJRF54NuH/O2am1XDgcwU4k6vq5NkLeE2IzBTbjz7WViCx2z73kcpZsnIxYHwbU2s6yeY=
X-Received: by 2002:a05:6870:a2c2:b0:16e:84ea:f1e9 with SMTP id
 w2-20020a056870a2c200b0016e84eaf1e9mr238613oak.2.1677823333736; Thu, 02 Mar
 2023 22:02:13 -0800 (PST)
MIME-Version: 1.0
References: <20230303002850.51858-1-arinc.unal@arinc9.com> <20230303002850.51858-3-arinc.unal@arinc9.com>
In-Reply-To: <20230303002850.51858-3-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 3 Mar 2023 07:02:01 +0100
Message-ID: <CAMhs-H80LrYJ4avuRFxKaM1Lj54FQM05k8omLJUjfYnpz1GPZw@mail.gmail.com>
Subject: Re: [PATCH 02/20] pinctrl: ralink: {mt7620,mt7621}: add new mediatek
 compatible strings
To: arinc9.unal@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_220217_913345_09013475 
X-CRM114-Status: GOOD (  10.17  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, William Dean <williamsukatube@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 3, 2023 at 1:29 AM <arinc9.unal@gmail.com> wrote:
>
> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>
> This platform from Ralink was acquired by MediaTek in 2011. Then, MediaTe=
k
> introduced these SoCs which utilise this platform. Add new compatible
> strings to address the incorrect naming.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  drivers/pinctrl/ralink/pinctrl-mt7620.c | 1 +
>  drivers/pinctrl/ralink/pinctrl-mt7621.c | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

