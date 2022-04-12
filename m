Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB92BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 18:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewd3bZr31OvUEqLA2ObCu37JZz0iTy6RdcAxO7zVgoc=; b=Kf+0wVqhXRdWDb
	VdLG+2FoFcXTUJqHjieDFyhiJlfvJb2dj470Hegu7bSy7OcUEBdV5kk6LrHxoq7grOfyAGgBBlMik
	2ZvP/51+Et3o9C/c2J0bJ4KphIUp2oU9Af5b11rFgXOH/8Lwh/LSDIcTfAoWTh3Honn75qK8B69ND
	YCi3eszpbkuiC4rExtqd7RrrVWi27ziauBYyh5ywF9rqgBpIArr3JdlkTjIRnfhBw3/WtsD1sqzHm
	5a81HOTDMo7x8EXbBLZPD8TX+GyM4YBLtLYRXC/fmRK+gieiScYpjcP6px7h2kfXESemg4+Ec4PMm
	NCWQaEJA7EUUDVfe1hmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neLb8-00FUBt-Mv; Tue, 12 Apr 2022 18:50:42 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neLb4-00FUAF-0w
 for linux-mediatek@lists.infradead.org; Tue, 12 Apr 2022 18:50:40 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so4017246pja.0
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Apr 2022 11:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Oms5iy2mleYr1Mgl7rwyTRl8+duDZzaRhXGwsQZnaQs=;
 b=CXdbWRRpd3cCn3mrJPA+ZYQocvpZz5fN/4oggR81pyCNGZXfpt78t4uyPO3Yp9Ex7Y
 BuWoWnS/fv1xYepfgS/kCM0ukkKbZvCTSCucth6UtFKaRoR3i++R+Cwvq/Y3YzrLBfeb
 EnKvon5nrVZEZTojdEhafmOiGLDWp1DeUFQ19Qx5XBxkz0cLrASsVYKGU97F2SPEMJsp
 M2NJ5/FGT9d/51gDleLDWAUN8j9/+jH9wo8MjQzX9hJPx3Nwjdn9RiDys9h3PfBehLpx
 tON0S3pP5P0JBp5SWHgdkdWnRuIY6uTH5EN605v7EGQbyu/Uw5yipFtc6uUhW/i6YRj9
 kBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Oms5iy2mleYr1Mgl7rwyTRl8+duDZzaRhXGwsQZnaQs=;
 b=wVB40UjqXrSctqCvEV2wSsKj+kE6wKJ6aAuBolKRdwmKp8Fu7TO1qLuNeZMUfqCfkI
 JLa7u7R2MJbakNqgksTii6anFQVsyOdqwFZ4vxmaifk4sRzZUyEzXYQRwbdC77mOZW1W
 EZBkqTxVbN164pQ0O6IiMXzSeHFY5KKuA1cRvleCx4C9v4pkCZShQtYWYDdF39OglzN6
 3d6R0hcj3tsflSckSbWyqMz+Ei3ngfk1hZp5refHvUVUQVXfPVOBhD2RYh3fRLZxHWe3
 gsfQ3E36IC8pRyKp94YO/PWOKGY1SBI/rx8MQFoPzl93tf+nE3IvBLh1xVtes3rSv4kS
 BibA==
X-Gm-Message-State: AOAM531xwgZ3Hg7i8WJ9Lf82wT8TSoX/qn6INvHnOHZjiUv2B4Ic02Md
 XebV1LJLqGTv7bc0h6u1Kd/GJQ==
X-Google-Smtp-Source: ABdhPJwEaHm4Ee7dtgbj8JHSPa8nujic46CUZZIHG9/o56zk2ge+ueMJmvoaSjrkqEbJWPjn+7naAg==
X-Received: by 2002:a17:902:f64f:b0:156:f1cc:b284 with SMTP id
 m15-20020a170902f64f00b00156f1ccb284mr31491954plg.147.1649789435921; 
 Tue, 12 Apr 2022 11:50:35 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 y20-20020aa79af4000000b005056a0171bdsm18300610pfp.6.2022.04.12.11.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 11:50:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V2 13/15] cpufreq: mediatek: Link CCI device to CPU
In-Reply-To: <f00e3df2e270e5edc160f8ff1bd8c52a49bf71d5.camel@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-14-rex-bc.chen@mediatek.com>
 <7hfsmn5m9f.fsf@baylibre.com>
 <bc6dd020a1cc3f00f5be2bf2929046b9116bbeef.camel@mediatek.com>
 <7hwnfv4hfr.fsf@baylibre.com>
 <f00e3df2e270e5edc160f8ff1bd8c52a49bf71d5.camel@mediatek.com>
Date: Tue, 12 Apr 2022 11:50:34 -0700
Message-ID: <7h5yne3zlx.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_115038_106633_11EF231D 
X-CRM114-Status: GOOD (  32.00  )
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

Rex-BC Chen <rex-bc.chen@mediatek.com> writes:

[...]

> I can summary what I got now:
>
> 1. Why we need cci for cpufreq in MT8183 and MT8186:
>    a. CCI is a mediatek hw module.
>    b. For mediatek SoCs before MT8183, like MT8173, the CCI hw
>       is not introduced.
>    c. The frequency for cci and cpufreq are determined could
>       be configed at bootloader stage, so the frequency when
>       entering kernel is unknown.
>    d. Cpu little core and cci are using the same regulator.
>    e. If we do not control CCI and just adjust the voltage in
>       cpufreq driver.
>       When we adjust the voltage smaller because we need to reduce
>       the frequency, the CCI could run in high frequency which is
>       set in bootloader.
>       This will cause some problem, the cci could crash.
>
>       Use MT8186 for a example, the bootloader set cci freq as
>       1.385GHz and cpufreq as 2GHz.
>       If entering kernel and we only adjust the cpufreq voltage, if
>       the cpufreq is under 1.618GHz, the cci will be out of spec.
>
>    f. If cpufreq driver wait cci ready, regulator framework will take
>       the highest voltage requests from cci and cpufreq as output
>       so that it prevents from high freqeuncy low voltage crash.
>
>    d. Therefore, I think it's not a good idea to bypass cci device if
>       the ccifreq_supported is true in MT8183 and MT8186.

I do not propose to bypass CCI device.  What both Angelo and I are
saying is just that you need a better way to handle the cases when CCI
is not (yet) enabled.  The current way in the propsed patch is not good
enough.

I fully understand the potential problems with high frequency & low
voltage when using a shared regulator.  But, I think the problem we're
trying to solve here is specific to the initial boot of the platform,
while we are waiting for the CCI driver to be loaded.

The root of the problem is that the CCI bus has constraints on the
voltage regulator that are not defined anywhere until the CCI driver is
loaded.  So to fix that, you need to either:

1) not allow any voltage changes
2) register the CCI device constraints

In the current patch, you attempt to do (1).  There's nothing wrong with
the idea, we just pointed out problems in your implementation,
especially the fact that it does nothing, but it "succeeds" so the
CPUfreq framework will think the OPPs are different from what they
actually are.

Just an idea, but another option could be (2).  While waiting for the
CCI device to be ready, the CPUfreq driver could check the current CCI
freq/voltage and set min/max constraints on the regulator that prevent
CCI from breaking.  These constraints would stay in place until the CCI
driver is ready.  Once the real CCI driver is ready/registerd these
contraints would be removed.

Another version of this same idea would be to check the CCI freq/voltage
and then limit the OPPs available to CPUfreq to only the ones that would
not break CCI.  Then, when CCI is ready/registered, you remove the
limits.

> 2. Check the device link status is DL_DEV_DRIVER_BOUND is used for
>    promising the cci is probed done.
>
> 3. About the cpufreq_driver->target_index
>    a. When I trace the common drivers, I found if the return value is
>       not zero, it will be BUG_ON.
>       ref:
> https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/cpufreq.c#L1471

Right, you should not try to do deferred probe in the ->set_target()
callback.  Deferred probe is meant for init/probe time.

>    b. I also try to move is_ccifreq_ready() to other place, like
>       cpufreq_driver->init and cpufreq probe function.
>       There will be new issue. Do you have any suggetion that we can
>       retern value of DEFER_PROBE?

The only appropriate place is in the probe function.

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
