Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97987C63797
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 10:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sZJQzJf1FPzCYsFNTrXsae7EJN3wjmK6a7W2GJN6E28=; b=V4cWPNOEt5yq8pttoiPhN+dEhh
	FOS5JhC94DFBpsH0XCgc+T2xy4T9D69aVND2zbbotM4spJU2u7BUSa/u6IlE1ze/O45bpMsBhJRbD
	L4CNIzzt8P5Q/kp/mL/ikXXoB7hT8q3hOlzMT2yztiu9bJ+owCr4Boss2dYSI0ChvOJrKuqVz/YKI
	9OMooqKLLUEdsAIM9iGaQlBaWCZeK5SkfueS4+4FWuTRYGOKC7aTzwojFfNqjUGny/kiG9HXT2K1h
	zsfSXl5ZG57LlvaBa3N7M0Nc2PjTj1Ci3WVPEZpQKeBDcqIGshnMZq6Xlcoufj7lML/3YoLfJffQx
	81E8ynjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHN7p-009n02-1v; Mon, 16 Jan 2023 10:54:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHN7c-009mtV-8V; Mon, 16 Jan 2023 10:53:49 +0000
X-UUID: 08eace1e958c11edbbe3f76fe852e059-20230116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sZJQzJf1FPzCYsFNTrXsae7EJN3wjmK6a7W2GJN6E28=;
	b=bR/946DmFnl8g2XdGXwf+h3mQiQ4vPCW8N9EaO/Gn0T3OYB/6hO0s0wt2dQ9Cs1qvRQqObuc7HohzrlRYfu6IV3nyWDJyD3ZJy98/cqKjpehLWGBNXgUS5WE8njbwoMyyvG+rUU2Bjv/KQiO9Q4aBsi6/jqO49fj7ob1ljO52Bk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:37a2a28b-ac8c-4f20-b764-a454fc58c624,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.18,REQID:37a2a28b-ac8c-4f20-b764-a454fc58c624,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:3ca2d6b,CLOUDID:de99638c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:230116185310DZXA5TCP,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0
X-CID-BVR: 0
X-UUID: 08eace1e958c11edbbe3f76fe852e059-20230116
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 685423915; Mon, 16 Jan 2023 03:53:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 16 Jan 2023 18:53:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 16 Jan 2023 18:53:06 +0800
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
Subject: [PATCH v2 0/2] mtk-wdt: Add reset-by-toprgu support
Date: Mon, 16 Jan 2023 18:53:03 +0800
Message-ID: <20230116105305.31818-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_025348_366652_D2CA4925 
X-CRM114-Status: UNSURE (   9.49  )
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

This series is based on next-20230116.

In some cases, we may need toprgu to reset the wdt timer after system
resets.

Provide a reset_by_toprgu parameter for configuration. We can disable
or enable it by adding reset_by_toprgu in dts.

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


