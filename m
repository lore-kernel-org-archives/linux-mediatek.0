Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F14D0D7BB
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 15:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3QaSDnFFFbE8vRjYrjaSKgw7kmdxTwobCOyf6Kpde7U=; b=S9uEZqFgb6RvfInK+XAf93NjRM
	ElgGrNrP803HJhLQiEDuxoGIkGlZKw1MmPqZlYCL/qLRI0U54FImUw778jR79PIq5PnysJOvw+Ac3
	JQZqMcEipD97tm+cfLoiZT2cYc4k9+C2VyZBQFZfpIKxRZbMiqpoAB96om3oq7R1eQpYl1gZU9wFj
	SxZE99obHLuAXYINrRLi4rkctOiuDVcubf2YcQny3eshzV77ahQox7plFLQWrQV0H5vKr92Saq6oY
	tHNBMchJzR3SsHfxmt8FZmeAd1drng2WdbITtEum3P6VkVgy1kLWom5Imvm1hg2znm0adZgqFgGkU
	HdykiPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szHZI-0000000Gn8s-31Fd;
	Fri, 11 Oct 2024 15:28:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szHLh-0000000GkMP-33b2
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Oct 2024 15:14:39 +0000
X-UUID: 8461f9fa87e311efba0aef63c0775dbf-20241011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3QaSDnFFFbE8vRjYrjaSKgw7kmdxTwobCOyf6Kpde7U=;
	b=BRt3sTUABW04XHadnjrcLSfHgtMHbMs1oTjIU3EM9OwzWJudEWjt7E58Q6ZOgiM5qn9SdQZpiPgWm4fsNIg0gOrFaE7TLVRqLWW4EfrjDmtmZp45V5NP6Kojq3NluGEEz7OkjrVvL8S4FNNAp3Q9gp+pvZV/DnUMKcy/HFvXLqQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:93907b22-cf40-43d9-8df4-b9b504db99b2,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:10,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-META: VersionHash:6dc6a47,CLOUDID:e9c11c41-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 8461f9fa87e311efba0aef63c0775dbf-20241011
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1053527606; Fri, 11 Oct 2024 08:14:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 11 Oct 2024 23:14:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Oct 2024 23:14:24 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: linux-firmware <linux-firmware@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Daniel Golle
	<daniel@makrotopia.org>
Subject: pull-request: mtk_wed firmware 20241011
Date: Fri, 11 Oct 2024 23:14:23 +0800
Message-ID: <20241011151424.30750-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.715300-8.000000
X-TMASE-MatchedRID: 9SKQLBmTF7vgxStX0wUODsqXjImgj58bIR1rLBJm/M52CVwwf1a+igzR
	CsGHURLufsb4gWsAzqDAbEAUUTwVAGcV4sYfqMYeHDC6a94U1AD4qCLIu0mtIEYvSDWdWaRhC9B
	TOmY04/BJri6yNs2b3HATsg8MODVIHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgWy4DzHzRjN6n38L
	4M0rTSSLErgvOjjWrLPa6JbT9/Ck9YIWbXtrx1NQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.715300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6AB2283C2A15734E666FF20D129126D412A712EDF399F97EC911404E00555F7B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_081437_797104_43EBF9F5 
X-CRM114-Status: UNSURE (   9.66  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Here's a pull request for adding firmware files for mt7988 Wireless
Ethernet Dispatcher.

Please let me know if there are any problems.

Shayne

The following changes since commit d55315295cccf8ce5dc288a74d75cf09b8063cfc:

  Merge branch 'superm1/qci-patches' into 'main' (2024-10-10 19:11:13 +0000)

are available in the Git repository at:

  https://github.com/csyuanc/linux-firmware.git mtk_wed-20241011

for you to fetch changes up to 8f2f0386630da115daf11229b4543f6672d8cca5:

  mtk_wed: add firmware for mt7988 Wireless Ethernet Dispatcher (2024-10-11 22:22:35 +0800)

----------------------------------------------------------------
Shayne Chen (1):
      mtk_wed: add firmware for mt7988 Wireless Ethernet Dispatcher

 WHENCE                          |  28 ++++++++++++++++++++++------
 mediatek/mt7988/mt7988_wo_0.bin | Bin 0 -> 107816 bytes
 mediatek/mt7988/mt7988_wo_1.bin | Bin 0 -> 107752 bytes
 3 files changed, 22 insertions(+), 6 deletions(-)
 create mode 100644 mediatek/mt7988/mt7988_wo_0.bin
 create mode 100644 mediatek/mt7988/mt7988_wo_1.bin

