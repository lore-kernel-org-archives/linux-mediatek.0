Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27EDCDB479
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2026 17:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y3ESHjFhIcPG4hvwDoMj3pKaSJ5JAGh6fCIgpcDiAdw=; b=g1hSd/TNcdpQOKk2xmr9WlHp7g
	YIPgphYLyiA0PfEpVB5tmjI9c5bfjNW+K9OO9v6uvY8IiqMWdgZ+JILPk5Bnnr3OED1GtSkTUa3qa
	uYR87pIl4EoEXQP/WeXw4tML0J0WOSlyRUmHdR8ywelnL2QoQLRBFgo46aNxMTyGDNS13MjQR5umu
	Ow6jH9zHu3WwlNvezNFQapHOSANukf6TOBu6FTH4CkoVX6U6z3K4oZCiuCUfDG0FQCExqKsK4a4Bz
	+4cYnW6Bptgm0WYvETFzYVmBVB4MwyQbcLtxikyjlfp0KkCKppmbkjXkwyOln7FbxBY6CEUGthoQA
	GGdRbuHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcRW0-00000008B2v-0NiM;
	Wed, 24 Jun 2026 17:35:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcRVy-00000008B2K-1LCb
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jun 2026 17:35:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso1066055e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2026 10:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782322552; x=1782927352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3ESHjFhIcPG4hvwDoMj3pKaSJ5JAGh6fCIgpcDiAdw=;
        b=QF9Isk5G6+bhczhu/J8zF8jwF2UJlqgTem35WADQbG0KHOJZXX8vcamlitnhJx+sal
         RmKLxVlPWK81V27CPtwZG6QR46fsETi5VAid1rJTpfdTh1UQe30fC/yJPgcGF5KN21qL
         TvPbwF1IABmBEDylReINhIbkUStO8BdT/+j4vYcOG6P+6TOmRDDn9RPNPBv6+xDFy45w
         w1azVbxef1C6JztDC3nm81EahS6ejOh+GXTEcYF6uFUl0R7t5nfpUv8OWp8G/7dQGkny
         zv/Lz4Nl0JTaaRj2iqqPjkAmI74lSXz32IbdlXSBGbmmtOY00gSUpXRot4YutdMIWSxE
         FJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782322552; x=1782927352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3ESHjFhIcPG4hvwDoMj3pKaSJ5JAGh6fCIgpcDiAdw=;
        b=mUg0QTmK80FixXXXGM7UStgJb4DMxK03ShLhTO9JQ7mMaP+deSZefCALNoMN5vyyRC
         KF/mR5FVvEScJOTYWNHZ0CTsgcBaW+y6lHyKT+1UQGxwNpn901rrkIpWTFMpnaIPWkDC
         y6Mf11JnU9oedSAfbnzftbKOoiFIDP9eFHAWBEwjzd67DcIB3c+zX5xXR5y7upYYQX1D
         vVZK/gwE0oAKKxV2la+q79HcLr7AGkFtARtNk01v+CLIUFQGMSP03YxGXLR+LUeT7rpo
         QiQCbocCoAykutw7RtrBzXZ0J32NEh5/spoWL5fEG2461bOqlq14YNH9VULFqHfI/o75
         dEgQ==
X-Gm-Message-State: AOJu0YytCXU7t9CjXeNZhobhZSGlOjySWSPNgzXDS7BVX13KhlkBn8g0
	qiNensc4SDFnRPw5KYqM5VYBMN4rqwEF9SBSBSiRvrEnh+yiREaxcvUZ9fBBlJXk
X-Gm-Gg: AfdE7ckcVLIHr95+ii8FWkFEscIuRWshj63Fy14/txW7PXczlcKaehE5Qd9++28HuoG
	gQvnXUgMV2HBQpxRf1nXcRFmLPQ2vgFD7qn9C4SZPyHIUWEjFLH5ztlLQGJHcuXbKn97HBu9sgi
	Uh9zC8p90n7yPM5Ffpc1h35w0QG0PKeYq+mhzEcRH6SSp7EBJvXnA4TUx068bRUpigBSkxUQ6/W
	hXx+XQOqFwNoVdFMcdoRZ+YBKDTTmXHOydmPVC3NdYEuegLUgzCgIAkdMoP1KWudqVG5KyneaaG
	BmqMCnDnLnEbt+ya3afeAcXP9jgYiYKjwwMjj5bjR3qqjzpCYVXZDMNRbqnM0PfPos1xk/vMIcW
	0vY5ju9ixoesvcUmfW3xY6xTdLOGPZAagDUFVMXopvEM5e0bIq0hIl36Z4ViMWrfXng7ZpPYlbg
	sgaR7ySw==
X-Received: by 2002:a05:600c:4503:b0:492:6348:d7b0 with SMTP id 5b1f17b1804b1-4926348d7e5mr17448505e9.18.1782322551566;
        Wed, 24 Jun 2026 10:35:51 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49260d917a5sm41336865e9.2.2026.06.24.10.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 10:35:51 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
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
Subject: [PATCH] dt-bindings: mediatek: hdmi-ddc: Correct the compatibles for mt7623-mt8167
Date: Wed, 24 Jun 2026 19:34:56 +0200
Message-ID: <20260624173514.19752-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_103554_369745_2DC8B776 
X-CRM114-Status: UNSURE (   8.45  )
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

This change fixes the following dtbs_check errors:

DTC [C] arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb
i2c@11013000 (mediatek,mt7623-hdmi-ddc): compatible:
  ['mediatek,mt7623-hdmi-ddc', 'mediatek,mt8173-hdmi-ddc'] is too long
DTC [C] arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb
i2c@11013000 (mediatek,mt7623-hdmi-ddc): compatible:
  ['mediatek,mt7623-hdmi-ddc', 'mediatek,mt8173-hdmi-ddc'] is too long

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
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


