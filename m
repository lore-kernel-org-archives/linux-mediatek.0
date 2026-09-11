Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0D8C88E50
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2026 22:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4x6skfRoPug9nQpkDIHkliB3IJCFQOtgzSpXl6Smj9I=; b=KEsaCiCuS1P6iuAtqxN27BgpR9
	9DpOPdHnI4Y/G245YKS2oEGxTs6S4r9QvpHo1KMwQe/c2kp3wui19pk2kBjvlKV48YnTDinudWpid
	VL9w0JCHCwg6Xk0WjIVjo6IST8wSTVQbn7rvTUYQ84La3Z/51rkRvOUgJyXCieORf+Lh38a8Yms8E
	0cyYQ4Wie9to2ptKIJqnvX0fJF7e32S+Pmlh0pvtSSvNIFDlkSRA1gNAcpgarxHtaPtcVtl9pXWxU
	sWmHA3pgV4yXY01PT3SikBY4kxchAY3Sq/I0Y7KIY7Q8Fa/nvdbmzEoX3euOuaDkP8JPTUn1Tqsel
	wvqghVUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5A98-00000000JKn-1w7k;
	Fri, 11 Sep 2026 22:55:02 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5A8u-00000000J4L-2ufV
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Sep 2026 22:54:51 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso4639415e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2026 15:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167287; x=1789772087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4x6skfRoPug9nQpkDIHkliB3IJCFQOtgzSpXl6Smj9I=;
        b=VRWwGn0nRMi81/MQF6lCyvlXcP8d77LMRE4meSjn07RUzEi3Xu/FTYCKSe3nUhy7HG
         1w5cL4k54ZVB7/NETSqdzipmDAmgZxBSuoB3XzhrC2p3W/iqMBjxnOIS55Fqm9TtlK79
         fgXC8ZmtKDH9H/lMQL8ZkX5osUz4znqAVx4NPCM3+BwXy9Py3WF/ZlFv/3XlM9nU9TFE
         oB+3r3OLu+Mfww+IRGeRhyzcywI0TivECFfGr8h0i1S1Lmz3Tac41/7zJZGpyZoRcpUI
         tfmfZNHNBrszrRQtF2Ojpsg+6jW+FxHAwUdeSqV6WU4JWexJ8ixqmiSu/7WptBLrv1K4
         7L4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167287; x=1789772087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4x6skfRoPug9nQpkDIHkliB3IJCFQOtgzSpXl6Smj9I=;
        b=KSQKeBesqxo8/KbeqP5f7S9iBmRFggQg/JbShEkCr7cq+fOROPfqkSsUXOMBZ0uHHo
         GbOtj9mB0ZPn/YKrLWJKPwo7WrFHb3Hv3+f5ad0u5TbuqLIQO4Gu2ESFaa+GoFi3z1JA
         lbmuLUw5OZ2j8QA1YMdNR+cc/+b7XdoJxGQmq63RHFrhxL6Bsg3r3lVNbm55RVrTC81J
         E+HshQK/ScbFUqnLfTy3s3ZtJJYvTVmZIWnh/mFiejn8F4jP/YirRkhLvR8U+RSZ4UiD
         ThC/dq572kbUYv+v+6c0T/fEojKIQjnnaJSTQJngAzoj42F8kTpe06KI7JlBQJJNZfp+
         obtw==
X-Forwarded-Encrypted: i=1; AKwUvBzYM4kV2qp5vTDnnEpU9VuTXx1gSawOZJbkJBiltb1hFIlWdXcBjL+GqMdwNKdxh8GJDTKrY6n5OF+s+3Zg7w==@lists.infradead.org
X-Gm-Message-State: AFuF++lc7S4M6v8OiTDEz1BIjxpe3Pk8EfGexn9XObR+pzA0ANQ0EtC4
	czpPYTd917WL91kZcGAETKy9cVoMYXhF6et6M/yufBBYgyYAk6vJFzp7
X-Gm-Gg: AYBFou3zyuUm89L61UPM5KkEyGg6+36YG4xA26yk7tuHICCcpYpg5qGeu5zM/2VNlqC
	hnWjU/zk6boPG9j2gJyH3iN5DVci31/57hfNRh2D33K2dBSd4nqwaEF098ddltrbbpZlhzoWiuY
	TsRAK1/VhJeivXoV2MMDPyOD186D5jNxycXATBwZbqbNcaGaNpS8Q3E2r2Aqvzz9tRfvydqWD/e
	q1+sfSr5QEHRwCFB2eMMUeFTghrXSQ2mqHPadblH6K3qBMVoxGfuNeCISszPkt+EtpbCs57PMRe
	lxswmGyQAjee/QSXnKkzoRRpuufusJqbiO3x35AjZ/z9UMQehYolGrDEr4MxK7A/iwtMSHhp6CG
	xg09npOgfR0ODlcjbMxZTB4DfCreD2FvdrlxfXbbk8TU20xzeIXUOsC88d1gCcpBz/29yBw1T+Z
	5XHlLR+IKJs0a3Ymh6+8/9QD4bq6SUZVxdcY6fyONxtVw9h4nA+MXgpA1+Jgz0Itz5HnOE/2BWn
	b+Y9ho/SvyFKR/D4AjVOPBbD+o6PDijXEehyQnlPY61PBcZs41j5Q2w8id39qQ=
X-Received: by 2002:a05:600c:a107:b0:49e:663c:c69f with SMTP id 5b1f17b1804b1-49e663cc929mr90961875e9.15.1789167287028;
        Fri, 11 Sep 2026 15:54:47 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm77593685e9.3.2026.09.11.15.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:54:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v21 7/9] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Sat, 12 Sep 2026 00:53:31 +0200
Message-ID: <20260911225414.225980-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911225414.225980-1-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_155448_784941_18427045 
X-CRM114-Status: UNSURE (   9.77  )
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

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 878ecf1fdf27..95072863b236 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -759,6 +759,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.53.0


