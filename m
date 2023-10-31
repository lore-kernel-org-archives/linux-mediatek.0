Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D923C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 17:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8+3OvEfjQ1ZOh8i5uNro/eWl301+Vobeupuf3v4yaM=; b=maG+zvMNCjlg+GJRaKVE/KlzbF
	rN8/E8aG4jWrPJJAz4VAVdFGX7kuInVl46cu0k7AnsYDfOZX1753vqPVW8dUFY410/9pRx07wp7gt
	iCp8dPO3qiW6VNxsm4InbCgSzZScuQaEibxuXxeSrJiNm+o+3mFeD+D8owd56rSB1EuCDKH+kzzds
	GILg8dGkCa/dubO9sxclHaUkfzYstNiuIwh6rHt2i4otM07ilCD9Wu5849vofPr13OMfIrC6yKHIB
	5nWWfLjT87yScfA/FO7ENsjPn2malB9LTEQW/5dxRddBML+PKhq9EY5E9l+lGCJfS/sl98DiC9P+a
	K9dgHJFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxsQ8-005q44-25;
	Tue, 31 Oct 2023 17:20:52 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxsQ5-005q2y-0g;
	Tue, 31 Oct 2023 17:20:50 +0000
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b566ee5f1dso485618b6e.0;
        Tue, 31 Oct 2023 10:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698772844; x=1699377644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8+3OvEfjQ1ZOh8i5uNro/eWl301+Vobeupuf3v4yaM=;
        b=WN4LEOzY79oAGdY5jCnb6p5NLBDv2+lA5cm8Q3XxFhmE/80xXe2/NlIdiwhg8JoTcI
         DjxvEEejGpwYD1ebK+eKpXddRXQOqxjbEXipCW1oDCLzHmS65bB6KO5hIkIAOCs+zY/s
         wHD2HwpQ0UOlcRvD21FzLW5pTyp+yXZPkHCVdzCosHYte4OwqS/I6gyEujquHLgYy5xL
         cmk1/+HDQO9G9jsHfpcO7UmjFxAka+C/j0IQ/wNFJDXb91mVUmdNBTd7YIRyBmzcpoB7
         3moGvtEREwOEzx2WwVyHf/S+MEtdVYgci6LPm9c9+zzZ4wG6rYdfQe/nrC4qr9CZ4QfM
         YAhw==
X-Gm-Message-State: AOJu0YxkbhBfi2QbjLXRCPLcGk/DfL2r2ygDnW7o5nx4pNW5FIyccspo
	WKxY6ZmqP5U35gtwCm4imQ==
X-Google-Smtp-Source: AGHT+IGz/RjS0dxuITvu3VVAWhlbRHi/yN8c+EsRazfPmzlB0JHyujRyURQ9PYb8VuqE36ZzsnxseQ==
X-Received: by 2002:a05:6808:218b:b0:3ae:16b6:6346 with SMTP id be11-20020a056808218b00b003ae16b66346mr16940183oib.7.1698772843765;
        Tue, 31 Oct 2023 10:20:43 -0700 (PDT)
Received: from herring.priv ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id dn3-20020a056808618300b003b274008e46sm331948oib.0.2023.10.31.10.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 10:20:43 -0700 (PDT)
Received: (nullmailer pid 1762172 invoked by uid 1000);
	Tue, 31 Oct 2023 17:20:42 -0000
Date: Tue, 31 Oct 2023 12:20:42 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-arm-kernel@lists.infradead.org, David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v9 16/16] dt-bindings: display: mediatek: padding: add
 compatible for MT8195
Message-ID: <169877278691.1760720.771717804140685552.robh@kernel.org>
References: <20231031083357.13775-1-moudy.ho@mediatek.com>
 <20231031083357.13775-17-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031083357.13775-17-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_102049_250324_798F04AB 
X-CRM114-Status: GOOD (  14.27  )
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


On Tue, 31 Oct 2023 16:33:57 +0800, Moudy Ho wrote:
> Add a compatible string for the PADDING block in MediaTek MT8195 that
> is controlled by MDP3.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,padding.yaml           | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring <robh@kernel.org>




