Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4EFC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D33B0206A1
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f/zo5muD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJKofRg3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D33B0206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CX1gJOMDKAcKdgLgKYktAXLYHqtZfg8i6RSR5/BuSmk=; b=f/zo5muDqJ5Gx5ZrOuTtuWWTB
	1Z9TUo0EnrachkS7ggzNcDTssXYlSRki25KW1T6B7Sr+HvQd/mleJDlf0NmTTau5t7L5vWYP6ub8A
	XujR2vbEhsGzoRGRdOAsNsKnamH+JgdhDvruY+rP7XjmnALPvgA6xyRfi1Eu668pM8HtfboY2seJ5
	geSvE7t4ZF1nTau28cugGrzvryd+S+aPEXHwjxY/XfW9eY0T7uHkEwUKcnhLpoy1Ckl2iMLZ8kGnf
	YUbQxt4hT8MD9uVDo4p3LSvro4qXbvGFVmWjwq0kiqGhCTQEiKltkqo/89mOK4pQMBD9XSADxsYhO
	+yVVL8drA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsP-0006EE-5m; Fri, 03 Jul 2020 08:16:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGsF-00064I-1n
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:44 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FECA206A1;
 Fri,  3 Jul 2020 08:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764202;
 bh=PO1Nvdcr9vILZYFERiZQGDgnlpRlKGGzimUUNaF7Fu0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MJKofRg3Y9Iy/dJShoXJmcSR+Vwzel3l+lxw+pDeMBMDJj6UcH2SgQVh7wDKiWST7
 2UGvR4KuRYeQVnZi9Jh+d7ubDF2+PL/+QEPissR8isAfobk+rtTvZA8LdQxEU3wH8R
 KHeII3/XHp3/Wf2c9OFXfrHoJOlvDzQ4XUu8pSA4=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 12/22] mt76: mt7615: run mt7615_mcu_set_wmm holding mt76
 mutex
Date: Fri,  3 Jul 2020 10:15:51 +0200
Message-Id: <ddb279d53ab481d2bd1518fcc52f592b86df8e7f.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041643_220697_380253A5 
X-CRM114-Status: UNSURE (   9.71  )
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

Make sure to run mt7615_mcu_set_wmm() holding mt76 mutex in order to
wake the device from low power state and avoid races

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index eb56cd7cb429..c52b5c68ba97 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -433,11 +433,17 @@ mt7615_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif, u16 queue,
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct mt7615_dev *dev = mt7615_hw_dev(hw);
+	int err;
+
+	mt7615_mutex_acquire(dev);
 
 	queue = mt7615_lmac_mapping(dev, queue);
 	queue += mvif->wmm_idx * MT7615_MAX_WMM_SETS;
+	err = mt7615_mcu_set_wmm(dev, queue, params);
 
-	return mt7615_mcu_set_wmm(dev, queue, params);
+	mt7615_mutex_release(dev);
+
+	return err;
 }
 
 static void mt7615_configure_filter(struct ieee80211_hw *hw,
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
