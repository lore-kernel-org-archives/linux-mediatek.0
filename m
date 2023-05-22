Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642C1C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9tpdUvQNrY+vXu1QgfXUo403K9j/yDPqK1JzzKX9TY=; b=WBNhhCyyP9cBUY
	xTEn8ncgTRUAdVPNuGTpaLCnuUtN8ZppKP0e98EFF86yMpRSskLsGxIwPGJgw8WeWFRf3h73HpI3j
	oSwOPGbNWBL0LYQW3ZUOnFeSVx12xn5vat2CWY6Qql1WdKgMcc7ux4WDnqy6xAgtEBljAo2cNeeDF
	tsX2yCrICah1ajx/9gwW8P7cGjP0psRMeeJpEOvBGsw7mtz6nigZpGgPpnIC2sU9m662IRu40As63
	G6QyWKYQIZbgH289pdQau4EBEZLk2XexPKsOVw17ILmOejxWYPj6y0Szqu7tG+omk9oH1+8P+kRo+
	z6MqlDto1aRfGGPDDRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14ph-006WH4-0z;
	Mon, 22 May 2023 12:40:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14pf-006WGN-06;
	Mon, 22 May 2023 12:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=V9tpdUvQNrY+vXu1QgfXUo403K9j/yDPqK1JzzKX9TY=; b=OZaIDKsYIbxGgQBEQ2PbHNNW+F
	euz/UcSKS8Z0gKxZHh2HcCuigFzNWGNjyz4QMdGnaVEAttP47/jJ2nYWI3RgVZ1err9dkyQHjG11e
	OiRXOUAn0NXqlfSykxlzfXbGEJ4AlzL9rL7xvwaTwVtQttzFsYDTSPyUDQqDyGDt4QN/qH9NYxl/V
	BpoVx1O5lRMDxfqHq42Ok0XBP/9z5yevmAKmlVRMcyli4Xfqk9xlUx36HXFYc2ckvzdHC0BLFC3eu
	fuQCningnboeCW80WReAvQmTGNEi128nrwRVubHcfzD4bvidUC7MzPEEfRKwpJVqKHMBjEPgYJ3Lk
	rjqjFz0A==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14TI-0021o8-0U;
	Mon, 22 May 2023 12:17:06 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-96fdc081cb3so172960266b.2;
        Mon, 22 May 2023 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757821; x=1687349821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9tpdUvQNrY+vXu1QgfXUo403K9j/yDPqK1JzzKX9TY=;
        b=q/+t+61YH1yRLDRJJOPmPwfYDM0nR2iAwN298kG0G6zmP9vpFPXhIHdNDzkdUd48l/
         cwN6osMyujFwj9quQ6Mtsi8e0J6fK2EcekhZ5NI2Fy4o6LfpS7sxMvHuKPS/CA6TUtxl
         873vrc68tsP58h5nIdlh1ZB2RXtaTmOT/4BmyCexQmjYNvwKx/pPFFHp4fkwE0R6HtaR
         gv+qXYYj6ax+RsWDq2Qjx8GFM9k/kVueB83PuKVI1LuAkEMwSR6Wr3WbXVoTl/Nh6E7J
         BYO8AW4KFY0NNwhPTu97qaEn0/4VLOCxrfhqk953FaUHq74O91UbEYPHlE/lOPeoQTRu
         tugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757821; x=1687349821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9tpdUvQNrY+vXu1QgfXUo403K9j/yDPqK1JzzKX9TY=;
        b=E7tNtNS6k6OAg98QHiiyml8Nt8CyxF4Mo3T1ZG6/3pUUcLISCNkcAMCTc+jVZCxi+7
         ERAeBrpXSB8nEv6qYUpDaHPcfDLaGNm1UgVqn5r04a0IQOMdJMp291SlVUZ2cZCfx0v/
         ihj3qjxAqfIadQdCMQ+7tbx4YvJwtX7M2SzlSx+QSCjLu5GdLDVk7hZvD0KkyKhGa9LX
         kLPCLySxGbCWeeffnwqusJHP4q3YAHVKQ3hXmz1/sRJohBzyZd1inL6sz2khcZMJMKGi
         WhANpzl55a+dV+2t2eWQA7hEMAnZ3VtDd8QuJinS0/LonFrdM/VRpzLV04bb3TmqPp35
         Cbwg==
X-Gm-Message-State: AC+VfDxoUytbcnOmkbQNDNyvHV9kzAE8uAzyfYnPRLbKee/a04lxS8u9
	BAT9UCVV062LpybtM87SNkI=
X-Google-Smtp-Source: ACHHUZ7AzgOwwMT64Nky0TTC6ZmE3dmOJIVkxkaYdVOAOo9F1zIfL1k1AU/yDAPVy4izH3/6gBiQ8A==
X-Received: by 2002:a17:907:7246:b0:96a:ee54:9f20 with SMTP id ds6-20020a170907724600b0096aee549f20mr10610920ejc.37.1684757821114;
        Mon, 22 May 2023 05:17:01 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:17:00 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next 25/30] net: dsa: mt7530: properly set MT7531_CPU_PMAP
Date: Mon, 22 May 2023 15:15:27 +0300
Message-Id: <20230522121532.86610-26-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_131704_459872_E6180EC3 
X-CRM114-Status: GOOD (  18.83  )
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
Cc: mithat.guner@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Every bit of the CPU port bitmap for MT7531 and the switch on the MT7988
SoC represents a CPU port to trap frames to. Currently only the bit that
corresponds to the first found CPU port is set on the bitmap. Introduce the
MT7531_CPU_PMAP macro to individually set the bits of the CPU port bitmap.
Set the CPU port bitmap for MT7531 and the switch on the MT7988 SoC on
mt753x_cpu_port_enable() which runs on a loop for each CPU port. Add
comments to explain this.

According to the document MT7531 Reference Manual for Development Board
v1.0, the MT7531_CPU_PMAP bits are unset after reset so no need to clear it
beforehand. Since there's currently no public document for the switch on
the MT7988 SoC, I assume this is also the case for this switch.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 15 ++++++++-------
 drivers/net/dsa/mt7530.h |  3 ++-
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 58d8738d94d3..0b513e3628fe 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -963,6 +963,13 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 		mt7530_rmw(priv, MT753X_MFC, MT7530_CPU_MASK, MT7530_CPU_EN |
 			   MT7530_CPU_PORT(port));
 
+	/* Add the CPU port to the CPU port bitmap for MT7531 and the switch on
+	 * the MT7988 SoC. Any frames set for trapping to CPU port will be
+	 * trapped to the CPU port the user port is affine to.
+	 */
+	if (priv->id == ID_MT7531 || priv->id == ID_MT7988)
+		mt7530_set(priv, MT7531_CFC, MT7531_CPU_PMAP(BIT(port)));
+
 	/* CPU port gets connected to all user ports of
 	 * the switch.
 	 */
@@ -2315,15 +2322,9 @@ static int
 mt7531_setup_common(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
-	struct dsa_port *cpu_dp;
 	int ret, i;
 
-	/* BPDU to CPU port */
-	dsa_switch_for_each_cpu_port(cpu_dp, ds) {
-		mt7530_rmw(priv, MT7531_CFC, MT7531_CPU_PMAP_MASK,
-			   BIT(cpu_dp->index));
-		break;
-	}
+	/* Trap BPDUs to the CPU port(s) */
 	mt7530_rmw(priv, MT753X_BPC, MT753X_BPDU_PORT_FW_MASK,
 		   MT753X_BPDU_CPU_ONLY);
 
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 5ebb942b07ef..fd2a2f726b8a 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -53,7 +53,8 @@ enum mt753x_id {
 #define  MT7531_MIRROR_MASK		(0x7 << 16)
 #define  MT7531_MIRROR_PORT_GET(x)	(((x) >> 16) & 0x7)
 #define  MT7531_MIRROR_PORT_SET(x)	(((x) & 0x7) << 16)
-#define  MT7531_CPU_PMAP_MASK		GENMASK(7, 0)
+#define  MT7531_CPU_PMAP(x)		((x) & 0xff)
+#define  MT7531_CPU_PMAP_MASK		MT7531_CPU_PMAP(~0)
 
 #define MT753X_MIRROR_REG(id)		((((id) == ID_MT7531) || ((id) == ID_MT7988)) ?	\
 					 MT7531_CFC : MT753X_MFC)
-- 
2.39.2


