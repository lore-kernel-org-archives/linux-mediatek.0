Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054B2C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kj9Ml8F3irRUgHRWA7sHIbIBxOr4NUL1nv1trxOCNuU=; b=bPdBrWjlnwrjSq0qrxsdB9Ehuf
	yZUUcTNLazYrR2b4x5CoaFZUKZKwnhYiQ5XB4GZVHGPPzjqKZ461waDkc0ftCg7/cvJEOam7zyZv/
	ZHvKyoRu8F1Kld5/XiBzHB550tVnPCx2GUew3o0Q/ThXDHpLFnDzIb+r9SvY0BrRE1c1tM9Ni4F1I
	G75t6deVcgo1FvMOxa9SPv0YY14TLz9t03KPNBNR977/yKZQZ0S0xR2z8kNg+7wlWa52qfZG0oWVg
	kCckcgr0QyLjbQdfAbx8R/HcuXqnn69K0R3XSdCNksdBvGo0Ag420U5n4PkrJcaNMtUc8JEEeJ8Jp
	1Dnmv73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM168-005yfC-2u;
	Wed, 19 Jul 2023 06:55:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM167-005ydN-1d;
	Wed, 19 Jul 2023 06:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kj9Ml8F3irRUgHRWA7sHIbIBxOr4NUL1nv1trxOCNuU=; b=ifVHRzeB1Scvsn90YSU+hljlvq
	5nBKzTbkOLRrjExEWaKxfVrDfZSb185cIB8lFDb15U5ZhsJPTEp5ffcZ9E4iKykafaYfOftW2sXnL
	ff00G6SozBnmYW0I022XMGwNsfY0ggvOPnU9ozaxxUDantPUZSpM7BAnZuE2dmkNfEZF2p3meLtOU
	xN58GRMOu3Yy1XqfcGkGs+WY1TlsRfuZxm4K6YOj7HX3HsCXqHVolrFV1PhC5E4x6EF9wljLIvD/R
	4YX0ZKRqVyM9f/wjiJMlFZPFsONUtLo+4Q/JJf2JiLVAlYM+kgSB+I/stQg/VobP+JIcIVF70avsz
	0LoxgxIw==;
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLsI3-00C4I4-0b;
	Tue, 18 Jul 2023 21:32:16 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qLsHr-0001LF-2C;
	Tue, 18 Jul 2023 21:31:15 +0000
Date: Tue, 18 Jul 2023 22:31:07 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Ungerer <gerg@kernel.org>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3 4/9] net: ethernet: mtk_eth_soc: increase
 MAX_DEVS to 3
Message-ID: <9ab4a1bc06723fcf2d9f6cbfd9ea4067c56d40d8.1689714291.git.daniel@makrotopia.org>
References: <cover.1689714290.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1689714290.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_223137_235750_6AC3A80B 
X-CRM114-Status: GOOD (  13.86  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

This is a preliminary patch to add MT7988 SoC support since it runs 3
macs instead of 2.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 1c28bf3731831..297b1ba4853fa 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1042,8 +1042,8 @@ struct mtk_soc_data {
 
 #define MTK_DMA_MONITOR_TIMEOUT		msecs_to_jiffies(1000)
 
-/* currently no SoC has more than 2 macs */
-#define MTK_MAX_DEVS			2
+/* currently no SoC has more than 3 macs */
+#define MTK_MAX_DEVS	3
 
 /* struct mtk_eth -	This is the main datasructure for holding the state
  *			of the driver
-- 
2.41.0

