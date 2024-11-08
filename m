Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0820D5E141
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Nov 2024 06:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AH5dye9ghuwYd4dunHk1XwO4UAJNi7Gix6OZFCVkEOI=; b=oGe4heQaOWoRTDIxWqoLth9Crx
	8gkslM00qPfGXEYLUQbVSd32dZde679rIsWS/IujhSiOe9s3rV/1eyC8sYkzFQGBMNL87j4NKuNGz
	Gs1d/CeBXVyQrBgmjx9hM4IggvwDoNl1TCoQH02PCoQXPvTNE2PFWOQgX+iYfZrGcXPCELdZm36bi
	lLN7UOslvZg5o3fUCQ9ATfjAN3kTS48rOgq2TtoxGSCmwcdZju0Eph0TnCEkOaqJiPIHFPhiphl3x
	cyqm0zwpqVEQOLqwFT6rli+/aOVlf2zmZs6y0Ffs1ZQb/pXcMsurNjsqZv71YimjuMKYO7CNoRiAi
	0X/uDFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Im8-00000009XNl-3uXL;
	Fri, 08 Nov 2024 06:47:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9If0-00000009Vvo-3gel;
	Fri, 08 Nov 2024 06:40:00 +0000
X-UUID: 432802d09d9c11ef9048ed6ed365623b-20241107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AH5dye9ghuwYd4dunHk1XwO4UAJNi7Gix6OZFCVkEOI=;
	b=KftSXk+avEMIqZ7JVtqWXS5KpbUCcBfwPKaYuC+TXVkDFK+LGxnJhcCjeFGiEqSUK0i3nGM56azYnOn3mftygov2EUcvVrpMI+DRKmT36IP3BzKdcQl0V9k5/5gt+h0wu1VR7q8JFiTPv8G3FUr3XmbDTTEcCQnCJ0KuyKmR8As=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:138a8027-d53b-4194-8c70-76119fe6f813,IP:0,U
	RL:0,TC:0,Content:15,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-META: VersionHash:b0fcdc3,CLOUDID:d5ffb8ca-91e6-4060-9516-6ba489b4e2dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 432802d09d9c11ef9048ed6ed365623b-20241107
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 101526059; Thu, 07 Nov 2024 23:39:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Nov 2024 14:39:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 14:39:48 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v2 0/4] fixed mediatek-cpufreq has multi policy concurrency issue
Date: Fri, 8 Nov 2024 14:39:38 +0800
Message-ID: <20241108063942.19744-1-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-1.112600-8.000000
X-TMASE-MatchedRID: r9EX/Oe9GqVP6qceA7YxicAmcZEx8XHJN/BTU5ZfZRLD3h2nmZ4BQf2o
	7vT7HSck6P2jQ8ymte/03yRiZxUSQaHtjelygRNaXP5rFAucBUFf6HjaRmqhcER4KzyzRoZGo8W
	MkQWv6iUoTQl7wNH8Pg1fA1QHegDv3QfwsVk0UbswamAE0joFo9Oz+1d0RpMCupiSwmVg/KvnLl
	qusi4ZPmCf5VV9gOCSFKrPn74+giS9bKqTrUhoWufHX8G+0nRv4SJOyqFUkYZNCuhRTC+mgoCE5
	xpCtDRTUbJFyh4XXyqYo/TPOlMB4bCh3zE4wqa8YGNVOdPa5Cp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-1.112600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5CE8E81E46AFE4466AC0C9543F8E5EB27426992430BDDCD519A671E26ABBF8582000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_223959_012721_5DC4D3D3 
X-CRM114-Status: UNSURE (   7.54  )
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

For multi cluster SoC, the cpufreq->target_index() is re-enter function
for each policy to change CPU frequency. In the cirtical session must
use glocal mutex lock to avoid get wrong OPP.

Changes since v1:
	  - seperate more patch for detail change.

Mark Tseng (4):
  cpufreq: mediatek: CCI support SoC , the transition_delay set to 10 ms
  cpufreq: mediatek: using global lock avoid race condition
  cpufreq: mediatek: Add CPUFREQ_ASYNC_NOTIFICATION flag
  cpufreq: mediatek: data safety protect

 drivers/cpufreq/mediatek-cpufreq.c | 65 ++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 16 deletions(-)

-- 
2.45.2


