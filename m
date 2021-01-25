Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_PH_BODY_ACCOUNTS_PRE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CD5C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 17:09:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 533A020757
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 17:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 533A020757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v16/gtNtY/tKm5N4ju+QOorYTksycw2QVph+i2PKCOQ=; b=LepJGwziS/+ZbT4wDibkcD48p
	6pDr1F4MM29qVj3bUyZz1fZJHdP7XZ0vBVb6y1CEZld6tnUhUgp5B4gFAoRmMJ6WFOavJq7V1hply
	X/alKdz9E7QAdEjC5nsgFdqTNPWAg7SM5ifI/Ppk81vU+m6JPUwoPQyIxPtXFiV3X+DZniPQJ8Svx
	HaSGAXe8/avLcBeeSdDs3ZbBGgGzDd5MJxqu4rFjlKkBCdkXA0G24QWrmrAsgv7oOOIj1Af1kYP4c
	Gl5g1AQ4LU9zSBZ+NaKVMmGPwUL0nv4RDhwUTHQHHTNv0AACXeszX/0O7FNZRhtPtiyKnBFUAozyK
	PS7XkDGkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l45MB-0006RP-Tt; Mon, 25 Jan 2021 17:08:51 +0000
Received: from perceval.ideasonboard.com
 ([2001:4b98:dc2:55:216:3eff:fef7:d647])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l45M8-0006Qc-QO
 for linux-mediatek@lists.infradead.org; Mon, 25 Jan 2021 17:08:49 +0000
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23C5C9FF;
 Mon, 25 Jan 2021 18:08:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1611594523;
 bh=s4U9Ejb6ol7vRTaFMsIKJy4NuPLqT6wMBylgJBy1dSM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ArlWlQfPnEgt7FObe6Od4x1PeZQmehnZwing1Dq3sWG1U9JYNclI0FL9b7sKLhR9T
 CvpSjtNTLy6axfLQfPpZkglkiZxPCESgieYAsGC9//Jyhkt4VpBY++EJrfUB3wLqX0
 7epKXVAP4KjO4unGFCMWyAwLX4To+gHjLP7UFMHU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: mediatek: mux: Update parent at enable time
Date: Mon, 25 Jan 2021 19:08:19 +0200
Message-Id: <20210125170819.26130-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210125170819.26130-1-laurent.pinchart@ideasonboard.com>
References: <20210125170819.26130-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_120848_979283_AA80D46A 
X-CRM114-Status: GOOD (  16.50  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Phi-Bang Nguyen <pnguyen@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The mux clocks don't always correctly take the new parent into account
when the parent is updated while the clock is disabled. Set the update
bit when enabling the clock to force an update of the mux.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/clk/mediatek/clk-mux.c | 32 +++++++++++++++++++++++++++++---
 drivers/clk/mediatek/clk-mux.h |  1 +
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 9370bebca7f8..b0c61709bacc 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -20,9 +20,33 @@ static inline struct mtk_clk_mux *to_mtk_clk_mux(struct clk_hw *hw)
 static int mtk_clk_mux_enable_setclr(struct clk_hw *hw)
 {
 	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
+	unsigned long flags = 0;
 
-	return regmap_write(mux->regmap, mux->data->clr_ofs,
-			BIT(mux->data->gate_shift));
+	if (mux->lock)
+		spin_lock_irqsave(mux->lock, flags);
+	else
+		__acquire(mux->lock);
+
+	regmap_write(mux->regmap, mux->data->clr_ofs,
+		     BIT(mux->data->gate_shift));
+
+	/*
+	 * If the parent has been changed when the clock was disabled, it will
+	 * not be effective yet. Set the update bit to ensure the mux gets
+	 * updated.
+	 */
+	if (mux->reparent && mux->data->upd_shift >= 0) {
+		regmap_write(mux->regmap, mux->data->upd_ofs,
+			     BIT(mux->data->upd_shift));
+		mux->reparent = false;
+	}
+
+	if (mux->lock)
+		spin_unlock_irqrestore(mux->lock, flags);
+	else
+		__release(mux->lock);
+
+	return 0;
 }
 
 static void mtk_clk_mux_disable_setclr(struct clk_hw *hw)
@@ -77,9 +101,11 @@ static int mtk_clk_mux_set_parent_setclr_lock(struct clk_hw *hw, u8 index)
 		regmap_write(mux->regmap, mux->data->set_ofs,
 				index << mux->data->mux_shift);
 
-		if (mux->data->upd_shift >= 0)
+		if (mux->data->upd_shift >= 0) {
 			regmap_write(mux->regmap, mux->data->upd_ofs,
 					BIT(mux->data->upd_shift));
+			mux->reparent = true;
+		}
 	}
 
 	if (mux->lock)
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 15c62366ba9a..f1946161ade1 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -14,6 +14,7 @@ struct mtk_clk_mux {
 	struct regmap *regmap;
 	const struct mtk_mux *data;
 	spinlock_t *lock;
+	bool reparent;
 };
 
 struct mtk_mux {
-- 
Regards,

Laurent Pinchart


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
