Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5AFC49EA2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 20:39:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 412BA610A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 20:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 412BA610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UXSq2PUgKGJGGY03V9x+DTy34uthpuIKR22hHuzjqH0=; b=LYGMXI3180EfPy
	Lp4JenJChkEkwZ3t3LwLYUukBf76r3eDUHArL9PnGL7pM7qsBh8hDBxwD9rFvDIC0wOuRLKHyKaEh
	gVV9HXAWWUkVYu16oJxeR5vz/foRAwaYCiSX4x0FHSY7vFC72s+WRWU5Cd7QcjRJku/RGAFwOpltX
	vdXLBB4vHJyw767E4ftWpVn7UdiMN1ys+DXI6G36hjoD/LP3m+3Q95MxdhEe8v6ik16L+S6dMYnZ6
	jkqHWp1AG38YgYYinBpZoGOxhz+JCUNS8FiLQGW8MgprCGDhddlb4zfrxZaoHB1WxnLIho6v5Ase2
	UwJmtc/e2xW/uwo43H6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltynO-00Bkd2-9f; Thu, 17 Jun 2021 20:39:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltynL-00Bkb3-8F
 for linux-mediatek@lists.infradead.org; Thu, 17 Jun 2021 20:39:24 +0000
X-UUID: f014f991bfbf4138869bd6e6b407126f-20210617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=2j11WJgBaEapQMFKiZflcyvirJ3hB3WPCaD+D/zb1zg=; 
 b=q5r0+HfTTQqNioFk8Yn4OYbrKaMLxZf45kRJ5gvLxmsxLH9WNw0+U4yCOF3gFpgxj6Kmy7dRUZ1heLzsE0VIDeBTqRT5dNb9EcotC4Drel//mna/Di81d+dx2qGv/xdG2kZp/S7G9Tqc4KCTG6GUCF1WBPZIOHygXLRz16Rx5Lw=;
X-UUID: f014f991bfbf4138869bd6e6b407126f-20210617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1910125386; Thu, 17 Jun 2021 13:39:17 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 13:39:16 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 04:39:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Jun 2021 04:39:02 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v2 1/3] mac80211: check per vif offload_flags in Tx path
Date: Fri, 18 Jun 2021 04:38:59 +0800
Message-ID: <177785418cf407808bf3a44760302d0647076990.1623961575.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_133923_384892_FA7A5FD1 
X-CRM114-Status: UNSURE (   9.18  )
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

offload_flags has been introduced to indicate encap status of each interface.
An interface can encap offload at runtime, or if it has some extra limitations
it can simply override the flags, so it's more flexible to check offload_flags
in Tx path.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v2: drop a TX_FRAG_LIST condition
---
 net/mac80211/tx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 0a4bc9e08637..db0d26d19f91 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -3267,6 +3267,9 @@ static bool ieee80211_amsdu_aggregate(struct ieee80211_sub_if_data *sdata,
 	if (!ieee80211_hw_check(&local->hw, TX_AMSDU))
 		return false;
 
+	if (sdata->vif.offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED)
+		return false;
+
 	if (skb_is_gso(skb))
 		return false;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
