Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52088C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 09:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SfWHc6C6T9H/rOjQwAOvsuuY+05MGIFO3rrF7uufH10=; b=sA9pCsRSb8HzGH+1CTicIYMCrt
	0W4kDqia199h4LUQRe4DpAxd2JTeAvAFQoq2Lz5hZtSmP/5z5C2QeY8KLle/THUMw0BrlKO3ZAXsA
	SbAH7/Vwutmxkt6kK+WOVvO1K5fr7PM6kWDlR7vSqQIFu7JcxFeWWLSfZKTX2i93ikaftUcD8y25M
	HgE88atA6YXkTH4UX6pt/jxpEHlqbe23Ki52ri8njAESuepy5OKEzT6HEnAsuyaVldAYC6xpbZQYc
	Mv6Pn+Jb4AjFfvxNGq3IQ5+C//K8TBZMW320okyjlodTX5NxD2nfwU1lD8vQ/UWnmcGTo1XQx/s1r
	bO8IKR6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8I81-00A4xZ-Sd; Thu, 22 Dec 2022 09:44:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8I7y-00A4vs-58
	for linux-mediatek@lists.infradead.org; Thu, 22 Dec 2022 09:44:39 +0000
X-UUID: 36215801c31f4faf9d30953f9eb6015f-20221222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SfWHc6C6T9H/rOjQwAOvsuuY+05MGIFO3rrF7uufH10=;
	b=m6mqnmH/ZBHBje4RCmGx/Jz9s9d6gYeX4u0EQIg87TkIsGY3dUPG2lOWOd7NHv0Jn0i0ZMImb+SJiRYICKOnDgUEwNsA4H4OnRlc7AYoBFk0MTt9n+E3m4XS+5RA6pU3kD8/wQYlw0f2rjUzApnCE2s1ws5svwXMjdThAHkoM+U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:2a3b3e8f-9785-4209-b5be-bfcaafec6b56,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:53be1b8a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 36215801c31f4faf9d30953f9eb6015f-20221222
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1871374882; Thu, 22 Dec 2022 02:44:32 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 22 Dec 2022 17:13:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 22 Dec 2022 17:13:57 +0800
From: Michael Lee <michael-cy.lee@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael Lee
	<michael-cy.lee@mediatek.com>
Subject: [PATCH] wifi: mac80211: check the control channel before downgrading the bandwidth
Date: Thu, 22 Dec 2022 17:13:54 +0800
Message-ID: <20221222091354.14050-1-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_014438_282053_93D2EEC6 
X-CRM114-Status: GOOD (  10.87  )
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

When the link fails to use the channel, chandef's bandwidth will be 
downgraded without checking the control channel.
The issue happens when the STA of an extender with limited channel 
context associates with a root AP operating on a different channel.

Below is an example:

    ______________           ________________
   | RootAP(ch36) |         | Extender(ch44) |
   |              | (ASSOC) |       AP       |
   |      AP <-------------------- STA       |
   |______________|         |________________|

- RootAP is operating on channel 36, while Extender is operating
  on channel 44
- When associating with RootAP, Extender-STA downgrades the
  chandef's bandwidth to be compatible with any channels on the phy
- Finally, chandef's bandwidth is downgraded to 20MHz and 
  the association fails

In this patch, a control channel checking is added to avoid unnecessary
bandwidth downgrading

Signed-off-by: Michael Lee <michael-cy.lee@mediatek.com>
---
 net/mac80211/mlme.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 0aee2392dd29..bc435e8508e2 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -4616,6 +4616,27 @@ ieee80211_verify_sta_he_mcs_support(struct ieee80211_sub_if_data *sdata,
 	return false;
 }
 
+static bool
+ieee80211_check_same_ctrl_channel(struct ieee80211_sub_if_data *sdata,
+				  const struct cfg80211_chan_def *chandef)
+{
+	struct ieee80211_local *local = sdata->local;
+	struct ieee80211_chanctx *ctx;
+
+	mutex_lock(&local->chanctx_mtx);
+	list_for_each_entry(ctx, &local->chanctx_list, list) {
+		if (ctx->replace_state == IEEE80211_CHANCTX_WILL_BE_REPLACED)
+			continue;
+		if (ctx->mode == IEEE80211_CHANCTX_EXCLUSIVE)
+			continue;
+		if (chandef->chan == ctx->conf.def.chan)
+			return true;
+	}
+
+	mutex_unlock(&local->chanctx_mtx);
+	return false;
+}
+
 static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 				  struct ieee80211_link_data *link,
 				  struct cfg80211_bss *cbss,
@@ -4842,6 +4863,9 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 	    chandef.width == NL80211_CHAN_WIDTH_10)
 		goto out;
 
+	if (!ret || !ieee80211_check_same_ctrl_channel(sdata, &chandef))
+		goto out;
+
 	while (ret && chandef.width != NL80211_CHAN_WIDTH_20_NOHT) {
 		*conn_flags |=
 			ieee80211_chandef_downgrade(&chandef);
-- 
2.25.1


