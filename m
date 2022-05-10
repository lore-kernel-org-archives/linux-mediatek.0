Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412A7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 09:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0EKnbHyMhb+RbQB5PKTbjD+vBjAOevsOupyyPKhf8Cc=; b=0I4eoBcsDQ/kqv
	ZTBC3AkdFqQqJAkQ9vl9H51kcCRVoCF04A4YBEjsqFbdbnsV2zL6nJSBWVqKi5Hj4emCz9FfRPfpW
	GKRGzEEkDMXGCzJ2lJVHShhK8FyCdgxowDyi2B2tXzi5FBAQLnBiYXXGv5R4VgsVwBCk6M9UP3iSB
	wh+/5HxDT2L3RjqU5FFL2YftYEGPq1oSZ7DXNw7CA8bUeBZ+IFOib+dnOUatBmxpcC5W98sy0JsqA
	O0unSlKBIzPRfRcr5ok9nm9LD+9iBWJ72QtRkVszszkryfsF5hDFwqqd9Oi7amW0nB7cvQBqVbEPZ
	V3Y0U3Q+qeFRYtNQJgug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noMMj-000uFN-Q4; Tue, 10 May 2022 09:41:13 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noMMG-000tzY-6Y; Tue, 10 May 2022 09:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mCs9O3RJG01sw6qsZslsu692hG4UQ4nY/c7ZXZYpQ7k=; b=YA/qQ9JBLeM2/t9UBwl7vdtyKP
 fPVHEg/CLYnZKaPDVcnlMphhcN657ekRTJ5EvsJc4XP6wroRqsrh4D0TdYh71PLCDeP32jCRU/GK4
 GEK0f7TrBABDVp/03sBk8odbSJHkMolZz+RgOLtmeLy+bASDC9ja//Hnt7T6tiyeUs5c=;
Received: from [217.114.218.19] (helo=localhost.localdomain)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1noMLu-0005SZ-MI; Tue, 10 May 2022 11:40:22 +0200
From: Felix Fietkau <nbd@nbd.name>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] net: dsa: tag_mtk: add padding for tx packets
Date: Tue, 10 May 2022 11:40:13 +0200
Message-Id: <20220510094014.68440-1-nbd@nbd.name>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_024044_564803_E8762E40 
X-CRM114-Status: GOOD (  11.93  )
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

Padding for transmitted packets needs to account for the special tag.
With not enough padding, garbage bytes are inserted by the switch at the
end of small packets.

Fixes: 5cd8985a1909 ("net-next: dsa: add Mediatek tag RX/TX handler")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 net/dsa/tag_mtk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index 415d8ece242a..1d1f9dbd9e93 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -25,6 +25,14 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 	u8 xmit_tpid;
 	u8 *mtk_tag;
 
+	/* The Ethernet switch we are interfaced with needs packets to be at
+	 * least 64 bytes (including FCS) otherwise their padding might be
+	 * corrupted. With tags enabled, we need to make sure that packets are
+	 * at least 68 bytes (including FCS and tag).
+	 */
+	if (__skb_put_padto(skb, ETH_ZLEN + MTK_HDR_LEN, false))
+		return NULL;
+
 	/* Build the special tag after the MAC Source Address. If VLAN header
 	 * is present, it's required that VLAN header and special tag is
 	 * being combined. Only in this way we can allow the switch can parse
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
