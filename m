Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A09DFA3740
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 02:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=coRe6aFtKEJ8SucS8fOYdsHKCX19NW/bW5k33DfhxmU=; b=P0914HcmfG/rdAq3pYxgFkNLJm
	iF7egkGbarhLwY9waTRjHNcWD7ahbiAhZ2OQfgTyQ+eTnmK0HY5PtNgnZg7BVZ5G+ysElXY9ZdirS
	TAikuxl90kT8vfVNWjKnaKPma+RuSFANGRcwbhFNg7rpRLA1H6hJagNPL2+a3hEEBzZxQv5A4ZBIc
	DhJ7jst21u5Ov7yN/dQz6sSjGnjGGPTiqFHi5o3DEGGdkW0+S6qCRhg3gGBL4GTQIX3GZLSHYkTUN
	ayUkG156ugaFC0+bCX5jIAIZqKkpx/aS+0PtMZ3F0DwMMuLmVYZiSrIRFcVke/QzSiPDH7tpqns/b
	ezov35Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onscZ-00BaRi-Oj; Thu, 27 Oct 2022 02:27:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onscX-00BaQC-8M
	for linux-mediatek@lists.infradead.org; Thu, 27 Oct 2022 02:27:50 +0000
X-UUID: ee8319a120264610aa1b6aa61cc27d59-20221026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=coRe6aFtKEJ8SucS8fOYdsHKCX19NW/bW5k33DfhxmU=;
	b=dlhDA3LWZ6IUXr5huF5BtYFiAXY0kXlFbTz6Az/DNHGjlXHwDfyTAy6aDrcdvtUWjKQfiDMXZuUp47lVXEW0HiY2DGy0Y4SC6qcrXC+pWyxswUfy3O8Jb0it3HtgPfePqJqiEJsbmUeryCWvf7+E6VZ1YHZQKCV0KuMfy/DetUQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:dc3964fa-608c-4538-ad09-70b6542fb7ab,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:79964327-9eb1-469f-b210-e32d06cfa36e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ee8319a120264610aa1b6aa61cc27d59-20221026
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 361676313; Wed, 26 Oct 2022 19:27:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 27 Oct 2022 09:57:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 27 Oct 2022 09:57:01 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Felix Fietkau
	<nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH] wifi: mac80211: Set TWT Information Frame Disabled bit as 1
Date: Thu, 27 Oct 2022 09:56:53 +0800
Message-ID: <20221027015653.1448-1-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_192749_328126_9767AE90 
X-CRM114-Status: UNSURE (   7.99  )
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

The TWT Information Frame Disabled bit of control field of TWT Setup
frame shall be set to 1 since handling TWT Information frame is not
supported by current mac80211 implementation.

Fixes: f5a4c24e689f ("mac80211: introduce individual TWT support in AP mode")

Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
---
 net/mac80211/s1g.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/mac80211/s1g.c b/net/mac80211/s1g.c
index 8ca7d45d6daa..cb2ab8fd4848 100644
--- a/net/mac80211/s1g.c
+++ b/net/mac80211/s1g.c
@@ -111,6 +111,8 @@ ieee80211_s1g_rx_twt_setup(struct ieee80211_sub_if_data *sdata,
 					 IEEE80211_TWT_REQTYPE_SETUP_CMD);
 		goto out;
 	}
+	/* TWT Information not supported yet */
+	twt->control |= IEEE80211_TWT_CONTROL_RX_DISABLED;
 
 	drv_add_twt_setup(sdata->local, sdata, &sta->sta, twt);
 out:
-- 
2.18.0


