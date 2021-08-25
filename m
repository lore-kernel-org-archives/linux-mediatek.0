Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFFAC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 08:39:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83CA861181
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 08:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83CA861181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5C35oVHgSfyZSDH1m9jatXX5lFaFiyUCtaMIFW+gDU=; b=mQYthtQwSiaDKV
	TWtifgTAa68zteslbRTcV1kF6vgT8tjS8jcVaYdaHgeQbbPZWMUlq+6oWMevLbp6LI8F0Lq7WLJn1
	DZZqX/q+In73RY3IhuUpA+7IZS5SGNvQqBSqy9vA26pvXFFM7Xu4wz96Q7zxTZJtyCVi5+bUiavMa
	MgT7gJ8p3zAmUiQ1AUt8mUpVMm0MF3frtmSBM9uWIK8yhsXbwgFmNN23lZtimbY78El8rFYjc518v
	FlSFhQD+ZnptyCpDFgYs6mObuNi/elVcjh0oaOXu8f05ENk/4/S+AowzqsrjCeFIjbs2VBDjJzoSv
	CGKShtCsuts0VXNTp+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIoRa-005x2j-7j; Wed, 25 Aug 2021 08:39:34 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIoR1-005wu4-3a; Wed, 25 Aug 2021 08:39:00 +0000
Received: by mail-pg1-x52d.google.com with SMTP id n18so22387458pgm.12;
 Wed, 25 Aug 2021 01:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BQ5Km8P5KshreDxxyfZN+g53ic8Bq6hG2JyV+9iqoI8=;
 b=iFFhRGxdH+NeAiYMTNireqJG2l/UYCQOXCnjGSnQFMArA+eGw+8wfcveq4IT1WeYKO
 vw9beeyxSi1qsmdxVK+o1EtnDn1hsXbzej53jUICNyISg+TOszHId1hpnMAiKOQgItMN
 kgjGP5fOoO3lA5RtBPE+vl1CcGSFnrb5cLOFth5/THAWxRSYhSkehomdaP7hjebMYKJe
 jDpyYTwcHhjogeVhzTMCUj+5MehL8zyfHoPWzTruofKv/nLlfbHZD0NK9ARqn+2ivJeG
 iTYteEct0Urw0+NoBAS9aZ2aAcY7qfQAPGNM8D85H0lHlcUOrK9MUBD0KPuGQMd90irH
 3TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BQ5Km8P5KshreDxxyfZN+g53ic8Bq6hG2JyV+9iqoI8=;
 b=BY+p+bPABmW2DuiIZXs94H/wcOnj0H439jdDJJ0skEkCBkpxIAfVXI/8inGHl0p/LS
 e7JLBGGa08tQYpkV5Vwu7QAzh+CQ8hwDJRRthI/0yl4HfGZsJvEeu9+TdGTkbwBnC34w
 NrJ8r9B6qiOd+fS5FZMmvG2oLRn6Wea6j2PTu4giv2gUlappiGvIzCfi8E68O6Aw4I6U
 7pr9kk0Ta9YIuW/AtHKt3GDEI6a1KmuLCCtzpgk+1VHYjNg4FYyAok/hsSTn1mdhS6my
 WXWGXUTy6X/YappFv3plN6Ln4/l1Nz1zOH6EzKpl1QXwzozpCpzDQ2fW1MEtYpwWux0H
 IL+w==
X-Gm-Message-State: AOAM530gRRadQGMtEgi0BNPgEw+uXrsxUUyVxr05JopuFmwJpXHRL9jo
 oMhtJtj6hqJjo6iA5xdaaErMVZsg+LRchIjJ
X-Google-Smtp-Source: ABdhPJxdfhF4L9hI63/ncflJW8yqJrHcIQJNGKtQAmcyZJAyAWmfBEqk0nGVgPCddFeurrjP49SaEA==
X-Received: by 2002:a05:6a00:22d2:b0:3eb:b41:583 with SMTP id
 f18-20020a056a0022d200b003eb0b410583mr21417058pfj.73.1629880735662; 
 Wed, 25 Aug 2021 01:38:55 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id p18sm24872294pgk.28.2021.08.25.01.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 01:38:55 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFC net-next 2/2] net: dsa: tag_mtk: handle VLAN tag insertion on TX
Date: Wed, 25 Aug 2021 16:38:31 +0800
Message-Id: <20210825083832.2425886-3-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825083832.2425886-1-dqfext@gmail.com>
References: <20210825083832.2425886-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_013859_196113_9FD4DCF0 
X-CRM114-Status: GOOD (  14.87  )
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

Advertise TX VLAN offload features, and handle VLAN tag insertion in
the tag_xmit function.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 net/dsa/tag_mtk.c | 46 ++++++++++++++++++++++------------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index 415d8ece242a..e407abefa06c 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -22,7 +22,6 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 				    struct net_device *dev)
 {
 	struct dsa_port *dp = dsa_slave_to_port(dev);
-	u8 xmit_tpid;
 	u8 *mtk_tag;
 
 	/* Build the special tag after the MAC Source Address. If VLAN header
@@ -31,33 +30,31 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 	 * the both special and VLAN tag at the same time and then look up VLAN
 	 * table with VID.
 	 */
-	switch (skb->protocol) {
-	case htons(ETH_P_8021Q):
-		xmit_tpid = MTK_HDR_XMIT_TAGGED_TPID_8100;
-		break;
-	case htons(ETH_P_8021AD):
-		xmit_tpid = MTK_HDR_XMIT_TAGGED_TPID_88A8;
-		break;
-	default:
-		xmit_tpid = MTK_HDR_XMIT_UNTAGGED;
-		skb_push(skb, MTK_HDR_LEN);
-		dsa_alloc_etype_header(skb, MTK_HDR_LEN);
-	}
-
+	skb_push(skb, MTK_HDR_LEN);
+	dsa_alloc_etype_header(skb, MTK_HDR_LEN);
 	mtk_tag = dsa_etype_header_pos_tx(skb);
 
-	/* Mark tag attribute on special tag insertion to notify hardware
-	 * whether that's a combined special tag with 802.1Q header.
-	 */
-	mtk_tag[0] = xmit_tpid;
-	mtk_tag[1] = (1 << dp->index) & MTK_HDR_XMIT_DP_BIT_MASK;
-
-	/* Tag control information is kept for 802.1Q */
-	if (xmit_tpid == MTK_HDR_XMIT_UNTAGGED) {
-		mtk_tag[2] = 0;
-		mtk_tag[3] = 0;
+	if (skb_vlan_tag_present(skb)) {
+		switch (skb->vlan_proto) {
+		case htons(ETH_P_8021Q):
+			mtk_tag[0] = MTK_HDR_XMIT_TAGGED_TPID_8100;
+			break;
+		case htons(ETH_P_8021AD):
+			mtk_tag[0] = MTK_HDR_XMIT_TAGGED_TPID_88A8;
+			break;
+		default:
+			return NULL;
+		}
+
+		((__be16 *)mtk_tag)[1] = htons(skb_vlan_tag_get(skb));
+		__vlan_hwaccel_clear_tag(skb);
+	} else {
+		mtk_tag[0] = MTK_HDR_XMIT_UNTAGGED;
+		((__be16 *)mtk_tag)[1] = 0;
 	}
 
+	mtk_tag[1] = (1 << dp->index) & MTK_HDR_XMIT_DP_BIT_MASK;
+
 	return skb;
 }
 
@@ -96,6 +93,7 @@ static const struct dsa_device_ops mtk_netdev_ops = {
 	.xmit		= mtk_tag_xmit,
 	.rcv		= mtk_tag_rcv,
 	.needed_headroom = MTK_HDR_LEN,
+	.features	= NETIF_F_HW_VLAN_CTAG_TX | NETIF_F_HW_VLAN_STAG_TX,
 };
 
 MODULE_LICENSE("GPL");
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
