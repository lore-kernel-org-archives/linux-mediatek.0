Return-Path: <SRS0=gQ79=JX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB2DC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 09:59:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35297610C8
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 09:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35297610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vkX7QltZ1gDCsXXG5+99Ptcl5GA/Y7jpjHsQZN/Lh5E=; b=er15+h0rp0IIC6Pd2XlPv5kPU
	211ZEQhwBmTgUHLHLVIvMOf5OULBX6girL9vtXepGu8vkYNfTToj6VSwlp9/Do6OgkximSfdhS5eW
	RMud5aiuuFLC8DX3Pf8Ht1n5WGluf/XusafqctbuhuJ0/ersvDy6yBI0ykvViCXUMcXjR29CiCABy
	XJ8hhU7wDQQpZWuCeVMwF+4dwWtBP0br+WGlQk+9gl+1nz5ICDJwnI6wab49D1qOj7VzXyVx15MAY
	MZlhSinpNyGdNKFZ5x65mc6CdgQlG1wAQj2g56+s+hZWoJbITtqTZeWhqRiyzW24xGtrP7UjotTgE
	nnxEg9J5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lay1O-007MiM-In; Mon, 26 Apr 2021 09:59:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lay1C-007Mgi-Mz
 for linux-mediatek@desiato.infradead.org; Mon, 26 Apr 2021 09:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=+nTBzmgMD86ImXMmoPl5Di6Ae0iGMljkfREQq3cZsyk=; b=g0OJGUk3+hJvTGcRSgu2CHzDJV
 RbQhDnH2WiEXcw8D1G3YgRXj5+hm7mLcohcNz9raROJmhaU4lE4J/TLgz77zZ7G+5lAzY3UM70iy/
 0KT73WnS30ClgLP4M3On6z4aQ4st5u8uCv8nKUxEsk9iejHNnGA2LJ9g/DWRcbZhhf+hVq0Hz+a29
 7XFG423OUVxjpsHU1X2jO7ZMhGvG90kMlRNE+wcATT+ty5x1+qdMQ0kOzUQFRh6Sw6KQLagPbct7m
 SLImzptn2xOg7OHrXiGnaamWlrRKF3V0uJnJXM2iPh1NWnw+kEHSzl+HXmFHddZEYVh1DNNtfnsrn
 Hrb3UqIg==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lay19-00FsgG-D8
 for linux-mediatek@lists.infradead.org; Mon, 26 Apr 2021 09:59:05 +0000
Received: by mail-wr1-x42b.google.com with SMTP id x7so55147307wrw.10
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Apr 2021 02:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+nTBzmgMD86ImXMmoPl5Di6Ae0iGMljkfREQq3cZsyk=;
 b=AEIsnJHXmaziJJTcgjFu6iegjOYSLr4FvBPv8J6WWXQxKc3lc6++Dy3OIInY1TdP/n
 MLwhkUhLB4HB61oGv0Vc8PgQL+cvIZ0o3Apk6vGrtY25BHIgJJoMdFgao9oqWHJOQcFe
 rdSVpyh7fixWesbou2peoQ28bg3JUeMSbErXv2EHJh79B+Nrf6LvpW7tfgbDO9tg19Fo
 DPiALE+fVXvMDIHYe30066lKYfmo5V5WQVEdS4J6mv75o6GN443YeEaEa+aaC4kZnP3J
 jyJcCw+LXQ2w4gUnZ0kPgsTl8YZNPTM1GyUhqsd13uQ6NzESdxMZse2nicVNzBYFSQ5m
 vGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+nTBzmgMD86ImXMmoPl5Di6Ae0iGMljkfREQq3cZsyk=;
 b=TjIdlgwlWcOC1eXkAj+fLg4RaQ7OQNWCGRLKvwb/LdMY1Q1aWKekSNtr9zvbPJmsvp
 WHDZCymEL6XxwmUhAA5sLuVrX6mVTQdWAIigwvGmvsZLB/BD1dhTu24FimybgeuA43HN
 VxYtmfA48/n1zUpl6hF4YI8T4iyExZyp373Bv9EGKgLm/qrXMSwevTllpoDJY3A7CwTx
 Sp1AWg0e3WbAc/NnbwaW7WxWOsUgL+2D7iAzGxw2s3YnMijwfyd9eAK79ZeqbOoHFRxM
 OS7m8opPiATqse1ys+xjmbrTwEF/WlWDI3uZq9EIxROOX1LDLwWxFz2m1latAkFS8x0e
 zVhQ==
X-Gm-Message-State: AOAM531V+H3qGVuyW96CD2dikLlWOMhDbtKcNcqsKIBzi73FMcmLISk0
 Wo97XADUh9aZNAMbv/RQOKiACoU5kMurXX8z
X-Google-Smtp-Source: ABdhPJxYhyoXc/WYgqEkHVidVk+IAkNDRwY4zw/XR8iI1ER3qAtb06MVw/1o5q4L+sF01UOiVWbjng==
X-Received: by 2002:adf:bc49:: with SMTP id a9mr22362575wrh.109.1619431141308; 
 Mon, 26 Apr 2021 02:59:01 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:b76e:7362:77c0:ddc3?
 ([2a01:e0a:90c:e290:b76e:7362:77c0:ddc3])
 by smtp.gmail.com with ESMTPSA id g12sm7617152wmh.24.2021.04.26.02.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 02:59:00 -0700 (PDT)
Subject: Re: [PATCH v13 0/4] drm/panfrost: Add support for mt8183 GPU
To: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: fshao@chromium.org, hsinyi@chromium.org, hoegsberg@chromium.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, boris.brezillon@collabora.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20210421052855.1279713-1-drinkcat@chromium.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <c91746ce-88b6-5612-74a5-74600c7761e8@baylibre.com>
Date: Mon, 26 Apr 2021 11:58:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210421052855.1279713-1-drinkcat@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_025903_459759_20CAA093 
X-CRM114-Status: GOOD (  30.51  )
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

Hi,

On 21/04/2021 07:28, Nicolas Boichat wrote:
> Hi!
> 
> This is just a rebase of the v11, untested (but it seems like
> Neil Armstrong recently tested it), with small changes in
> binding and dts. v11 cover follows:
> 
> Follow-up on the v5 [1], things have gotten significantly
> better in the last year, thanks to the efforts on Bifrost
> support by the Collabora team (and probably others I'm not
> aware of).
> 
> I've been testing this series on a MT8183/kukui device, with a
> chromeos-5.10 kernel [2], and got basic Chromium OS UI up with
> mesa 20.3.2 (lots of artifacts though).
> 
> devfreq is currently not supported, as we'll need:
>  - Clock core support for switching the GPU core clock (see 2/4).
>  - Platform-specific handling of the 2-regulator (see 3/4).
> 
> Since the latter is easy to detect, patch 3/4 just disables
> devfreq if the more than one regulator is specified in the
> compatible matching table.
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/cover/20200306041345.259332-1-drinkcat@chromium.org/
> [2] https://crrev.com/c/2608070
> 
> Changes in v13:
>  - devfreq: Fix conflict resolution mistake when rebasing, didn't
>    even compile. Oops.
> 
> Changes in v12:
>  - binding: Fix min/maxItems logic (Rob Herring)
>  - Add gpu node to mt8183-pumpkin.dts as well (Neil Armstrong).
> 
> Changes in v11:
>  - binding: power-domain-names not power-domainS-names
>  - mt8183*.dts: remove incorrect supply-names
> 
> Changes in v10:
>  - Fix the binding to make sure sram-supply property can be provided.
> 
> Changes in v9:
>  - Explain why devfreq needs to be disabled for GPUs with >1
>    regulators.
> 
> Changes in v8:
>  - Use DRM_DEV_INFO instead of ERROR
> 
> Changes in v7:
>  - Fix GPU ID in commit message
>  - Fix GPU ID in commit message
> 
> Changes in v6:
>  - Rebased, actually tested with recent mesa driver.
>  - Add gpu regulators to kukui dtsi as well.
>  - Power domains are now attached to spm, not scpsys
>  - Drop R-B.
>  - devfreq: New change
>  - Context conflicts, reflow the code.
>  - Use ARRAY_SIZE for power domains too.
> 
> Changes in v5:
>  - Rename "2d" power domain to "core2"
>  - Rename "2d" power domain to "core2" (keep R-B again).
>  - Change power domain name from 2d to core2.
> 
> Changes in v4:
>  - Add power-domain-names description
>    (kept Alyssa's reviewed-by as the change is minor)
>  - Add power-domain-names to describe the 3 domains.
>    (kept Alyssa's reviewed-by as the change is minor)
>  - Add power domain names.
> 
> Changes in v3:
>  - Match mt8183-mali instead of bifrost, as we require special
>    handling for the 2 regulators and 3 power domains.
> 
> Changes in v2:
>  - Use sram instead of mali_sram as SRAM supply name.
>  - Rename mali@ to gpu@.
> 
> Nicolas Boichat (4):
>   dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
>   arm64: dts: mt8183: Add node for the Mali GPU
>   drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
>   drm/panfrost: Add mt8183-mali compatible string
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        |  30 ++++-
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   5 +
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   5 +
>  .../boot/dts/mediatek/mt8183-pumpkin.dts      |   5 +
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
>  7 files changed, 168 insertions(+), 1 deletion(-)
> 

Seems this version is ready to be applied if we get a review on the DT ?

Mathias ? could you have a look ?

Neil

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
