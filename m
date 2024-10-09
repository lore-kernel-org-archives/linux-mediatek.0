Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310E3CEDD89
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 12:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wft0wMYjRol19sQXS7lU7PGKjsnYG5Yenj+/tz3tTQ8=; b=GrGVaI2+liLcybbGPAPqF4l3Zr
	RZFE/+DalNshFAz2lZHRKVOZLssQrXkF43w1WTSRvoKYXIUJPpSJHw5na8ElmjBA49FKEG/RomhKs
	LC7zomn1kIJ33KAZSYGA7mcMlQPvfPD9aPhKNw3DlStjImkX05vw1vGHpZRmOEs6nr9DlFBX7WlLH
	JiZF3IXoAgXQ2H6wFFgPpZt3VeJVV7Yod0HwrtgaXdQBrFS4P0siRdb4u2BJhjvirL8j/Qy5F1jwj
	UqRm5Z97MQnzULPqyVSon4hlH/Li8EzocEzsKVP9CDIwkkde2K1l65FMfgxKt56TQxT6oWdLoyEkO
	M6UKzz5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syVcB-00000009B9m-0sp3;
	Wed, 09 Oct 2024 12:16:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syVOU-000000099RQ-0TGt;
	Wed, 09 Oct 2024 12:02:19 +0000
X-UUID: 52ffa046863611efb3adad29d29602c1-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wft0wMYjRol19sQXS7lU7PGKjsnYG5Yenj+/tz3tTQ8=;
	b=FFal7dpZ0mU4QV8mNteFS69YCD4IM/KxlT1xJXqeXJQqK39BEj5tbJIJ6qbQiVf15rXDeAj3wkvwb+YNmMr0OfalAQrolFsEK+uxZHcHrW4Q3vazMbP3CjT4Mjq+sqBXpwRbLPsxEtDOnHkV2CN+wBEQsrckRkNqwNJqVBr26aw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:da3d1f1a-9470-4608-a5e2-735ccd30de98,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:8cc5fe64-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 52ffa046863611efb3adad29d29602c1-20241009
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <andy-ld.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 605445394; Wed, 09 Oct 2024 05:02:15 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 20:02:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 20:02:08 +0800
From: Andy-ld Lu <andy-ld.lu@mediatek.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH v3 0/3] Add mtk-sd support for MT8196
Date: Wed, 9 Oct 2024 20:01:23 +0800
Message-ID: <20241009120203.14913-1-andy-ld.lu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.718400-8.000000
X-TMASE-MatchedRID: 6Pyq8tKkRyftt0HEL3BUV7iMC5wdwKqdLoYOuiLW+uXfq/+cvg1NCKip
	18v0DWYVnxamL54dKNbAFycL8Ymu1rhhaFskSWDqYwaJXrf2IXSL6a+kPOEFsJ6fSoF3Lt+MMqR
	wky9xOk45imXDx6zyYOFr39PS7zaEgZI1n6aNUzbJ5W6OZe5hhYEcpMn6x9cZOW8XgChxVdgwfX
	HHXt4W1FoqhwIvssPy3c3CRAd2bOE2UEKHDN0wzBlckvO1m+JcTJDl9FKHbrmdohxAwFG9tKPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KraTORqtbRsP2nTRjrsQn0THUTvWJ9mbf13z4B5fjDcKL3YG1
	Y8RuI/JK31unxphxzudGiGOk5aHhKyVJb/VK9KDdknd0aVk9DuLDq7G+Ik/yv22xKJRyIGVDnOx
	ozmpp1r+WvXJiKHRLKUZy1dpMKy4=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.718400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 02CD6116B37BFC20CAFB3C4A291E803122577B9430CD7D288F9F17C22E29986A2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_050218_178322_566306E6 
X-CRM114-Status: GOOD (  12.53  )
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

There are some new features for Mediatek SoC MT8196, which include new
command/data transmitting and receiving path (abbreviated as tx/rx), and
two modified register settings.

The driver code has to be adapted to implement the above changes, and the
compatible string 'mediatek,mt8196-mmc' is added to driver and devicetree
bindings.

---
Changes in v3:
- Separate the settings for stop_dly_sel and pop_en_cnt to a different
  commit; 
- Add the original value of stop_dly_sel to the platdata of legacy SoCs,
  for unified code setting;
- Change to return if host->top_base is NULL in msdc_new_tx_setting function,
  to simplify coding;
- Optimize the location of assignment for 'timing_changed' in msdc_set_mclk
  function.

Changes in v2:
- Use compatible string 'mediatek,mt8196-mmc' to replace 'mediatek,msdc-v2';
- Remove the 'mediatek,stop-dly-sel', 'mediatek,pop-en-cnt' and 'mediatek,
  prohibit-gate-cg' in devicetree bindings, due to SoC dependent;
- Add 'stop_dly_sel' and 'pop_en_cnt' to the compatiblity structure for
  different register settings;
- The SoC's upgraded version would discard the bus design that detect source
  clock CG when the CPU access the IP registers, so drop the related control
  flow with 'prohibit_gate_cg' flag.

Link to v1:
https://patchwork.kernel.org/patch/13812924

---
Andy-ld Lu (3):
  mmc: mtk-sd: Add support for MT8196
  mmc: mtk-sd: Add two settings in platdata
  dt-bindings: mmc: mtk-sd: Add support for MT8196

 .../devicetree/bindings/mmc/mtk-sd.yaml       |   2 +
 drivers/mmc/host/mtk-sd.c                     | 166 +++++++++++++++---
 2 files changed, 147 insertions(+), 21 deletions(-)

-- 
2.46.0


