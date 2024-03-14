Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAC7C54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 10:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQ9xJOrNdcx4ns2opyYFy1nMz7E6ESkxJBC1vTwyjTA=; b=fKKAdLCqV7PsSsCoufcGAMoQeM
	LSAu7eRdI9FTl5gY7D0prlc1MQBgvYD8V/wYU0aYbYozWOdg4L0LOUUBh+hLcp3dQrvDgRo/Vxkc0
	VipTjUVX2NGR33/FEaMCpcmPOFvEhopOTnaj3eRCOTxjDolzQxSuHpDMPogo7sxMDYsxvmBTKJwFF
	U2c9QK9J1WmYqI6tst/k8KLnKum+Asght72hcZWPkzcHF+hV7V3NFkBDBqilbXdJdBTLT43AOKIxC
	6Cl5ipTMcU2L/zDUAjazAGzrYBSv4DCjxGbNphZLyTSrLvgPhPWS3wBScHUzwjqtLVq2yV4IEl8PG
	UdbNfSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkiRM-0000000DvWp-2lC4;
	Thu, 14 Mar 2024 10:36:00 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkiRC-0000000DvRO-2gdI;
	Thu, 14 Mar 2024 10:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710412548;
	bh=QReK/KWVzgQf557F87tkZ7/Pys1J7fmBggS/0JRuhqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r0aP0w+C0idVItdhVePghwV+j80xy/2P7aDOE+0QbCvBNlu2+Ko/y3sxZRl3fnTDn
	 xQdZ+b6v+etgrCxP+9t2TSIBkEuztj5seYouoiLGvgZhg8FjtMYV0ofcXYYtiWWwEJ
	 mPMgqv+Br2q80+FdoaF1FL7tKowKKeLICE5OvrNNCiUu8rq8h3euGq+8WmblBdPAhX
	 U67KMSrqvTTAGzNfT3tEqrvyqd2o7556Bm3Ex08B/7aHKoimYuHTdV8wHRZRjXq8FL
	 enHq05yixx5b3mynSZRUqnnX8mTPJQlH0gahSBQ51MDWA1ch2eUYd6Bs5uA3FhjHxv
	 ioPPCml0y53Tw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0C2A437820D9;
	Thu, 14 Mar 2024 10:35:47 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	jenneron@protonmail.com,
	kernel@collabora.com
Subject: [PATCH 1/2] dt-bindings: arm: mediatek: Add MT8195 HP Chromebook x360 13b-ca0002sa
Date: Thu, 14 Mar 2024 11:34:59 +0100
Message-ID: <20240314103500.93158-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240314103500.93158-1-angelogioacchino.delregno@collabora.com>
References: <20240314103500.93158-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_033550_836335_B0ACABD6 
X-CRM114-Status: UNSURE (   7.19  )
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

Add the MT8195 Cherry platform's Dojo machine, a convertible design
commercially known as the HP Chromebook x360 (13b-ca0002sa).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 09f9ffd3ff7b..5524b095bf3b 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -342,6 +342,14 @@ properties:
           - const: google,tomato-rev3
           - const: google,tomato
           - const: mediatek,mt8195
+      - description: HP Dojo sku1, 3, 5, 7 (HP Chromebook x360 13b-ca0002sa)
+        items:
+          - const: google,dojo-sku7
+          - const: google,dojo-sku5
+          - const: google,dojo-sku3
+          - const: google,dojo-sku1
+          - const: google,dojo
+          - const: mediatek,mt8195
       - items:
           - enum:
               - mediatek,mt8195-demo
-- 
2.44.0


