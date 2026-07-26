Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C0CC531CC
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jul 2026 05:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ev/3L8OQlWgePlw96lEzXKu7EjQVakUCH3mo3g6zOGU=; b=ZI9M38XasTRd1PEcQdUd8E6my0
	/Il5T3n3G/Z/aTxwC1ViMQEr8bfKSkyvE+sfJy4XekzPVMeLjQxpNpATW+MmqjoxAdZGjfy8TNokB
	QlBrOq0XAFyeZXM9m5wjzCI38SC1JTOdcCc8qd/OhQMlQCRfZ7hgdLKRgjHgkuNNpoXeJHOorl7Wh
	l2/UYWUTV3jerkoYWS8K0c3iQ5stlsODvOij58YmZ55RukJP5cQiBiBtTenpStt0zDfqHcUUCr+VO
	LtfKlmoSPWnEP3BhTATnGuOjUmyLpU39Dh69vUSfViie2SL4cwOB1eviik+0I08MPaC6IvOkl4dAT
	dA3un0SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnrZT-00000000vcz-3Zun;
	Sun, 26 Jul 2026 05:38:43 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnrZR-00000000vcB-0KEk
	for linux-mediatek@lists.infradead.org;
	Sun, 26 Jul 2026 05:38:42 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84e27035206so1622838b3a.3
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Jul 2026 22:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785044320; x=1785649120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ev/3L8OQlWgePlw96lEzXKu7EjQVakUCH3mo3g6zOGU=;
        b=K6EaAJqrKuI6BoAt6OeuGQJ08280w26DfR0Yy2T+W+urW0YMaFaAf7yHx32l+K1VbF
         NxTdUvPqDmn/tsSW2aA35sfJtaJpscGhK0+jU3dR+vcXuIxNn8wb3+BEVr+BoUZVe1cv
         X8vYvxYbzYvkzj15sJTvdVELLZVPINTqnJq3oto0nvv23Gexi7mgifwBap/nrDHl8jkM
         L/SAKJFujXoDDjNjHV0A8vNuxJ65Cu/udjymJ8RHjvU0rH2L+rdtm7sNLz4h7IROtamC
         eNRx9LdGXweuKOVt7NHvJ6L0FWYdRlMipK9dee7gmHId2vYk/GbeuFjE5+Bx9swVoD3z
         i5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785044320; x=1785649120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ev/3L8OQlWgePlw96lEzXKu7EjQVakUCH3mo3g6zOGU=;
        b=TXvnzrjLLJeDbGQIzswqwHtUheNzx49Ck/2dlD8d1I4w8DxifxRtHI63lPAiARi09I
         v3oUocF6ErvYncaI4Sjho0UDKBA3+kUiHcpaWEdOIXfVdz/ZtUv6aw97JP3bUTckMztP
         PrlPcYgxcmYKe70gGl57ZJFmze5Y5jsPICxdwOfuBUGn37NSTPp7UO/LU1yEdJ31VsHq
         Sysctx5nvpj/qnulvjeGGL5+yubjG0+wS3OezwvGuz60Ap54iKA4bQ+e2QVqfGc/o+zK
         39/baZFFLyOllBsYC10HofWfS66SYDEX78XVYZc9gnIk0SGRYlJczc4CvcRMvH97Ldig
         P6xQ==
X-Forwarded-Encrypted: i=1; AHgh+RrF/cJzfTyNGlC1ALmqcbqiGRiJ1jtb88I7oo/psjAyE7EvzuowgEzyLk5xY2Wd5Rn4f0K0jD6bMbPY2wms4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YywzPu748LZXXQWmy3bq9Fti62HEJADz2btbv+kSolwW/V4seid
	r5l6JnJ4eTaGnJTxq6ea98/JhX+4DN55BwrswD0zIl3qtdwj7PKaE8tS
X-Gm-Gg: AR+sD110S2N0Gqe2t11w5OeLGkXKde9oGkxG1eGYelm9Sf6nDWKWHJY+rpWG+qqYfoD
	/KQKdswVeWtOIBBQsFDTXpS23HvKq47RKGO9IJKcBgKPAd9lwNdJ06wyYW9Lvp2ue4m05zT6jJ8
	c/EDAaiwPY1+RV2VsoGj3RopsFtDO7hL4vwEdUSdSpGATASmq/+NfuKPuXQu1YZpBxQp5YTjRL2
	iLpZswHk2vrplpE44LMCW+A8wstWae+9xzJ7CDhO1PjQVNXOTyyZg3pzSitIIlEUy5aNV1vAqVk
	ELTkPw7xqf9R4b3xzHd7wHZKQgCaI5ttrunBX2yGFeIiZ68F1J1iJiSTjjhAvYGVvVer/fxyCYQ
	ni9/AmyHgqS+8VJRSgQcI2T10gHq8XbFfD1uwY4dw25gETzZ4a3sQZYH06sZuqmB8pHxZ/vxVLC
	gL0Pw8M9P+vhVpz8Iw3XpJ3RCOXwq4FIQ=
X-Received: by 2002:a05:6a00:190c:b0:837:e9cc:d474 with SMTP id d2e1a72fcca58-84e593ff0efmr3181609b3a.2.1785044320319;
        Sat, 25 Jul 2026 22:38:40 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5346dc8bsm1600912b3a.61.2026.07.25.22.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:38:39 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless-next] dt-bindings: net: wireless: mediatek,mt76: fix 'spacial' spelling
Date: Sun, 26 Jul 2026 11:08:17 +0530
Message-ID: <20260726053817.17409-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_223841_131553_A83B3CF9 
X-CRM114-Status: GOOD (  10.04  )
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

Fix spelling error reported by codespell: spacial -> spatial
(spatial reuse). No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 .../bindings/net/wireless/mediatek,mt76.yaml           | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index ae6b97cdc44b..e51acc544f15 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -221,7 +221,7 @@ properties:
                     minItems: 4
                     maxItems: 4
                     description:
-                      4 half-dBm backoff values (1 - 4 antennas, single spacial
+                      4 half-dBm backoff values (1 - 4 antennas, single spatial
                       stream)
 
                   paths-ofdm:
@@ -229,7 +229,7 @@ properties:
                     minItems: 4
                     maxItems: 4
                     description:
-                      4 half-dBm backoff values (1 - 4 antennas, single spacial
+                      4 half-dBm backoff values (1 - 4 antennas, single spatial
                       stream)
 
                   paths-ofdm-bf:
@@ -238,13 +238,13 @@ properties:
                     maxItems: 4
                     description:
                       4 half-dBm backoff values for beamforming
-                      (1 - 4 antennas, single spacial stream)
+                      (1 - 4 antennas, single spatial stream)
 
                   paths-ru:
                     $ref: /schemas/types.yaml#/definitions/uint8-matrix
                     description:
                       Sets of half-dBm backoff values for 802.11ax rates for
-                      1T1ss (aka 1 transmitting antenna with 1 spacial stream),
+                      1T1ss (aka 1 transmitting antenna with 1 spatial stream),
                       2T1ss, 3T1ss, 4T1ss, 2T2ss, 3T2ss, 4T2ss, 3T3ss, 4T3ss
                       and 4T4ss.
                       Each set starts with the number of channel bandwidth or
@@ -262,7 +262,7 @@ properties:
                     $ref: /schemas/types.yaml#/definitions/uint8-matrix
                     description:
                       Sets of half-dBm backoff (beamforming) values for 802.11ax
-                      rates for 1T1ss (aka 1 transmitting antenna with 1 spacial
+                      rates for 1T1ss (aka 1 transmitting antenna with 1 spatial
                       stream), 2T1ss, 3T1ss, 4T1ss, 2T2ss, 3T2ss, 4T2ss, 3T3ss,
                       4T3ss and 4T4ss.
                       Each set starts with the number of channel bandwidth or

base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
prerequisite-patch-id: 912014811782d33538ddb17f00b64c15b364425e
-- 
2.43.0


