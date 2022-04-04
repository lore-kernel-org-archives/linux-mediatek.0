Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB645C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 19:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=928gKmHL6rD7YCRMOCWLAVhv0JoDoUqZVut+m/0F5n4=; b=D8eoj/Fqcbdieg
	VMhSDS8jJDBqQFK2FYPCBBxQK811API+wZgwbv/lsCyzpe0zfBeVMqUrLKauBElXSHbTqFnkQ6QBk
	592dtZS4aeYXqdOaEuryxj7VNAsErJzZtPvVk4bap+cmu0asm1UbhiJb4If+0ljO6aGRuhoYKYM89
	0OE7dyV34Qp5LO5ImjIxQr6Ad3WkAq63PdSkTVWPJ94nU4i2LU16EjHhzYrnwtcW979C3uKvpGx1l
	uN1A3sYtal+zVbgXSPSnA+mEBMMaywdUV5wdcKc1tMD+OpcuvtVJKX7xy7xqLocnGRHIDdcQdaDoC
	DYV7zKFLlL2XCdi6wVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbSI3-00GGW8-Bo; Mon, 04 Apr 2022 19:23:03 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbSI0-00GGV3-2V; Mon, 04 Apr 2022 19:23:01 +0000
Received: by mail-oi1-f182.google.com with SMTP id b188so11061585oia.13;
 Mon, 04 Apr 2022 12:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WKBlTF79XqHlzgtuNtv6275CX0xRJ50HbuzrT91tU8g=;
 b=rQoYDjhoTZA2CehF+/QIdKka7uM6vmg+ofju+maGpS6bvQfwLcxnW95xxihY45Q1ao
 tBVyNR/LoWdpjoMjAGWrVFuOpmH7bILVzWkxzvwOCJNLJYyWqF60DsfmaB96DyqoFqKu
 WeJBmlbGOhVI6vE0vloj1EQP2hfdlcmWrYevSsXPN0rnBFWjHY1Emt5HG7Q53r3cAieM
 8uJ+mAPmzAaoKQdVDyh6MN6qcR1y5ssnFL2Wp4cosom+FQhSCccp+R6xO67qPZ2dl6LF
 TF/K4vBpeilxMau0tivvQcqaWG8u2SSOHPjcyDKy7r9Y6RAHfnyT9lMRJeOkG8AqNVIH
 /Ajw==
X-Gm-Message-State: AOAM531QSNiGiBSGB9qc1/KaxKwbdjgy6aE5DIzlsZW0HmXqhej7a2Pa
 8V/lyBaaxDfStatIuE8oIA==
X-Google-Smtp-Source: ABdhPJyYU5ZN20QO1onZaEwEsB+CVkebLQ3zOpRklJ6Pq/HgZ2AgQsr/pu9Qk30S2Wn7qSTJgjGIRw==
X-Received: by 2002:a05:6808:de0:b0:2ec:c2ab:50b9 with SMTP id
 g32-20020a0568080de000b002ecc2ab50b9mr298493oic.254.1649100177005; 
 Mon, 04 Apr 2022 12:22:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d12-20020a056871040c00b000d9eed0f8fdsm4545924oag.14.2022.04.04.12.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 12:22:56 -0700 (PDT)
Received: (nullmailer pid 1802031 invoked by uid 1000);
 Mon, 04 Apr 2022 19:22:55 -0000
Date: Mon, 4 Apr 2022 14:22:55 -0500
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 linux-mmc@vger.kernel.org, wenst@chromium.org, chunfeng.yun@mediatek.com,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 Wenbin Mei <wenbin.mei@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>
Subject: Re: [PATCH v13 1/2] dt-bindings: mmc: mtk-sd: increase reg items
Message-ID: <YktFjwb6ZqfOyqUe@robh.at.kernel.org>
References: <20220330094532.21721-1-tinghan.shen@mediatek.com>
 <20220330094532.21721-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220330094532.21721-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_122300_149366_F7578BF6 
X-CRM114-Status: GOOD (  11.64  )
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

On Wed, 30 Mar 2022 17:45:31 +0800, Tinghan Shen wrote:
> MediaTek has a new version of mmc IP since mt8183. Some IO registers
> are moved to top to improve hardware design and named as "host top
> registers".
> 
> Add host top register in the reg binding description for mt8183 and
> successors.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
