Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F883C4707B
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rVf/KyCe3y2w+HtApnhWHSc0RRmauZP3HVSAozjLxco=; b=TTC2a2t2/qmy79/oMEhSM9bDWT
	AG/DkL4tWdHXF7vDl/9sckr2PNIKR6ZSg6H9PT9U9aBjIn1mBiWWu6tsnKNUoPb75vS6n2FmIULWK
	IMUGPdYWj42t94kchv4TbOSgYodmXo0zGKp86ITs7VoI5MMHsrlaZ2ohpxZZa/T2sSsBShKBPeAJJ
	c+Su96L8TQi0X4xPMokVrpioqt3JGbz95VeCEjr6fqxIlebDx1aN3tiJFBHlTAF4S6pQGsc+1HFN6
	SI/OzIA41EPDz1tmZB3t8dlqfq2J6f15sJnMrLMUgtGKo2IRX8dwgPNeeV8HxyQLkv2zgUGdOz9t4
	bvwLRAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNb2J-00ClRf-1y;
	Wed, 10 Jan 2024 16:02:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNb2H-00ClPF-1G;
	Wed, 10 Jan 2024 16:02:34 +0000
X-UUID: a7191086afd111ee9a662f17bb45267e-20240110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rVf/KyCe3y2w+HtApnhWHSc0RRmauZP3HVSAozjLxco=;
	b=EvKF0DuyyzRJVmWZEZnSiF+3zaRXOXa6F3a6ahy6mU31Zinq3KdwU+llkyEHbqUFColuS3uzGVR66TMgwh/t1HVMg3X0MLRpUFGNj4MuGra9PSL2ykpY24xL69C+aF/5Q4QnaZgnj1Ak5R/2w+PNcVxcbA3TLqV0UgjyWy+hb/g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:fa843c50-de53-4146-b99f-a429a9589ded,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:fa44b482-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a7191086afd111ee9a662f17bb45267e-20240110
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 663257629; Wed, 10 Jan 2024 09:02:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Jan 2024 23:51:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Jan 2024 23:51:51 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-jh Lin
	<jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH 0/2] Change GCE hardware timeout to software timeout
Date: Wed, 10 Jan 2024 23:51:46 +0800
Message-ID: <20240110155148.6383-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.263700-8.000000
X-TMASE-MatchedRID: q3F3psOzl9ySm4maZcPB3bMjW/sniEQKKVrLOZD1BXT7efdnqtsaEwNx
	WPxQqGxCIivmPMAFRzSor0AhuwYJneHxFb2pjr4bXP5rFAucBUGy4iyjvVWTop2iHEDAUb20o8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqtgZFlHm/gtnY0ATtLIYswSE9/RQmUBCjZHpPDPfgQysA2V8
	IOje1GckMMprcbiest
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.263700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6C97B50913820EDC4F53C26FD1119DCA9248F4935C41D9B043801622779BF2CB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_080233_439380_BF38D6F8 
X-CRM114-Status: UNSURE (   9.70  )
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

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

Since the max value of GCE hardware interrupt timeout for wait and poll
instructions is about 1760ms.
It is not enough for the use case of ISP driver below:
GCE Thread A: wait for SOF and set event 1.
GCE Thread B: wait for event 1 and set event 2.
GCE Thread C: wait for event 2 and set event 3.
GCE Thread D: wait for event 3 and set event 4.
GCE Thread E: wait for event 4 and set EOF.
If all GCE Threads start at the same time, the latest GCE Thread E will
wait for event more than 2 seconds.

Therefore, we changed the hardware timeout to software timeout, making it
longer, more certain, and making it configurable by CMDQ client drivers.

Jason-JH.Lin (2):
  mailbox: mtk-cmdq: Change GCE hardware timeout to software timeout
  mailbox: mtk-cmdq: Add set GCE thread timeout interface

 drivers/mailbox/mtk-cmdq-mailbox.c       | 183 +++++++++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h |   4 +
 2 files changed, 187 insertions(+)

-- 
2.18.0


