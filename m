Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B003CC47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jan 2024 18:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsTpAwqd/7QjMORruXxyzjor5gLJU3V4uDYNASOFOIs=; b=tB3+Kni6PGTnGd
	k3L+SfWUZSN45xo6xs/o0kUjai82HFm3eAZvievJJ4+bI3O6Ursom50BV8BpurmgfP0BWO85hWoKH
	OjNHjnzdvhGr2NrKcBUw/OUpDaIUzX3h0e+GZysjkJ72VrJCXW1DTFR9wSelkLiM/5uSyIjNY8z9Z
	a37dGAffX6R0eXmdvHTYaUtv3ZhJSZynI5xWwyE3ZT4HtpQAlg/kEb7e8vczLKci1wpUMD/ihsLzM
	LgFmH4V2Dd0mpudG73Rwbrw8CfhRBO10Qz+kmdHA2u25CMX1DO8xzH2wwWhW7Ul+Xg2n2CPhTAnKp
	ktPFZY5DCZ8tX+jMG3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQAqr-000Obn-1g;
	Wed, 17 Jan 2024 18:41:25 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQAqm-000OY1-24;
	Wed, 17 Jan 2024 18:41:22 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id C4AC5101655;
	Wed, 17 Jan 2024 18:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1705516875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsTpAwqd/7QjMORruXxyzjor5gLJU3V4uDYNASOFOIs=;
	b=n6tMzGF06/M3ISIDribRHuKQ35U3S/Y2vBsVitsfhE06qp2j629OGhuGEM/o+HpMEM30iK
	5+wrlfYZPZT73HpZDindSidDxoR80xoXMDD7LXaa/kyH9WnA6QMOuHpMQo18lZRFgRoxMO
	jATEPVe+VhBR/PrV6oA+oPR4drCioEI=
Received: from frank-G5.. (fttx-pool-217.61.151.254.bambit.de [217.61.151.254])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id DC922100738;
	Wed, 17 Jan 2024 18:41:14 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: reset: mediatek: add MT7988 reset IDs
Date: Wed, 17 Jan 2024 19:41:10 +0100
Message-Id: <20240117184111.62371-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117184111.62371-1-linux@fw-web.de>
References: <20240117184111.62371-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 8e13c0df-8d77-41db-a62c-66e3a8be9a12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_104120_822267_564C2040 
X-CRM114-Status: UNSURE (   9.90  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add reset constants for using as index in driver and dts.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v3:
- add pcie reset id as suggested by angelo

v2:
 - add missing commit message and SoB
 - change value of infrareset to 0
---
 include/dt-bindings/reset/mediatek,mt7988-resets.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/include/dt-bindings/reset/mediatek,mt7988-resets.h
index 493301971367..0eb152889a89 100644
--- a/include/dt-bindings/reset/mediatek,mt7988-resets.h
+++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
@@ -10,4 +10,10 @@
 /* ETHWARP resets */
 #define MT7988_ETHWARP_RST_SWITCH		0
 
+/* INFRA resets */
+#define MT7988_INFRA_RST0_PEXTP_MAC_SWRST	0
+#define MT7988_INFRA_RST1_THERM_CTRL_SWRST	1
+
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT7988 */
+
-- 
2.34.1


