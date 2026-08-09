Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52F3C5AD4E
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 13:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jiE5KveVgNl9XkJ4WjLCf6DiWT0Rzjhuj8+wghGG/qQ=; b=4R6qtFDvzaFX7RCdFyX7cEByGF
	L7Fmb2FpbdTODXW+74v5923Lrokcwf2HZXjSjPuTkPSj0gE8GniIzFdTbgqLBbl/Y0Kwwhm8RgGgg
	3DwhQivAaCfUfCWxtq8Z6x+dNQ8X0U8I1Z0htsJqIvDh773xSseUobCF9KoT6qJtjnCrPhudlaKnX
	blPFFbeCVAk+dAHcF9URlskPr4MC9oqg3aFoeO1IkKpeix5y8uyDWempN5mVtXs1Oy3x+tCPIZUGN
	wUx8N52RL9FQ6iPbg62VS2m7evWHcgDWH3ki6aKzUxOaEwFPYIBhKCZpuxzqbMrpqnvyLmqnFaFsX
	NTgZiQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt3VE-0000000ALmi-14J3;
	Sun, 09 Aug 2026 13:23:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt3VB-0000000ALlr-3S3k
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 13:23:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47fd4531020so522092f8f.3
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786281823; x=1786886623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jiE5KveVgNl9XkJ4WjLCf6DiWT0Rzjhuj8+wghGG/qQ=;
        b=Eoe2Uie0MhSG6MkT2Qry14u66upwKPHeKBbtgXPIrCnM3UxBMA3NvEk4bmZ+4/AC+X
         THYOkxW8IH7nIyTodhkpU2TNKvV+J1p/PAUfFIq2C+HlrpUBKPzkO1bh1fEp16c5/B+U
         5x0PO45eCyPBC067cO6pmNkDrXRzNwaXtoE59vq7/tstJ5Fyc/eIj7robSCsWu2hTPKI
         N/5yZvHSdnIb7qjt9XHWEkCFkaGlGWC2PzE0uK7KYUfDlmUb1AxPuzjvT5TGV5TlQ/SK
         +UyoucHhM6wwLNzzd1KvAL5EFOvxRuES6smTj0r/mnlwi0bI6r0/nY05YzgKuYdJ88t8
         ybMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786281823; x=1786886623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiE5KveVgNl9XkJ4WjLCf6DiWT0Rzjhuj8+wghGG/qQ=;
        b=KNB59a18uD5P2Rb8wacqn2SwzLTvy8yvguFcLuxcR+nwSXQYVzyMTGhKnCZbyduzty
         KaNjBrK2Xpjc1qc04MIIl+jXnPFK0KdLqHdqQntpqaPnnI84HpS+vG0fo9IVTOkBimcJ
         UTb0/+/HBd79AsJguiEbWp4DvRchF0irJPjJbZ4KPfDbvqoIR6kNuHh2moB3H/Hpg6+t
         qar5DpgnR1wgO0cFri96ABKhPqxcILyS0Uz0fUnYzS4YaYCu9ztgC1rd22tDlMQ7+1ct
         FrvWLWx95A4wfLu4GQVnNRc3KXYgD4UgLo8DdyY5phrTkimJMQ7zSMTG6ABC3R6KEdj1
         TYfw==
X-Gm-Message-State: AOJu0YxWLf8RLe5x8+ks5Bg/8LZfKzZHvDLemJUAo7RzP9hLv+BXpUKC
	XDobSrPiv5GbgzReVInLlWva8PxFGrcb3N0EGO7qX8BOUUxjx0rRoO+n73a5dB9o+fHRYA==
X-Gm-Gg: AR+sD106y2XAyxE7u/STtWkbVBFlRVL7pv7eMNJzjUSRTCh71nC+e6T02rdgSg4XztS
	AbyIMdsP10dSWQQ/QRrP3AInSnTNBwAQwEdfBb1Yvh5fPA4G2Ihe7wJ7h0+kAw/OGmh17Pw+6tM
	u0lBEoWE1lyLC5XCzVEyLK1ow+BeePCvhFY6i/IdtlDSa2kwLFb/sGitK37o1WqrWGOs+Ga0F0v
	MRkDYYImGGdbdGxSHsPECbEpqZyKaWTbHwa+coIZ5Rqe9dNrWqG7R068RD2knj17lUC1RK+6H3/
	8ZZ6+rb3QPzbHwJ/Y513ZWLCF8nOui1lnNjbqbKsNFISGiX3Ble2LbaC2M3rXx5/AWR4K8pqbv1
	RDM3qTbFSzefbKHZ3YqfroooKuh81Uftaxdgim/XPmUIEt8ynDRSXSlckOJTm66THC1BSZ+AhrZ
	jjdI7JlOwSPSHmdXr42RLn9TqCP2XfCzIABf02STFA7lWgDVCqbxzUTA==
X-Received: by 2002:a05:6000:2913:b0:47f:973b:71c8 with SMTP id ffacd0b85a97d-47fec62e4eamr46608879f8f.21.1786281823240;
        Sun, 09 Aug 2026 06:23:43 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800214557esm22476356f8f.2.2026.08.09.06.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 06:23:42 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] dt-bindings: mediatek: hdmi-ddc: Correct the compatibles for mt7623-mt8167
Date: Sun,  9 Aug 2026 15:22:24 +0200
Message-ID: <20260809132241.6153-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_062345_869711_17E0926A 
X-CRM114-Status: UNSURE (   9.44  )
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

The HDMI DDC driver for both mt7623 and mt8167 is actually the same as
mt8173-hdmi-ddc and the mt7623n.dtsi board include file already uses
mt8173-hdmi-ddc compatible as a fallback, but the documentation lists
them as separate entries. Correct the binding by adding the correct
fallback.

Fixes the following dtbs_check error in mt7623n-rfb-emmc.dts and
mt7623n-bananapi-bpi-r2.dts:

i2c@11013000 (mediatek,mt7623-hdmi-ddc): compatible:
  ['mediatek,mt7623-hdmi-ddc', 'mediatek,mt8173-hdmi-ddc'] is too long

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2: Simplified error description in commit message.
Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260624173514.19752-1-l.scorcia@gmail.com/

 .../bindings/display/mediatek/mediatek,hdmi-ddc.yaml  | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
index bd8f7b8ae0ff..966127e1ee63 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
@@ -15,10 +15,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt7623-hdmi-ddc
-      - mediatek,mt8167-hdmi-ddc
-      - mediatek,mt8173-hdmi-ddc
+    oneOf:
+      - const: mediatek,mt8173-hdmi-ddc
+      - items:
+          - enum:
+              - mediatek,mt7623-hdmi-ddc
+              - mediatek,mt8167-hdmi-ddc
+          - const: mediatek,mt8173-hdmi-ddc
 
   reg:
     maxItems: 1
-- 
2.43.0


