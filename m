Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A74C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 250CD207DA
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B0Nkg13f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yAPXJ+Fj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 250CD207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=22TPcjva+CWtqx+nnsZ2CtxhXyhZoYm9svXlmNuX1Uc=; b=B0Nkg13fx1rOwnqJWfpT9Vl2w
	hsUvHIzv+ALQuLDWX2lpkLQXlrpRM59AL+DIv9UkE9PDqMv0G71sxNj4+nr6kQSueH3H7gDeCggzS
	ajextU/dEXwvcM08l2xtyRPNEG6PFifBx5nl5et0uZueBQjKw20bdLEiOXzFVOekX/+Yr4O96JlUm
	UcZmmLqIslVMANNubC+gv88NxHO3BbztIgpnsOwWafZ1UdSFnfCDX7Dko9hM5FZMYYMjGhLtT0EOM
	foVX7zevzNUgPkrAzMcVt1WENbNaN3DdNlfP+wXidBXN3BwEAj8J6U2jr/xplFn9IKp7QV93aIh2w
	Z0Tz034gQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsM-0006Bh-LG; Fri, 03 Jul 2020 08:16:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGsD-00062b-85
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:42 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 450EC207FF;
 Fri,  3 Jul 2020 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764200;
 bh=PHxZI6kQT92TJsy5aJifbIG/s34Ng7bluHs6Q1I1JqE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yAPXJ+FjYcLZpzmKBc38EhSbW1BSXIHWJdz3P2YFTFlko4IP+UzCCtNz6bhuYbjDU
 Xz6+t5Z2jHFQWmHOfp7nzwzo0WJn8hKMkCO7+Qa8n0hTX7aQGgCPxMQUjIzP/2zCM9
 E7A1VpHmlPcLfqNuQfxKr0e6acJyQaL9JwvgPTa8=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 11/22] mt76: mt7615: add missing lock in
 mt7615_regd_notifier
Date: Fri,  3 Jul 2020 10:15:50 +0200
Message-Id: <a8d8e4bc64d003972f04b9452ae723f6400842b7.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041641_384572_2AFCA2B5 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 ryder.lee@mediatek.com, linux-wireless@vger.kernel.org, sean.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Make sure to run mt7615_dfs_init_radar_detector in mt7615_regd_notifier
holding mt76 mutex in order to avoid races and set the device in full
power

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index c22878b82540..59c59e8630c1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -294,7 +294,9 @@ mt7615_regd_notifier(struct wiphy *wiphy,
 	if (!(chandef->chan->flags & IEEE80211_CHAN_RADAR))
 		return;
 
+	mt7615_mutex_acquire(dev);
 	mt7615_dfs_init_radar_detector(phy);
+	mt7615_mutex_release(dev);
 }
 
 static void
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
