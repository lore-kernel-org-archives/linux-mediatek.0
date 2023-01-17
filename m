Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D90C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 03:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=izQlGGt5FZNdfcVfV+ZwBHdU6OcNmPO68g0341IO2+8=; b=PMONrqwdNGbJDhTHqM6sNQjMd4
	wdd1V2AzEmqs8lTBCX09GmHHxLzUirz2AqYAiKtjU88c73f/jE0mwin/lIR9kFWu1VbWsh6S+itjM
	Jwcep3G7DvD5ifCRbS2yfRYbaPIWzefikBXkxtTcyhAH9KEkTEpA6i0U0WF3t7YFmPCzI9PlU0xfd
	qGWEl7UqJpmYRuUI1TSrowNPNV8VlpXsoKmnilGWtgq3SmSVuUbfYtEyyL8zSvQsML7wkcHJMifye
	QmUleRq+puB0BR1oOlcvN3MOhLyJN9888P5i75niJD/k+N98QmOi+WL8lo4Yjn3CtXQyKVNTWVJZd
	glkge3nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHcco-00CjAc-U1; Tue, 17 Jan 2023 03:27:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHccm-00Cj8g-0d; Tue, 17 Jan 2023 03:27:01 +0000
X-UUID: c694a3f6961611edbbe3f76fe852e059-20230116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=izQlGGt5FZNdfcVfV+ZwBHdU6OcNmPO68g0341IO2+8=;
	b=SoRcV3od8EP2fURNxss6x4Gp0BRiIIkz9oTyZO12VbCuSAN5lovjUcCx5YoEoY83rJtzF8VjdOkN5MvRy5lBh5ceHfCH9EXhIjQBAhK8psIf5U5B8Y41TLcEbjxQQ5t3whVDGzS1ICRsuxy/+wkdr1VR4AIdvPyXcAONObomeWo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:345db0f2-1eb1-40f1-8d18-f8df9e9e9f6c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.18,REQID:345db0f2-1eb1-40f1-8d18-f8df9e9e9f6c,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:3ca2d6b,CLOUDID:174102f6-ff42-4fb0-b929-626456a83c14,B
	ulkID:2301171126499V0JQC4D,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0
X-CID-BVR: 0
X-UUID: c694a3f6961611edbbe3f76fe852e059-20230116
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1593815966; Mon, 16 Jan 2023 20:26:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 17 Jan 2023 11:26:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 17 Jan 2023 11:26:45 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo i Serra
	<enric.balletbo@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH 0/2] mediatek: pm-domains: Add buck isolation setting support
Date: Tue, 17 Jan 2023 11:26:38 +0800
Message-ID: <20230117032640.13504-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_192700_233356_5BE7FF3A 
X-CRM114-Status: UNSURE (   8.98  )
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

We send a independent series from [1].
Add buck isolation setting support for the specific power pm-domains (mtcmos)
in some chipsets, such as ADSP in MT8192 and CAM_VCORE in MT8188.

Changes since [1]:
 - Add the conditional for ext_buck_iso_offs

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=706103

Allen-KH Cheng (2):
  soc: mediatek: pm-domains: Add buck isolation offset and mask to power
    domain data
  soc: mediatek: pm-domains: Add buck isolation setting in power domain

 drivers/soc/mediatek/mtk-pm-domains.c | 8 ++++++++
 drivers/soc/mediatek/mtk-pm-domains.h | 5 +++++
 2 files changed, 13 insertions(+)

-- 
2.18.0


