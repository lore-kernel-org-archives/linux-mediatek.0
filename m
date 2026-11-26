Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABE3606A333
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 12:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lcpos1X1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ai20VcS3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Bx+gebuWvdDvenp5ww/mcPP2uIDCBl2be7uQgah9rb4=; b=lcpos1X1NYi2o3Lfcc8gTEtd5T
	vBSJSma8sGKNnjlmHvCCgYfPNNQnQW3Sd8u7ZxqU2eqVBOI3ZmUGMdzMELqPI1CubceEouJlas8bF
	9Y9vQ98FhreLjCfFDWcI5L9xUWFPdoPKxwtdMW5Vbo2LQHfTcna4Ky60K1BloAne84Gf46+kFMwOP
	ZBmZeCB83aOMYDWz2TPxT0f56udWIfEMLXd7oGaxffS40ymP4a1xqatRDa7TxZR+GLgi9BWlBMy48
	fVaXrrCc+hi4vSZpqbOVdJBE0FDEd2HtWbPjcFWBM1TC0N+SXBs3tKHiLAe251o3/GiBL9Hop/Q+d
	xy40IqCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYnA-0000000DBJh-2FOL;
	Thu, 26 Nov 2026 12:41:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYn3-0000000DBDf-24Hc;
	Thu, 26 Nov 2026 12:41:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EBF9C624D0;
	Thu, 26 Nov 2026 12:41:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795696888;
	b=LhjqzBervFkjBwdmAmbd3s2BXEmdQwbj77MPknr56DuYJvQw2mHRdgbG/+1EXAGX4eeG
	 kbR7AulA7MC6+r23qdLaOux1d/or/e+R0BpE0lDyjbLcr51xeNFNJpzZHXtxm7ttb1qMK
	 CHLxzfTDEtRF3SRgj8vqtJUje25ibWxqRyb4bbOjaPnSL9YZ5yUiNjLR4xVRfLNG8NZQI
	 EvPMXZ5gpQocdtyA0tGUrtjqSXKRYe0wlz3SU17ccTJCK3C+85iUnOi2M8SyjXsXz6r7T
	 QFk48bOsmxM+jcjPu+6vw3D0QjkltfhptPk+MwGsdCgGOYnF9x5IpizgZXFJ8rALdyQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795696888;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Bx+gebuWvdDvenp5ww/mcPP2uIDCBl2be7uQgah9rb4=;
	b=0LHiY/ttdgidikq1muNt1LZAldRQEjy1xAqIUItYwIE+FHdx0+Pt0IA3E7ND+YZuws59
	 UUMM/P+8XnThWzxAkCFs1PD3Ff2rcPE7NYyChjeAeuf7tYsug3AoBfIut7LdsUhzn6P+3
	 l5mEOB1M73IPdN4cm6VyOZwWBBWvfc86lkTXVr5ojWKrMjN0o5TcduzSy7n02F+6DvaXg
	 RkX5YH0isKBTu8TkURGOrVcksmxYW3VkDNjI66P9gDEOFOzXBEROlh80cM3elFjVBvjBu
	 set0pkS9LnCkXFY6BAT92FpW3KBcnoT0Dn7qazttn7OlmONWFFqbdLESHZzPmNzND/g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 528891F000CF;
	Thu, 26 Nov 2026 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696888;
	bh=Bx+gebuWvdDvenp5ww/mcPP2uIDCBl2be7uQgah9rb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ai20VcS34okP63nNsTVx8H6rGlQco7/+hQ8ufhITFXAcppPtS5jAlAjh1CvxfPKJr
	 VC2XRo2p3gcISkNXrbVPNW+dhZe2URzciRwyfwH9NtFdv44rF1D8esPIhK1ynFJ1r6
	 +sZB6NlIcug137liwn8e0d+YcOpNUiDHPGR75y3yt/A+h/Y6oMlY+7g13Cr8SyJEbb
	 5x5+P24/hWctv60S/4tCdn/d7vKqVNZJwYwrJYQvVI8NkDDu6GkZauljdY+fB8Wm6u
	 YB8fQPtPtQucwr6p/cCRZfP0C4rBl/6ONo6IL5PYlEzQeZ5Qetfoh7HucyaUEmcWvl
	 +5fZLHeaCx3Fw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BB4F24D4D0;
	Thu, 26 Nov 2026 12:41:16 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 26 Nov 2026 14:39:56 +0200
Subject: [PATCH 3/8] dt-bindings: watchdog: mediatek,mtk-wdt: add mt6768
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-6768-init-v1-3-abc364a2447e@protonmail.com>
References: <20261126-6768-init-v1-0-abc364a2447e@protonmail.com>
In-Reply-To: <20261126-6768-init-v1-0-abc364a2447e@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795696875; l=1885;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=aH0siMLM19GbpIna6FTZmhfIkS4nKiHnuKEgLlr6TYI=;
 b=bApZzV91JzAk9Q5+fVhxb13HvL6/TMxJR8PEtOAHRZiqj9drOyY4gngo9qfX/7d18Ip6QK2+O
 ANBx5cq1zoQBiCjdzBKOqPQwsVW3aN40hoesqPYsu0m1HztotDyNajp
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the MT6768 watchdog and a binding header
with its reset IDs.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml           |  1 +
 include/dt-bindings/reset/mediatek,mt6768-wdt.h       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 72abc9cdc007..55e687b4a6fa 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -23,6 +23,7 @@ properties:
           - mediatek,mt2712-wdt
           - mediatek,mt6589-wdt
           - mediatek,mt6735-wdt
+          - mediatek,mt6768-wdt
           - mediatek,mt6795-wdt
           - mediatek,mt6797-wdt
           - mediatek,mt6833-wdt
diff --git a/include/dt-bindings/reset/mediatek,mt6768-wdt.h b/include/dt-bindings/reset/mediatek,mt6768-wdt.h
new file mode 100644
index 000000000000..d5af8f106ad4
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6768-wdt.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT6768_WDT_H_
+#define _DT_BINDINGS_RESET_MEDIATEK_MT6768_WDT_H_
+
+#define MT6768_TOPRGU_MM_RST			0
+#define MT6768_TOPRGU_MFG_RST			1
+#define MT6768_TOPRGU_VENC_RST			2
+#define MT6768_TOPRGU_VDEC_RST			3
+#define MT6768_TOPRGU_IMG_RST			4
+#define MT6768_TOPRGU_MD_RST			5
+#define MT6768_TOPRGU_CONN_RST			6
+#define MT6768_TOPRGU_APMIXED_RST		7
+#define MT6768_TOPRGU_CONN_MCU_RST		8
+#define MT6768_TOPRGU_C2K_RST			9
+#define MT6768_TOPRGU_AUDIO_RST			10
+#define MT6768_TOPRGU_CAMSYS_RST		11
+
+#endif /* _DT_BINDINGS_RESET_MEDIATEK_MT6768_WDT_H_ */

-- 
2.56.1



