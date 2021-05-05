Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26106C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:54:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C86F6613B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C86F6613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ynM5JR3zA1h5fX1c5fM98jEBa92tSColsaTAUiIANrw=; b=bc9ZvTlxqak23RHgqhoBFK2pd
	0iUHh0ktwe16gnVQYm3G6mLl/iXhYkmZrdal+QVoZdN68cBYwYER+fO2FL0vvgsJDfKS5jwSpKLxT
	7JMK8o6V06RXY5QdJsvX1n+MrgGyrBYJPYvYKQ5UfrRhgsd2GAWDMBvsfQ3tdb8nLrqxuId0HXvV+
	Bi+Lu1fEMgf4q575ZlwiXv518cyCOwHndUXd7ib/InKKB55rpVENuRRMQkdR01lkkIJR77vtD9dJZ
	g6x4Lk7zzsLfTvnbqa7igllD/jo7YCZ8Lo1IkX6fGCyLgjjMG9dydWIxyLxck+H/CKA9DWvGifLGH
	E+CChD4DQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKme-001mp8-5c; Wed, 05 May 2021 16:54:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKXi-001gyh-FF; Wed, 05 May 2021 16:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=VQoO3oCApZ3pKKm/W6X/a8FrJWlV1CnhnDGiQRRBacw=; b=hW17uRDauuUYOAFXNUtxdFI5K+
 hGSbJOF4XKAeVfIMTZXn1BbdyFggM/8QXg1Hm03PSfD9IBTbZ2jCa9LwQZqy6Rsog4+M7UsbMj/uu
 Z+27AZRrFtlG9bthJ7/jXwT3OdUCkelpbKIj3o9/UBbw7ArN5l/kskxeIz2fFi/k84N9VyPznqI5b
 WJXQlmY8He2X0conKHcGrptOg8VFRue92rBPGx5IwDlMC6N8X2HZq9Uaq9C4zs02rUwGgyI0KGNeG
 bfC4NINqqNRb0//FA6UJ9+nK035ugdwHnT0etuF8TyLIEQMU2VyWBvstvC+W4DnxkzB+Q1+16SsQ7
 VUq8aRpQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKXe-004xk9-SL; Wed, 05 May 2021 16:38:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DB8D61461;
 Wed,  5 May 2021 16:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232710;
 bh=VWFWm5cUN1jSxsItT/U9HhoMnGvxh07KV69SrLyK5ns=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f8LuGWZ0CFj/j9LrHALciQam79aHAsxzB46F5Zd+SozCbu61OLfawa3NqI4nGC9vc
 uO/fjc3WFz8z1p/ui/kiXc1LIWmlvdXUkDsAGCHSEFVQTCN9wYZgJw0dLThgsmOFpB
 HRNIo5MXFVNX8Z+bfkcQc0yRfYpWYBWmI9tvLkJx6358qnA8G+sYmDWG11db2pViYQ
 1/GQc/1UkMp9nTwhVGwbmDIiIMkpOXk11UOQ7m55Iofw4vPCe+MiqkLeUex2CP+qkb
 Lc26wgxXCzxoXUN1FzXA/mzNwBU8i64JP0DxAHgmyds6GrNT+/RlHLKZfJKmSO/ern
 VpobiP70NR+hg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Sasha Levin <sashal@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 69/85] mt76: mt7615: fix entering driver-own
 state on mt7663
Date: Wed,  5 May 2021 12:36:32 -0400
Message-Id: <20210505163648.3462507-69-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163648.3462507-1-sashal@kernel.org>
References: <20210505163648.3462507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093830_982139_3A12F946 
X-CRM114-Status: UNSURE (   9.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 5c7d374444afdeb9dd534a37c4f6c13af032da0c ]

Fixes hardware wakeup issues

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index c31036f57aef..62a971660da7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -341,12 +341,20 @@ static int mt7615_mcu_drv_pmctrl(struct mt7615_dev *dev)
 	u32 addr;
 	int err;
 
-	addr = is_mt7663(mdev) ? MT_PCIE_DOORBELL_PUSH : MT_CFG_LPCR_HOST;
+	if (is_mt7663(mdev)) {
+		/* Clear firmware own via N9 eint */
+		mt76_wr(dev, MT_PCIE_DOORBELL_PUSH, MT_CFG_LPCR_HOST_DRV_OWN);
+		mt76_poll(dev, MT_CONN_ON_MISC, MT_CFG_LPCR_HOST_FW_OWN, 0, 3000);
+
+		addr = MT_CONN_HIF_ON_LPCTL;
+	} else {
+		addr = MT_CFG_LPCR_HOST;
+	}
+
 	mt76_wr(dev, addr, MT_CFG_LPCR_HOST_DRV_OWN);
 
 	mt7622_trigger_hif_int(dev, true);
 
-	addr = is_mt7663(mdev) ? MT_CONN_HIF_ON_LPCTL : MT_CFG_LPCR_HOST;
 	err = !mt76_poll_msec(dev, addr, MT_CFG_LPCR_HOST_FW_OWN, 0, 3000);
 
 	mt7622_trigger_hif_int(dev, false);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
