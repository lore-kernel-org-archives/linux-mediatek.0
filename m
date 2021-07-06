Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39BDC07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 10:05:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0004613F3
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 10:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0004613F3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b81Wyl7hWXb7EpBiImn0r+sqieIQuk5vwI4r3AgEfVs=; b=W0vdsxNoTiZhQ5
	nuwYgStf52leKMPZH4Gv0qsffS8l469Nq62JLO6Dq4aKCjWopC1FpIp432ZWiyt3qH2TK5EZkQ/43
	fNeE4/h5L/kwNC6jM0WMjdIJrvrn2Qr6GOpkuBego5kqUwy/QAHV/EtEZ2woLY6kj6WZMz9j3JgBW
	SWjW98X3288rjlAMCrbMnrT8V5YZX0/O7pSXpgrOV4hAMZDzFpf1oKdhlXwXMgfhGe1XJhAo+dx3a
	asxytEXXBxDkWhAv/dzUb5PrQ8vbZxOm70vT+UbDQa+JlDIhE5KiiealsyLWvQKLDhU+dGH94+0la
	QtWcVipfJquBoqwPz0KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0hwk-00AzVb-7h; Tue, 06 Jul 2021 10:04:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0hwg-00AzTO-Qh
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 10:04:52 +0000
X-UUID: 5debba8b99554b0e8d199da8f2e6fa13-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=7zav9C8Ab8coO8QsXvtBun3/cARc5MdBmvVcP8UQ9rA=; 
 b=YmDMyI48yUMN+OmiyHos/IvE5PJSigbLcFsB1dgtQaM2CqiEw+Jx2kZkrX8QhISbHcOg3UJjG7YKIkTbslUO5sDNnnSphUtxBLHnWrvkk7UD1INm5/uqgK0VPqOOjSCiOoe5qzFfIYYcEKzt87CsbmZ4RpBgW23ImJ4JqezUj/Q=;
X-UUID: 5debba8b99554b0e8d199da8f2e6fa13-20210706
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 661260531; Tue, 06 Jul 2021 03:04:48 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 03:04:46 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 6 Jul 2021 18:04:38 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 6 Jul 2021 18:04:37 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Bo Jiao
 <Bo.Jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: adapt new firmware to update BA winsize for Rx
 session
Date: Tue, 6 Jul 2021 18:04:26 +0800
Message-ID: <20210706100426.1763-1-bo.jiao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5E9EBCD832329CCA81BA9DBD9ECFA2340AFE343B008E73A170618CD70E11EC2B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_030450_897192_A4A82720 
X-CRM114-Status: GOOD (  11.48  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

The newer firmware requires host driver to set BA winsize
on both Tx/Rx sessions, so modify it for the long run.

Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 863aa18b3024..b34571538ff9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1317,7 +1317,7 @@ mt7915_mcu_wtbl_ba_tlv(struct sk_buff *skb,
 		ba->rst_ba_sb = 1;
 	}
 
-	if (enable && tx)
+	if (enable)
 		ba->ba_winsize = cpu_to_le16(params->buf_size);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index edd3ba3a0c2d..c903ccb01740 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -716,6 +716,7 @@ struct wtbl_ba {
 	__le16 sn;
 	u8 ba_en;
 	u8 ba_winsize_idx;
+	/* originator & recipient */
 	__le16 ba_winsize;
 	/* recipient only */
 	u8 peer_addr[ETH_ALEN];
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
