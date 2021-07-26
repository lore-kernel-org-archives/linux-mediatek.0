Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAADC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:21:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D16B060F56
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D16B060F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5vPfgMSmes5TYmnc8nkqpMQCVvNACe/wrj6W96lQ60I=; b=VG/35ZooRHo1y7
	EuujzPB93w+aZkpejEEHeVqem8zLvQMtpqZ52AS9mE4+PuguCzXYmPLvZYIjLU3Klj1AAQR72UWqf
	dSZf3EC83zQuWVQQv4j/H7X4G0WWmMNBttYJ+a5ZcfR6CwtWPyDjG/Eu+u/DDfVU0uJNVhzmruqS8
	lPG7enh4D5/S13Q7Aivky0C7CXud+o0HbXlKBvCupvvEP3H69cJStFBoa76fSQVUoRXfo4bC+r1iS
	UuVUpB9efMUaaWMGd6z7H7+KmFNV0RXta8aRHxsFcDm7fL7RDn26hJwauZzTDzsNJYKRdmMztD5Yt
	DK4fX7FA2KbJgKztjNKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7xk0-00Aiez-9N; Mon, 26 Jul 2021 10:21:44 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7xjY-00AiVC-DO
 for linux-mediatek@lists.infradead.org; Mon, 26 Jul 2021 10:21:18 +0000
Received: by mail-lj1-x235.google.com with SMTP id l17so10709579ljn.2
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=70X+o4gxoqVmOcvp7WeXhrzKKX6eGZ5QMDEYtNs6KMA=;
 b=B/vovlhWPxahAXgxBeGB7sRBwdK9X/gPTel9zf2v93GlvKIc/3xPxEBu1pAUg4Ht+y
 htvG8VA7My/I7sobqOofsQkt1nm+2ZKfDI0Pgr7jwLU9txHrfC4NbazSlCGZmB0LvkpA
 eoLYsmPTyHq7PMUGCRp52/P2mQSHA+FzSYG2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=70X+o4gxoqVmOcvp7WeXhrzKKX6eGZ5QMDEYtNs6KMA=;
 b=hGtu4hxCEH/2NtqdVD4ekV32fce3N3MnVYZtF+ZRKBsZZHHlJ8C7HYaFrd/+Kj/t6t
 rZr7/0uGvgcGtvCLA1qHhlmU6ATOZ/pZIADExN9L7OPQ42vbQOCGhoWxpP0YWpJYpO+C
 r4Uu+HlTHNs24QocVmr4lwj2KaX3uqvh2LbORuqvfWfcPWoC+qzsrywuSrSnKBevF8Ek
 v19XtlH6h/EfBaWxz+QSjUbAAmY9T/8bUc2VzlH/Hk6LDBW3Ie16oVQKUJ6yRGXeuA4K
 GX3QmwYPnoU+fMhezyCO2jV6FhtqrWXkrMwb2kTB3xSee7AvxKsSX23YWdb1UICbksri
 MjsA==
X-Gm-Message-State: AOAM531Ayb1LZKHdMivgR570xMTynSPiK+PDjPJMIiIseziDawbLfLUY
 1Trm5Dhi+dWFe2SV+l6HTGw64ibdouqDfR6OvSMS0g==
X-Google-Smtp-Source: ABdhPJxkenPZbBydwKHClv/1HF5JInmSLFW/smf/ijGDtLgwcs2N1oTLO8pBBQNVgoPO0r6jmzMPSV9WgKG+X60d9nI=
X-Received: by 2002:a2e:9215:: with SMTP id k21mr12364515ljg.91.1627294874239; 
 Mon, 26 Jul 2021 03:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210726101451.2118076-1-hsinyi@chromium.org>
In-Reply-To: <20210726101451.2118076-1-hsinyi@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Jul 2021 18:21:02 +0800
Message-ID: <CAGXv+5E+NATyk+QHwi2d_+QAM0ByHB_id9_xOpwHw9kc01hm=w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8173: elm: Use aliases to mmc nodes
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Eizan Miyamoto <eizan@chromium.org>,
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_032116_545391_A66FDDDF 
X-CRM114-Status: GOOD (  18.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 26, 2021 at 6:15 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Use aliases to mmc nodes so the partition name for eMMC and SD card will
> be consistent across boots.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index 21452c51a20a8..be21740d682d0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -10,6 +10,13 @@
>  #include "mt8173.dtsi"
>
>  / {
> +       aliases {
> +               mmc0 = &mmc0;
> +               mmc1 = &mmc1;
> +               mmc2 = &mmc2;

mmc2 is not used or enabled anywhere. Just skip it.
You can have

        mmc2 = &mmc3;

so that the numbers are consecutive.


ChenYu

> +               mmc3 = &mmc3;
> +       };
> +
>         memory@40000000 {
>                 device_type = "memory";
>                 reg = <0 0x40000000 0 0x80000000>;
> --
> 2.32.0.432.gabb21c7263-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
