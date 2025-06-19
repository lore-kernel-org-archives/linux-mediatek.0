Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8115C7115E
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jun 2025 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mQQX0g/RXBoYey7jHVoGxTSFtEhgzlZ2xKLsOSPaOg=; b=z43mjX/wNK/XuQmbX0220bJKmn
	tk9spwG8rZHlfJKHrZnOnoEopFnvtkEwh1cYR6Dm+jELTxBBQ27yP97+4qVPFOTq1o/j5v/DLPjOV
	YH1cOL2iLcYvWewY+rLIvyxHcXStkG1zkmzH6nJzbVJBAbZH+A9FW5OMaYZd1DI/7CSJOY8EPzVaC
	aPu+p4pBKIOkRquzVRmYoFWesVwFRvM7sqSZRcWMY0R5U8TO0dQrpNrp+xui8bmag9IquSL7j0vh7
	/n3lzTlUcc/QHRN330qFeJ1hxeFlnn9bRgbOFBQ93AGWklE+VWYDGSkxAJBbQVYi630CLYeUYfXYH
	r9/dmq1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAao-0000000CQcy-23d1;
	Thu, 19 Jun 2025 08:25:54 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSA41-0000000CM63-3G7K
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Jun 2025 07:52:03 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55220699ba8so554504e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jun 2025 00:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750319519; x=1750924319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mQQX0g/RXBoYey7jHVoGxTSFtEhgzlZ2xKLsOSPaOg=;
        b=Qilxf40r4QUbgh4083gn0GQkp1ZX3rQl8OBomiHsBEUo8feSk1mUMTBuqN20aHJ1FT
         wCciToBdIWriNjU7P7Y6LTgDyzorWAlFM6PMDu+3EADDZ0+MHMd1g7oSOFO7Wy3xGZB2
         sJE/IiX5jRykyBw0WSbLGs8Et4XrkI0yOJ9N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750319519; x=1750924319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mQQX0g/RXBoYey7jHVoGxTSFtEhgzlZ2xKLsOSPaOg=;
        b=Nh5V3mH9AlzeCIyAd3M/vlmocusdbRhQKWjUOFibozbu1prZaBCkBgPIAewkfENYro
         2UejBa4BVqG9TbhgP0C81jGqzvyAYfOatpJV9Virso08EfCV9zrsu/E+zWb3etb948Qi
         ybeLOkgojnY0jB0jfRqhrpWi3dU3J31d1jZDDqVkglOcxHIyYcTrOYul82J1LNb/F+c/
         md7EAc7gHjzmHsEhGnEc0qzFq6LIYQRoOYRCfxSWanOuysqDTOYAOmmCzMdtlDA0MJsH
         3356O6cGYZAwswLQ8b+ijpvDSop6ZESosZE4equedkYs9INSq8nU/d8Uw5Y24zooyLj7
         S5MQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2D5tZ36N9Yok2aqGScT/Gcr8uv5v0MV3SdvR2NiJBmC3dr8dfUjYDvpxmcSxDZojOMQg/d78MjEwqpAlGSA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd1zsDbXLa/mP+TRLmPxH8vqrN7o9AQIUVNSrb5f1/8Rw92o8q
	OnJtEKBnVd8OXkK+777rq9arat+9xjN9xwMPAGFxFkqCrw0DB4WpwsMGEeRajY5KNNg65ZtC/Ug
	pvoAFpLtJO4Cqq1WLBxawVPEgLJyupGa7RWpSk3wh
X-Gm-Gg: ASbGncsuhVfZqqgPPE6qHjmTYXBaRaeCWJkKS0PyaVobV7fOZrzWIXGDiAfEWEZBSHS
	sTmDnBEGwXoO2s34jQJPRQWBux7ZQTtz1YQy/8RWzyQNdipccUpkqoUdgNFOuzFjygeynjdZ/HV
	IvypdLYNyBr2qyT4QPPSiBBes9LFW/qUH7DvCJtmoxi/oBT/WvSkAyl1D1wlzsCZcELU3XkwE=
X-Google-Smtp-Source: AGHT+IGKSw6WMdR9IoIRey67gW5v3Kd28RATCpIk0gj4cgp0HNOfe/nKQSJBKksAip/SsLckx6UbC9sCyZs1uSNHQ90=
X-Received: by 2002:a05:6512:6ca:b0:553:6488:fa56 with SMTP id
 2adb3069b0e04-553b6f42225mr6061529e87.43.1750319519609; Thu, 19 Jun 2025
 00:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250318102259.189289-1-laura.nao@collabora.com>
 <20250318102259.189289-3-laura.nao@collabora.com> <CAGXv+5E-G0BY5q_EsxOkEEJvqXaX5=Y9PWqNbwysLEFfU-UmAg@mail.gmail.com>
In-Reply-To: <CAGXv+5E-G0BY5q_EsxOkEEJvqXaX5=Y9PWqNbwysLEFfU-UmAg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 Jun 2025 15:51:48 +0800
X-Gm-Features: AX0GCFshC_lgMp9vezDeihTD0kDhQFAT31Y9bBRKASrIpMKtnPIy3f3lDgJ-TQs
Message-ID: <CAGXv+5Ff8jFqURizywr7NedprytSoCz9HvaW__v_Q1LcuzMxrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8192-asurada-spherion: Mark
 trackpads as fail-needs-probe
To: angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	nfraprado@collabora.com, kernel@collabora.com, 
	Laura Nao <laura.nao@collabora.com>, matthias.bgg@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_005201_847017_2E598BFC 
X-CRM114-Status: GOOD (  11.90  )
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

Hi Angelo,

On Wed, Mar 19, 2025 at 12:23=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Tue, Mar 18, 2025 at 6:26=E2=80=AFPM Laura Nao <laura.nao@collabora.co=
m> wrote:
> >
> > Different Spherion variants use different trackpads on the same I2C2
> > bus. Instead of enabling all of them by default, mark them as
> > "fail-needs-probe" and let the implementation determine which one is
> > actually present.
> >
> > Additionally, move the trackpad pinctrl entry back to the individual
> > trackpad nodes.
> >
> > Signed-off-by: Laura Nao <laura.nao@collabora.com>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

It looks like this patch has fallen through the cracks.
Could you pick it up?


Thanks
ChenYu

