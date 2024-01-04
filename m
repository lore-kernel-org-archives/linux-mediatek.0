Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6D4C4707C
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 17:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u31vqb832iBo503aU0D4rkKh2sGRkH9JUeHiMN+G1mE=; b=sngcEcZcEzpj/x
	U1EeqcEPKikDRmx56v2gEUVrxxGQzA81UCxInYCPGEfaURhbrGPAXChhvb6s9Qe/BMuYI6KJW0dvA
	Dmg9bqMS5bmbXGO2aifkDvtASkXGHmR+lcSUe7zRXj5X2f8qVYroXNcXRtAp/VEqjc9wtvsKKn0oJ
	DbICqrnKEfhghWZBYOWG154yayP7tbsdg4ojAdqQB+iXTfzkw3WN5JP+WnaBWVVkxvSkRb/lnfhA1
	S/5f8ZCLIvw+PJJP1vy/MX6HXUtYRm6+SNlfsYXjqu19h6KBpmVfYLaVYcg8MetjsemIWfwoDmYCQ
	UJnwBDkLTGpp5XEjfO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLRhF-00Erev-1z;
	Thu, 04 Jan 2024 17:39:57 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLRh9-00Erbm-15;
	Thu, 04 Jan 2024 17:39:53 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 97F7B5FF8F;
	Thu,  4 Jan 2024 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1704389986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u31vqb832iBo503aU0D4rkKh2sGRkH9JUeHiMN+G1mE=;
	b=HJKUGDYhE03OgtP34sIwOijceDMSih37DZxiGdTGjoRC6DSEuYCZJZalZv/0hv2/AF2UdM
	PJpPtswhQMBQwdshvoWrOxUHwgznbLGVSQCnA/bfkR9LPlrQjRjD7sgOSnZbAnVyhptJAa
	F26E5mR9V7cLPGIYmpgXC2RB3I/hQbc=
Received: from frank-G5.. (fttx-pool-157.180.226.237.bambit.de [157.180.226.237])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id BF7BB100738;
	Thu,  4 Jan 2024 17:39:45 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: reset: mediatek: add MT7988 LVTS reset ID
Date: Thu,  4 Jan 2024 18:39:29 +0100
Message-Id: <20240104173930.13907-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240104173930.13907-1-linux@fw-web.de>
References: <20240104173930.13907-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: d6c2a594-df4e-40d7-80ec-fbc130c01098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_093951_543192_D9293001 
X-CRM114-Status: UNSURE (   8.90  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

---
 include/dt-bindings/reset/mediatek,mt7988-resets.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/include/dt-bindings/reset/mediatek,mt7988-resets.h
index 493301971367..3f1e4ec07ad5 100644
--- a/include/dt-bindings/reset/mediatek,mt7988-resets.h
+++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
@@ -10,4 +10,8 @@
 /* ETHWARP resets */
 #define MT7988_ETHWARP_RST_SWITCH		0
 
+/* INFRA resets */
+#define MT7988_INFRA_RST0_THERM_CTRL_SWRST	9
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT7988 */
+
-- 
2.34.1


