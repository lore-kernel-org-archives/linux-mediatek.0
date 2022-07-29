Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488A4C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 22:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtHVxHIf1ranp5UWH3YvWfj77wihU7UmTQjplZtOLAo=; b=L728Ixqt0MdS2J0OIHZnVZA0tF
	Rq1PLbNAZ4t1OEbRYUJR9EpF5D+5ibLUu43QI/XoJZPh4eQN4aCTlqmEO7iYv5860/bQ+0Fibm6I7
	RSZswyEENDhfJOIPYpjhGCz/sHM4BBRkkCSngBgvtvXwiHNu/gKb4vBXcYjmOiqi/OWZIhCphYeNJ
	RwYm+//x47jYfIbMS5VPXIdkCgAmGTLPfTjgS55uBipoOTpENzXUJCAY7CPqAN8a1yzC3oW/tZEvj
	hZsSz1cdqI2Ui60cVd6pV5Hx0ZGuAWyW/lwZrttkd99/32c1JWQzxtiQn5Ec04VFgGCIU5UaTPpoS
	cSwz550g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHYx8-00DYAF-UM; Fri, 29 Jul 2022 22:59:30 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHYwx-00DXuh-QH; Fri, 29 Jul 2022 22:59:21 +0000
Received: by mail-il1-f181.google.com with SMTP id z6so2110408iln.13;
        Fri, 29 Jul 2022 15:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=qtHVxHIf1ranp5UWH3YvWfj77wihU7UmTQjplZtOLAo=;
        b=ayJONOWMj6fZwoOqCiTDqTrmY7FUfo2R4/eglkpqVXhzg6FGve8Qb2ryMjtHU8EaE/
         BkQ9r/UFBK2zt9do6v2QaWEeWTLZow8jDRzMgpIpyhA2hcvENqa9UkNVHKGm9G+2oppF
         J22YEj9JZ1se66Z0qbcH2nLuQLKBOdxCh09rVxs7ajPMz1fi3kCSfOxWY6Se2KiSqiVj
         r3JVUFpNpVwFLvzwKLKMm9QQpFG0qWD34QffO67nJ5zsolN6TT2x+cNAzaOqv919JVgo
         LfqoQZGwp52i5aPTQw7xqTHOe50/rd2F2moCbhl2kFYg+a6HpDq6qkk2sonB2aF3uzLk
         2hXQ==
X-Gm-Message-State: AJIora8xWytMTthY7C979jeZfG7svXymPF2mwlOzBI+48sXx6N4kZ1AS
	gO2xb4lnlxAxm3vrYd29Wg==
X-Google-Smtp-Source: AGRyM1uImBYJJceitPtvDPkne05B/TOaHpSUK/ydXKTmD9uWheT6PiMogps3kBxE+zuC91ugtcAjAQ==
X-Received: by 2002:a05:6e02:1c23:b0:2dc:e497:8b12 with SMTP id m3-20020a056e021c2300b002dce4978b12mr2184159ilh.151.1659135558409;
        Fri, 29 Jul 2022 15:59:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f5-20020a056638168500b0033f5e8dab90sm2262072jat.143.2022.07.29.15.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 15:59:17 -0700 (PDT)
Received: (nullmailer pid 96409 invoked by uid 1000);
	Fri, 29 Jul 2022 22:59:15 -0000
Date: Fri, 29 Jul 2022 16:59:15 -0600
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, iommu@lists.linux.dev, linux-mediatek@lists.infradead.org, MandyJH Liu <mandyjh.liu@mediatek.com>, devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 06/20] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
Message-ID: <20220729225915.GA96357-robh@kernel.org>
References: <20220729063208.16799-1-tinghan.shen@mediatek.com>
 <20220729063208.16799-7-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729063208.16799-7-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_155919_869198_B44A95B9 
X-CRM114-Status: GOOD (  11.43  )
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

On Fri, 29 Jul 2022 14:31:54 +0800, Tinghan Shen wrote:
> The System Control Processor System (SCPSYS) has several power
> management related tasks in the system. Add the bindings for it.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/mfd/mediatek,mt8195-scpsys.yaml  | 67 +++++++++++++++++++
>  .../power/mediatek,power-controller.yaml      |  2 +-
>  2 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

