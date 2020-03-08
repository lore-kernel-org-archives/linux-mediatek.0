Return-Path: <SRS0=sXDt=4Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C89C10F28
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Mar 2020 06:35:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C07B206D5
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Mar 2020 06:35:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YbJ5PqOD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ax2DXZTx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C07B206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ohTxEfjtgNlWB0V1CHjZ8LAZW55LaP0G2kMCHQjzc2M=; b=YbJ5PqODAj9Ikm
	DA5tEDUd5dO8U4H7obqa+46lxO5MGxYBA5c7mEw3srBAXYBRoUpYwkA7j1x2oqVHfdhKOuMuHE8P/
	5Tfl92kh/1m/gRlTCsOMOtpCkOJWrxh/bWGcJwCzaxLB7wvnv+uVebgzIw1Fu/KLKIQP0VOa25uK0
	IkMWrd0T5/eC9nIPf/YUxL8V1zlBSlKuPaL8znTDPHUB/nTiQmdf4LueCoiIFaKuCkjm/Q1Js1A4L
	fNFot6sCSjaEUTR6WB4blDtaKR4SknCHBeCM4J0O7Rgiqnn7Bo6Mvy2QhJi1p+q/FuG9qaXkdMsnj
	meaJHS0ao+2Y/F0Snfbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jApWd-0002vu-Lu; Sun, 08 Mar 2020 06:34:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jApWW-0002pO-8v; Sun, 08 Mar 2020 06:34:53 +0000
X-UUID: 17983672a028440f8395a694e8eef122-20200307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=amPnNjmjefQsyk5bkPNYdHvxBnqS5HcVAeBUw7OCcuY=; 
 b=Ax2DXZTx9qOU0YVK64+DxYjQUgqiu5d8juThM7utccukdRnzfKT5jkACsIE29Qds6UArdWVk6pp3vnSEXP7yMJpWMVVWTms67vHtrtw+G0lKPZ8K+ldmZFyqQPUfowkrzvaj7sYtWYCxy9GCILk22PXWx9clUO591cAknpOev7U=;
X-UUID: 17983672a028440f8395a694e8eef122-20200307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 862519836; Sat, 07 Mar 2020 22:34:41 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 7 Mar 2020 22:34:40 -0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sun, 8 Mar 2020 14:34:38 +0800
From: <sean.wang@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] arm: dts: mt7623: add phy-mode property for gmac2
Date: Sun, 8 Mar 2020 14:34:37 +0800
Message-ID: <70e3eff31ecd500ed4862d9de28325a4dbd15105.1583648927.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200307_223452_324776_1C66B0FD 
X-CRM114-Status: UNSURE (   7.37  )
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
Cc: Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, john@phrozen.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Add phy-mode property required by phylink on gmac2

Fixes: b8fc9f30821e ("net: ethernet: mediatek: Add basic PHYLINK support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
index b7606130ade9..0447748f9fa0 100644
--- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
@@ -138,6 +138,7 @@ fixed-link {
 	mac@1 {
 		compatible = "mediatek,eth-mac";
 		reg = <1>;
+		phy-mode = "rgmii";
 		phy-handle = <&phy5>;
 	};
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
