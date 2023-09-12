Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29C2CA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 08:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=134sTkyIYJwq60odkndkVX6XDM2LNYnyGhf+IscYT2k=; b=xIWaN0XTiUJTWYXCVIy2gj9TYt
	FG0D+KMETn1SS2HH2FwItSvVghVdB/QfZDaHcpWYVf8AW11fU1nOARxqV/mAx5sV9XR/0rlke4TcY
	OfLeWKSpFi9tn9oN6mTbRdm4mR5dZpG9BKISmArvMWpR0eYVicgUyTISBzM9BMSZv6ZyoNg5y52hY
	tvektskiA71CBspWHb0g77XTIruStBryIuvIFz1YlmkY7PTwSUaK4M+P77t02a1/f0jIiJ8OJFYxn
	E5GXaSXVMV9rreS1gY03QMMQVSaEISgzydfu8CJSGjrVwssbnl2cA3amSMGEUfikuroXeAgu7ipqE
	GVxQOnVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyey-002Yj8-34;
	Tue, 12 Sep 2023 08:22:12 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyew-002Ygu-0s
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 08:22:11 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52a1ce52ef4so6803481a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 01:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694506921; x=1695111721; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=134sTkyIYJwq60odkndkVX6XDM2LNYnyGhf+IscYT2k=;
        b=aEfhXLMAb3a4ayxPksufP4JpFzcVle8Q85BbXBA2WwpEcdYl9TwnoGeZAuYrhRkHGC
         5ZDGPe1fAnQLX/hJB9otgQHYVrADh5iwkwpZ/lJNY1Hlx8di6w/zctC9/9gZcDVp6j4m
         TsJJIR9WwvHb8onoSiTZaeMYT34itj1EylkqTdwnSnFDMulOLrR/rxDp9A84EQQf+SwI
         bhP8yxUYHjd8nsbbakBfXuOOH0ykYLPZoo2inO8ynDON7KIQm7S3jRBHvRX7PMThXrcD
         hdsvcQAPa4RQCx+7rWzon5NphvYyI1qa24RoLncW1QBxIuwPehc/zKICfN/J3Ng8fWJK
         hT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694506921; x=1695111721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=134sTkyIYJwq60odkndkVX6XDM2LNYnyGhf+IscYT2k=;
        b=UsfX99IDRPq9a2Lbk2qW5uK/vPoehzIypos+8ZG4lrDcfjxg5n6z1Tds2JA1aAdLNn
         2e0Fwm18Wud65SwOzuMG4v3ml5FJTFDhxBtCg698tgjMUtsnU8DSakuteyw9B7ZNjyyj
         RvhLWK+yZ4AuOB4CNE/JolpJZhdtJO3O7+S8Ka9ZykR4L+KkX7f7oJJyBJx56mBQCIWG
         bVd40yUhmlq+Fhylvoh5KkxmiYTARdq/C+GbnHPB/UDPXRFIr0Xq3GxlBKUkHWQUn6/w
         6TB34kNgbRO2DCYlPOCrRY7kIX6W+jiu0Ai+zVFTRRdGRRUSkhPVRD+FQV403hF1eRLY
         eEJQ==
X-Gm-Message-State: AOJu0YwHgoI9QTGNYECdva+kRcr7Za332yDOxDEfzvGxG/xmrbLLG7V2
	9CBZv4Du6guKCg1/NoI3Vg9+ZQ==
X-Google-Smtp-Source: AGHT+IGYjGp3CXvM/xYQNS9e1ApRDKROqociEYndRpvvCGZhoBavvvSx1h696r7SBp0u74hDwV9oCQ==
X-Received: by 2002:aa7:d8d0:0:b0:52d:212d:78e8 with SMTP id k16-20020aa7d8d0000000b0052d212d78e8mr9546980eds.34.1694506920920;
        Tue, 12 Sep 2023 01:22:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7ca42000000b0052a401d8ef6sm5611858edt.71.2023.09.12.01.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 01:22:00 -0700 (PDT)
Message-ID: <6b7a229d-54c9-2450-4b37-9acc659cbd12@linaro.org>
Date: Tue, 12 Sep 2023 10:21:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 11/14] media: platform: mtk-mdp3: add mt8195 platform
 configuration
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <20230912075805.11432-12-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912075805.11432-12-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_012210_311895_90EC0D0B 
X-CRM114-Status: GOOD (  13.92  )
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

On 12/09/2023 09:58, Moudy Ho wrote:
> Add MT8195 MDP3 basic configuration in file "mdp_cfg_data.c"
> and corresponding driver data.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

...

>  	{}
>  };
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index 06b7d2b0b814..8b69bd8b91c6 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -21,6 +21,9 @@ static const struct of_device_id mdp_of_ids[] = {
>  	{ .compatible = "mediatek,mt8183-mdp3-rdma",
>  	  .data = &mt8183_mdp_driver_data,
>  	},
> +	{ .compatible = "mediatek,mt8195-mdp3-rdma",

You keep adding undocumented compatibles. Your way of organizing patches
does not have any sense. DTS should not be mixed with media subsystem -
they *CANNOT* go via one subsystem. In the same time bindings are always
going via subsystem, so why are they missing here?

This does not make any sense and such mess at v5 is confusing.

Best regards,
Krzysztof


