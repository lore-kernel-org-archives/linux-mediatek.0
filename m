Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4D6C46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 08:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1IcXxUlcMjL6OjiByHs+3U0DRKLrz/x/GXv70XJcADo=; b=4ff7d2JbPLu5wfzgUZBAOzTru+
	5ojVuajsBx1+bAM+KsK8ib8y8S7WoNkaC1DPi/jdxAcZGnKCCdJTfqtgf2GEvqhPH4DMbTkx8WG4r
	utGO44ADrJUG8lvt+F28z3JGaMaLgLZ67iDaqKWQBTlJ8MBI0yltlBwLUgXJzGDFMVYn4hdasbLd1
	fWS9zD2ndz1IAmYfmWWo3Pr3dSGxZui4dMANBnF8csMgiUWxwWKzyRLmwiCC4PmCaOiPdp51AccPl
	9DZ1JTvrDg2NsLyw+2ICPGW5K7sggJrjg5CxXYkGWRO4DStoi8x3UICBBKXaG0AX6kJWJSnd4L2bg
	eAjYulcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFW86-00AHmt-1c; Wed, 11 Jan 2023 08:06:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFW84-00AHld-Oa; Wed, 11 Jan 2023 08:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=1IcXxUlcMjL6OjiByHs+3U0DRKLrz/x/GXv70XJcADo=; b=YwOHDIo/7c4hs98syxSrNY4AGr
	HfQ8pRYu6GjsmLb7x26It1w3/jBsKxL1CH2hG6yKXX18naE1vBcwHpFIx8q226shdgdYUNm2V6aOy
	EidEOi5mSb2ErbjXm75k8USuhANZ4CDHFeQfsXyo44h+zD8ETH9UkXUgANHbVs5xCcedT0x/TafF9
	xMI4gQh6V/0jWl/XvcXaasYMMP4Jf5UVRoA9Ihgq1bjRxnFV6H8A2Gme2THxGOPU84PmWZKL6nNVd
	ZY1Z4sP+Z9DlwOP/4ZbZ2UsXfLKwx0P0lRMpomNDKfvF/zIYg+wEMyp6kw13sVtYA+zo09NeQySsd
	6mnwNcVQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFW7s-003Zcd-0C;
	Wed, 11 Jan 2023 08:06:27 +0000
X-UUID: cccbc89c918611edbbe3f76fe852e059-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1IcXxUlcMjL6OjiByHs+3U0DRKLrz/x/GXv70XJcADo=;
	b=q+KxuErKEDdXT0h122zyBa873ChK/ioOiaJy68Pm8xlAecLa/5zBZxQcIdXhz9+UeVHZhZfgu66t3BUYfmO8L8yiX/ftebFNKjn71FtXb1ZeTkSypbovCLXgErMAkA+GUwThdOXlZc9quVDJh4EQnU6u4tRVEOPVgBftmaBmAck=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:2f973ca0-5ae6-49af-ae8e-be12a20c8ecc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:6d4def8b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: cccbc89c918611edbbe3f76fe852e059-20230111
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1038756757; Wed, 11 Jan 2023 01:06:06 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 15:45:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 15:45:29 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 0/14] Enahance SVS's robustness
Date: Wed, 11 Jan 2023 15:45:14 +0800
Message-ID: <20230111074528.29354-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_080624_902757_9B44DC0F 
X-CRM114-Status: UNSURE (   8.53  )
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

SVS driver got accepted upstream but still has room to be improved.
Therefore, we add these patches to fix issues and coding style.

Change since v3:
- Remove cleanup codes in patch [01/14] for letting it backport easily
- Enclose svs debug cmd codes with "CONFIG_DEBUG_FS" where needed
- Reorder patch sequenece to put fix up patch first

Tested on:
MT8183 Platform (kernel v5.10)
MT8192 Platform (kernel v5.4)

Matthias Brugger (4):
  soc: mediatek: mtk-svs: clean up platform probing
  soc: mediatek: mtk-svs: improve readability of platform_probe
  soc: mediatek: mtk-svs: move svs_platform_probe into probe
  soc: mediatek: mtk-svs: delete superfluous platform data entries

Ricardo Ribalda (1):
  soc: mediatek: mtk-svs: enable the IRQ later

Roger Lu (8):
  soc: mediatek: mtk-svs: restore default voltages when svs_init02()
    fail
  soc: mediatek: mtk-svs: reset svs when svs_resume() fail
  soc: mediatek: mtk-svs: use svs clk control APIs
  soc: mediatek: mtk-svs: add thermal voltage compensation if needed
  soc: mediatek: mtk-svs: keep svs alive if CONFIG_DEBUG_FS not
    supported
  soc: mediatek: mtk-svs: use svs get efuse common function
  soc: mediatek: mtk-svs: use common function to disable restore
    voltages
  soc: mtk-svs: mt8183: refactor o_slope calculation

Shang XiaoJing (1):
  soc: mediatek: mtk-svs: Use pm_runtime_resume_and_get() in
    svs_init01()

 drivers/soc/mediatek/mtk-svs.c | 339 +++++++++++++++++----------------
 1 file changed, 173 insertions(+), 166 deletions(-)



