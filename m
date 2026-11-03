Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70F1606D822
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 22:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NGxS2IGb;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jWQ5cNlD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=; b=NGxS2IGbdt1WMg
	WMH5Hob0dbirWlwVO9/c0XwyflMwyKb7gRCMa2l47Wukde2C3BBQGkvHpzrE6BJ0KawKjYdUTbbtf
	LH46tEdwy9EzezUc36Kn3tx5d3In78I9lHT0hEd3Dt2uVGUwPSFegeJCKCOhtUYjpjYRF3ff7IkNl
	hKtfbHz0dW1sujQeFxMLwU6OJ7dsdBaVwrqnSdGtdJhFf2H+fXe/Gul6QCNLa2nhVc8TbqH1PJ3Yd
	n9gK6/CNRmQP4Wi+7+ExRnUQfBj/xTmgF/KD/L/EvfFjhTeHGlRvyqWPdr7rcA57nkuqhY5qvDgJW
	4FtHuVvvPmUe6WCIEdOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMmO-00000003oBq-2EvP;
	Tue, 03 Nov 2026 22:14:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMmL-00000003o9A-0XtJ
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 22:14:54 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48e0d885929so56020f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Nov 2026 14:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744091; x=1794348891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=;
        b=jWQ5cNlDjdF4ZRgBgGzz2lIoTZC24m4goxuOY346vpWbdW8aTph5cZxcwy76apt0ty
         c6+r33QX77l247abvDqdAhxTVbEyx3JGTzvRrYGnc6gLE0rkkUWqOKH2GQsfi+Dc4iS2
         L6QG/K4jAepTvV2XvIntg8zSmTZVptSdCOqvYWeFEz3jSByEYH23MccFvC84YQCm0aaS
         7SuNnFbDKxFNZzKbtSbfTLUJIXtIJQa4J7rToG7MF6Nu4ev7d6438pbLTgrNZNn9dNRL
         QiY8s5yJeWTlgUYBGq+0m1Tnt88xd3Qh+/0yoHJlBpwbi8nNbFmK1eNGW4idn7fmKGna
         Er9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744091; x=1794348891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=;
        b=MLMLAMgUTIGkUGr/CzGjdXt9gXssoHvYjdqNhr8qgvRUegU8Q1EEE1aTsOH43FaIgk
         rttjyE/eKQ7fy70HdDmMmpm4F3ql1urn0XFbw+qvZdFfeNl1LLUHDLPOxLI4kAf0ZSli
         J89X5Kji19yvObLDE6xXUD0TqNLHE9AtY+pt3flmQkSPw95lOKMUB3rbKal6y++jtZu2
         2Is3xsOns1nvr0nQd06U7qHAy3o1N5BUmedTS3mo0lQd58fOW3c5UIBV2WLC1NZVCmNY
         iD59/BXMh32dXZAe9/0mV+F7qs9cWtSOi/J1l26nB8If3sbR9rVJ6FXxxx8nAr6S4nyH
         16DA==
X-Forwarded-Encrypted: i=1; AKwUvBwMaHMxW+qFgRV+2oG2f+bqW8iX0QsHtI0tUX+YBbRuYZoqih9Qf0An0F/VlIQDGmaC4pkg9t3KbSMcMChoug==@lists.infradead.org
X-Gm-Message-State: APuU4Z938uGbe7r2BIklAyg3UnmltOEL1NNbvv5Vn0GRuDdwrjDu+w1U
	J34rGKiBxfbizkqOmpmjliYzzhAdq8zDxotEyaW4A8oqT7V3tSxzED0e
X-Gm-Gg: AYBFou2MhwbtIKSjJELJZeSiRV7kJT3/5BwFEXXQKpUaS1xsc5Gn1kSTLu7ll1hdo9m
	zl5TR/p7rmcb9fO+g0N2ciYCnKf618khinNTw6UPqMFUPEL/RiPggMDxBsDOmmv4Jl8+JUYmSbI
	tSrtgRSxJ9vqlsSOv5OEHQ8591Dvna08FfbZov7gv/A/wTvQ2Jijg1/hHRgiIGcZhnqtmN/jJMh
	vmPbsaUCVSnYmAU4ZguqmRIah7sSFzrgzKf3x69hK+W3pxYsqY+gnw1r0sgnhC7CS3ztdNv1icq
	U+FR4QDJ3ERXUjXPpNqvtrmLfhmZBnDnipV/yp+BnMuPDnD6G2QSavR5SRr//FAg0JtD4tzjXHy
	PatAueb7hPI2TzRLtGzQVwr0A/x0oWd19ZO/fpDmOOkntb3Ze/91ySWTYOU2GaAf74bcA8kvP+Y
	4cFkNnGX6BkqmmT4wRWPxLiglQ1emlykxe4h21zCyQPHiUcKujJSUlM/n6NWWiHGOrbpUjZUlV/
	h3XllpjnFFNKa6V33qpwim33XIBYDqaUHZHhJyi0NvPUt3lWAI4pskhICLwquSHmfX3BE+H2d7B
	DlKdV7TZhVduKdI6pAMnOg6sNnpfcXcdQ0AGCdJArZ/F3zSU3tkum5NA11frk//eHT9sfVCTj2i
	pKD8aJZXf1ZdCF07TJ/UhkfHcKzEEFlcWhw==
X-Received: by 2002:a5d:5d06:0:b0:48d:ff71:dd87 with SMTP id ffacd0b85a97d-48e6e303f29mr32359299f8f.17.1793744091527;
        Tue, 03 Nov 2026 14:14:51 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm328556f8f.14.2026.11.03.14.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:14:50 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v4 1/6] net: phy: mediatek: export __mtk_tr_write
Date: Tue,  3 Nov 2026 23:14:32 +0100
Message-ID: <20261103221439.30502-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103221439.30502-1-ansuelsmth@gmail.com>
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_141453_188218_F009C658 
X-CRM114-Status: GOOD (  10.97  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Export __mtk_tr_write to directly write to debug register.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/mtk-phy-lib.c | 5 +++--
 drivers/net/phy/mediatek/mtk.h         | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 4c4eca870bde..3e4fb899a85b 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -36,8 +36,8 @@ static void __mtk_tr_read(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		*tr_high, *tr_low);
 }
 
-static void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
-			   u8 data_addr, u32 tr_data)
+void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		    u8 data_addr, u32 tr_data)
 {
 	__phy_write(phydev, 0x11, tr_data & 0xffff);
 	__phy_write(phydev, 0x12, tr_data >> 16);
@@ -45,6 +45,7 @@ static void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		tr_data >> 16, tr_data & 0xffff);
 	__mtk_tr_access(phydev, false, ch_addr, node_addr, data_addr);
 }
+EXPORT_SYMBOL_GPL(__mtk_tr_write);
 
 void __mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		     u8 data_addr, u32 mask, u32 set)
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index 79e09727b81b..3565e39b96a8 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -72,6 +72,8 @@ struct mtk_socphy_priv {
 	unsigned long		led_state;
 };
 
+void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		    u8 data_addr, u32 tr_data);
 void __mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		     u8 data_addr, u32 mask, u32 set);
 void mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
-- 
2.55.0


