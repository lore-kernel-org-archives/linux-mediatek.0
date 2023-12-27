Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5D8C46CD4
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Dec 2023 13:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TdS2SB8gqiKhHo2Q4/XiohnvYlRC2A8bxQwPxFGJ3MU=; b=uy/hzZbJZHg2qz8r4q4WPopDS8
	tU1VQelRbc+JVy9OHO5kFjI9H6hqeXBHATYh/ekXs48NX4x5LOGy2HwJsrl4a4kL5t/aIcEoIVsrs
	AJeMw2UGTjrlRrGXVJeUdmQsjBkoKvBvbOCu8MwYcjFh3trTWSp2DVhm2l2BqYoEubY/Y/3g55Bs2
	i57A/AqNWeuRWHvNgU7A3CRpzOOmvvd3Msc5SpGW/8MFNGw0kjWjTQ1x5xaryIIJYG5d8PAMdS4K4
	F8Tsthr45VXf3n12s/pyspaJNWoSW/tltvllvlzyy8IWzzyamucjrJoPZS40b5vX9cyWu36ovV6Qr
	gdtZL68g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rITeA-00Eh4E-2r;
	Wed, 27 Dec 2023 13:08:30 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rITe7-00Eh3G-1f;
	Wed, 27 Dec 2023 13:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703682501;
	bh=jvUeOk62psQZsbMdkKVZNNNG5A+qB2Z6aEW45S/4p1Q=;
	h=From:To:Cc:Subject:Date:From;
	b=LE8nW6o9iLpxjsx2UDxC4w8bFvUiqBCbUaSLGN2QHFcV7Wvo3xQgjPQXLOdfJxYC1
	 e9razMUHVWO2kNDJZJA8djvpDFNJdNPgGKJ15oohl2rupU12EPGneHtvm2rwuFT8Un
	 iRw1ay/k+rjsCP6nc0VtHVpc3LA3yA+IKVdVMGvRSTKboJqy4FuEs/LqjTZ0WgV3zG
	 l2x3agZGwT7bEJ2muGWT+J2QP8ykOAGZqxQbQqLnL9ACZKfiHIEl72DcudVTqXklKV
	 ck7km5lP3naUFlSAOTHnnKSgHLKfGHnzOS6YAfbVP0Elw9NUjOydzd6cDkRgJXWC4E
	 MdXJdsUQdV6Tg==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C56A237801C1;
	Wed, 27 Dec 2023 13:08:20 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: bin.liu@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH 1/2] dt-bindings: media: mediatek-jpeg-encoder: change max ioomus count
Date: Wed, 27 Dec 2023 15:08:11 +0200
Message-Id: <20231227130812.148914-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_050827_705555_856E5026 
X-CRM114-Status: UNSURE (   8.53  )
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

MT8186 has 4 iommus in the list, to cope with this situation, adjust
the maxItems to 4 (instead of previous 2).
Add also minItems as 1 since iommus are mandatory, to avoid warning
on the example.

Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 37800e1908cc..60c75b9312e8 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -38,7 +38,8 @@ properties:
     maxItems: 1
 
   iommus:
-    maxItems: 2
+    minItems: 1
+    maxItems: 4
     description: |
       Points to the respective IOMMU block with master port as argument, see
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
-- 
2.34.1


