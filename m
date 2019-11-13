Return-Path: <SRS0=w4bH=ZF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF752C43331
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 02:40:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C333E2084E
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 02:40:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U5q/X1HX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EDn7Q97S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C333E2084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RYdY6Aj5GHEkH0VVQa8tmrRhb3jssv+LCGiPevrmAzQ=; b=U5q/X1HXkFjjEK
	Q8m55M2EdVNtt2fudQo3lQPBpT03Zz9jMWoccG7/jzxhfmKiIWV5vLVUm5QP9N25Ua4S2+L+Bg+JU
	wDmFYF+VEA528UgX52CHe4zmmyF+bkHQmu1uDKVaqSJD0z9ReeJpJo6T0NeYwHltyLcJ5F3uw96sQ
	u5okk/OjisxuxwRCM/3AmPY/PIyBTq1B1p3iUMlaZkLEguuPvDS4XXIoVSu4VAecjO64SoBV4avLz
	cweEJocH9yR4i0o3KAbxDBl5xJ56mC5dJRXxBRm1p+B1jhB9OaPFtAgtbbnYavmOqIorB3Mu807sE
	4YqZllNkJ2u0Wx5+j4MA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUiZv-0005hm-Ro; Wed, 13 Nov 2019 02:40:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUiYt-0003Og-LH; Wed, 13 Nov 2019 02:39:17 +0000
X-UUID: acadfcb72ac14fe8b27e92ac0ce2599f-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1NPMi5s0B7PLycleggl/Ct6ul55hyyE2HzaKv33AkXA=; 
 b=EDn7Q97SYGe/ISn7VL40J628+hoVivlbsz1L2h9kC6FgazP0cjWcyDbn3c1pvtq//nSzxCMNLrl6IQGXa7Eptlkt8wNqTZiBcSTY2G9xKgZELPaS5XmFEJqoXE2EqYxdxZ5v1GvUH2PWo3MQAwltPWQ3YjPa95xHB4adVhkbaAc=;
X-UUID: acadfcb72ac14fe8b27e92ac0ce2599f-20191112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-mc.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1737915054; Tue, 12 Nov 2019 18:39:05 -0800
Received: from mtkmbs05dr.mediatek.inc (172.21.101.97) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 18:38:45 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05dr.mediatek.inc (172.21.101.97) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 13 Nov 2019 10:38:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 13 Nov 2019 10:38:43 +0800
From: MarkLee <Mark-MC.Lee@mediatek.com>
To: "David S. Miller" <davem@davemloft.net>, Sean Wang
 <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net,v3 0/3]  Rework mt762x GDM setup flow
Date: Wed, 13 Nov 2019 10:38:41 +0800
Message-ID: <20191113023844.17800-1-Mark-MC.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_183915_719639_A69B07AB 
X-CRM114-Status: UNSURE (   7.61  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jakub
 Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rene van Dorst <opensource@vdorst.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 MarkLee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The mt762x GDM block is mainly used to setup the HW internal
rx path from GMAC to RX DMA engine(PDMA) and the packet
switching engine(PSE) is responsed to do the data forward
following the GDM configuration.

This patch set have three goals :

1. Integrate GDM/PSE setup operations into single function "mtk_gdm_config"

2. Refine the timing of GDM/PSE setup, move it from mtk_hw_init 
   to mtk_open

3. Enable GDM GDMA_DROP_ALL mode to drop all packet during the 
   stop operation

MarkLee (3):
  net: ethernet: mediatek: Integrate GDM/PSE setup operations
  net: ethernet: mediatek: Refine the timing of GDM/PSE setup
  net: ethernet: mediatek: Enable GDM GDMA_DROP_ALL mode

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 44 ++++++++++++++-------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  2 +
 2 files changed, 31 insertions(+), 15 deletions(-)

-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
