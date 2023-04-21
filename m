Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993EDC77B7F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 13:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHOqo4HIEyB7ktMTIGmhNIv8WSv4OG8N14TT+vETEfY=; b=zKJ52mLajjv8nV
	ul3M5rjYYsTHX7h82xWK95gwwD4DZRMf+lJZDZw3wy8DAHkn7lNn8N9+rWp2N/b7+4rFdQeTZw2WN
	wZm05ptu+UFKte42jvuTppk39kKnDIYVBpy/suQZeT3sJrTP2n00zHFVA8pZQvtsneWE72OhugCkb
	xxJihUNYyWyNoIKkk7Y5VwbNCfl1FaCDenfAx4ZliZnxZHH0ntWAcRmalczT8c5jT85/HK+qs7sTy
	EhnHjFJNFfRitMrgZFb5vkm7Ljpu3GhmHlJBPmkaGTsf8vuieHlZ13MX4u3fQvpVsMvm7fO4/hzhQ
	Enq4Sp3zGxnifwCqiFaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppqhX-00Axdt-28;
	Fri, 21 Apr 2023 13:21:23 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppqh9-00AxTI-13;
	Fri, 21 Apr 2023 13:21:01 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 97F093FC7E;
	Fri, 21 Apr 2023 13:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1682083254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHOqo4HIEyB7ktMTIGmhNIv8WSv4OG8N14TT+vETEfY=;
	b=o9E6v+gujiezFk2NdyxP//YaF1oxEfhftHFfrnGRImu9HuaQolymY5kM3gNHsJeAy3XTcT
	BaAX02pfjXln71AVTA/54satIDDLpKKxyPvWL2zzG/ODhhyB4qC+YSKTVQ0ZYsluGYZnqa
	aT2nhtcB7b+smEtXP4BPqhv4T50YKWo=
Received: from frank-G5.. (fttx-pool-217.61.159.143.bambit.de [217.61.159.143])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 9E0A810078A;
	Fri, 21 Apr 2023 13:20:53 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v1 1/7] dt-bindings: nvmem: mediatek: efuse: add support for mt7986
Date: Fri, 21 Apr 2023 15:20:41 +0200
Message-Id: <20230421132047.42166-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421132047.42166-1-linux@fw-web.de>
References: <20230421132047.42166-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 360423d2-8823-4f65-8664-11db58bb00fa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_062059_501517_9F61A949 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lars-Peter Clausen <lars@metafoo.de>, Lala Lin <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, "Hui.Liu" <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jonathan Cameron <jic23@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible string for mt7986 SoC.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 75e0a516e59a..e3894f9d566e 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -27,6 +27,7 @@ properties:
           - enum:
               - mediatek,mt7622-efuse
               - mediatek,mt7623-efuse
+              - mediatek,mt7986-efuse
               - mediatek,mt8173-efuse
               - mediatek,mt8183-efuse
               - mediatek,mt8186-efuse
-- 
2.34.1


