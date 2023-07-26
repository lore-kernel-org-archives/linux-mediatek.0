Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A386C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiHG1lqfKtIgSn5nDbZ/v9AonJn+0BEDVLcqcbo9VMw=; b=YKc4xeWCD0eg09kGr0RvWeZLOZ
	gRlvA/gzr1lB7W/fTDHZtCUGEoIdUWWOqdEKB+iMNgAUATmnUK0tiaw7ZHv858hNGeC8AnNM9fB+P
	09wwWD1+HanUKX8EDazfFRw8mgnSJ+kNUwNV4Vuqff3RVwIRk9/Fm4RAGbLbz5pWWRBea8ldX6b2L
	YJK9sGs4bwFFNciRochVAzIXKG+p6by1xvkTJ6S9fZmDhfbdpmSBJdQl8SoV8aOJ67H8bZG49VYDD
	0LteMULLXaai45R7xjfqw9herkKWmA6qN9pX/6yxZhck+XaXMWh/XjCRVYMceWn+2nKE/mRn5eyP/
	LDkOTOFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZlZ-009ZD8-0J;
	Wed, 26 Jul 2023 08:21:05 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZlW-009ZBZ-0d
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jul 2023 08:21:03 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99bccc9ec02so19415366b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jul 2023 01:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690359660; x=1690964460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JiHG1lqfKtIgSn5nDbZ/v9AonJn+0BEDVLcqcbo9VMw=;
        b=eM07wKpFCUyvyGxNYzYTzgCpEijzkJf7hJHDQc+i/xA/jNEnvHA977kYSn0v/43e+H
         175ADqTKdLFh5yltdkjKiAQquGfKNC7khbSd6pR+Xsx4eMx2/MN2VZeQmwXbsE+avszl
         GhG4wA39gGhGrK9uymQluTkRgUAZDzHXgwPVmxCwfmXs210k8gYsiols3HHWcv9aT4Ds
         B5Z2BDhHLmBoPo9mYXDsSY6eOvwzWjtb7mPc02HjZIqeRrsVSMGcDpKgRM69mg01yyna
         m4onL4BptrTSDHkWGcFMJzCDBAurZ4qUl1eo6zPwT4oPh7wG6VIDUrbWXF86GIUFk+gH
         ct3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690359660; x=1690964460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JiHG1lqfKtIgSn5nDbZ/v9AonJn+0BEDVLcqcbo9VMw=;
        b=Nh/QaH2mMtUJNP9Z20w5UEevo+oMlEw7hSxFGDFiC7GzcJWPLAiv4LewI597c0jwru
         ywdvgqUIaLiFjHgVU9RAIXiVnBRYoAzv6zBMTjPiheOjGcGXePD20CQuOhhYd7IF51EA
         gDmtyYf2WlIz/VZiSbhP+B7fIDh/2v85U4eFucC56VjUzuTYNhxL4Y+BMruSGWcDW3rY
         9KxwioyPiVMIDFmCyxcNOQX/i1cgel2DLwFGgiNQ+2Xk6QfSLP8rFDrT/r9zpPSUyYb4
         eDuyOjY1BbAtHd2RPimz4wdDST+DTfAp55Y07D9rklEjGPXX2fM9BKqg/IF3Kjm0W9PS
         1LSQ==
X-Gm-Message-State: ABy/qLabyL9Hv4T/8NDTZ95ZDIr0GzpQHcsYcPp7nXNHwzCTiDUrt9xK
	x7NF8V7Mi7IU84AVcqu3rlS71Q==
X-Google-Smtp-Source: APBJJlFSv4sPrPVpORIAoXVWqnWYXffFs8Rj+rBO6g/J3M8WgKWJdW/mDG62LCvhpl6DqK28klacEQ==
X-Received: by 2002:a17:907:7851:b0:982:21a1:c4e0 with SMTP id lb17-20020a170907785100b0098221a1c4e0mr1067754ejc.56.1690359660018;
        Wed, 26 Jul 2023 01:21:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906804a00b009893b06e9e3sm9301463ejw.225.2023.07.26.01.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 01:20:59 -0700 (PDT)
Message-ID: <f24f29e9-ff06-5d96-df44-7632a933e4c5@linaro.org>
Date: Wed, 26 Jul 2023 10:20:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Joe Tessler <jrt@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Wenyou Yang
 <wenyou.yang@microchip.com>, Bin Liu <bin.liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <98a77653-ec58-56c4-9893-3b424f67c87e@linaro.org>
 <5afcec8b-b8f6-35b0-278a-5de185e4a7a2@xs4all.nl>
 <ZG9XJCD98VWjGjTN@valkosipuli.retiisi.eu>
 <ZG9ger4WE2VWoVEF@valkosipuli.retiisi.eu>
 <158425ec-86e8-ca3e-eed8-e14b37c42730@linaro.org>
 <ce217ae6-6dd5-26ea-2ce7-95d97ef791c4@linaro.org>
 <ZL+pNUYymeXv5EoU@valkosipuli.retiisi.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZL+pNUYymeXv5EoU@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_012102_236343_602E2E86 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

On 25/07/2023 12:51, Sakari Ailus wrote:
>>
>> I don't think this was merged in v6.5-rc1. It's not in linux-next,
>> either. Another month passed...
> 
> These are now in the media-stage tree
> <URL:https://git.linuxtv.org/media_stage.git/log/>. Assuming nothing goes
> wrong, these should end up in Linus's tree for 6.6.

Great, thank you!

Best regards,
Krzysztof


