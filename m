Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49380C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 05:30:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 161B0204FD
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 05:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c3POfqFv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Tgp7wuTv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 161B0204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wgsLlGQujdTefB4sPHQFEUrHEVZ8cKv5qS1XclEg/8w=; b=c3POfqFvl9Q/opDVuAcYJF4L2
	aqAuBixCrW7i03eP/QtS4BRRQ5BrVzoyvY3+Sv696YfBtDsrJs6RVNyvXL5PPS4DSoo/Dtq+CvYbr
	r1zCYfNyzMgtLI5ZUHYccsRNoWTCeEiQT4SdJDKuyBqrkekpQDxJu0k2himkKZiy1BbVzawNvZHAh
	WMqQky+q3eL4tEvlDs1lCxVYxvoiv3IpZd9z2cxNMD6iYzlUB0rEIH6bmvHjd0fBQLQ5wOuQI21FJ
	a1nvM/qDLQcgBUqJuBiG5xoIAt4+dF/S+ivIqvhCbivBoSonJyH2lAzYW2xcPHVdRBJio15EwRH9d
	09tODeMMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kARXb-0006pY-9T; Tue, 25 Aug 2020 05:30:39 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kARXZ-0006ob-0j
 for linux-mediatek@lists.infradead.org; Tue, 25 Aug 2020 05:30:37 +0000
Received: by mail-il1-x143.google.com with SMTP id e11so9377187ils.10
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2020 22:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=neyZL3XwDDi0ek1Ye3rJ4gqwsEJHH61znyG0zceh0QI=;
 b=Tgp7wuTv1IHgsnqufqj9kjl/EVG0o2Nw3FYx6C+gcxh1x2TkxJ8YIs9hPgIs9vpkMJ
 O8R/7xm1A5mAEiLUgFSpsxhojvedDXqhIj3R3FMfpQb1c1M2XdQI68wVDLH5CGgTKY+F
 qKwXfDhK4d7y03HzJ332+JWXqi6jHdnq0TmwNjXxljodZzmAgYin9M1xSm5i30gMP8p2
 961FsHzDOX9anHSzig1GZZv2V4F0L+L2mBOxVpbRQjQ1FEsXG/lwIa6YPzjat2iKui7M
 yY6CMuG17kF6TaLMhrsE3PkSM3if2O6rmzxhKD44cA3tUcn47THJDHSyHwa3Ee5rvZsy
 6RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=neyZL3XwDDi0ek1Ye3rJ4gqwsEJHH61znyG0zceh0QI=;
 b=iDWoH9A211pPRgocRXNzHWpFmOKXQYGK0lGBdV/EOjZolDvr9Ou515kSXNOO7J8Tp+
 qAmcpOeJk2OpUC6gDD4Y89hY6G8Zpo0LmiqEcVQspTpXvRn3NUpCCl5EXP4/7ege9Etn
 c4alVPPXpIS0030Yj/XzCH2ks6kSRSGnjcC/rOYbV6Gb+Mu/hHa5+Nn1uM5ohx10ky2b
 Ix0+yse+bZTWUUPsGgB6bXKR7P+NSd+osWBsiE95G+UpE+xeoZFLF/f1o2Rk2hYQ2Y3y
 VV9Fuc9xhTrQ3tDuio7K8ZA8Y4Z1JxT9xxwg2f8hNmyJ7DBSKVTP/mMuiFLMSX69OyMk
 mDIw==
X-Gm-Message-State: AOAM533nwf5ZWKzdH4/WzlWw7H8B6xqzxpar7+Ed72sdVtmItym3cFbj
 3sCVEVl70mmnVqGx6Z4swPnd2wlO/NBMTHECB6gJFTZUXIc=
X-Google-Smtp-Source: ABdhPJy+FagyNB5/9MOEumL7LTOxvNb64K7Nk3DXYrDlwAYByZ74V/wFNbSr+6jt6N7XAq4eL1Uk36CxIQafL+2NmeY=
X-Received: by 2002:a92:9fdb:: with SMTP id z88mr7872110ilk.57.1598333433252; 
 Mon, 24 Aug 2020 22:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200825152551.1.I6d12081e37d27ba7580a1af877727d882935787a@changeid>
In-Reply-To: <20200825152551.1.I6d12081e37d27ba7580a1af877727d882935787a@changeid>
From: "Anand K. Mistry" <amistry@google.com>
Date: Tue, 25 Aug 2020 15:30:22 +1000
Message-ID: <CAATStaPRS0Tduo7czesD9rzBDfVLgiWrHUQi+kAadGZAvUv+GA@mail.gmail.com>
Subject: Re: [PATCH] CHROMIUM: arm64: dts: mt8183-elm: Set GPU power regulator
 to always on
To: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_013037_128945_5F6A07AA 
X-CRM114-Status: GOOD (  27.04  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

:facepalm: sorry about the subject line. I'll fix it up in the next revision.

On Tue, 25 Aug 2020 at 15:26, Anand K Mistry <amistry@google.com> wrote:
>
> Keep the da9212 BUCKB always-on. This works around an issue on Elm/Hana
> devices where sometimes, the regulator is disabled before scpsys is
> suspended, causing the suspension of scpsys to fail.
>
> Usually, the GPU and scpsys are suspended by the runtime PM before the
> system is suspended, due to the GPU being idle. In this case, scpsys is
> suspended inline with the GPU suspend, which then disables the
> regulator. However, if the GPU is still active when system is suspended,
> GPU suspend occurs but defers suspending scpsys to the PM's noirq phase.
> Since GPU suspend disables the regulator, scpsys isn't powered and
> suspending it fails with the following error:
> [  523.773227] mtk-scpsys 10006000.scpsys: Failed to power off domain mfg_2d
>
> On resume, scpsys is resumed in the noirq phase. Since scpsys requires
> power from the regulator, which is still disabled at this point,
> attempting to turn it on will hang the CPU. A HW watchdog eventually
> reboots the system.
>
> The obvious solution would be to add a link to the regulator from scpsys
> in the devicetree. This would prevent the regulator from being disabled
> until scpsys is suspended. However, in the case where suspending scpsys
> is deferred to the noirq phase, disabling the regulator will fail since
> it is connected over I2C which requires IRQs to be enabled. Even in the
> usual case where scpsys is suspended inline with the GPU, PM will always
> attempt to resume scpsys in noirq. This will attempt to enable the
> regulator, which will also fail due to being unable to communicate over
> I2C.
>
> Since I2C can't be using with IRQs disabled, a workaround is to never
> turn off the regulator.
>
> Measuring power on the GPU rail on a Elm DVT shows that the change in
> power usage is negligible. The two relavent cases are S0 with an idle
> GPU, and S3.
>
> In S0 with an idle GPU, current behaviour with the regulator off:
> @@           NAME  COUNT  AVERAGE  STDDEV      MAX    MIN
> @@         gpu_mw    600     1.74    1.31     6.75   0.00
> ... and with the regulator on, but no load:
> @@           NAME  COUNT  AVERAGE  STDDEV     MAX    MIN
> @@         gpu_mw    600     1.68    1.25    7.13   0.00
> The difference being well within the margin of error.
>
> In S3, current behaviour with the regulator off:
> @@           NAME  COUNT  AVERAGE  STDDEV     MAX    MIN
> @@         gpu_mw    600     0.94    0.74    3.25   0.00
> ... and with the regulator on:
> @@           NAME  COUNT  AVERAGE  STDDEV     MAX     MIN
> @@         gpu_mw    600     0.83    0.66    3.25    0.00
>
> Signed-off-by: Anand K Mistry <amistry@google.com>
>
> ---
>
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index a5a12b2599a4..1294f27b21c1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -304,6 +304,7 @@ da9211_vgpu_reg: BUCKB {
>                                 regulator-min-microamp  = <2000000>;
>                                 regulator-max-microamp  = <3000000>;
>                                 regulator-ramp-delay = <10000>;
> +                               regulator-always-on;
>                         };
>                 };
>         };
> --
> 2.28.0.297.g1956fa8f8d-goog
>


-- 
Anand K. Mistry
Software Engineer
Google Australia

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
