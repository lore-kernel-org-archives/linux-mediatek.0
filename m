Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA17CC3A59D
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 17:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/+qwOcJ+Ykv/tsQAvaNcC2RFDOgqrMsuP9mqjxWRnA=; b=Z9gz5Dg37I6lPm
	sCJhj4JLDizwLAU4jHqTSWrlp+0ANr9j8PqGWcBLJuupW78GdVb5nokqX+jC6Kop/0z6OH+6OhIBq
	wUTrheGiruFfYRrDfQmzoCfy1Z/zkDraBbB0FyHfaf8TJM3n7rVPWwjM/mzfY3xLLYrhRCKzvzjpa
	ycbgp5h2KK5ak0eMnA4RGedvjnEKPmXjeN5ceGPFOSk1xOgyTfZGd7OR8xywkfptzHX6RSIsscZvj
	DdJqWfXLgNglCXVhFDgXku7dIRUL9AlfKzjgh65rI/3PKKGHziKxsZIDoM5WXnL7eNm/lwaw/0Hzi
	NXPZ21AOcJl+DV9M2p4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omeNd-00FmQa-5w; Sun, 23 Oct 2022 17:03:21 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omeNB-00FmJG-P6; Sun, 23 Oct 2022 17:02:55 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id 895A710085C;
	Sun, 23 Oct 2022 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666544568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+/+qwOcJ+Ykv/tsQAvaNcC2RFDOgqrMsuP9mqjxWRnA=;
	b=LVZpdg+qdJ8mDixU4po/b2W0QM58yN/XDmsrGJHfrBjdiWXN6UFnr/hVnILmrgliAOQ7KC
	uc1xHy3g40URxyRYBgMtTzX6EZvo5rYzXk1OCBPIwatL2+xtedyt/UNqmzFlsc9RHt6Pzh
	MQSAy4BKccYrLk2GW1OdKaRjcFqtKxE=
Received: from frank-G5.. (fttx-pool-80.245.79.234.bambit.de [80.245.79.234])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id B2C9F100352;
	Sun, 23 Oct 2022 17:02:47 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] dt-bindings: PCI: mediatek-gen3: add support for mt7986
Date: Sun, 23 Oct 2022 19:02:33 +0200
Message-Id: <20221023170234.83621-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023170234.83621-1-linux@fw-web.de>
References: <20221023170234.83621-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: faab5a44-dd36-424f-82ff-370abfa0d751
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_100253_980505_A2A1B95A 
X-CRM114-Status: UNSURE (   8.12  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible string for mt7986.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index af0d2201746d..3662422b38ea 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -48,6 +48,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt7986-pcie
               - mediatek,mt8188-pcie
               - mediatek,mt8195-pcie
           - const: mediatek,mt8192-pcie
-- 
2.34.1


