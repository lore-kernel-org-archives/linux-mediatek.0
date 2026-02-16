Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78FAE81A3C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Feb 2026 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EP/NkuwHIXZWXD+wl8EaORZCaWZmz1qMdyG8O5pYtJ0=; b=UymiIG/i5SJe/T2T8bUZDgE5UH
	4oiTyslJ6o5NzvjeNpOsNAXXr+OrUwYIOO8uZ6IBXTXOcnJpnvgzCZBVNj7ovCIAdDa8x0MJlNfvG
	LTQlUMEW8aLqfjhb9H7+UE88eKvVevpDoIIGr+8Sng0cnGicRfPc+NnqjjGctHHqI34gA7zyLxAUC
	8cTe4pd6hhbY73YwywRhA1NhVwdiv+c2RS/n4sA0tvMS0H6v28a2lQDrDW2tjNzTvJdZ8Rx4xr/gv
	78RBAheu9jodP8bb9zkv9HGV5DWg8juYIsAdgaHs0ih7n82KrBi3K6fwb0JBjPejJ8cyqbh446XOx
	0Aqtn/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1PI-0000000715I-3Yjr;
	Mon, 16 Feb 2026 16:25:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1PB-000000070sy-0Zje
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Feb 2026 16:25:02 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43590777e22so2040135f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Feb 2026 08:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771259099; x=1771863899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EP/NkuwHIXZWXD+wl8EaORZCaWZmz1qMdyG8O5pYtJ0=;
        b=OhIJGbCwnwz9AvhqZ01DESKOHI7Htwznf+TlHs1UNrlK+sK3/Af72t78olcpQ9jiT6
         P6byLHms66PxHCxwLHNAZzGfSOuskSBTY+sn4aj7ACDc6089AOpiBRjryYKwXkAOfvSH
         AhPD5qnEWIJKIkAd88EuYwzF+d+Dh0LdG7O6g51horushPDVo3rWeAcgVsRu/LGKexw9
         gwuguR4sg19GsSamg8CQG/cQz9A71U85IulXrOmLM0Znu9bbiZnDnpEIWhpvr8j5EMWv
         pXMC6GG6+2Yv4BUO0KRXDXlvozTX75VGAN1Jupo5u6eX/oxKSEy0bU3SXv9njh6/E1Hr
         WEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771259099; x=1771863899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EP/NkuwHIXZWXD+wl8EaORZCaWZmz1qMdyG8O5pYtJ0=;
        b=BYK7g/fHnW1O0Gfl+LYDa6vmM3eQMGGM60H0dY38RnFRjqpRP0NvdXsHKvZ+0NFumB
         SS9iZJntmMLs9+goQ8+2gNFeMLjj/M5HgPHjSjlaNtoezQkqH92o4vJMCntymhv8dSSP
         lZwdtsSqDeR59OXqecHKS69dCu+VWEE2IU33sqA7Er5eS0tvXHMJKtAo8Hy9qi1s/Azn
         5ozABgogM02t87ZW0fUFfuXhrK6sqvyaAvnNtEqbx44kcQEct1BgwcnZoSwQ2QVgtgcT
         Xry2epmVJoeeZ5FKmwxE21laKRB4bneNp7e6/f/nTl11pQxr3tOqmhnZYxg0Bv8f/eKP
         iz+g==
X-Gm-Message-State: AOJu0YyYqT2jCqDq+B6awQjxt6PCY5hbPd11jggztO9jDWT1BUEPRCza
	u7KJb2gxLuWWJUhSm2EQBrBL1J5Llz8saVxnoPLxuA4WQsLsFZxtwEhg+dh9xg==
X-Gm-Gg: AZuq6aKdWDAjYLzVAG37bCA7Nv6waHuJfxfjp/kBJiWHiGpZPzIbBHlMO8CK8MAD1S2
	Ns8Oly8JWM9PDwlwasXtXejETvZyigWif+BtmzVNQAHZ8xK4KVnz/ktJntzWDMQ6Qtxe4YOem+5
	kzFSg/gI7rHZLKG+ThjyTWd6tejCY0uufH9aBIA/h1UrhPa8ZbtKRccoQwayb4TA/Fr+H3R/9+Z
	r3yub10w0B18TvK697H78IQlF3ngLZ01Qu87gK4ohR+xkbkdcY4Pt5/5kzYAEslAvFkFPZu7jTQ
	Ez3ZktTyJALhSxJse2u35MUhGe5XfcucvyFlYl+SOlrRFjfUgvEdYmKTWPyLSU0heGz8ehJESr8
	kAhFi28oveuB7KKqWXJV0YCPUU0tDtDQQHD3apD5re8RNU2D8lAJxmTHZCnEIwx6WZ52bhZmvEM
	y75TmziSbgDf/0MGefWaQig5qeHQpwcQ==
X-Received: by 2002:a05:6000:4010:b0:436:1b1:6cbd with SMTP id ffacd0b85a97d-4379db25b60mr13014530f8f.6.1771259099036;
        Mon, 16 Feb 2026 08:24:59 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6a6desm28775962f8f.10.2026.02.16.08.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:24:58 -0800 (PST)
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
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v2 4/6] dt-bindings: phy: mediatek,dsi-phy: Add support for mt8167
Date: Mon, 16 Feb 2026 16:22:15 +0000
Message-ID: <66fbd5dd3604ffc4fda45022c1db68e4e0be6714.1771258407.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771258407.git.l.scorcia@gmail.com>
References: <cover.1771258407.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_082501_204284_C230DBDA 
X-CRM114-Status: UNSURE (   9.58  )
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

Add support for the MediaTek mt8167 SoC: the DSI PHY found
in this chip is fully compatible with the one found in the mt2701 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index acdbce937b0a..c6d0bbdbe0e2 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -23,6 +23,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt7623-mipi-tx
+              - mediatek,mt8167-mipi-tx
           - const: mediatek,mt2701-mipi-tx
       - items:
           - enum:
-- 
2.43.0


