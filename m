Return-Path: <SRS0=HsXE=H7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D809C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 16:02:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D92F6024A
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 16:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D92F6024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a/4Lfi+akuOX0MNenSh40g9XVsAK9yYt1HqctTad75w=; b=jLmFW0L6YPhN+1gnEp3ySCbbfU
	QWC19wfECEv3Wp3GhryVJwchEExhVc3Bb39eGcwrBI2gmTebQST9U99RnkNtkquX/1ewQ4Hn0zY5Q
	+RVu5Mr/737oowInf7msMgQEXwmPdmMyJqfin1iyyXddL1WyEoHDcYtWsReOWl2rIZsYYvt7OGoWM
	SslElOkL5ts6U51gsrL7ITkOWCKGWl8CENFzvPlLsyITJcM8xNgXsfYjSKYP46BZajgYo4ZjB/P81
	TQlBzEt1Gi06XEqbrpfQgpZ8hIt7weXnz4JNnSeKM44886c6mvR3sZcCMklqorceZUEWTHeKJPmb+
	WuV0Iu2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGkzy-0007cP-2W; Mon, 01 Mar 2021 16:02:18 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGkzw-0007bu-DZ
 for linux-mediatek@lists.infradead.org; Mon, 01 Mar 2021 16:02:17 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 d13-20020a17090abf8db02900c0590648b1so2537680pjs.1
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Mar 2021 08:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yAJ35ttTIYDaI03L0R6KlFCI401JDb9oaNvf3irJiO8=;
 b=iISj92BVreEJ2LpNvSZhMhGd9VC2A8DXy5c/sz+6O+U98rLX64zXTc7BQBbxaf6zQz
 ZfXL7f34UG/6Z2mgnb0M5b3eAUaAzsclp0olHTOagY4kIHZvgX1Zx6JDdDY8ub9MWU/Q
 u+kXGN6FjS/GHk4NlyKbpMf1xy2ragULlAN5wXe2rYxFJZpFR+7tXpZuxSnqLNKB3uf2
 rSO+E+2rgqj4LBVYc/97+9biZHhp3FmgemkmXDRpEsju/3VI+skwPimvKRz6RA7H0Dz/
 FgkC0vww9nDqhbxdiaLNcvYqNYIpa0hR9KgJTdHtQuqeLbutWB0tB+ZU1kxln5PEnr9v
 WH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yAJ35ttTIYDaI03L0R6KlFCI401JDb9oaNvf3irJiO8=;
 b=D3SlBUh0y+xYsRnjJutxQbo150tEQM77rX7ypfFRNsTNpntm6A+K4Es6unzAnONatE
 LhIpxZWovvgOHkuUDpOGCZOlBMjupf7Vn47rw8kMVeWriUYZ6gNrgN/PLznbVZqLcKcJ
 csNzxeczWR4532quQ32kSWxLwyHStP4NtA6LcEJXSFTsMLdeFm8BxL3UiNLmx1tx4v10
 j3OAgyPDSF+DpZ3ZLrviwnSpj9KeyFJz4l+lMZKP7xAMu5tCDIY0bnPasR7OiLYkpywP
 tQ5rGg+/dyKfVxFJxsZQpAXLO52wdhEsCIEjVIaLHGyIHS1tXvCUXeGlOES3HBPWsteX
 gniQ==
X-Gm-Message-State: AOAM533eLfjoIs4vHe20FxQ9+XMLwbzmkPRHetxsl6XQ3dkP0QrTLA1l
 oyTGAcJGdw+5VvuWG8YWNJG3jSJnpqVJMA==
X-Google-Smtp-Source: ABdhPJzsVR8mOsz7Yc3zfxrjeSBvYYK+Rd3GpMC4Y0Eqqbf19NW2wIrBiZKvhPI39QJ6IqtFa5m8aw==
X-Received: by 2002:a17:90a:ce82:: with SMTP id
 g2mr15022366pju.193.1614614531638; 
 Mon, 01 Mar 2021 08:02:11 -0800 (PST)
Received: from container-ubuntu.lan ([171.211.27.50])
 by smtp.gmail.com with ESMTPSA id o9sm16604078pfh.47.2021.03.01.08.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 08:02:10 -0800 (PST)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net] net: dsa: tag_mtk: fix 802.1ad VLAN egress
Date: Tue,  2 Mar 2021 00:01:59 +0800
Message-Id: <20210301160159.7622-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_110216_474887_ED3ACC30 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: Ilario Gelmetti <iochesonome@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

A different TPID bit is used for 802.1ad VLAN frames.

Reported-by: Ilario Gelmetti <iochesonome@gmail.com>
Fixes: f0af34317f4b ("net: dsa: mediatek: combine MediaTek tag with VLAN tag")
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 net/dsa/tag_mtk.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index 38dcdded74c0..59748487664f 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -13,6 +13,7 @@
 #define MTK_HDR_LEN		4
 #define MTK_HDR_XMIT_UNTAGGED		0
 #define MTK_HDR_XMIT_TAGGED_TPID_8100	1
+#define MTK_HDR_XMIT_TAGGED_TPID_88A8	2
 #define MTK_HDR_RECV_SOURCE_PORT_MASK	GENMASK(2, 0)
 #define MTK_HDR_XMIT_DP_BIT_MASK	GENMASK(5, 0)
 #define MTK_HDR_XMIT_SA_DIS		BIT(6)
@@ -21,8 +22,8 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 				    struct net_device *dev)
 {
 	struct dsa_port *dp = dsa_slave_to_port(dev);
+	u8 xmit_tpid;
 	u8 *mtk_tag;
-	bool is_vlan_skb = true;
 	unsigned char *dest = eth_hdr(skb)->h_dest;
 	bool is_multicast_skb = is_multicast_ether_addr(dest) &&
 				!is_broadcast_ether_addr(dest);
@@ -33,10 +34,17 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 	 * the both special and VLAN tag at the same time and then look up VLAN
 	 * table with VID.
 	 */
-	if (!skb_vlan_tagged(skb)) {
+	switch (skb->protocol) {
+	case htons(ETH_P_8021Q):
+		xmit_tpid = MTK_HDR_XMIT_TAGGED_TPID_8100;
+		break;
+	case htons(ETH_P_8021AD):
+		xmit_tpid = MTK_HDR_XMIT_TAGGED_TPID_88A8;
+		break;
+	default:
+		xmit_tpid = MTK_HDR_XMIT_UNTAGGED;
 		skb_push(skb, MTK_HDR_LEN);
 		memmove(skb->data, skb->data + MTK_HDR_LEN, 2 * ETH_ALEN);
-		is_vlan_skb = false;
 	}
 
 	mtk_tag = skb->data + 2 * ETH_ALEN;
@@ -44,8 +52,7 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 	/* Mark tag attribute on special tag insertion to notify hardware
 	 * whether that's a combined special tag with 802.1Q header.
 	 */
-	mtk_tag[0] = is_vlan_skb ? MTK_HDR_XMIT_TAGGED_TPID_8100 :
-		     MTK_HDR_XMIT_UNTAGGED;
+	mtk_tag[0] = xmit_tpid;
 	mtk_tag[1] = (1 << dp->index) & MTK_HDR_XMIT_DP_BIT_MASK;
 
 	/* Disable SA learning for multicast frames */
@@ -53,7 +60,7 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 		mtk_tag[1] |= MTK_HDR_XMIT_SA_DIS;
 
 	/* Tag control information is kept for 802.1Q */
-	if (!is_vlan_skb) {
+	if (xmit_tpid == MTK_HDR_XMIT_UNTAGGED) {
 		mtk_tag[2] = 0;
 		mtk_tag[3] = 0;
 	}
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
