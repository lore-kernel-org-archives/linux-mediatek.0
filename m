Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3D4C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 13:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVyozoiaeEmN1Mqspc/fEt9AeFWqakfpxz9o248h/pM=; b=1DjhnmXDdfW99t1axFKAep9mXP
	qasnypRkWdwWWMyXrUuZxfhCou/n/DdqMjd90VVZchNtU25bJmhWDffptPmSpc9Q+qepTSabGWFlH
	+UnnIV/bO0mmI44trdf8pie4giIRwosXWuQoQJSy6h9wxHsndnD+ZN+Urf+LHwf5fDPA3UAi0OSeT
	7VJIfBUvhaj6rWrujHSlOvR7rGEBWfsO/cinxE2PB6onNdkq8naKktpQD1Wi5c9/MjdTX/xwERIYq
	vMmnsqWuQ8yD/LxXJt/2X2uFP7NLg4hZe7aOLGL3XQt/Qa9GABV1mLmL/ib8PrhdE/xkeP2X/RWJP
	3oHxcd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyXgE-009WpQ-1Q;
	Thu, 02 Nov 2023 13:24:14 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyXgA-009WmW-0a;
	Thu, 02 Nov 2023 13:24:12 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c5056059e0so13038551fa.3;
        Thu, 02 Nov 2023 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698931446; x=1699536246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVyozoiaeEmN1Mqspc/fEt9AeFWqakfpxz9o248h/pM=;
        b=aLyfVgB5VX3I7apZfEqYiIyrZm0nyKOcQDH+aoUEAKBMvfhrNmL4IyinPDg8WMIcu9
         AZunmuu/kYAOTC7yYpGeDkZq8Fiptb/j5JTBBaxHPrFzK1vW3m9/ebHcmlAB+o9C9GyV
         9udFqNQBFdSM6NYz6aeUpg/KZF7F0y22bMrYCP/EPuqO1gmQ93K4W9YO7N7MSw4mWlOy
         ZoQxwngvlPajdSkAZ5+O3uFAPUlBsRnH+lbRZWz8NWAgsGNpg8cw8xPOFpiY/4/KfT1I
         QJz6QisKfV8BbmxqtS1XA7I6wCpET3VZe/Nh8vIDg4fcGf7xE2LwFRoGwiq4Qz9UZGhn
         xo0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698931446; x=1699536246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVyozoiaeEmN1Mqspc/fEt9AeFWqakfpxz9o248h/pM=;
        b=pM0aD9TzJEFey3Puazj14rFSlqJ+meZNpCkSe4Yth6D1CrWdQxSxMqTjqz43I1Yaog
         B7cA2+KteBepJmWxqKFvS6yHW+/dDl/oI/a6UhOtdZZ0byK0nmhZDOSdLo9fsmTjChCg
         upgzEQlN1VuN0c7+lkrytr+F1WjX88JAMtOo9ltL7d4TcbPXwUGvomYDw/uNcocwFghg
         PSC8kyXApc8mmtMHeJ1HzkOIV0nylTTM49rdPJYs1Yxq+i/9SWg8lHZc42KQcge8pU1i
         QwGewkMK1rFO/XOkzLCBRbQzPBHs7T3EYLxtxskpWJyLXFkax8hVQeS+D0hgX0S/Ticz
         OpyQ==
X-Gm-Message-State: AOJu0Yz/KszTE8xH8f9CEH5H6fjbRZwn2YH7BYLXyVV9e07XqyRTtfoA
	E2wANLstaISHmbzpXQNQsjATww/wpyKTj8FGIA==
X-Google-Smtp-Source: AGHT+IFw8HNGzdISsA+wihixwdCY6OGHchatKKYXsaUOf/XMUPEES0QyeTbJFs3CMlJoKYUCvmxw0QjnLeqQO6kPsOM=
X-Received: by 2002:a2e:bc29:0:b0:2c5:b583:f167 with SMTP id
 b41-20020a2ebc29000000b002c5b583f167mr17564967ljf.34.1698931445262; Thu, 02
 Nov 2023 06:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231102052426.12006-1-naomi.chu@mediatek.com> <20231102052426.12006-2-naomi.chu@mediatek.com>
In-Reply-To: <20231102052426.12006-2-naomi.chu@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Thu, 2 Nov 2023 22:23:53 +0900
Message-ID: <CAGaU9a8Vn20Bx71mtUPYJgSgO11FXv4bNzScso7Dn2n36etaFw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] ufs: core: Expand MCQ queue slot to
 DeviceQueueDepth + 1
To: naomi.chu@mediatek.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Asutosh Das <quic_asutoshd@quicinc.com>, 
	Can Guo <quic_cang@quicinc.com>, wsd_upstream@mediatek.com, peter.wang@mediatek.com, 
	casper.li@mediatek.com, powen.kao@mediatek.com, alice.chao@mediatek.com, 
	chun-hung.wu@mediatek.com, cc.chou@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_062410_227618_83CDBF1C 
X-CRM114-Status: GOOD (  12.61  )
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

On Thu, Nov 2, 2023 at 2:26=E2=80=AFPM <naomi.chu@mediatek.com> wrote:
>
> From: Naomi Chu <naomi.chu@mediatek.com>
>
> The UFSHCI 4.0 specification mandates that there should always be at
> least one empty slot in each queue for distinguishing between full and
> empty states. Enlarge the `hwq->max_entries` to `DeviceQueueDepth +1`
> to allow UFSHCI 4.0 controllers to fully utilize MCQ queue slots.
>
> Fixes: 4682abfae2eb ("scsi: ufs: core: mcq: Allocate memory for MCQ mode"=
)
> Signed-off-by: Naomi Chu <naomi.chu@mediatek.com>
> ---
>  drivers/ufs/core/ufs-mcq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

