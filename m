Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2792C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 17:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DrSTVU0MouuPAPgDnH3bvO6W0mBoIKC+iPYe6f7yQ8=; b=bup6z4OQnReUrzPWrl4/I3i12O
	1KXSODpvA/YYivGBXUAYwJa34PJgwIaw7IuUnCLeuzdjrZSjoqFQA+PPEHJ6sxB8rlw68AURz3NKE
	Qx2L1oF3d534T+d6RgXKpeJ0LtX/3ZYJ/fmRMN3lqlbVZXsoRQzyb8KYvMhavQkQ4zZzHgLBjGxf7
	5e5Ai7BCbsDxAnMRL4gyizcq7Va1gBOloRGbsi+zbcvBijDiQE3kqkCPH0CbYFKgwCPTdKx2jo7L+
	hWS82thV7ED7R06bNGyxpibZChreOKuUukKFfubvLm4UJhbs8KHJgCH9v2EEozcHzzVSvcMCveWzN
	E9ksWHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQAze-002cHF-52; Thu, 09 Feb 2023 17:45:58 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQAzb-002cGG-D9; Thu, 09 Feb 2023 17:45:56 +0000
Received: by mail-oi1-f169.google.com with SMTP id v15so2280609oie.9;
        Thu, 09 Feb 2023 09:45:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DrSTVU0MouuPAPgDnH3bvO6W0mBoIKC+iPYe6f7yQ8=;
        b=cLODX420G722ErvQNvDNQTYtgC0kH+lx+zhNLsU79STQdJODd5clhr+ec8CB/csn5p
         BRyZ0fhi9OOxGN6juFwlkpUULCU3+I8w4YKSVccKHWZBzHPpyCvSdXdyiqiipOkzJfB/
         6SqXbqu6XQPPT6f/ixYhUxpd46h6njGQbiQBQ60BP9aTF5x2SyYIIdKv6xb86H5md2OY
         Hzm6Pc//XKAnw+fl4ASc4T4PO+obr+XtaEkC++zzYwi56aSvInk0idQJnzz4lvFl5euQ
         mfkQvFdoBey95BwdzpXub/7e19Iwy1riGlyPS47qYEnr3jKXYhaCFesPRyely34UDsed
         ZlaA==
X-Gm-Message-State: AO0yUKWSLtpGMvuYMPGd/BtKI2qtlEdfgEqtkBfr13wcyc4NfRpm6gmG
	fdQm/1V6Ct/9jQB08Gw35g==
X-Google-Smtp-Source: AK7set9jyx6LMJhbcKNlh1fXP27jxIMoQEJ+KUbwmEZRPY53UW1ny3huB384noPvethCecih31RSAw==
X-Received: by 2002:a05:6808:279a:b0:37b:3177:65c with SMTP id es26-20020a056808279a00b0037b3177065cmr5747500oib.28.1675964753686;
        Thu, 09 Feb 2023 09:45:53 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z14-20020a0568301dae00b0068d56f93d73sm973117oti.26.2023.02.09.09.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 09:45:53 -0800 (PST)
Received: (nullmailer pid 556291 invoked by uid 1000);
	Thu, 09 Feb 2023 17:45:52 -0000
Date: Thu, 9 Feb 2023 11:45:52 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: anan.sun@mediatek.com, Xia Jiang <xia.jiang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, yf.wang@mediatek.com, chengci.xu@mediatek.com, iommu@lists.linux.dev, devicetree@vger.kernel.org, Yunfei Dong <yunfei.dong@mediatek.com>, Robin Murphy <robin.murphy@arm.com>, mingyuan.ma@mediatek.com, Joerg Roedel <joro@8bytes.org>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, libo.kang@mediatek.com, kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, youlin.pei@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, nfraprado@collabora.com, Will Deacon <will@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>, Bin Liu <bin.liu@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 02/10] dt-bindings: media: mediatek,jpeg: Remove
 dma-ranges property
Message-ID: <167596475165.556224.15663986433586946843.robh@kernel.org>
References: <20230208053643.28249-1-yong.wu@mediatek.com>
 <20230208053643.28249-3-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208053643.28249-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_094555_463186_6E322409 
X-CRM114-Status: GOOD (  13.60  )
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


On Wed, 08 Feb 2023 13:36:35 +0800, Yong Wu wrote:
> After commit f1ad5338a4d5 ("of: Fix "dma-ranges" handling for bus
> controllers"), the dma-ranges of the leaf node doesn't work. Remove
> it for jpeg here.
> 
> Currently there is only mt8195 jpeg node has this property in upstream,
> and it already uses parent-child node, this property did work. But instead,
> MediaTek iommu will control the masters' iova ranges by the master's
> larb/port id internally, then this property is unnecessary.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Bin Liu <bin.liu@mediatek.com>
> Cc: kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
> Cc: Xia Jiang <xia.jiang@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml | 7 -------
>  .../devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml | 7 -------
>  .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml   | 5 -----
>  3 files changed, 19 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


