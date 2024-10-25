Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AD9D11718
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qFFSbzREMj+907t23C3L843r52O7eW/pgOwe1WxGoIU=; b=i6dtjS6hZTw2pm5z4bjiyhR/xP
	TVkZ5OjPXURS98O5OfBq9d5NK4kZmG0MH//OKiCE3qV2ucqaSO4pyOsnwSe7tvq6qSzMwnaqv/Izh
	Y0mTWE2DjLVeywgASVHkeBIDHQAUziRHtUpKevwqff/z82E1pbUffL2N+Bse1AfF+365BIXa0elO8
	14ZiOENp1UE+uzUr2/6tMJfIhPTp/st5E/yDWw+0TCqDB4XZVNfate6wpzDRIOmtZ8k18f2jbwBkn
	zMUwXGgydk5Fj/Ubn8rXg2nHeIO41PI9S7N2pCVEt4dQPHXqqEaOsIpkPJzlsKGGP6lt/A63oMNL2
	VbmsnP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FB4-00000002sQd-183w;
	Fri, 25 Oct 2024 07:56:10 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FB0-00000002sOr-0loP
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 07:56:09 +0000
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id VHC00152;
        Fri, 25 Oct 2024 15:55:52 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201620.home.langchao.com (10.100.2.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 15:55:57 +0800
Received: from localhost.localdomain (10.94.19.204) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 15:55:56 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <sean.wang@mediatek.com>, <nbd@nbd.name>, <lorenzo@kernel.org>,
	<ryder.lee@mediatek.com>
CC: <shayne.chen@mediatek.com>, <kvalo@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <deren.wu@mediatek.com>,
	<mingyen.hsieh@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.or>,
	<linux-mediatek@lists.infradead.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] wifi: mt76: mt7925: fix NULL deref check in mt7925_change_vif_links
Date: Fri, 25 Oct 2024 15:55:54 +0800
Message-ID: <20241025075554.181572-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.19.204]
X-ClientProxiedBy: Jtjnmail201614.home.langchao.com (10.100.2.14) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 202410251555529e83ff3bf139e32a4d242e5986fe8ea6
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_005606_557403_0330870F 
X-CRM114-Status: UNSURE (   6.06  )
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

In mt7925_change_vif_links() devm_kzalloc() may return NULL but this
returned value is not checked.

Fixes: 69acd6d910b0 ("wifi: mt76: mt7925: add mt7925_change_vif_links")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 791c8b00e112..a5110f8485e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1946,6 +1946,8 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 					     GFP_KERNEL);
 			mlink = devm_kzalloc(dev->mt76.dev, sizeof(*mlink),
 					     GFP_KERNEL);
+			if (!mconf || !mlink)
+				return -ENOMEM;
 		}
 
 		mconfs[link_id] = mconf;
-- 
2.31.1


