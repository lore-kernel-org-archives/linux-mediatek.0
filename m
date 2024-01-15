Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA03AC3DA79
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jan 2024 11:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JL8etJQJZZlxR7+amaW8doF71Tvptr0HhTmq5ofDFk8=; b=NSJuMAnlxNtHH2/6pY5xJGymz9
	gt4yCBm6ncPk+GTtKkex5fl7osjJ7AwqwkubgKueTIHF8yBj515rOOtEYNno3veknU/u4vCTKjaMI
	+BBxRPJ5Ody9lvTs+eXNWyDSKqZtXiS1C7PNvdt6X3VfWJdzU9CTErq7gArX/UUbQKonypPwK/db7
	J69cYxH/H0X7zzMDtZqDhFLJGpmwh8P8rw2nV00gsVhXJdQY6tD7lgbQ4BcaYFUKCKtsl/+N6+5mv
	/rPfFmKyT84yUL5fxbuISJAk6VWn6o/+qRSZ6pJvWUISXv3kgSXAhZY6zU3n77dNmt6sJVd3n08mh
	x9Dj1vvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPKzb-008f8B-2Z;
	Mon, 15 Jan 2024 11:18:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPKzY-008f6h-2l;
	Mon, 15 Jan 2024 11:18:58 +0000
X-UUID: db6dfc7eb39711ee9a662f17bb45267e-20240115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Reply-To:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JL8etJQJZZlxR7+amaW8doF71Tvptr0HhTmq5ofDFk8=;
	b=nFX2iE/IKpTCVXvJp5icHv94H4aX+ShCfcbswSgJqxTuISdW3CwT63nnRbNYXctXien316BRp6mEwdGvdHsgcKcXkxhqz30Hafn19BHT1CqhdWwDXLfANehcYD1YdAwxGWSOvW17VBijJk0GoUYbt0BLakyh0uArgBnKMcW7y50=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:21600bb7-5259-4548-a14c-fac3415c0825,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:dccc2e2f-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: db6dfc7eb39711ee9a662f17bb45267e-20240115
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 941927661; Mon, 15 Jan 2024 04:18:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 15 Jan 2024 19:18:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 15 Jan 2024 19:18:46 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: <msp@baylibre.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <fparent@baylibre.com>, Ben Lok
	<ben.lok@mediatek.com>, Chris-qj Chen <Chris-qj.Chen@mediatek.com>, Louis Yu
	<louis.yu@mediatek.com>, Bear Wang <bear.wang@mediatek.com>, MandyJH Liu
	<MandyJH.Liu@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, Xiufeng Li
	<Xiufeng.Li@mediatek.com>, <abailon@baylibre.com>, <amergnat@baylibre.com>,
	<afgros@baylibre.com>, yu-chang.lee <yu-chang.lee@mediatek.com>
Subject: [PATCH 0/1] Need help to validate power domain driver modification on mt8365
Date: Mon, 15 Jan 2024 19:18:43 +0800
Message-ID: <20240115111844.22240-1-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <Need help to validate power domain driver modification on mt8365>
References: <Need help to validate power domain driver modification on mt8365>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.523200-8.000000
X-TMASE-MatchedRID: fXkh6SfpfhtM4VjZ76ar2IQ6iEG+7EHnQKuv8uQBDjos7eP5cPCWQxLB
	HER/v45pa888eHP8TjxdPJV7o2tMJaLCTO1UKypvbQ9aoPSmWJFKPIx+MJF9o5soi2XrUn/JlR1
	cT9YafQUG3jF6chFcDnS4vQrt84k3IAcCikR3vq/Yh98d0MMCXCdiKF9WF8aIyjYtBKCN99W//3
	PsX06R2V2kuxS4dcf0
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.523200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5D51DBEE3B8543E096065A55E9CD6ACC2AC7770FC9861491344DB8422BAE874B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_031856_914891_42317BB9 
X-CRM114-Status: UNSURE (   8.84  )
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
Reply-To: msp@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Markus,

In reply to mail "Need help to validate power domain driver modification on
mt8365", the timing of "smi clamp protection" being called is completely 
different from the one of "bus protection" that is why I think there should
be another member represent "smi clamp protection" since these are 
different thing essentially. In this way we match smi to its protection
in an 1 to 1 manner which is more direct way to support multiple smi I
think.

By adding "scpsys_clamp_bus_protection_enable" at the end of bus protection
function we also can guarantee bus protection still remain the same as
before, while, at the same time, forcing bus protection sequence in the
future.

yu-chang.lee (1):
  soc: mediatek: pm-domains: support clamp protection

 drivers/pmdomain/mediatek/mt8183-pm-domains.h |  52 ++++---
 drivers/pmdomain/mediatek/mt8188-pm-domains.h |  41 +++++-
 drivers/pmdomain/mediatek/mt8365-pm-domains.h |  12 +-
 drivers/pmdomain/mediatek/mtk-pm-domains.c    | 132 +++++++++++++++---
 drivers/pmdomain/mediatek/mtk-pm-domains.h    |   2 +
 5 files changed, 189 insertions(+), 50 deletions(-)

-- 
2.18.0


