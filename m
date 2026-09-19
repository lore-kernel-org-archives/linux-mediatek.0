Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DCBC982DD
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Sep 2026 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K14gEIiwRJ26lA+Mkn6qqcGlhkPWo02FPF9k8+47c18=; b=rRGfc9h+HzlgRwBGKBRmG/y0R1
	ikGK7IRl4MAXiGZnI5CWfwilkrbNi9vLmxWNGkNnzypQZWOOhJN4QvR57yS1KZCjDr6a86icXp6CO
	jJgktKZYeLQTaR8piMO28sY74JHAneaLLYzh+gwAokRf1CdSksmzc2gzFheHXkHm7DufVN5PUqgRT
	BwlfOEhpXT/t5Pf9Evjlbgo6J1aBdmWonRpVCP38ogtcc86Y0djHwxFkANnI/xVSgqiJsife0fd1l
	HQetydzF188IfTioO2xYu6c3/+3jOywNYv4iAWEjMxJiofoKFI939ECBcEEPDx48uBlwgtLarrXRV
	ltcC+Stw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ovv-0000000G08R-1sHH;
	Sat, 19 Sep 2026 06:52:23 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ovr-0000000G06a-3ztT
	for linux-mediatek@lists.infradead.org;
	Sat, 19 Sep 2026 06:52:21 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469b355ffso933646b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 23:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789800739; x=1790405539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K14gEIiwRJ26lA+Mkn6qqcGlhkPWo02FPF9k8+47c18=;
        b=CDl5udMwLzdgeJG2Y81JbhHhCBBaAfoamPXitI5IF/hS7safiQ+J8kNqUyiEPAf/GC
         kxeddRurAglI5TxAB4sQGYn2eDiEj4/sO4kxiSMORrIJb7wc3cxufnwX2vHurmrv5k1j
         oRIgVRZ+WXsiMIlmFRlcwOHrW6GNuONLfiOuomkeNlWBK8PSDhMDoWgxMSkyXgYstjRU
         0RMKGIg1IiiuWceBPnJXvdluXr5CjhMGdbzoZVRTXwBXnUtDde7MXvp5G04rIal5JkWC
         DL4R8hLUQFRyc74xFy2cwliRyTPbCeNd1xXYSJ93/lk1DGC8/IqRQnfF8YyM8BP8KWIi
         WQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789800739; x=1790405539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K14gEIiwRJ26lA+Mkn6qqcGlhkPWo02FPF9k8+47c18=;
        b=Ee7qMst+17p5yTnL7MDy5fgI9Oq1V2NXFXE7EhNwsDN+0jGJc4ON69xVGXTxVlMvfe
         W5xcmQzhkfRRd51IXrB3uPFQ0nbc9qV8T2c8jO8YzoMT6EMahxwqv0SwT7+C0voi52vF
         EjdOgWZrQtxWWlcnIZ5AGhycAsB47rUhuOez9uTuomQSd6AftrBNCtMqceRBowKXJNzT
         TdVJaM53aqrA7VY+a1chBA+3Zc/u47QxN9LdPLadwXpzJxFJDzzJWd3GxfxP5dnttZ8e
         20w/19LU5uz+TWqVeU30d3cOL8Y/oXsk8/gYV37PZruw2NCXppq9cfpJHWB8rq9rF3h6
         +ECA==
X-Forwarded-Encrypted: i=1; AKwUvBxrCwSTU785h/DouiaTKTYvb+smnqWVM2yowxXCCqsMhmjWTPaiVBEwpGUhdSQJc41H6le597b8TySoXhESnA==@lists.infradead.org
X-Gm-Message-State: AFuF++mUSyackPcqO8KJpk9aRsg3nGsDDCojjg5PHF23OKzwz7COF4hi
	y9aMxO6Y2gXql+s9DKMMdKkRhs3mhVgaBnHieNf0hkvZOcPk4upGXARd
X-Gm-Gg: AYBFou3jb76jSg9B46JcQOuBww7Gr9MEVaLOOZFlPrELozKOA6oLBKruMasFGy6Fx6u
	zBktnnjLQDPHNrUP/0TfJ52Zs983+EVnyI1gUvDoNA6FiRzEyyw1C21eoOP73Qv7Uu5MRTT0Ohz
	W4wVW2t60MO+hzYndEN2jU75oO+ITtb2Lx2gn9M3+qZjeMVev24fjmAqTCp9z+YY/WdZh6Cwq8n
	DaaGDXpCm5+3WXlOyqOd7eE14mg3/EFM2JA4SNnvsvC/qBOFyS7Z1xsGcOsMB0EUN2eQhW60gKR
	orGPOBqUU63z18O7xzXwuLND5GCQ18j0Xsa4cjP9fMVUukme2wSxUJuUVKRoNYpWebtg7EvGZbz
	QUQuarMpk31KI8QIrxxL7aFiLNOJmNihn7FmCU9XZlcQkG1BAmcCAXWg77YuaD1HTqJ36EDobX3
	SVcoi5stUGWkqjwR+yp7bdOiUCk/2BPoieJ8vpbwBhhtMz80a/iIk8Lb1O5J2+mhzCfSUNqp7FH
	w3rM2G7rDMmZYKOggqFrkdQOBOvsKqHfw==
X-Received: by 2002:a05:6a00:2e11:b0:878:34d7:6995 with SMTP id d2e1a72fcca58-87834d76d70mr625344b3a.37.1789800738978;
        Fri, 18 Sep 2026 23:52:18 -0700 (PDT)
Received: from abs.sf.dndws.com ([50.35.86.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f5464sm678077b3a.27.2026.09.18.23.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:52:18 -0700 (PDT)
From: Tao <gongtao0607@gmail.com>
To: netdev@vger.kernel.org
Cc: Tao <gongtao0607@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 2/2] net: dsa: mt7530: trap frames to conduit in MFC on EN7581 and AN7583
Date: Sat, 19 Sep 2026 06:52:12 +0000
Message-ID: <20260919065214.31604-3-gongtao0607@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919065214.31604-1-gongtao0607@gmail.com>
References: <20260919065214.31604-1-gongtao0607@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_235220_017745_B7F00B17 
X-CRM114-Status: GOOD (  12.39  )
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

On MT7531 and MT7988 switches, trapped frames forwarding is directed to
CPU ports specified in the MT7531_CFC (0x04) CPU_PMAP bitmap. When support
for EN7581 was introduced, it was assumed to follow the MT7531 model.

However, on Airoha EN7581 and AN7583 switch IP, setting MT7531_CFC alone
is not sufficient for trapped control frames (such as STP BPDUs) to exit
towards the CPU port. The switch forwarding hardware also requires the
MT7530_CPU_EN bit and MT7530_CPU_PORT field to be enabled in MT753X_MFC
(0x10). Without this, trapped frames are dropped by the switch forwarding
logic and never reach the CPU conduit.

Include ID_EN7581 and ID_AN7583 in mt753x_conduit_state_change() to set
MT7530_CPU_EN and MT7530_CPU_PORT in MT753X_MFC when the conduit becomes
operational, matching the handling for MT7530, MT7621, and EN7528.

Fixes: 2b0229f67932 ("net: dsa: mt7530: Add EN7581 support")
Signed-off-by: Tao <gongtao0607@gmail.com>
---
 drivers/net/dsa/mt7530.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 863f2079833f..9693a55f553e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3309,7 +3309,8 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
 	 * interface is up.
 	 */
 	if (priv->id != ID_MT7530 && priv->id != ID_MT7621 &&
-	    priv->id != ID_EN7528)
+	    priv->id != ID_EN7528 &&
+	    priv->id != ID_EN7581 && priv->id != ID_AN7583)
 		return;
 
 	mask = BIT(cpu_dp->index);
-- 
2.55.0


