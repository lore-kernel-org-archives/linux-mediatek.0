Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBB8C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqRoVOW5ATPKkmSDchjmJB2cTgfNIDW4SGp9tBnvP0Q=; b=jpbQAWlvH8ywV/
	lQ4hDfnnTA3LiovxfVcAqKsIdvby9ljmZoaCnVMnMjBBSJpZRzoIphqCk2ZLKHK0tPpiO9ZBoBngo
	FTtivZ+oK2VIP1UoFcVy10ZEOKWlaoQP5ax1dcLuHUGdAF68xLP5CyyoLVbXWFFVfPI+nrkNGsnHL
	3gjUQEiuX5Gi/YizLM2t9tRzD5yMuY9nl30A/fbzhY3iMOI1B4m0v2ZdWar73uwBPqrmPaK/UzDZm
	Sq6pUWtsLRuae8AyxvRu8O5RVS+JuHLSmrPoEHIFsoZnXDp4sgJTPV0krfGji2EkDGnumKlMjAnXk
	wifWzd9ApyNRNIIdulOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14UA-006Qcc-2p;
	Mon, 22 May 2023 12:17:58 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14TP-006PrF-2J;
	Mon, 22 May 2023 12:17:13 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-96f8d485ef3so368987166b.0;
        Mon, 22 May 2023 05:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757830; x=1687349830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqRoVOW5ATPKkmSDchjmJB2cTgfNIDW4SGp9tBnvP0Q=;
        b=pUw4uKIUNJh5QEQn8is2R/h6lUbhpzqig1b4ddexVTPPD9XVIqJ9g/wMetQyRjn/s7
         iyIKR2mc40MhSUcoC26nUXn9ZJgchgDimE5YicIDCx2k72qNqSvIfXw8XSbIm0nZjI/2
         ZNKZvbWbdT7tUqstSqQQuknQZ+KQVxgJljPqP8DsyHGp00yDl/FmeJ2tOO0QVn8LfqJ8
         cqNZjEBvuMLPRx7VkW9vxZESHTDhL0JR4mrys+CwGHuaM5WfD4PDegQPyLj2RuAJ7gEi
         DDtuYHcfsS9wxf8QoW7c3BS6C0EvcavSrBErQHu0xHwiqKp/M7qqwKR5whWOaTBjpIav
         mMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757830; x=1687349830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqRoVOW5ATPKkmSDchjmJB2cTgfNIDW4SGp9tBnvP0Q=;
        b=TEPkm2wsZNECq6RqNv06mYIIX8tXMmLSzQvqVoZBAeeZNgU7qBOMoizyZgln+Tpy7y
         23wNTHhpO0MoK3ETGJ40GcBdfUqTWnp+3iuTGXNmqJGnKobGnn/U0epITPuf9HGR66ey
         +ljnTvR4pn6sMePAC5wtTloHRB60CtpBA0YWC9ckAw00uaw9Xnh+Fu8umq40TulKfHqi
         Fzhk7/83avg7HaCDVzOk7oBfbGAwDC6OlQdQt2SsMlScolQV8XKAGefWxRU9gZ+Q6AZQ
         yeDiDGI2Mm9D4IH2NFxWIC00Q6sKi9xtPEEJAxxikvVgfG+iNgnBD38P4D9gma/fiDkU
         K0FA==
X-Gm-Message-State: AC+VfDzJQLjUXryi6UgjW1hNzbb8nR7/S7A1/o+8qolLtCAtGP7OQ9Nl
	/NeoNZ+NPQQr7yQoZw9qNWE=
X-Google-Smtp-Source: ACHHUZ7S5doXEQbzc7jj+Nwm/KeUfeIBOBxtvMLCkdUE7EEsyV+Swmuat4wLSM2bpWQovi+wxudbjQ==
X-Received: by 2002:a17:907:25c2:b0:96f:8439:6143 with SMTP id ae2-20020a17090725c200b0096f84396143mr7741710ejc.40.1684757830174;
        Mon, 22 May 2023 05:17:10 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:17:09 -0700 (PDT)
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
Subject: [PATCH net-next 28/30] net: dsa: mt7530: introduce LLDP frame trapping
Date: Mon, 22 May 2023 15:15:30 +0300
Message-Id: <20230522121532.86610-29-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051711_775233_51ECCE60 
X-CRM114-Status: GOOD (  16.37  )
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

The MT753X switches are capable of trapping certain frames. Introduce
trapping LLDP frames to the CPU port(s) for the MT753X switches.

For MT7530, LLDP frames will be trapped to the numerically smallest CPU
port which is affine to the DSA conduit interface that is set up. The LLDP
frames won't necessarily be trapped to the CPU port the user port, which
these LLDP frames are received from, is affine to.

For MT7531 and the switch on the MT7988 SoC, LLDP frames will be trapped to
the CPU port the user port is affine to.

The bit for R0E_MANG_FR is 27. When set, the switch regards the frames with
:0E MAC DA as management (LLDP) frames. This bit is set to 1 after reset on
MT7530 and MT7531 according to the documents MT7620 Programming Guide v1.0
and MT7531 Reference Manual for Development Board v1.0, so there's no need
to deal with this bit. Since there's currently no public document for the
switch on the MT7988 SoC, I assume this is also the case for this switch.

Remove the ETHSYS_CLKCFG0 register which doesn't exist on the said
documents, and conflicts with the MT753X_RGAC2 register.

The mt753x_bpdu_port_fw enum is universally used for trapping frames,
therefore rename it and the values in it to mt753x_port_fw.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 12 ++++++++++--
 drivers/net/dsa/mt7530.h | 23 ++++++++++++-----------
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2fb4b0bc6335..8f5a8803cb33 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2225,7 +2225,11 @@ mt7530_setup(struct dsa_switch *ds)
 
 	/* Trap BPDUs to the CPU port */
 	mt7530_rmw(priv, MT753X_BPC, MT753X_BPDU_PORT_FW_MASK,
-		   MT753X_BPDU_CPU_ONLY);
+		   MT753X_PORT_FW_CPU_ONLY);
+
+	/* Trap LLDP frames with :0E MAC DA to the CPU port */
+	mt7530_rmw(priv, MT753X_RGAC2, MT753X_R0E_PORT_FW_MASK,
+		   MT753X_R0E_PORT_FW(MT753X_PORT_FW_CPU_ONLY));
 
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
@@ -2325,7 +2329,11 @@ mt7531_setup_common(struct dsa_switch *ds)
 
 	/* Trap BPDUs to the CPU port(s) */
 	mt7530_rmw(priv, MT753X_BPC, MT753X_BPDU_PORT_FW_MASK,
-		   MT753X_BPDU_CPU_ONLY);
+		   MT753X_PORT_FW_CPU_ONLY);
+
+	/* Trap LLDP frames with :0E MAC DA to the CPU port(s) */
+	mt7530_rmw(priv, MT753X_RGAC2, MT753X_R0E_PORT_FW_MASK,
+		   MT753X_R0E_PORT_FW(MT753X_PORT_FW_CPU_ONLY));
 
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 52e5d71a04d3..2664057b3cd2 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -25,10 +25,6 @@ enum mt753x_id {
 
 #define TRGMII_BASE(x)			(0x10000 + (x))
 
-/* Registers to ethsys access */
-#define ETHSYS_CLKCFG0			0x2c
-#define  ETHSYS_TRGMII_CLK_SEL362_5	BIT(11)
-
 #define SYSC_REG_RSTCTRL		0x34
 #define  RESET_MCM			BIT(2)
 
@@ -63,16 +59,21 @@ enum mt753x_id {
 #define MT753X_MIRROR_MASK(id)		((((id) == ID_MT7531) || ((id) == ID_MT7988)) ?	\
 					 MT7531_MIRROR_MASK : MT7530_MIRROR_MASK)
 
-/* Registers for BPDU and PAE frame control*/
+/* Register for BPDU and PAE frame control */
 #define MT753X_BPC			0x24
 #define  MT753X_BPDU_PORT_FW_MASK	GENMASK(2, 0)
 
-enum mt753x_bpdu_port_fw {
-	MT753X_BPDU_FOLLOW_MFC,
-	MT753X_BPDU_CPU_EXCLUDE = 4,
-	MT753X_BPDU_CPU_INCLUDE = 5,
-	MT753X_BPDU_CPU_ONLY = 6,
-	MT753X_BPDU_DROP = 7,
+/* Register for :03 and :0E MAC DA frame control */
+#define MT753X_RGAC2			0x2c
+#define  MT753X_R0E_PORT_FW(x)		(((x) & 0x7) << 16)
+#define  MT753X_R0E_PORT_FW_MASK	MT753X_R0E_PORT_FW(~0)
+
+enum mt753x_port_fw {
+	MT753X_PORT_FW_FOLLOW_MFC,
+	MT753X_PORT_FW_CPU_EXCLUDE = 4,
+	MT753X_PORT_FW_CPU_INCLUDE = 5,
+	MT753X_PORT_FW_CPU_ONLY = 6,
+	MT753X_PORT_FW_DROP = 7,
 };
 
 /* Registers for address table access */
-- 
2.39.2


