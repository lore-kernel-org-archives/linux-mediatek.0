Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54770C54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 19:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4CJajujD5LCHqYKQc7DCfZ+S0748YjEApgV0a2xuDw=; b=AzcYxIgAN6uC/ViBbPI6PrhWIH
	w59daafJ1J2CuaxbGpjS0NPa3u9xvHMZlz/x5XGnOT55gXj4gH5GYVCU9bjyaWMLIKOhf58Vl7w9G
	drnepQNrW5bHIqDDIDHGTlGAOlxKFoMUhFVOPmOYPbSZYmgVHQ59ffluldDBlzQRC6Bl8EFH/9seM
	HzrFFWPIjKv1n/EK5Yupys3ZDC2QBtjL0iUcSp8P8BBmYflcJiZI0p4W/VJ+663m1SS9FVMOEqdnp
	YSGrz8OpuCgcreA0j4fkGCs+H5b7Zts/7hy3J73O1EgJuUuccljeaH+w3sqCDBBoIutwp1QTYoOOT
	ioDtTxag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPYg-004Bbr-0z; Fri, 13 Jan 2023 19:17:46 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPYd-004Baj-N7; Fri, 13 Jan 2023 19:17:44 +0000
Received: by mail-oi1-f181.google.com with SMTP id d127so18414495oif.12;
        Fri, 13 Jan 2023 11:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4CJajujD5LCHqYKQc7DCfZ+S0748YjEApgV0a2xuDw=;
        b=DWn6cYTBRL3YmZPiIm8B4qlOH9DLbWrWYXfqUyyevAZARF030MslY6Z/LBR4VZ7Znh
         O0CIY7BBTRnrEbkxRFydtGxg6Oi7pVP/f9qFnPJWTdAg3aCKOh2bsdrTho1n97HAj4iF
         DWzFcjlJhKbr6KX7reMxeHfiGJCzJA6CqDqHS87de5mFZkBEl+Hq8/8SovTZc209DP03
         KsH6VbK1BbjbIg1Qnvwt71mCIZ/hrBNjzAYJoErNDRkULbw1P9B6pKwKvix1NTNP09gn
         6e4c2bJhHXCcmRMe45YjaPs3aNXbs9XFDmxLobZ18d5WIIgPlsDU5RopwdjViehZZIQZ
         410g==
X-Gm-Message-State: AFqh2kp1i1QzS6FiY34bH2fsdiYHmBAUqomdE48KnIZ+DKmcxvfGizqc
	Oo/u+iAtkA44TTX2Cwwx/A==
X-Google-Smtp-Source: AMrXdXumnqXHmHJ9OSjT0qtZ37tvwGUWU+z1M/2ahtBoZIkYl48Ps2exVXHLlOF9YRZTNrnHNwii8Q==
X-Received: by 2002:a05:6808:2744:b0:35a:33d:5651 with SMTP id eh4-20020a056808274400b0035a033d5651mr30880409oib.14.1673637462562;
        Fri, 13 Jan 2023 11:17:42 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q10-20020acad90a000000b00354932bae03sm9543137oig.10.2023.01.13.11.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 11:17:42 -0800 (PST)
Received: (nullmailer pid 2757784 invoked by uid 1000);
	Fri, 13 Jan 2023 19:17:41 -0000
Date: Fri, 13 Jan 2023 13:17:41 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, hsinyi@chromium.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: spmi: spmi-mtk-pmif: Document
 mediatek,mt8195-spmi as fallback of mediatek,mt8186-spmi
Message-ID: <167363746062.2757569.16048285089924690318.robh@kernel.org>
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
 <20230111123711.32020-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111123711.32020-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_111743_767208_D1818CEA 
X-CRM114-Status: GOOD (  11.42  )
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


On Wed, 11 Jan 2023 20:37:04 +0800, Allen-KH Cheng wrote:
> The mt8186-spmi is used as compatible with mt8195-spmi on the MT8186,
> document this situation.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml   | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

