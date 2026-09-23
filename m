Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58201C98302
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2026 05:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8I4xevnwT3ppSAEaRbNTpjJDMceK72lG36tesANdB7I=; b=iom7NipjPsKE/tb7lQ5ZELr1dg
	9NHEPR/zETJJTZqdJ5UDuZ+TjedLGzxzlNa56oH1w3NCB1KNmfKktlXZDW0sPLbX2Gr6DH5GFWcgY
	hjjiIQEguL6b+Tf6u1ShrfFdr+5B5iQegLB/I06IFJ5BxzDyR/8XHS0kUNwgf7/gixDWPwIL5q6MD
	3E76NncE0AH5vj7bkunh/PvLAzaFkO/3XqCpUVblJIZ/1hHD6iHxmFQwOCcqSc3/FhjSkoQDTRRWI
	/SOv/lQoZqFNoKUtS2owpxJgtWvi6wjRtBW5b9eDhVq1RneDRsRT96LpqB3dLh+RKQ+5BGlVtJpiB
	BIAlQ+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fss-00000007CpS-3Cg5;
	Wed, 23 Sep 2026 05:51:10 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fsp-00000007Cne-3jAF
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Sep 2026 05:51:09 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso326315a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2026 22:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790142667; x=1790747467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8I4xevnwT3ppSAEaRbNTpjJDMceK72lG36tesANdB7I=;
        b=gfSlgSeigy7KngPA6s9bmHOAeID+KVji184727XgRq59F2JXKaCvaNx2CmlMFDQ465
         UtKHbMIlQx62pxC86fj6qCFGCLvi/aGWy+qlBZQ1TOdm2FH6G0NRAP/U9jtIO1LUgJeP
         CbhqSxrQsC/KP6Ixlzdf0BaGyE9tebZlnldbWy+XrZ73Va8GxYOXeMKcYDoilDEQWFBE
         67ZxIiXJ8Chr8Dl5DO0K8vSfsjUeMHzUq54Lbkf+bWoPq2smUINCsvmtIGDLhKwa1sTp
         nm6frsNBWgh+Th33wN2yC6UauT/fyE2B69WmUwZAM3PyZNGOHiZo0tV5zfROlxwlCxa7
         J9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142667; x=1790747467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8I4xevnwT3ppSAEaRbNTpjJDMceK72lG36tesANdB7I=;
        b=rCzW+qpFrWpq6zp3+oJZ7Mxbi31DjCEq6ha3X4RMqP1z+VyfiITzMbbqfsKt61jhGe
         cwDVFOGx23NyLN2GIiOhuLuxsLqlsbqlQq856ps0Mxp0hVKnhpmPM+wHGIL3ZppyW9gE
         yvcxj859tgwzcnLUptpBraHP6wrRHRcWjFVUW22grkR+WitmOTwqIeePMwF4V9JsU1p4
         dAj/3yuJve1Q7PW5VP4UUKxE7dW6MFcOv9Sp9bpqoyBii+PpU2AFhQTPW6dvMO+eBPpF
         Pwehyho2yQTjzAnDclF07T68FnYKNpGs11hW7PBpEUwEOsWYi4B9sdoPQCPR704U1OD3
         pJog==
X-Forwarded-Encrypted: i=1; AKwUvBwgCqg40+fvEpsoUs3ig8BVij2gEgB1gdloB3vKDip8KKTJysEsIWL3LAy1+/1Tzev83DHQybZcP6T7sw8R4A==@lists.infradead.org
X-Gm-Message-State: AFuF++kHUqaFTbw/AYDvbRExS+jQsIskHILkV0ksbYVSjG0nSoicvWmq
	4BwrXL4GRt3LHDU55uo8FwIC5+1/o2yDfGRuOWPULiuHJiZ+TLSkjRUs
X-Gm-Gg: AYBFou2XYgd24vXgLplGenTaKVFsw7iMJnXjsRnZbjs6ShzwHt7dPZGRhO+H/WXkwGL
	9cN27/5s4NeEO3JIzFoFKvbpSU6XZ95LsgFj4uv18SatG8UTMK0+PxxVn4x3vozYcA3xI7EI1Td
	Ns5ghEWsMblHm7KD4HtOusys3ooHsmWy0jekpqtJ/s8F6mjFs/8JP53Y3B3e/y0lWXihFLxxooJ
	DmvKn251xyotRXXej44oJpWUDWg6skgeNl/iu7+u3pwrUVjF7ELkY3rbCD5lLMT0axLGMqS9wWy
	Hh1ToF4jRbjEDIE67hat7GtEWj5s8jIzfx2GfAKuibh1p1K8iTz9VU5jQ3n8ZRpWmNvh82HSOL3
	rWmyJ/6m8QdsLk4IKyVynOUZYQckCu0gX6qHR4D1X8VeBqpp6NEW0Yeli1MIpSl54LD/AhdQs3h
	zG9GcJ6Dv4w1COxu0D4cyvUUTL5zvI/xmzqQP57DWazCgmfOwzlof8bt0V7brN0+NYIrcUNLBkM
	qCuRV/9MmjPl8KYx5z7A3y51ZD39kUgfII2GZzLWtlrqB9HSloztDA=
X-Received: by 2002:a05:6a21:ed0a:b0:3dd:a197:cf27 with SMTP id adf61e73a8af0-3ddf828a55fmr1675049637.75.1790142667003;
        Tue, 22 Sep 2026 22:51:07 -0700 (PDT)
Received: from abs.sf.dndws.com ([50.35.86.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dffd6ddsm691486b3a.48.2026.09.22.22.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:51:06 -0700 (PDT)
From: Tao Gong <gongtao0607@gmail.com>
To: netdev@vger.kernel.org
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tao Gong <gongtao0607@gmail.com>
Subject: [PATCH net v2 1/2] net: dsa: mt7530: use consistent egress tag for trapped link-local frames
Date: Wed, 23 Sep 2026 05:51:02 +0000
Message-ID: <20260923055103.949540-2-gongtao0607@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923055103.949540-1-gongtao0607@gmail.com>
References: <20260923055103.949540-1-gongtao0607@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_225107_972127_98D65507 
X-CRM114-Status: GOOD (  14.42  )
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

commit 3ac85bcfd404 ("net: dsa: mt7530: preserve VLAN tags on trapped
link-local frames") changed the egress VLAN tag attribute for trapped
link-local frames in BPC, RGAC1, and RGAC2 from MT7530_VLAN_EG_UNTAGGED
to MT7530_VLAN_EG_DISABLED, with the intention of passing frames
through without VLAN tag modification.

However, in MT7530 hardware, MT7530_VLAN_EG_DISABLED disables the
protocol-level egress tagging override, causing trapped frames to
fall back to the egress port's active VLAN table (VAWD2) rule. When a
bridge with VLAN filtering is active, the CPU port is configured with
stack mode, causing the switch to insert a VLAN tag into incoming
untagged BPDUs (01:80:C2:00:00:00) and other link-local frames before
delivering them to the CPU conduit.

Because BPDUs arrive at the CPU with a VLAN tag (EtherType 0x8100
at offset 12 instead of 802.3 length <= 1500), userspace STP daemons
(such as ustpd) and the kernel bridge drop or ignore them, breaking
STP convergence.

Use MT7530_VLAN_EG_CONSISTENT instead. This instructs the hardware to
keep egress tagging consistent with the ingress wire format: frames
received untagged on the wire remain untagged when forwarded to the
CPU, while VLAN-tagged frames preserve their original VLAN tag.

Fixes: 3ac85bcfd404 ("net: dsa: mt7530: preserve VLAN tags on trapped link-local frames")
Signed-off-by: Tao Gong <gongtao0607@gmail.com>
---
 drivers/net/dsa/mt7530.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3e61eb3c2b1e..20bb07fac0f7 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1309,39 +1309,39 @@ static void
 mt753x_trap_frames(struct mt7530_priv *priv)
 {
 	/* Trap 802.1X PAE frames and BPDUs to the CPU port(s) and egress
-	 * them with the EG_TAG attribute set to disabled (system default)
-	 * so that any VLAN tags in the frame are not modified by the
-	 * switch egress VLAN tag processing. This preserves VLAN tags
-	 * for reception on VLAN sub-interfaces.
+	 * them with the EG_TAG attribute set to consistent so that any
+	 * VLAN tags in the frame are not modified by the switch egress
+	 * VLAN tag processing. This preserves VLAN tags for reception
+	 * on VLAN sub-interfaces.
 	 */
 	mt7530_rmw(priv, MT753X_BPC,
 		   PAE_BPDU_FR | PAE_EG_TAG_MASK | PAE_PORT_FW_MASK |
 			   BPDU_EG_TAG_MASK | BPDU_PORT_FW_MASK,
-		   PAE_BPDU_FR | PAE_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+		   PAE_BPDU_FR | PAE_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 			   PAE_PORT_FW(TO_CPU_FW_CPU_ONLY) |
-			   BPDU_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+			   BPDU_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 			   TO_CPU_FW_CPU_ONLY);
 
 	/* Trap frames with :01 and :02 MAC DAs to the CPU port(s) and
-	 * egress them with EG_TAG disabled.
+	 * egress them with EG_TAG consistent.
 	 */
 	mt7530_rmw(priv, MT753X_RGAC1,
 		   R02_BPDU_FR | R02_EG_TAG_MASK | R02_PORT_FW_MASK |
 			   R01_BPDU_FR | R01_EG_TAG_MASK | R01_PORT_FW_MASK,
-		   R02_BPDU_FR | R02_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+		   R02_BPDU_FR | R02_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 			   R02_PORT_FW(TO_CPU_FW_CPU_ONLY) | R01_BPDU_FR |
-			   R01_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+			   R01_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 			   TO_CPU_FW_CPU_ONLY);
 
 	/* Trap frames with :03 and :0E MAC DAs to the CPU port(s) and
-	 * egress them with EG_TAG disabled.
+	 * egress them with EG_TAG consistent.
 	 */
 	mt7530_rmw(priv, MT753X_RGAC2,
 		   R0E_BPDU_FR | R0E_EG_TAG_MASK | R0E_PORT_FW_MASK |
 			   R03_BPDU_FR | R03_EG_TAG_MASK | R03_PORT_FW_MASK,
-		   R0E_BPDU_FR | R0E_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+		   R0E_BPDU_FR | R0E_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 			   R0E_PORT_FW(TO_CPU_FW_CPU_ONLY) | R03_BPDU_FR |
-			   R03_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+			   R03_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 			   TO_CPU_FW_CPU_ONLY);
 }
 
-- 
2.55.0


