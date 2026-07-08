Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0698C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZsRXfT5ibQiwiJAzw9HJHDQeaykvfcjebj1qaMIo5g8=; b=kpFkSalmkT4KhtLrsTRKY9AzeG
	FvPM1xYFNZV+nbHNAyN5iD2x9n2ZZF3kyerxdLxzTBTXORvXnrdScYb4af+30PrIs2xOZvcpuHFay
	YMJ5SDMZQkosr9JOcfGc4gkwbCN2Ovn0DivhB01uZHUyFWc87PW11ZbuclDr/LNzxCdEjkh3Uw91e
	wUCL6Qh0tX4SkEbbwv2pYWTqU2e8lrsfpnzIE4t8AgqOI7dX+PxJ/sZdOSh5OcnjE53lMj0vVJUnU
	Ci07+f9NCwNBSznagL6Mp/j/GkqOazQ2LBLhUf6PBFzqjjmoXRYRraDw0vA6V+YgwGUTIL2L/JdFq
	aG/2t1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPRc-0000000Gsz7-1yON;
	Wed, 08 Jul 2026 10:23:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPRY-0000000GsvS-38Vk
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 10:23:54 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso324810f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 03:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506231; x=1784111031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZsRXfT5ibQiwiJAzw9HJHDQeaykvfcjebj1qaMIo5g8=;
        b=EGjO9p3s1QrIB2SINroUK5HDFcpv7KMB/pTQXWw9XQc5NMVqnQg0BpqDZ4KzAX0Ni8
         1qh2PrlarEM/H7N29kGhTfcgl2/0YaZhiuf7t+6jLOPmaPDI8iJT4+spnELZUAs4QSnv
         ga2834DRaVcI+95/DjUwXm1z4+E0Q22P28Bfufe/sJEdzXPCwexSzKovakQVuf6MCPEf
         vrE6+6txdXvZWMstOINp8qASkrUGs+OPNrCZCiQdKJjyzqebRr09JVfoasfOdlBf/1+U
         wpKo5uFnFzCK1iBrdd+DpPgT+L0+W02QpMYj9o+Z3rAQBBNysyc7OVcPQ9XzOrOSVfCc
         FdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506231; x=1784111031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZsRXfT5ibQiwiJAzw9HJHDQeaykvfcjebj1qaMIo5g8=;
        b=SnUbIFs2qnB3T6qBOyR3hc0r4JmJtu9YgqLv9QJqKjBcbxXPG30P2NZWjfOWr2XvvM
         vsUD7mxAUJ3+GRSVUtTL8GAWo1RtKeRnfRlVd2HpVABTQX5UJe2BVpbwtfJb+oShSikG
         Ztu9JfelA6VJc24lBraQC9S4kMEmtYHjYah3noz64RaXxe4PSWnl+B76jwBANQHiuA+w
         iWjuYzvK28Y/wz2T4ik1mxybMCaIEFLTvsZi8Rh9kIKYzRnAmhuSH+I/005NyzAtqoe2
         1jcG9+tujyagnTWG0tZ4C7ks/iNdxbBMfYajFkv0gjCLlO4llS/1JV5q0O0sphBXN+98
         HIsg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9pzy/9fyVo0UDA2J5yJBKJC7yheHy7H/qnESyi6tSBHwZB2OTfPMzAhExOLLalgFgApEpvzTOsuyPg1Q06g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiFBr8CjfE2F6mvOLMl68VZaJUOHKtgiXl9i/dxm4GotP13cM6
	z7sqrStwzsMvK3hrnuz5m5U6I8ij/pXQsbXivoSNz+dI9vmr/5ynqkyT
X-Gm-Gg: AfdE7cmSHLT4mXfnGp9WSdSa7wT555Obhk+z3RwB/wjK4atVQShhNsO2xukndY1YcAf
	1pcxcw+CGdGCWwqPRfJcYvE3QB/mwuB5l5KdQ5bM1fsGxtMebyDv99raX4f2P/q9Fukt6Vp44Fu
	ugHbjde+pRlNMtppqsIvAbruzcREH8DWOaEru/HJsEDQoWc57EJXJuaCZi8DN1JHw9YKwIE20oa
	RlrBnfgXn9VfzikH+K48LCS7ulBN4GRAPjQmMdyl5Xk+ChX0biIEuJD8TcHNBc9hKdRqU6c3chm
	NIRNd8gdWmL1GnLY8dBuGH+u2YC2P/rwyWmCuM2tnL4AU3pS5Dxh32oP4WbDs3hpDN0QTuB46xK
	odRH+QZz/4vNrztgwh2hPw+wEgol2JpRlQ4crmzxzYd6ockmCTr0gKjnkYNwlrGQyzigDzTsDSt
	xZJic5jWz06uWAJd3ojQ5kA3fHJD4h+LLLCyemNqn0tTTUUUu47Q81N6mkr+jnF9vkl7MQGYuNG
	3KJp/nx
X-Received: by 2002:a05:6000:26ce:b0:473:1706:7f01 with SMTP id ffacd0b85a97d-47df077caedmr1960726f8f.43.1783506230730;
        Wed, 08 Jul 2026 03:23:50 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm40660248f8f.36.2026.07.08.03.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:23:50 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 1/5] net: phy: mediatek: export __mtk_tr_write
Date: Wed,  8 Jul 2026 12:23:27 +0200
Message-ID: <20260708102341.53919-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708102341.53919-1-ansuelsmth@gmail.com>
References: <20260708102341.53919-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_032353_383187_F1786B60 
X-CRM114-Status: GOOD (  11.46  )
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

Export __mtk_tr_write to directly write to debug register.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/mtk-phy-lib.c | 5 +++--
 drivers/net/phy/mediatek/mtk.h         | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index dfd0f4e439a2..78b998af5238 100644
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
index 320f76ffa81f..f172f7d671c9 100644
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
2.53.0


