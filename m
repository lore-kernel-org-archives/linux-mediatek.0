Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61156C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 12:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jWuSk1dDtPY+tecayuusPYHmhLKKcjfGDicEFBBIWU=; b=J4QK5u0A3IIoU/dwuiNrDInT/E
	ZNZ9F/j3bRUgdtwUTHd75jsiRXV7/+67c0VqOQmNu9mfhdF9QtjUJo9aMsIIz/gRLc7IpcDhTTsvA
	QpkBf6H5qobGjuY1nujXJZQ9xwbvQcqsRnAgu4efFdtROmPz5n7bq9iiSpsi04jKggoxt25624NDk
	wVZJbm4lFIgI9O6lkhexpHe+cMOmjOtYQLBvvJLDMMeEA2VtC7ylfdv/OuhJpKHo6Ws/l0VtuJdzv
	wGrQYhW8Bviq8IbBO1ODSOFr8LY2InZ8Ipeuh48fBWmvN3Evof9MPuPRIPjJoQBAMvfgMCC/XA4gr
	DUplPVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQpQb-00Cn8e-10; Wed, 24 Aug 2022 12:24:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQpQY-00Cn4b-FS; Wed, 24 Aug 2022 12:24:12 +0000
X-UUID: 958c8954486443b18fd7d5b56c121c79-20220824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2jWuSk1dDtPY+tecayuusPYHmhLKKcjfGDicEFBBIWU=;
	b=Uwh5TfKA0rsmOAQkXhsa2zujqD92vMZH6m30UhDQHfN+YtlyvrPJ5atZbiEX5vC9FDlIzWlNSNx8QKc+agcb9+3jhxKSsufekA8FNMFH+wmdJZ4g8mkh2GsFO5hdtLb/Q3BnMo3uVhpxUcGSV+ddQWIU5seVZ+p1jB98hmBxS0g=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:122f6ea2-b9d0-40e4-b144-7789d971f419,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:100
X-CID-INFO: VERSION:1.1.10,REQID:122f6ea2-b9d0-40e4-b144-7789d971f419,OB:0,LOB
	:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS9
	81B3D,ACTION:quarantine,TS:100
X-CID-META: VersionHash:84eae18,CLOUDID:e26baac9-6b09-4f60-bf82-12f039f5d530,C
	OID:465db6b84101,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 958c8954486443b18fd7d5b56c121c79-20220824
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1381897521; Wed, 24 Aug 2022 05:23:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 24 Aug 2022 20:23:22 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 24 Aug 2022 20:23:21 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<nfraprado@collabora.com>, <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <matthias.bgg@gmail.com>, <jiaxin.yu@mediatek.com>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<project_global_chrome_upstream_group@mediatek.com>, chunxu.li
	<chunxu.li@mediatek.com>
Subject: [PATCH v2 1/2] ASoC: mediatek: dt-bindings: modify machine bindings for SOF
Date: Wed, 24 Aug 2022 20:23:18 +0800
Message-ID: <20220824122319.23918-2-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220824122319.23918-1-chunxu.li@mediatek.com>
References: <20220824122319.23918-1-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_052410_678196_3A40FE32 
X-CRM114-Status: GOOD (  10.89  )
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

From: "chunxu.li" <chunxu.li@mediatek.com>

Add SOF related field.
1. Add a property "mediatek,adsp", Only when adsp phandle could be
retrieved, from DTS, the SOF related part of machine driver is executed.
2. Add a property "mediatek,dai-link" to support dai-links could be
specified from DTS

Signed-off-by: chunxu.li <chunxu.li@mediatek.com>
---
 .../bindings/sound/mt8186-mt6366-da7219-max98357.yaml  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
index 513cd28b2027..d427f7f623db 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
@@ -43,6 +43,16 @@ properties:
     required:
       - sound-dai
 
+  mediatek,adsp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8186 ADSP platform.
+
+  mediatek,dai-link:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      A list of the desired dai-links in the sound card. Each entry is a
+      name defined in the machine driver.
+
 additionalProperties: false
 
 required:
-- 
2.25.1


