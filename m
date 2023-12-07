Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60086C10DCE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 06:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Upr25vEguertkhwfGF+tea8+auuicN+7Yo0Ew+WXUc=; b=ZbXeQr9vXbhqG96n2eRPHA3viR
	KWAMiDWJIKvXLAiwe/HRdx2Hk4kgN7zJutZ4iSQdZnaVNKQHj3CjxKpTyECRdZ2j5YTD3hCP5LCRW
	y99tNCY0e8vG2Yl3egD/WDSgR5mxzHccK7dOJp5xz0t61G0OCL0e8zk9ebIUEMwraIMOA3VNbax1s
	QUrieWwxjWROu9OSskibZiWf85cbVYQf/jGNuzwLwouG6+bjNLNDpXMHcMA3ln3OwQZM+znrw3igL
	zmqI1uSQBPJvH1coWzzUub/yDhlpO0caorp8M4yMPwjmDCycP+CR0VFgvV5JKAPIZTLX1zh7pojg/
	CXRFgJRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB7zF-00Bzu4-0R;
	Thu, 07 Dec 2023 06:35:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB7zB-00Bzt6-1c;
	Thu, 07 Dec 2023 06:35:50 +0000
X-UUID: d7b3082294ca11ee958cff29c719f35b-20231206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1Upr25vEguertkhwfGF+tea8+auuicN+7Yo0Ew+WXUc=;
	b=VNDOLM4uq5kOIFzxKkumbHtgXBYuLh9E8Zm6FzSSDoOQpT8w6gLv8cfhuzVnhxPbzCyGSkv2dma4IMWqBCiuLajiNeYhuLq+rtlHzKO+rZWqsGHYQVUifP6YzpdBNZ0ZEtSkEiB4lasqRVEliiEkMFDofmhSY752IdQBv+VLFHM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:d01ab93b-be21-4b5f-b156-db000d9ec74e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:1beae4bc-2ac7-4da2-9f94-677a477649d9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d7b3082294ca11ee958cff29c719f35b-20231206
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 654089090; Wed, 06 Dec 2023 23:35:41 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Dec 2023 14:35:38 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 7 Dec 2023 14:35:37 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Wenbin
 Mei" <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Axe Yang
	<axe.yang@mediatek.com>
Subject: [PATCH v4 0/2] mmc: mediatek: add support for 64-steps tuning 
Date: Thu, 7 Dec 2023 14:35:33 +0800
Message-ID: <20231207063535.29546-1-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.560700-8.000000
X-TMASE-MatchedRID: gUuz9Ogq75XyTBeqcpWTVjPDkSOzeDWWc3ewuwbSaG74JyR+b5tvoMIZ
	XeWgC5H4MNtd4b5keZYEoCN5ygO+keG9zoNFX6PtcFEiuPxHjsXizg6lQ0NagVwpnAAvAwazYjN
	VHAF7/x2VMlcqqHWd7aBVvEjzNBpCHxPMjOKY7A+Wlioo2ZbGwdmzcdRxL+xwKrauXd3MZDWCtu
	rRWuLXZFTRjqgjX5vkHnbm84W0zu1SxdSdZ8QKZ+kY/8nj1oos
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.560700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9B3128BC62A2FEE6AE006376D6BA995C3A25A8BBC567435E09939EC57DB75A0F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_223549_616941_85C0E57A 
X-CRM114-Status: UNSURE (   8.40  )
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

Change in v4:
- for SD/SDIO, tune 64 steps by default
- reduce some breaks to improve code readability

Change in v3:
- use BIT_ULL() instead of BIT() to avoid potential left shift operations
  that could cause exceed boundary problem on 32-bit platforms

Change in v2:
- move the change made to document to the front
- change mediatek,tune-step dts property type to enum for better scalability

Axe Yang (2):
  dt-bindings: mmc: mtk-sd: add tuning steps related property
  mmc: mediatek: extend number of tuning steps

 .../devicetree/bindings/mmc/mtk-sd.yaml       |   9 +
 drivers/mmc/host/mtk-sd.c                     | 158 ++++++++++++------
 2 files changed, 119 insertions(+), 48 deletions(-)

-- 
2.18.0


