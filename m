Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6972DC5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 07:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1M3SJtzz5C3bUSDZkAmRVh+gZoP04r7fK3PelZP1IM=; b=j2fOBqQnrxx5o+KTo3KaAXNuw0
	oAsFJLDTynSSUGXJP4XBkb3jsjDej0iEetCjxt1a7tCpNyU46ii6uli0cB5QiW8HF3cZjBYuFNZ3r
	yYuFZVHqtUvfjOiImnt+pJPlHlVN8O7EzBaJVyDjxIVS89vK6wg9LRPJv/CmawmaR+oE07b+gjfSV
	Dz+KsuBngYPDXYwHwfBxxXSqZwMOsvUsTJDPzD0TOvStbEQ8YwfkL0SAkZOg4jShMzVC661yHWXBq
	FTmarkhM516dWdeu9NKQqEyGBiBgBVbKOUqJ4/UEMqpbbQbtSb+4KTRZURCGKMmHZM+UVfb2DGdP6
	fcuLQ9Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r63wh-0040Fm-14;
	Thu, 23 Nov 2023 07:16:19 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r63wd-0040DU-2t;
	Thu, 23 Nov 2023 07:16:17 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5409bc907edso770249a12.0;
        Wed, 22 Nov 2023 23:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700723772; x=1701328572; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s1M3SJtzz5C3bUSDZkAmRVh+gZoP04r7fK3PelZP1IM=;
        b=nsjvI+fzJWYEIJL1hFtpWxcv9wVb46vKkNDJoXdedLJJ29PkOb3HkIedrXdKMyPL0q
         wfEmgMJDRIc8BiRHu1L/or6LVHeBQLx2DSPzuhV28LwStBIFrmi7neSQTwIAmzknmTw3
         iT+NVYxZc4ChYhl5wsiZ83p7j0kfqfbPngqsXIuY0xs2HSyM/JMMxwdQr41GYkNljfj6
         PZ4oN+rf52K0w7aapFQ2KKmV3mP5dl4olOqncgJyXeGeHjBiSotFT3uGi33CeW04ABQq
         Ua2dQsHPTiCHZnXqI2w4KYGjchlREhgBqnfNp4iScWqBJvnJvp3DDxNB0eGjRXIZU9qF
         Y6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700723772; x=1701328572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1M3SJtzz5C3bUSDZkAmRVh+gZoP04r7fK3PelZP1IM=;
        b=b64VsV9QwIBj4DKIoirqLu8KOC+r1BzW70F0Cmnh65HNvH/8VGxFtvA+oW6T6TaT2p
         tpuNgqcscrVfu0YbBFPUm0RfI5VhUgIBCucfN1AN7d7eqAm3Huc+qlfUYlCJ4FKFiL4S
         hzYCkN6vKQh1D/JbooAuc/w77OGQG5qoJVckQXPg4owy4vExRcvhSfzcCdKjMNvMAWAh
         oGkdESJMkprPxBSxvVgX5o0ynbhTG8aLcokabiYwuzIuFUCnSf52Opk6ar6tVU/V419U
         F3S7LWkRSj80Kapaoj8LtrRQPkbiZmu7g5A1idtBSqwp8et2JeMoWPcEGhL7KHR90hMN
         Pljw==
X-Gm-Message-State: AOJu0Ywd50qU6vLaUz7xWmEKhN5COqrZLrt7IBYClUb3l/BkSX4cgD+h
	fSdMCXKCRWrVfjzVVoc/JXQ=
X-Google-Smtp-Source: AGHT+IG2lzFXoBD5/YVWF8Wdre51d/r4yqSFQ+l4y0uTZy+JK3Ss3+SAA6KwfCsX+vsojVfzrw7Cfg==
X-Received: by 2002:a05:6402:31fc:b0:548:6870:7b73 with SMTP id dy28-20020a05640231fc00b0054868707b73mr1846198edb.41.1700723771352;
        Wed, 22 Nov 2023 23:16:11 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0f2:3200:59ae:788f:5985:cbec? (dynamic-2a01-0c23-c0f2-3200-59ae-788f-5985-cbec.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:59ae:788f:5985:cbec])
        by smtp.googlemail.com with ESMTPSA id y26-20020aa7ccda000000b0053635409213sm328230edt.34.2023.11.22.23.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 23:16:10 -0800 (PST)
Message-ID: <aeb96878-7ce0-48a9-b8f2-fdc9a3c0fc83@gmail.com>
Date: Thu, 23 Nov 2023 08:16:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/20] remove I2C_CLASS_DDC support
To: Thomas Zimmermann <tzimmermann@suse.de>, Wolfram Sang <wsa@kernel.org>,
 intel-gfx@lists.freedesktop.org
Cc: linux-i2c@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
 <4e0cc556-a7eb-48ce-8226-0f5281f3ef0a@suse.de>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <4e0cc556-a7eb-48ce-8226-0f5281f3ef0a@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_231615_932275_D05328E1 
X-CRM114-Status: GOOD (  13.20  )
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

On 23.11.2023 07:56, Thomas Zimmermann wrote:
> Hi
> 
> Am 20.11.23 um 22:46 schrieb Heiner Kallweit:
>> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
>> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
>> Class-based device auto-detection is a legacy mechanism and shouldn't
>> be used in new code. So we can remove this class completely now.
>>
>> Preferably this series should be applied via the i2c tree.
>>
>> v2:
>> - change tag in commit subject of patch 03
>> - add ack tags
>> v3:
>> - fix a compile error in patch 5
>> v4:
>> - more ack and review tags
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> for the patches that don't already have my r-b.
> 
This refers to which patches of the series?
Patches 8, 16, 18 are the remaining ones w/o A-b or R-b.

> Best regards
> Thomas
> 
Thanks, Heiner

>>
>> ---
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c           |    1 -
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
>>   drivers/gpu/drm/ast/ast_i2c.c                     |    1 -
>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c         |    1 -
>>   drivers/gpu/drm/display/drm_dp_helper.c           |    1 -
>>   drivers/gpu/drm/display/drm_dp_mst_topology.c     |    1 -
>>   drivers/gpu/drm/gma500/cdv_intel_dp.c             |    1 -
>>   drivers/gpu/drm/gma500/intel_gmbus.c              |    1 -
>>   drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c        |    1 -
>>   drivers/gpu/drm/gma500/psb_intel_sdvo.c           |    1 -
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |    1 -
>>   drivers/gpu/drm/i915/display/intel_gmbus.c        |    1 -
>>   drivers/gpu/drm/i915/display/intel_sdvo.c         |    1 -
>>   drivers/gpu/drm/loongson/lsdc_i2c.c               |    1 -
>>   drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c           |    1 -
>>   drivers/gpu/drm/mgag200/mgag200_i2c.c             |    1 -
>>   drivers/gpu/drm/msm/hdmi/hdmi_i2c.c               |    1 -
>>   drivers/gpu/drm/radeon/radeon_i2c.c               |    1 -
>>   drivers/gpu/drm/rockchip/inno_hdmi.c              |    1 -
>>   drivers/gpu/drm/rockchip/rk3066_hdmi.c            |    1 -
>>   drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c            |    1 -
>>   drivers/video/fbdev/core/fb_ddc.c                 |    1 -
>>   drivers/video/fbdev/cyber2000fb.c                 |    1 -
>>   drivers/video/fbdev/i740fb.c                      |    1 -
>>   drivers/video/fbdev/intelfb/intelfb_i2c.c         |   15 +++++----------
>>   drivers/video/fbdev/matrox/i2c-matroxfb.c         |   12 ++++--------
>>   drivers/video/fbdev/s3fb.c                        |    1 -
>>   drivers/video/fbdev/tdfxfb.c                      |    1 -
>>   drivers/video/fbdev/tridentfb.c                   |    1 -
>>   drivers/video/fbdev/via/via_i2c.c                 |    1 -
>>   include/linux/i2c.h                               |    1 -
>>   31 files changed, 9 insertions(+), 47 deletions(-)
> 


