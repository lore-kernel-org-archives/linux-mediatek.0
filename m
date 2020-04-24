Return-Path: <SRS0=cCBG=6I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25058C55186
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 19:33:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E999D2075A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 19:33:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TmPA9COf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rSZieFD4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E999D2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eoVGK+hQcTqprV5fu26O0LCUp8hbR+P75oMvLgVZPgg=; b=TmPA9COfBub1B5
	yDzI0g2rm7sM9f4c3XEBwlBjuWlRzKOdlCBI6laHgvzXdBYV8LIowm3640x0HnNsLZo9Opn4oEDy7
	zhZh3TeN7l3RIXM7A9DkYPa+gK79sLK1LMhB5Iwld/hqGWtcsqF2EPvqvWsDouchvlQUuRpa9f252
	qxyCm+iZYcQyvZWnqNLLSCNcQv0opT/UJsyiRJUd9Xv4vGaJoyf6hmM2y+AroloDbbJSVOuMV5kz7
	RrnvlV4SHNYPrN3z1Ko6wmaVgDbgnQmRvxw27rdaP3qCLZ2OdXn/9p+DsUp3jcOmNkwlbue6BnYHU
	QckefGPuhNfUjRyX7RIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS44U-0007my-2N; Fri, 24 Apr 2020 19:33:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS44O-0007iz-Oq
 for linux-mediatek@lists.infradead.org; Fri, 24 Apr 2020 19:33:05 +0000
X-UUID: 78074ef2ab1c4969bc433c415a7622b4-20200424
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=333UAHMqqUfl/oqO1oNmHQeRS6Hf48FRzVK5RbsxFDg=; 
 b=rSZieFD4rmu6Nvnhips9wGHPy6kKX+BeDzQqpf+EBU0RydesTJ6v6w3nDhfHSA48bGLPFPuEkSpn5JlSH0gT9Z5Rn3ijDkD9TFbS400hto6sOL0KD3KxYapSQBRnfw7ZG6Zcv34GN+pEEntSOjavhpLDIPRvV6yIqlLYPBEik7I=;
X-UUID: 78074ef2ab1c4969bc433c415a7622b4-20200424
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 105296040; Fri, 24 Apr 2020 11:32:54 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Apr 2020 12:32:49 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 25 Apr 2020 03:32:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 25 Apr 2020 03:32:50 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v3 05/18] mt76: add HE phy modes and hardware queue
Date: Sat, 25 Apr 2020 03:32:26 +0800
Message-ID: <a46fac373d73eceeb8c60010eac596762208f045.1587756404.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1587756404.git.ryder.lee@mediatek.com>
References: <cover.1587756404.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_123304_806380_651FCF91 
X-CRM114-Status: UNSURE (   6.60  )
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
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is a preliminary patch to support 11ax deivces.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 2d0fb57f050b..254fbf5d094a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -60,6 +60,7 @@ enum mt76_txq_id {
 	MT_TXQ_BK = IEEE80211_AC_BK,
 	MT_TXQ_PSD,
 	MT_TXQ_MCU,
+	MT_TXQ_MCU_WA,
 	MT_TXQ_BEACON,
 	MT_TXQ_CAB,
 	MT_TXQ_FWDL,
@@ -69,6 +70,7 @@ enum mt76_txq_id {
 enum mt76_rxq_id {
 	MT_RXQ_MAIN,
 	MT_RXQ_MCU,
+	MT_RXQ_MCU_WA,
 	__MT_RXQ_MAX
 };
 
@@ -579,6 +581,10 @@ enum mt76_phy_type {
 	MT_PHY_TYPE_HT,
 	MT_PHY_TYPE_HT_GF,
 	MT_PHY_TYPE_VHT,
+	MT_PHY_TYPE_HE_SU = 8,
+	MT_PHY_TYPE_HE_EXT_SU,
+	MT_PHY_TYPE_HE_TB,
+	MT_PHY_TYPE_HE_MU,
 };
 
 #define __mt76_rr(dev, ...)	(dev)->bus->rr((dev), __VA_ARGS__)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
