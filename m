Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA53C9830E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 18:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=; b=s5pcbpRLxa0FVm0tc2n1Yt2gTs
	BrnajxLp2YgMjtwyx1IivDK+qCJaM/PolE8DnV2wKMxtNdMqDG2IHpMIwL1SUchGHVFV0uzXVJ6TN
	78VZbxXrSY8QLcc2GnH4Xr6mOmFJdkYemXScdivYpmOKHI1wIEcvJWClTSv/noeQuzM5TLrDcN30T
	gjHGz/UBSQOuHZatEvSWrPP3DxITijEHFPMStWeGUNC5aj90s99VqT4PEjNb1ydVtSpf83xntohD7
	Umy6fQolL0vs+VvqNnnuyEmbAW1ZKTno3xmFLe/IhDpEw7GNK1MRtLFMrzMdy3zbKgJsb8Q8ikwnk
	KqUvBb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nwY-0000000BsoX-3k1w;
	Thu, 24 Sep 2026 18:13:14 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nwW-0000000Bsnf-1zrU
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Sep 2026 18:13:13 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e4aa8d882so353200d50.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 11:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790273590; cv=none;
        d=google.com; s=arc-20260327;
        b=A2Fyo3koVEwbnUQdfhPAt9cW70Dhii9aGBnev9LaB9l9hl0rm/+saOzzmMZkJPlhh+
         RTKpdiExdIAo36ezuDEsA1jdcbw0cdwGt6UKc+5cfiUsGT/hVv2mZAydGfmyknXHgpDq
         nujijbKx7LDDbnfzHIPQUHGxUFvHQGqnn2FYtzKPpTP2N4xn+VViEy3DVCQjEBwMcC3Z
         cUl1gCy66AN2b5ayjJquE4jMvSLonPVTCeca1om5Jwc4arZui1WriTBC7qcG7lD8LvDW
         hjT31+kMGE/azfTs7bWqA/FyvvYsF5Ri/HmDpGFGNn9S48nVbV9ygtt82Cv4brMVToYg
         FL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        fh=lyZtjk/qQD5bljwBg9+CLg2NSEoYRDbOfMsOTAGur2E=;
        b=G+RxR9uxVOvKEoayLTcdhpWFnqiQJuIGqoldpmcrip9TscfSTbXDsG5VvEYxZjlc7T
         eo/Wfor0uTvh5ymrDYZDYNjOg9M2JkTnkXyb/6tPDuM6GAktf6zEUyXXXY424sz1UQI6
         d89ANhcuHKat1o08KEwmM7OIh/5DXzPzD/7XTYngcfD8SbOdRslhP93135XtHgwstiSw
         4FHiikf6swk0mY3gQnnk1wltehbMUvSx8FRgnpUySkEEOMjxEj4ArZyLJBEFUte1S7rW
         ZRIK6+423YtBT+17Ip3sEIS1Ua11H3WFLSKrcTCCqlYLmIR9xQmw4ME8rWcd7g3RWTnr
         4FZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790273590; x=1790878390; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        b=hu0s5fqWQiVSqNI60lJ0imualOOwHFG23fDqCdNoZRVeN0RAIr2NkRX9RUhsNN1xbq
         OMxCvHSjIMlQvZfeLSd67nmgj3tSTYq/mJwz+YkS6o0kcsht+rFqoqPGtgMc8QaNYYzn
         vCWsvXtO/kalhzuIm5SEPjGOh1kn3QN4VsYtBbGCTe747Kph3KE9WayxZeiOiugDH53o
         nS8yxFE8nZsm3T0CMStfKM3SgcKpfLNNFs5jEzbfKvM8DKK+uxkYDVo+PF80fEg3NHbG
         KzsPkRvS2hNmWqs5cOa4iC30bm2mEMB1VzeKDnEvJebNUIz58kyqbpY9T45+ZdEBPX34
         7tEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790273590; x=1790878390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        b=CUZdld7sN9yZWozOHNlEUv3pEmdh9g3ndDseG0L+sP65TpskOzEQR8/HLbRkKfSG3r
         Yk5l/vlJiGEZF3q+XYMPUIMX++NengMOAz5RxC5K3pCjCDEhOI0O2X1lwH3r5Ljqag7p
         A4puXSY5UOns7Fmumco+Whq8j6uUemAOjUOJbKOBlZu+3GvQMzcZHFos/HP5fGxSaM2C
         Zh/ojUb+GNFckhnCYAESdbp2ki+Noct1hK8fKPLHLvzUNmdROYQ2fXyy8loBt4gN9WeV
         nkkmPhxFr0jSO5hUYFIioWODoN+530m09dKqc9s6J19Ov4eAhR5RcbO44o75W70OlqR1
         kxBg==
X-Forwarded-Encrypted: i=1; AKwUvBzmj+k1RDg0Vnnycrrw/byQ7XI03JwiQz7PtqaTWfgIC/EBqgCAs+QdmnuNmDhEwBICmYHB+3vkRW6Fpy4wzg==@lists.infradead.org
X-Gm-Message-State: AFuF++krpoBBjhdp71NTk1rbl3uRpOqo3zZKFlWDyWUijU8q2JNFlAEl
	3wyqlSMIKq0gZ9XpriyY7hiiBh03BpflYe+BJupT7yrCD+dU3ycb3nj3BBNPsNYe/PTf8zKvcYX
	3WzjH2k6GZUCH8DW79I9iiF3UU6IHvIw=
X-Gm-Gg: AYBFou0V4hmbCJWS1pLAJJLm/lwk2CiaLPL61nRaNczNLj4mUINpwwOorz/5sR0Y3ME
	nO3ZTeXu02DKcmQgHFpeqc7YVJrU01VEO9NfWHvRR08PbUCOo6AY+AIVyAYOb65TfLCBkCCb6Y9
	Xxd9cXzPYrOLw5LKefOeoC73F6QVVEosga3b9hcFgDRO+VwB84WYZrE03f8Te/F5SlcbVJ7SwoJ
	sdjpAo8M6Jf7DxVRPoQZLCx2yJvdb2A+0iZx36G2w5yZXuls2hcz5pGevT7UbL1PcTZJBOqRnRo
	g3qlsD+RWixM4xVOT1kpOfNGq62oHJCGRbwMGYfBNchXRrG7jzyfTlSn
X-Received: by 2002:a05:690e:418b:b0:671:5ede:96e2 with SMTP id
 956f58d0204a3-672ed2603d0mr2064645d50.8.1790273590483; Thu, 24 Sep 2026
 11:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Thu, 24 Sep 2026 23:42:59 +0530
X-Gm-Features: AclHuK9xd3dlB_Cgp98d7h2ns81HK8suGpMur6yXKcYJOLZ9LOtfHEkjox28BFY
Message-ID: <CAJ9orWTDrTTRLqwnwu9YMQQKt0k2g7qZEpH6fDcMFcTbTs55KA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] PM: Use %pe to print error pointers symbolically
To: rafael@kernel.org, krzk@kernel.org, amit.kachhap@gmail.com, 
	daniel.lezcano@kernel.org, thara.gopinath@gmail.com, talel@amazon.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, mmayer@broadcom.com, 
	viresh.kumar@linaro.org, sumitg@nvidia.com, peter.griffin@linaro.org, 
	myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-samsung-soc@vger.kernel.org, 
	kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_111312_529371_E54D67ED 
X-CRM114-Status: GOOD (  20.51  )
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

On Sun, Sep 13, 2026 at 12:42=E2=80=AFAM Sumeet Pawnikar <sumeet4linux@gmai=
l.com> wrote:
>
> This patch series is a cleanup for subsystems under power management
> (linux-pm) that converts several instances of error pointer printing
> to use the `%pe` format specifier instead of explicitly casting with
> `PTR_ERR()`.
>
> Currently, many drivers use `PTR_ERR()` paired with `%ld` or `%li` to
> print error codes returned as pointers. By switching to `%pe` and passing
> the error pointer directly, the logging subsystem will automatically
> print the symbolic error name (e.g., `-ENOMEM`, `-EPROBE_DEFER`) when
> `CONFIG_SYMBOLIC_ERRNAME` is enabled, and gracefully fall back to the
> numeric value otherwise.
>
> This change significantly improves the readability of kernel logs and
> dmesg traces during debugging, without introducing any functional changes
> or side effects.
>
> The cleanup has been applied across the following PM subsystems/drivers:
> * powercap (intel_rapl_msr)
> * thermal (cpufreq_cooling, devfreq_cooling, qcom)
> * cpufreq (bmips, cppc, qoriq, s3c64xx)
> * devfreq (imx-bus, imx8m-ddrc)
> * power/supply (various battery and charger drivers)
>
ping for review request on above listed changes in this v2 series.

Thanks,
Sumeet.

> ---
> changes in v2:
>  - Krzysztof kozlowski suggested to use dev_err_probe instead of dev_err
>    for *_probe() functions during review of v1 series. This will be done
>    in different patch series.
>  - Here in v2, reverted the changes for dev_err under *_probe() functions=
.
>
>  - Link to v1: https://lore.kernel.org/all/20260906061755.5103-1-sumeet4l=
inux@gmail.com/
>
> ---
>
> Sumeet Pawnikar (5):
>   power: Use %pe to print error pointers symbolically
>   devfreq: Use %pe to print error pointers symbolically
>   cpufreq: Use %pe to print error pointers symbolically
>   thermal: Use %pe to print error pointers symbolically
>   powercap: intel_rapl: Use %pe to print error pointers symbolically
>
>  drivers/cpufreq/bmips-cpufreq.c            | 4 ++--
>  drivers/cpufreq/cppc_cpufreq.c             | 4 ++--
>  drivers/cpufreq/qoriq-cpufreq.c            | 4 ++--
>  drivers/cpufreq/s3c64xx-cpufreq.c          | 5 ++---
>  drivers/devfreq/imx-bus.c                  | 4 ++--
>  drivers/devfreq/imx8m-ddrc.c               | 3 +--
>  drivers/power/reset/macsmc-reboot.c        | 4 ++--
>  drivers/power/supply/cpcap-charger.c       | 4 ++--
>  drivers/power/supply/intel_dc_ti_battery.c | 2 +-
>  drivers/power/supply/qcom_smbx.c           | 2 +-
>  drivers/powercap/intel_rapl_msr.c          | 4 ++--
>  drivers/thermal/cpufreq_cooling.c          | 4 ++--
>  drivers/thermal/devfreq_cooling.c          | 4 ++--
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c   | 4 ++--
>  14 files changed, 25 insertions(+), 27 deletions(-)
>
> --
> 2.43.0
>

