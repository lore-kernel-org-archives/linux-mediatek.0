Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34343C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpxH+0pcpwdGFQIy9DRev+uNqMcyJUe+RuBBYCncU+8=; b=hbfrabJUXeoi+75nsC/czrf1Ra
	vhGOdbfZYrUX64lpXHFraTL77gDC8+BNBi6Hs2iWdXWe4b0jfms4bKH0VLIAxwfsNZD1FoBNEYD0L
	pSrqXmuMnjkQd2Ojcaq3C7VuauoS+V8Q1wuGBJ6XeuYCP5T7aJB3skxxryDQ51YDCymirRv8ynSad
	rdA/W1lWzV/tyYk5Xh7hFdvOTPVbL0u//YKnYoy/pME60cb8mygGpfCnU8PWGdjGP881rpbEsd88U
	IUql9cOCPoQjZIIklxHGOYPcyr0XlI7F76t1TVS1oZPYCdh+Cic+pX6zTvvskHx7tM/+h14pj8ixG
	q6w8A+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHRn1-005prx-L4; Fri, 29 Jul 2022 15:20:35 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHRmr-005plc-4n
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 15:20:26 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-3246910dac3so2507657b3.12
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Jul 2022 08:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JpxH+0pcpwdGFQIy9DRev+uNqMcyJUe+RuBBYCncU+8=;
        b=uaoD4+E11ru9kzNBwgCQg73wXXd8Qu535Vg4usFywm+XxTbn2bQFO0gYrVGIETI09L
         1Mum+2d/sLV21Vijzmrbj3cHaNttcffFcy9nAvdaTJvNLtd0s0nXHj44Wrm7u+85uV7W
         svON+Shi7/KnZtWbSC9jkTaLZoqmXf57fYb62YNvFdcmHwtVGMvoFiz+icftdxSUGTVY
         IoD2YK4GiJMI9Hh9/GR2wDrnRc1RCTLMRNvx3O/BydKEgRdLTdksjyPUwC/YKeuOnt0P
         zmd1FGJUhOgqBbv2Ujh1SwpPJLhxb1YEYgiLyVuf2J0qeDpX38Tlx+1J9/WRnFqfz6HI
         tCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JpxH+0pcpwdGFQIy9DRev+uNqMcyJUe+RuBBYCncU+8=;
        b=fim/mYa/kLq12sm2GSynlI+2v2H5K1e7CM1uJIfKM/D9ZDix3m5QITst2lZerlX7BG
         SuoLehXfcDRcrk+4Vhmt74MHzXNiH3RE8DYG+xsoxM/udAbuksBwJRUSXmxxzBeGnRXA
         MsYPruMMnzd7Dmuxcbt0ORnlc6GxD/1JmOtV9vMf7p0zM403bIbaHNjcJ3/tfxTCTNnG
         c45HGVpZGMIqd1ocudpJ90GEjsGt9qQBHnBkH9hY6r3eYoHmV+6yyjwg4tES/0cNNpnf
         PcG55HhZsSBHY6piEgz5SOyvdIqH6wRW6gILxA/Fgav9OvdBMY3+57+QflngwXByrLzI
         yaTQ==
X-Gm-Message-State: ACgBeo1UkG9lDsygmv1KD6+Bdkk+dLMLEER536R8X8blNtZuy562qgHM
	2PI6cmqLLJAv0vI+YutLBh83o/nnUeNTWKD3NeCaaA==
X-Google-Smtp-Source: AA6agR5LgLR6pYTs5w5w5fc+1Z3RdxkEoqGGkvJvcfN8qQUqzHYmYQWuz6pJKO/kmJsT/6k5rd+apjFglbV7OmOEMoc=
X-Received: by 2002:a81:b046:0:b0:31d:bd47:7fb with SMTP id
 x6-20020a81b046000000b0031dbd4707fbmr3601026ywk.88.1659108021846; Fri, 29 Jul
 2022 08:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220726135506.485108-1-bchihi@baylibre.com> <20220726135506.485108-2-bchihi@baylibre.com>
 <24250d03-b25f-e521-5abd-f36109885c36@linaro.org>
In-Reply-To: <24250d03-b25f-e521-5abd-f36109885c36@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Fri, 29 Jul 2022 17:19:45 +0200
Message-ID: <CAGuA+opxZ7DDrWHcnTRhMcm7YveCAypdy9MDSytt58asgekayw@mail.gmail.com>
Subject: Re: [PATCH v8 1/6] thermal: mediatek: Relocate driver to mediatek folder
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, rui.zhang@intel.com, amitk@kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, khilman@baylibre.com, 
	mka@chromium.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
	matthias.bgg@gmail.com, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	james.lo@mediatek.com, fan.chen@mediatek.com, louis.yu@mediatek.com, 
	rex-bc.chen@mediatek.com, abailon@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_082025_194047_F1BEA1F8 
X-CRM114-Status: GOOD (  13.96  )
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

On Thu, Jul 28, 2022 at 10:53 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
>
> Hi Balsam,
>
> On 26/07/2022 15:55, Balsam CHIHI wrote:
> > Add Mediatek proprietary folder to upstream more thermal zone and cooler
> > drivers. Relocate the original thermal controller driver to it and rename
> > as soc_temp.c to show its purpose more clearly.
>
> I realize the Kconfig, Makefiles format are not consistent across the
> boards. Before I fix this, you can comply to the format:
>
> drivers/thermal/Kconfig:
>
> menu "Mediatek thermal drivers"
> depends on ARCH_MEDIATEK || COMPILE_TEST
> source "drivers/thermal/mediatek/Kconfig"
> endmenu
>
> drivers/thermal/Makefile:
>
> -obj-$(CONFIG_MTK_THERMAL)      += mtk_thermal.o
> +obj-y                          += mediatek
>
> drivers/thermal/mediatek/Kconfig:
>
> config MTK_SOC_THERMAL
>         tristate "Temperature sensor driver for MediaTek SoCs"
>         depends on HAS_IOMEM
>         depends on NVMEM
>         depends on RESET_CONTROLLER
>         help
>                 Enable this option if you want to get SoC temperature
>                 information for MediaTek platforms. This driver
>                 configures thermal controllers to collect temperature
>                 via AUXADC interface.
>
> drivers/thermal/mediatek/Makefile:
>
> obj-$(MTK_SOC_THERMAL)  += soc_temp.o
>
> However, rename 'soc_temp' to something more SoC explicit, eg.
> mtxxx_thermal.c
>
> Thanks
>
>    -- Daniel

Hello Daniel,

Thank you for the feedback.
Changes have been made as you suggested.
Resubmitting seen.

Best regards.
Balsam.

