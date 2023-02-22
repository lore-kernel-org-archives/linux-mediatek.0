Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBC2C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBgzLfkXpKOGfd/1eNx8Vyt8q2pJnQcGFP33kaJSZLo=; b=HXWUUhT6/vjQbHUKD6FQ5GsNL+
	KmiX7sYoGJ4hkZSUmQoaZYKB8fidHUpGypWe2pEZQ06Ol1r0/g6OuEGgdinaaj5c7XOWHgE7EQqWr
	GJT2NxAIo5sAzfJzhz2cSa5eD4xJlykGcX0cYKXOzcjXzK93aJdXUkBwjN+DnLMy+cvVZmzdPbaQc
	ZCi44YCPnIA5S7zJXHeCl5YZiuZKfsq4mj+8ctTtylNRQkyfcZGoEIuTCdFQqpLVdu6oNvRq29DEt
	oYsa1bjgu3lGplWnPofxrpgpblTsvFUrCbP7kjt0lm7pQpAjM9Nlw8isLJ0xrm8eHE/zTfqUp7Zo2
	btLd3e/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUjyp-00B8Py-EW; Wed, 22 Feb 2023 07:55:59 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUjym-00B8Om-GA
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 07:55:58 +0000
Received: by mail-pj1-x102c.google.com with SMTP id y2so3630667pjg.3
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Feb 2023 23:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oBgzLfkXpKOGfd/1eNx8Vyt8q2pJnQcGFP33kaJSZLo=;
        b=bKcnv4mE5FYO28aQVhL4l7jvPYfuxRvwJx4aDOMpVX7i7lTxPjZ2zeB/msNGjCoAUS
         9BWfwGlpf4nOVynX5qpqDIcuFnNCx1ZYDUxfE0cP0TsmymLnw467Im4PI/aPWvfGTOTq
         fYnOFo4Nyhdr7Pzf7P3ljnJxv/HDvkXFr7eog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBgzLfkXpKOGfd/1eNx8Vyt8q2pJnQcGFP33kaJSZLo=;
        b=36BdvWlJwceFd+9Alu0IDpqIwPMgY6QmHm/4DeEaRbQ5qxTSgDmdkLlSD0E+9I84W7
         o8gZuZklon4dnbrSGbKRZc6PFP9wjPL0cDbcwK8HDi7xKzWw7x/+M0ItxXZGYTU21cp7
         BSa34wA04OSRIFDRyVYHpGt6wiQ2FxB2lRvzM3gLSLavpPTSo0RYFHmEIcM464k65Z9E
         s3DntC0o361XJ0B3h8R5ko2h2EFnAYHVKwVBPFjbviLhYnsvjJNNEZ5m1q0elvlPiIBU
         mHchiIlfOEs1PxMbx8+cmNSWpgZb44BukCDPspHzoc4XTmntL0TbU/MPRc9XCc9gXZ2J
         Eluw==
X-Gm-Message-State: AO0yUKWneRbh6QVbw4RMLS7zbkn9SzB7G0UjaOmoxvd2DqPnVu7rQocc
	Li0Cy/bSe8ROjSgoMwTRrkbYjA==
X-Google-Smtp-Source: AK7set+DvRSC/UTE3/Bo65NIi9ejlfvJh5OTnIy8q82XRhMInMhg/LrhSdfTTPAcfKctZav/mMZuWQ==
X-Received: by 2002:a17:903:110e:b0:19c:ac96:223b with SMTP id n14-20020a170903110e00b0019cac96223bmr509904plh.40.1677052555089;
        Tue, 21 Feb 2023 23:55:55 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:ddae:8a07:7ed9:423d])
        by smtp.gmail.com with ESMTPSA id x24-20020a170902821800b001947222676csm5009278pln.249.2023.02.21.23.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 23:55:54 -0800 (PST)
Date: Wed, 22 Feb 2023 15:55:50 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com,
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com,
	robh@kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 00/10] Panfrost: Improve and add MediaTek SoCs support
Message-ID: <Y/XKhg+wultVbEWW@google.com>
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_235556_600352_3E910DF5 
X-CRM114-Status: GOOD (  20.60  )
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

On Tue, Feb 21, 2023 at 04:37:30PM +0100, AngeloGioacchino Del Regno wrote:
> Changes in v2:
>  - Add power-domain-names commit from Chen-Yu to the series
>  - Kept sram-supply in base schema, overridden for non-MediaTek
>  - Added Reviewed-by tags from Steven Price to the driver commits
>    (as released in reply to v1's cover letter - thanks!)
> 
> This series adds support for new MediaTek SoCs (MT8186/MT8192/MT8195)
> and improves MT8183 support: since the mtk-regulator-coupler driver
> was picked, it is now useless for Panfrost to look for, and manage,
> two regulators (GPU Vcore and GPU SRAM) on MediaTek;
> 
> The aforementioned driver will take care of keeping the voltage
> relation (/constraints) of the two regulators on its own when a
> voltage change request is sent to the Vcore, solving the old time
> issue with not working DVFS on Panfrost+MediaTek (due to devfreq
> supporting only single regulator).
> 
> In the specific case of MT8183, in order to not break the ABI, it
> was necessary to add a new compatible for enabling DVFS.
> 
> Alyssa Rosenzweig (3):
>   drm/panfrost: Increase MAX_PM_DOMAINS to 5
>   drm/panfrost: Add the MT8192 GPU ID
>   drm/panfrost: Add mediatek,mt8192-mali compatible
> 
> AngeloGioacchino Del Regno (6):
>   dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains
>     variation
>   dt-bindings: gpu: mali-bifrost: Allow up to 5 power domains for MT8192
>   dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
>   dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
>   dt-bindings: gpu: mali-bifrost: Add a compatible for MediaTek MT8186
>   drm/panfrost: Add new compatible for Mali on the MT8183 SoC
> 
> Chen-Yu Tsai (1):
>   dt-bindings: gpu: mali-bifrost: Add power-domain-names to base schema
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 67 ++++++++++++++++++-
>  drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       | 28 ++++++++
>  drivers/gpu/drm/panfrost/panfrost_gpu.c       |  8 +++
>  4 files changed, 101 insertions(+), 4 deletions(-)

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8183, MT8186, MT8192, MT8195 with glmark2.

