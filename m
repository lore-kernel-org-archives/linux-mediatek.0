Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68F7CD98EB
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 03:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EO7OBvttA2G0Br3GmBGfNhUy1Mwtm/Kb7V1YAV+3bzA=; b=PycDK3JS5qqbYFvA7V7RCt1bl0
	Xxg232Gu904R/NqXmXB4v8ypQ0+WFvVZ3MNRmdurE7JyNxnwXqP7c45XX4MQOkZJHqaHTiOrhUiA4
	9eKrZHB7O8/cPJIGP8QIlR7VO3pqBDUCkq9Y4Nt49QQsqXWiG8zDSqu9Eo+hR7mtYCKQXHGXJc0JM
	IQGxkpZ8ZTW100l82YPPhzM9/oWgq6rgQ9ejE+bsU8vbpErS1vNRkaZ7vi1sO1w9NqE2VbwtKE9ZM
	a3kZmJmm09bBQ+x6MHu4P4UyZsvObSFiwYrtY8+NwP4iBGr8ADwm3+E52YjqGkWbxyYYMoyxhKFdg
	x/9rjKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqQ8V-00Eg7P-16;
	Wed, 11 Oct 2023 03:43:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqQ8R-00Eg6T-1i;
	Wed, 11 Oct 2023 03:43:50 +0000
X-UUID: 606059dc67e811ee86758d4a7c00f3a0-20231010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EO7OBvttA2G0Br3GmBGfNhUy1Mwtm/Kb7V1YAV+3bzA=;
	b=WcLdV5S9QPZ7outeSxwQHoInlngda29lKBYtfO+0MSf2FTTQvVOz2hlOPoDagUdN2YWrB2iwW2JWxwT0e6tqtWVLLqszRtvjO1bbJQU2cWp9IAyz7ayCyHivVNeOeYIHZLbcsdMRRcA0+6bvrouXroeJl9LtsTT4V/SZVPJRnYo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:92145b4d-3793-488e-94da-96cad27cfedf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:e425a6f0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 606059dc67e811ee86758d4a7c00f3a0-20231010
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2072292879; Tue, 10 Oct 2023 20:43:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Oct 2023 11:43:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Oct 2023 11:43:08 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Roger Lu <roger.lu@mediatek.com>, Kevin Hilman
	<khilman@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v1 0/3] soc: mediatek: svs: add support for MT8186 and MT8195
Date: Wed, 11 Oct 2023 11:43:04 +0800
Message-ID: <20231011034307.24641-1-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.312900-8.000000
X-TMASE-MatchedRID: wd/A6I6/m8qUYaO/E+T/Q6Dvfqcnzyt/sEf8CpnIYtnfUZT83lbkEF2k
	xKIqW9ov4vM1YF6AJbadn/a8z5b7FtAtbEEX0MxBxEHRux+uk8h+ICquNi0WJA0fmkkTRq9olZE
	Mt6Cp1VZNqFkWb2JyIJ78/gaM6W6aftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.312900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4FD3CF831E3EC3C60ACC47404E9EBAB4307A7D618F0E7BC831CC6D9FD65491D12000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_204347_570579_7602D093 
X-CRM114-Status: UNSURE (   8.10  )
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

This series supports MT8186 and MT8195 Smart Voltage Scaling (SVS) hardware which
used as optimization of opp voltage table for gpu/cpu dvfs driver.


Mark Tseng (3):
  soc: mediatek: svs: Add support for MT8195 SoC
  soc: mediatek: svs: Add support for MT8186 SoC
  dt-bindings: soc: mediatek: add mt8186 and mt8195 svs dt-bindings

 .../bindings/soc/mediatek/mtk-svs.yaml        |   2 +
 drivers/soc/mediatek/mtk-svs.c                | 418 ++++++++++++++++++
 2 files changed, 420 insertions(+)

-- 
2.18.0


