Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83255C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 02:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EErZkKra0XeGY2iNAPwkwZ4Bk62p3Qrgv9IdIa4U0lw=; b=LwPi7HGvaRX0pury59YDoSv4SG
	KuXyYoxePChyCr1arhPHG+BbaOmse0USrx4EkuS4Jpfwhla4NDH6J2TRuIiEY5pK0ahoFFIU5VbDV
	YmiwCHq2huluDJYEAuS9K230YK4ZyV+4NN5BfEgXob5BzXiM70jDo/72rqP1e72BDsc05NAJ8wnjl
	ilS7H1hP0bIGATr9G+GUd99Iz3CRtHfMj12eveFd+OErifeixCuSrGGG3NNyuIyKCLtHsnUkX1qgM
	kbXEXAHPFGVnHqjlDsUttVe1tiDDvyZteyEcuPg9ja/oE8h41BpXoB9AqsWpuHH2lLJJ2a9XG7rZe
	Ki2ZtfHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrqln-0000000Dhzr-2H6i;
	Wed, 03 Apr 2024 02:54:35 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrqli-0000000Dhuy-3Ppk;
	Wed, 03 Apr 2024 02:54:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712112847; bh=EErZkKra0XeGY2iNAPwkwZ4Bk62p3Qrgv9IdIa4U0lw=;
	h=From:To:Cc:Subject:Date;
	b=Pj5hFXWcrhBr7pY0uqmtvTDFnrXEeunlv8SiD3gR/qKBHchPAi7V65AZgbFEKDaBG
	 dqN4UgPfZW/2srTR1ycebQMbCFd8eR7HgXwiSC+/quMpFBhqvcgcnVs0IgnzuE+TlB
	 skjstmDVda9G+TRxcF9dEtmhW3DnL588Huh771y8=
Received: from localhost.localdomain ([153.3.164.50])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id D8284E80; Wed, 03 Apr 2024 10:54:02 +0800
X-QQ-mid: xmsmtpt1712112842t6y8mxulq
Message-ID: <tencent_C699E9540505523424F11A9BD3D21B86840A@qq.com>
X-QQ-XMAILINFO: Nh9rHd4LJNLEhO7Ar0Vx/lAaGZ5gmlRV1igCRrU3qWmsPOw8HzyPxWvQm5b/dw
	 P6hBrtj1rz5fmjJZM2CE62Dq18cKqTlBQB0Zk+y6fqD4eyOky5kxzIKZY/TdAKxA6QNe/EJB8yBI
	 Do1qCPApRxc8PKCJYOjL8Av0aL/ewrmnSZQ8jXQ8GXxMpVBgsHQUVEUvg5CZwnlJy4HxROPHTZvg
	 tjqnubt1d1BGKhkaY/qUVfDLFJrW91n2gQwLKaNc9CrHGpsfZOu7PnuHIQcmd5guB6JofiM8b8RH
	 kAEyo9gwcdTK5eAk/H9YOQUfaCDCwD4COfloLyA2hwIesJ16Q7fYYtVO1zN4Izjx0Ir12bBm2G8U
	 eRqxEwPGTMV7a12T6hgdeJ2yIW4B1Ae5FXr1UJ6VdbD97khPL3jcSvOIT7BTdtCCg3WrGPJBCSDG
	 lVDl/SrYvdCg+BBWBL3oC4FsX6WdkhwMeZWlydxKCU3qD7+fsA3UvqqoVLesyDiIF1ny2FVXC90A
	 lfI+447EDglZiIgG/som2YOAX3AhzEc+TBlT1HL6swSkXc5DPOosopbeWap+HdIffcLzmme06o/9
	 XrmjVjX6OpLofK98KWm/xNjRcvbjcGbygYW0y5/xpV3VOVG+nXslpQ+T6jFR/cNv6ebcx4qclRNM
	 Uhoz99luMbBAtfFWfIDYr9N4gdyGk9+Fcp4+Kj0tucXFkv1ZE9xD/qZY2laqPC72AF/APbMGrPin
	 9MQEa2jtTiPORwIDOGbaFcV7nzwmAm/DZozx+Yg6+e7N7u+/V7aBf/nUM1lAovht10ttXwEBlnAh
	 kPBf/tHPt4XB+aoUX2EoSiRfI831erzxlHMnJfw0iSCbToVGVqhFJn0/8MK1jGkOLAY1QsA7G5Gp
	 lm3PeyF+3M/lfSOfWkHZ6NmlJWMmSE8M6UC4Vwt5mO27Q1DtCqlE/IdDz3O2r2Tpcl488apB4S89
	 7G61EJYfuREPGs/E1gU66TdZrxEsEBWH4H8dS5pbnQHYbSZj836tahAs8bYCqLJTxT07hE64xS1N
	 Ah/+ei0CZ4/Krsrs/p
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: linke li <lilinke99@qq.com>
To: 
Cc: xujianhao01@gmail.com,
	linke li <lilinke99@qq.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] net: ethernet: mtk_eth_soc: Reuse value using READ_ONCE instead of re-rereading it
Date: Wed,  3 Apr 2024 10:54:00 +0800
X-OQ-MSGID: <20240403025400.48088-1-lilinke99@qq.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_195431_208312_BEBA506C 
X-CRM114-Status: GOOD (  10.22  )
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

In mtk_flow_entry_update_l2, the hwe->ib1 is read using READ_ONCE at the
beginning of the function, checked, and then re-read from hwe->ib1,
may void all guarantees of the checks. Reuse the value that was read by
READ_ONCE to ensure the consistency of the ib1 throughout the function.

Signed-off-by: linke li <lilinke99@qq.com>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index b2a5d9c3733d..8b3cdfc4d407 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -580,7 +580,7 @@ mtk_flow_entry_update_l2(struct mtk_ppe *ppe, struct mtk_flow_entry *entry)
 
 		idle = cur_idle;
 		entry->data.ib1 &= ~ib1_ts_mask;
-		entry->data.ib1 |= hwe->ib1 & ib1_ts_mask;
+		entry->data.ib1 |= ib1 & ib1_ts_mask;
 	}
 }
 
-- 
2.39.3 (Apple Git-146)


