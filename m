Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9DFC54EBE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 01:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=260WfMFmV7gTCf7bcdowdVdB4l4oCLTurwzBetm6Z5c=; b=v9ZkKB93UfCg/q8aDsRQa/uPkO
	BTqBM3OFiJY/zkFE3xTazwMqtzqs6smX27HpIbO9wc1qwkZ3NJyIA8iK5JXDWopvmKjYkH7lzQz3F
	F5nEvLVKOjJuEpxgPIn1wmGgSkpskHI/sJ43MImYWoI5e2FRQJbXhi7VQwvckq6i5E/a9Ovy8Ay6D
	9WRHFsV/DIsZwrr2Z2ZDYq9VzcdNCdmtnA0LOkui0E+krPUvLZeo2srUn4NLUqo6pF4vcAUv0pW4u
	qHjjCpGHM9d+fxlFZpSvpw/nPdsfBniRShiLnIAnM4Kb3Rjpy8N37hyNvsrDJ/EWcVA40hfF+Z06Y
	r659En1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHayg-00CWUy-37; Tue, 17 Jan 2023 01:41:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHayS-00CWPo-UM; Tue, 17 Jan 2023 01:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=260WfMFmV7gTCf7bcdowdVdB4l4oCLTurwzBetm6Z5c=; b=ogWRSx5OUUTCYgG1QUE0ICTNOQ
	A7ECyGo45kum35scBMBCkPUpP+1KOqxVlxGRO9N1kR+V06sT+4D/Sb59nSqPbnjlyVGUUeCN5QJ73
	hI9wP4/96NLXGl0AfllVlPEqxcVxrKrdbKN31bZHOtMi7OOLL0AxVM/ptrB8AuruhOEciAOArNix0
	7Zy5SCmoT6gVIDf5Usmx0BrrJls0BRXPUhi0X2k2wD1T3E5pPo1WT9EdZq3nYE0822kQp9A0hsQ6h
	/KOZ67wsVEbFTRudJiW1OHNwXUPadaR6LAZF30mg3Mc9TzQZ1K5koG4i8zzf3GTBXs+bocl7nWpmo
	KF51FOdw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHayC-005mtP-2N;
	Tue, 17 Jan 2023 01:41:04 +0000
X-UUID: 008360de960811eda08d4d6090ec5a5c-20230116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=260WfMFmV7gTCf7bcdowdVdB4l4oCLTurwzBetm6Z5c=;
	b=XvB2a6HoY/C8stvxCVhWQU0spQxLCzxF88rvHN6cSRSpuRdKPEg8SqqqSMEWRJONs+rz/P5DH7phDtpgZEbpImnZEh6ok2RSToodrdXXLNmL5D17rOeo2NyLc1fUuT3J1I2Ckai1SZN/21Lks9gIc6XZFBtQOQ1C9qGwzaV2F9A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:6ffb4c81-93e3-487e-bd86-e587ea4e3d54,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:6b28fef5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 008360de960811eda08d4d6090ec5a5c-20230116
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1778554574; Mon, 16 Jan 2023 18:41:03 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 17 Jan 2023 09:40:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 17 Jan 2023 09:40:25 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<linux-watchdog@vger.kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 0/2] mtk-wdt: Add reset-by-toprgu support
Date: Tue, 17 Jan 2023 09:40:21 +0800
Message-ID: <20230117014023.2993-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_014102_207850_D00799F9 
X-CRM114-Status: GOOD (  10.57  )
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

This series is based on next-20230116.

TOPRGU = Top Reset Generation Unit

In some cases, we may need TOPRGU to reset the wdt timer after system
resets. Provide a reset_by_toprgu parameter for configuration. We can
disable or enable it by adding reset_by_toprgu in dts.

Changes since v2:
 - Correct the description
Changes since v1:
 - Add more information in bindings
 - Modify some words in the commit message

Allen-KH Cheng (2):
  dt-bindings: watchdog: mtk-wdt: Add reset-by-toprgu support
  watchdog: mtk_wdt: Add reset_by_toprgu support

 .../devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml     | 6 ++++++
 drivers/watchdog/mtk_wdt.c                                 | 7 +++++++
 2 files changed, 13 insertions(+)

-- 
2.18.0


