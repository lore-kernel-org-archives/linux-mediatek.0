Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4588EB64DD
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mdVpG6KrBclrQ0ouLiBkLwF9mOH3uxISN3uLBX1IcqM=; b=iOh3vHTkvxRcasI8DNUqrT1qXt
	+EFGzk90ttPCWvhi465hd+hfVab1SH7olfHF3qZccS0BVbb16G3pFIy2WjUbIHIddeSfnZ8R3HSvr
	wF+8TO3Ikq0prdgOGtkUBC5ElvIYYJk7vYTbqUzjgjjX//OF9Wuw+m7qZMtOrtO7JbCo1gKlmHF3r
	ubgmSFt43QIkJTtARAohGwZDk+F7zC+vLYrdX8S635WqgS81K3JCBZrACfsaT/KvC7sxXxbGRdX0E
	wl1aCI8DsYLcuI57G6l8SoxZ2gWu+jmEXjfGN7OdrOzQmQ0xTEnaducOB8AuGRcXGxiGt3/ZQ/g5M
	+S1Rznmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qV8oz-00Ezmu-0s;
	Sun, 13 Aug 2023 10:59:45 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qV8ov-00EzlO-1W;
	Sun, 13 Aug 2023 10:59:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86DE21BF203;
	Sun, 13 Aug 2023 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1691924375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mdVpG6KrBclrQ0ouLiBkLwF9mOH3uxISN3uLBX1IcqM=;
	b=U6RxFQzLHDJ2hTlJRDh5d1aBt7SPPoIHKaPO0i5YdVDSOK6o58k2WrckL3SwuINAtbYRj+
	ACto8MENZ9NEdu+Vf2sqTcJa/TcUsAfw/fCrq7dkopbE4ch1lHdY4ErmB2Sb4RZt+h4H15
	ZlkNPt7lhXA7kKgWfgDVGV8fn6z2as683LFElvkd/ZQGdH6BLcMoEPW2MpThGmXoccrc5j
	PT+n/hWtjh8KixMUTVWxC5Jfvc7ivpZY3ZlBExUiqcPjol+9HJdF7spSRunFI7m+sRNHL0
	XYn4BsY9pA2pPTTkiIjVfbU1mUbmxAvTbtCB2JJ3OChtqllsMGEs2ZUoQbZ56g==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: dsa: mt7530: fix handling of 802.1X PAE frames
Date: Sun, 13 Aug 2023 13:59:17 +0300
Message-Id: <20230813105917.32102-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_035941_669769_F0AE2A9B 
X-CRM114-Status: UNSURE (   9.15  )
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

802.1X PAE frames are link-local frames, therefore they must be trapped to
the CPU port. Currently, the MT753X switches treat 802.1X PAE frames as
regular multicast frames, therefore flooding them to user ports. To fix
this, set 802.1X PAE frames to be trapped to the CPU port(s).

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 4 ++++
 drivers/net/dsa/mt7530.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 38b3c6dda386..b8bb9f3b3609 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1006,6 +1006,10 @@ mt753x_trap_frames(struct mt7530_priv *priv)
 	mt7530_rmw(priv, MT753X_BPC, MT753X_BPDU_PORT_FW_MASK,
 		   MT753X_BPDU_CPU_ONLY);
 
+	/* Trap 802.1X PAE frames to the CPU port(s) */
+	mt7530_rmw(priv, MT753X_BPC, MT753X_PAE_PORT_FW_MASK,
+		   MT753X_PAE_PORT_FW(MT753X_BPDU_CPU_ONLY));
+
 	/* Trap LLDP frames with :0E MAC DA to the CPU port(s) */
 	mt7530_rmw(priv, MT753X_RGAC2, MT753X_R0E_PORT_FW_MASK,
 		   MT753X_R0E_PORT_FW(MT753X_BPDU_CPU_ONLY));
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 08045b035e6a..17e42d30fff4 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -66,6 +66,8 @@ enum mt753x_id {
 /* Registers for BPDU and PAE frame control*/
 #define MT753X_BPC			0x24
 #define  MT753X_BPDU_PORT_FW_MASK	GENMASK(2, 0)
+#define  MT753X_PAE_PORT_FW_MASK	GENMASK(18, 16)
+#define  MT753X_PAE_PORT_FW(x)		FIELD_PREP(MT753X_PAE_PORT_FW_MASK, x)
 
 /* Register for :03 and :0E MAC DA frame control */
 #define MT753X_RGAC2			0x2c
-- 
2.39.2


