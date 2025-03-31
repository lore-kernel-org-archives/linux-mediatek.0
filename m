Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3843AC3600B
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Mar 2025 16:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X6B2tJqe01Uq81UH95MalVSBuIVl1PFIf+pP37173PE=; b=C5MX0t23CX1i8DM7VIJUYUkleR
	WSF+jM6yJuBclT/oL3kWppYMttOn4E6LsF0PyeoI2x9HZOKMMlH9yEF+WDHr56ZYwQoBZfJ2cfDpx
	nK/Zm8LwH/dgknRIB546kD6C+Q1Hi1qRoocF5SrdN5gd5Eu06+vzDWCUDdMynebA//W0qRCLjWnL9
	QYlBDWLLJHzB1h2fLGJF7bKslVBsg2/8hNUseLYqBifZ40n0z/hgBPzWQMAeLZV88RZQfczxd6Vd0
	mzmAF2UUYR/kcvS0hJ0TRx8V/yGpr7/0TOcrzXhPF5fXVgUffBBwa6nPWBstWp4kc5svWQVWjobj3
	ybu129Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHre-00000000xhQ-0hvc;
	Mon, 31 Mar 2025 16:19:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHpk-00000000xLz-0JPS;
	Mon, 31 Mar 2025 16:17:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B01FF6112F;
	Mon, 31 Mar 2025 16:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A343AC4CEE3;
	Mon, 31 Mar 2025 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743437875;
	bh=GLt2qxliARWsWadN44XE6Cw38AjZfFoCaVkAZ79+/cI=;
	h=From:Date:Subject:To:Cc:From;
	b=cb0H50iU2Gu6dsH85BTD+036NEeKyWwrG8lw5jnA3dsFfdgL6vGLXJltqgkrDeSzA
	 aeDEh1Ct8X8cIt2oXr6/pWEIo8khx99q/+cCocoQVZbSHl8/1J5OAKimmOr/uU5Hz7
	 xXi3D3w03j3ziem/oWwdP0g0x2rwarRPa/f8VRM9pm6TrKhElm3fvNQFM334lAc00X
	 JIThzeKgMc8E0cyx3YYhuWY+wdYXbXV0CQNB9Cl375QfLJXAz1DMrXX5w08vVLW42E
	 kdG43wiRV52EdSQnjwmiUaHLdY/7gZDK4BnJ/JGr5ZAZj7cDWe0Wk20JKgOFTf1R+f
	 X9BWisPAEPaHg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 31 Mar 2025 18:17:31 +0200
Subject: [PATCH net] net: airoha: Fix ETS priomap validation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-airoha-ets-validate-priomap-v1-1-60a524488672@kernel.org>
X-B4-Tracking: v=1; b=H4sIABrA6mcC/x3MzQpAQBAA4FfRnE3tTyKvIofBYAq7zUpK3t3m+
 F2+BxKrcIK2eED5kiThyLBlAeNKx8IoUzY44yrjvUUSDSshnwkv2mSikzGqhJ0iNuPgZ+PqobI
 W8hCVZ7n/vevf9wP9Uww7bQAAAA==
X-Change-ID: 20250331-airoha-ets-validate-priomap-8cb3f027b511
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Davide Caratti <dcaratti@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

ETS Qdisc schedules SP bands in a priority order assigning band-0 the
highest priority (band-0 > band-1 > .. > band-n) while EN7581 arranges
SP bands in a priority order assigning band-7 the highest priority
(band-7 > band-6, .. > band-n).
Fix priomap check in airoha_qdma_set_tx_ets_sched routine in order to
align ETS Qdisc and airoha_eth driver SP priority ordering.

Fixes: b56e4d660a96 ("net: airoha: Enforce ETS Qdisc priomap")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index c0a642568ac115ea9df6fbaf7133627a4405a36c..5a1039c95241ad943ce6d42e8aa290f693653471 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2028,7 +2028,7 @@ static int airoha_qdma_set_tx_ets_sched(struct airoha_gdm_port *port,
 	struct tc_ets_qopt_offload_replace_params *p = &opt->replace_params;
 	enum tx_sched_mode mode = TC_SCH_SP;
 	u16 w[AIROHA_NUM_QOS_QUEUES] = {};
-	int i, nstrict = 0, nwrr, qidx;
+	int i, nstrict = 0;
 
 	if (p->bands > AIROHA_NUM_QOS_QUEUES)
 		return -EINVAL;
@@ -2046,17 +2046,17 @@ static int airoha_qdma_set_tx_ets_sched(struct airoha_gdm_port *port,
 	 * lowest priorities with respect to SP ones.
 	 * e.g: WRR0, WRR1, .., WRRm, SP0, SP1, .., SPn
 	 */
-	nwrr = p->bands - nstrict;
-	qidx = nstrict && nwrr ? nstrict : 0;
-	for (i = 1; i <= p->bands; i++) {
-		if (p->priomap[i % AIROHA_NUM_QOS_QUEUES] != qidx)
+	for (i = 0; i < nstrict; i++) {
+		if (p->priomap[p->bands - i - 1] != i)
 			return -EINVAL;
-
-		qidx = i == nwrr ? 0 : qidx + 1;
 	}
 
-	for (i = 0; i < nwrr; i++)
+	for (i = 0; i < p->bands - nstrict; i++) {
+		if (p->priomap[i] != nstrict + i)
+			return -EINVAL;
+
 		w[i] = p->weights[nstrict + i];
+	}
 
 	if (!nstrict)
 		mode = TC_SCH_WRR8;

---
base-commit: 4f1eaabb4b66a1f7473f584e14e15b2ac19dfaf3
change-id: 20250331-airoha-ets-validate-priomap-8cb3f027b511

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


