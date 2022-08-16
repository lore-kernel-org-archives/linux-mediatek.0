Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E12C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 07:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OMBvxrYpYXvQuRyN25bILzhvoPmLavCn4lFuGeOOtg0=; b=1Rn+Gwc1xcDcD/k3q6KdvX4odX
	X1mBRPxZAR5t4FCvNR5HIfH8+gH559CX/abQlegLmUI4/P+8qmUOfUZHGKM2wSjqkBo2hq2Vlvs0u
	7tgXLWSlEQqNXAEHeqRxHw4/LYW5IKrI9CLLt9+jWWcCoiz7zchEUBQMZAi4IV/MCrLZ3Dt+KCgyT
	QIPTA9uSKuYJgHyiFeYMAzbao11+HI7dMR5DkZxavbMDiIsrITAw2gS9J4dbdWVBzOMPieh/n+elK
	4wQmEDQLV04lUzzOKi7XrmVYkDIFXo7wvR2sWmwSeHSOBua6MTGr3xFm01IHctyj82MaYNQ5z/+/w
	+UwXH9eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNrOd-00Fptr-76; Tue, 16 Aug 2022 07:53:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNrOV-00Fpn2-P6; Tue, 16 Aug 2022 07:53:52 +0000
X-UUID: 9b47f5488aa94a6d86e240e11b483637-20220816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OMBvxrYpYXvQuRyN25bILzhvoPmLavCn4lFuGeOOtg0=;
	b=MaoVU48eesYRgetgqU/UI2QLGYXBqlAiL7kuoGrwcfGM1aosM5XF9jEzpbqKuV8jcnDkZbpxl4wnaaWhuMIrs1hyS7hiCGX43h61ePfCM2YYHETvIp4cY89KZH9b2IJqf9OIYhda+lxUNeEW3Ligc90rsy4XQqAcjbXWdWb3xiQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:9da09e2f-3d03-4907-a8d3-eb90fba9d07d,OB:0,L
	OB:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:5
X-CID-META: VersionHash:84eae18,CLOUDID:c5d7f2ae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9b47f5488aa94a6d86e240e11b483637-20220816
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <runyang.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2123164277; Tue, 16 Aug 2022 00:53:45 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 16 Aug 2022 14:53:40 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Aug 2022 14:53:39 +0800
From: Runyang Chen <Runyang.Chen@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<nfraprado@collabora.com>
CC: <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Runyang
 Chen <runyang.chen@mediatek.com>
Subject: [PATCH v2 0/3] Add watchdog support for MT8188 Soc
Date: Tue, 16 Aug 2022 14:53:27 +0800
Message-ID: <20220816065330.27570-1-Runyang.Chen@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_005350_591454_C2E8F3DD 
X-CRM114-Status: UNSURE (   8.77  )
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

From: Runyang Chen <runyang.chen@mediatek.com>

Based on tag: next-20220815, linux-next/master

Refer to the discussion in the link: https://patchwork.kernel.org/project/linux-mediatek/patch/20220721014845.19044-2-allen-kh.cheng@mediatek.com/
The other wdt compatible strings are unchanged.So, won't apply the series above

v2:
Revert wdt compatible for MT8188.

v1:
1. Add mt8188-resets.h to define definition of reset bits.
2. Add wdt compatible for MT8188.

Runyang Chen (3):
  dt-bindings: watchdog: Add compatible for MediaTek MT8188
  dt-bindings: reset: mt8188: add toprgu reset-controller header file
  watchdog: mediatek: mt8188: add wdt support

 .../devicetree/bindings/watchdog/mtk-wdt.txt  |  1 +
 drivers/watchdog/mtk_wdt.c                    |  6 ++++
 include/dt-bindings/reset/mt8188-resets.h     | 36 +++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt8188-resets.h

-- 
2.18.0


