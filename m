Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3683CD3430
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 01:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yt9rNt7h8DE405+Mq7rWtcTRUY7xH9V0TktrYXEFh60=; b=hoK0nnO2NGt3fSJV6G8xnJOfnY
	e4zAY/iOSC9nW9jy3IwXnNtWAIrf0d3HFHOUJAtTnincthkyE6TEen7n1yVkXah4wPMcP0heGKVxk
	Q2D6O569HpIDlyyFcjsXCvMFYpyj7I3zRZhXUBU8Qggf5cLE2comqdXI54/Apdj9hZ7z6uFA0NCMT
	dQyRZTOvOUxiWrq4OPtlVynAhyjgScn+OHCU4Zqoh1Q6ca0U9Qq8wxZh9MK72vnHiZqvBO4tKxOtM
	4y2XHiy53O8+pmnmui14W4nHzFgzg64taYe5JSBwj3ZTqBWHeXPzI3JUZwDbXM5TgsrxqOfOHipfw
	hFIyRvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiPnq-00GfzB-1u;
	Tue, 19 Sep 2023 01:45:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiPno-00Gfy8-1J;
	Tue, 19 Sep 2023 01:45:25 +0000
X-UUID: 2fe534d2568e11ee9b7791016c24628a-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yt9rNt7h8DE405+Mq7rWtcTRUY7xH9V0TktrYXEFh60=;
	b=Gzlbmmt+7CYofhbBYFIk47uChpVS7nM8KBw/5riULGVFvhYQcXI43t/ifdcojLipDnZqEN1LdMXpxjL5fMSvFEfLUmXecrjzVM5RSPq4uzx6GWxbkM58fP+BadMvQrAdj4OFMalUhk2XeIBfstSs0hqxczQkeWpkhCVhV7p4gQQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:33e94fef-5020-4ba6-9a5b-ff1dae866ef1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:670c2ec3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2fe534d2568e11ee9b7791016c24628a-20230918
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1921378180; Mon, 18 Sep 2023 18:45:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 09:44:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 09:44:40 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Roger Lu <roger.lu@mediatek.com>,
	Kevin Hilman <khilman@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v3 0/2] soc: mediatek: svs: add support for mt8188
Date: Tue, 19 Sep 2023 09:44:37 +0800
Message-ID: <20230919014439.5795-1-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.329200-8.000000
X-TMASE-MatchedRID: mjDuVRm881CUYaO/E+T/Q1z+axQLnAVBIaLR+2xKRDJrtkNaxER5J/gQ
	nFzx6+s56DB7yJ7eUTOIJs0Up7vkWEkjllSXrjtQFEUknJ/kEl5jFT88f69nG/oLR4+zsDTtjoc
	zmuoPCq0vyXISH/RYkMxjueKjC4GveOFyorNDzUCCgA30pQeF94ViHoWt3zyB
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.329200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 941405550405806D315C16C92E388B6DD0F813BE60116E68F3EC0BC7955A797D2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_184524_446692_1FFA9F46 
X-CRM114-Status: UNSURE (   9.36  )
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

This series supports MT8188 Smart Voltage Scaling (SVS) hardware which
used as optimization of opp voltage table for gpu dvfs driver.

Changes since v2:
  - Add Acked-by & Acked-by in patch

Changes since v1:
  - thermal name change to lvts
  - fixed voltage bin flow
  - using svs_get_efuse_data() replace nvmem read API in mt8188 efuse
    parsing 

Mark Tseng (2):
  dt-bindings: soc: mediatek: add mt8188 svs dt-bindings
  soc: mediatek: svs: add support for mt8188

 .../bindings/soc/mediatek/mtk-svs.yaml        |   1 +
 drivers/soc/mediatek/mtk-svs.c                | 184 +++++++++++++++++-
 2 files changed, 181 insertions(+), 4 deletions(-)

-- 
2.18.0


