Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF13FC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 10:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ci7nW5O76X1a58+iI4kZgrCVhPN75VjT3qyOK0pXYnw=; b=HMWsVD7j9na7oZAZSCymqVmz2E
	44FjLvnJRNjH4zC4dfMf3A2VP1pelQtcWbis5C/kLSPSjgaBKSpYHtvgfCv8wmyDSxGAgU0c2IXZB
	jUMj8gV9zwW4bYQ31YT9Z2BN4Mg+Zwdvx9UeKTOmFus631ndYJRJD9KPTmECoWUSarDI9qmclQvog
	NfAx0Rm4kY2X24x/keLVBTjMsoY2K8u/+WgPNBXd4GBTxcic3iLP2cUwg/tkYfbsjcRXnWYAju+Pn
	b/8R58uTYmEwwiBz56Jx6LMeV2JaJrZrKwW+VDk/gULE/+TrmIuLkYceJTjHar9wIUGht7IfaPBcw
	afM1AtiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKcA0-007cKN-3B;
	Tue, 02 Jan 2024 10:38:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKc9x-007cJT-2E;
	Tue, 02 Jan 2024 10:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704191886;
	bh=M7Xvx7dEYV5/Uj992gYqxQaLymoVlWi/PbPy7cgkjUQ=;
	h=From:To:Cc:Subject:Date:From;
	b=M6FRHFMnNf101tyVbQwluru0ACn738DHhwyLERK/KmF+dRrs3xYWo9tKuyPw82ufs
	 hLrbXcwc6ZO6rSlEITpP1N7DgnlNSPTLjG4V15Hxsf8bvtwVvrzYPaZOvDDgdkIonl
	 3j8wFrj8yUD6dwdebN/gQU0zLXcD/7eQuI2cbEF7jvfbSYT1dw9hTPr7QD3wl7J0lI
	 tySu70fkNZN/s0cTU6TjsuNAOd24aJmBSfpH6vGb82ImrZGVxIaQ+F432LnfhGz3jz
	 y6GnyphNK7onHffNSkBT5ncqUVx0cMVgxsRfUM6it7WLur1Gu1NaM9lWAibZNII945
	 lD4i5HpdeyuOw==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BD17D3781FFA;
	Tue,  2 Jan 2024 10:38:05 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	bin.liu@mediatek.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	kernel@collabora.com,
	eugen.hristev@collabora.com,
	matthias.bgg@gmail.com
Subject: [PATCH v2 1/2] dt-bindings: media: mediatek-jpeg-encoder: change max iommus count
Date: Tue,  2 Jan 2024 12:38:00 +0200
Message-Id: <20240102103801.268647-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_023809_943273_9AC2423B 
X-CRM114-Status: UNSURE (   9.55  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes in v2:
fixed typo in subject

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


