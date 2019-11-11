Return-Path: <SRS0=Eirx=ZD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8E2C43331
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 06:52:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 620CC2184C
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 06:52:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JiFpvWlW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bdaC+/gn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 620CC2184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RYdY6Aj5GHEkH0VVQa8tmrRhb3jssv+LCGiPevrmAzQ=; b=JiFpvWlW9xpDwF
	8FZBSXhNW2+grmmgp4B68FE3ey1MISDGN5+njUjabhOKv0xKVNK0G56kfqqV2jd7RBqr6P002U5Bq
	PF5rfIpvtz1ofWG9UbbC/5iqLMs9bjnwBX8aqlKBsRCbgZjrzLRkM7qtRuBox8q3eLn4fSHa0CEbA
	l8dvM8NgL+WLlaiS9CbaDgYK2buiQ3s55GiB3y/tZdJZ+d8MVsHnmnu/HbyEM8JKrWNIN/7IQTKzr
	cXv4gdfhJAYDaCBnNYAXcuvZX1ZqD1IufnfcXOWwFU72AIa33Tb3EagjV3Zqql3YPlUas1KJsh4T9
	duY6cd26mVZy/08w2h/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU3Yj-0000n7-2T; Mon, 11 Nov 2019 06:52:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU3Y4-0008Ow-2t; Mon, 11 Nov 2019 06:51:42 +0000
X-UUID: 8a2e8b24864049688528a5fcd39d0afb-20191110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1NPMi5s0B7PLycleggl/Ct6ul55hyyE2HzaKv33AkXA=; 
 b=bdaC+/gnZss0+iInHREM2o3C5rYGGqZF+oGjr1dM2Oc7D0RQKQtaYaT2wV1DMQ123uYe5OJWYbF4Vxu3K4GdZXcidCXOjjms+uCuunJ5BpN8HVeOTOapb0RJwpflWxtbAmcQ+PKThxOZ7atyI1m8sQW1avidVo7UgW/zVfutN8s=;
X-UUID: 8a2e8b24864049688528a5fcd39d0afb-20191110
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mark-mc.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 827488120; Sun, 10 Nov 2019 22:51:40 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 10 Nov 2019 22:51:29 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 11 Nov 2019 14:51:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 11 Nov 2019 14:51:28 +0800
From: MarkLee <Mark-MC.Lee@mediatek.com>
To: "David S. Miller" <davem@davemloft.net>, Sean Wang
 <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net,v2 0/3]  Rework mt762x GDM setup flow
Date: Mon, 11 Nov 2019 14:51:26 +0800
Message-ID: <20191111065129.30078-1-Mark-MC.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_225140_126736_7F743983 
X-CRM114-Status: UNSURE (   6.80  )
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
