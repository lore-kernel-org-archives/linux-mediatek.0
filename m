Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEDEC77B73
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 10:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1k/rwLcFO2bB3Oa74LdI4dO5dKJGAnDPj2NzOWcALug=; b=2JHnJRlLWnpdtr4C1hvcwSYSHQ
	7jMDdQ9oagRrgW3ntJvq95e2JkjCJFAsv1fCa5T/YOtQJAgIgJjaY4AGVgxKNSmRNZMrIS/0rBLVi
	JhbgfJMyapdNyyuyH5OrYUaqDz7aL482T61BVcGOtESWVTWxeICIFTUT8dl0ms09dPJRk3KmEjwtC
	gvWihi9ED/KFhJb5IjIRiyIfAXCoSw8HSd+Webz1pf9TWsb8kMa3Z764UN3WVAe6gw+q3C5Rh8Vo4
	O8fs+HTTejBQXqsBbg7AeEj4Xu8QHDNnVL0TWudnK8+HSwTn4sz4ra8uk/dnFBMMsKktx/b89z8YD
	iilWkasA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptnMP-000y0u-0Z;
	Tue, 02 May 2023 10:35:53 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptnMK-000xz7-37
	for linux-mediatek@lists.infradead.org;
	Tue, 02 May 2023 10:35:50 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-518d325b8a2so3116311a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 May 2023 03:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683023747; x=1685615747;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1k/rwLcFO2bB3Oa74LdI4dO5dKJGAnDPj2NzOWcALug=;
        b=FxTb+Whw3s4DsO+LoDJSIj9HK/kqLMLJw5iBHlim3UjK1ozu2HxriBtEICQMGvIr2V
         z8pWvpLlDbSlP9orffy5OMwDMsOUpoJdfHrJjo5lSH7ZLI0NIrTGkdk9srG+MmqLMyf2
         rdS9Rsc6sS1J/zPo6ZtaEkyQHUZNiE1pwYrsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683023747; x=1685615747;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1k/rwLcFO2bB3Oa74LdI4dO5dKJGAnDPj2NzOWcALug=;
        b=P9MKlFKh2HmPUpxBTzBumkBgURIxzVhtzQ+8pNqc+h9Y6GU4LUsCsLUohvOX8KzEOU
         F2HH+XD3/MLJL/SihjVvsRloOqoTTdOHBCB0Kov+GTXj1/UUFz8Ek2jUdWcPsfejXaoj
         tAj6eZgNHNVzAJDWWaZQDZlbXzBEoRWTY/RDjgLxj+/YHeJcIX4u+OP1/wHwdK2QPA0G
         Q40JLODgWX595zN1aXh10ZK0w39J7WkJuvkgvrVbDxZtkTyGwmDPl+UIBFi7K5QHSyHb
         R/hqbenD7zmq6DmY4TlA7dqu3nPf6tghCiCxcUS+wO3rdSR+iLyuzcxfyPdE1g3ENIuX
         Ac2w==
X-Gm-Message-State: AC+VfDwm96xW1LdN9JDX+KQse0J5uwFXZNjgfep6Y3DqEXx53FgZtVlw
	9kfLIY1+cUIid9K7LaJGco2l5Q==
X-Google-Smtp-Source: ACHHUZ7ArtFdVhB+1t61Ffe4OEgVtAY5Cs3jlOqJpXteLdfbH8M29DO6/5eoroavSX0VUh4PxTp2DA==
X-Received: by 2002:a05:6a21:329f:b0:f0:a282:a343 with SMTP id yt31-20020a056a21329f00b000f0a282a343mr22950107pzb.16.1683023746979;
        Tue, 02 May 2023 03:35:46 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:b873:4627:7ea:a0dd])
        by smtp.gmail.com with ESMTPSA id j14-20020a17090a588e00b0024e2980574asm1052755pji.4.2023.05.02.03.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 03:35:46 -0700 (PDT)
Date: Tue, 2 May 2023 18:35:41 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: bchihi@baylibre.com
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
	matthias.bgg@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	james.lo@mediatek.com, rex-bc.chen@mediatek.com,
	nfraprado@collabora.com, abailon@baylibre.com,
	amergnat@baylibre.com, khilman@baylibre.com
Subject: Re: [PATCH v2 0/5] Add LVTS support for mt8192
Message-ID: <20230502103541.GB3388518@google.com>
References: <20230425133052.199767-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230425133052.199767-1-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_033549_003366_3A2B4515 
X-CRM114-Status: GOOD (  13.12  )
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

On Tue, Apr 25, 2023 at 03:30:47PM +0200, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add full LVTS support (MCU thermal domain + AP thermal domain) to MediaTek MT8192 SoC.
> Also, add Suspend and Resume support to LVTS Driver (all SoCs),
> and update the documentation that describes the Calibration Data Offsets.
> 
> Changelog:
>     v2 :
>         - Based on top of thermal/linux-next :
>             base-commit: 7ac82227ee046f8234471de4c12a40b8c2d3ddcc
>         - Squash "add thermal zones and thermal nodes" and
>             "add temperature mitigation threshold" commits together to form
>             "arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones" commit.
>         - Add Suspend and Resume support to LVTS Driver.
>         - Update Calibration Data documentation.
>         - Fix calibration data offsets for mt8192
>             (Thanks to "Chen-Yu Tsai" and "Nícolas F. R. A. Prado").
> 
>     v1 :
>         - The initial series "Add LVTS support for mt8192" :
>             "https://lore.kernel.org/all/20230307163413.143334-1-bchihi@baylibre.com/".
> 
> Balsam CHIHI (5):
>   thermal/drivers/mediatek/lvts_thermal: Add suspend and resume
>   dt-bindings: thermal: mediatek: Add LVTS thermal controller definition
>     for mt8192
>   thermal/drivers/mediatek/lvts_thermal: Add mt8192 support
>   arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones
>   thermal/drivers/mediatek/lvts_thermal: Update calibration data
>     documentation

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on a MT8192 Hayato Chromebook. Sensor readings look OK. Haven't tried
stress testing to hit thermal threshold yet.

