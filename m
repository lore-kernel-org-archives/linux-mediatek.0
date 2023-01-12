Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403B6C54EBC
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 08:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a5HuUiTpabxEB8ZknlEA22SGE1hlxv7QqumQwbvQEvk=; b=wy4eaHaPHmwYGCglyPiz3oySVr
	VCb90GhS9/fAB+C99Q//IzcnrIukQULH37O46Om7/Ndvc34p95Q5rCJGS2nMQY9kogFKICFbZ5ZiU
	QGdgwFPlCi7CJy31gu706UiMQMgKdhJVQSA2YVrfqacBuncdX+Pvtol9XRPNjVkoKFoXNMtwxx4vU
	RKTnKB1i8g6rXuS5tZBbp2FuT34q/6fxaX145PWWVEtya+Ek4QJkCeO6UCvzu0Wd3g6Fth/iDl7/4
	EBbhPpjjs0q6MdZ8ptwVpHPtliAyBoVbP/vyP3cL6vAjCMkthZwZNWq6n17ROjS1/mFTyKApy9tX2
	frnmzPtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtE0-00EBwl-Tr; Thu, 12 Jan 2023 08:46:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtDz-00EBvx-FM; Thu, 12 Jan 2023 08:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=a5HuUiTpabxEB8ZknlEA22SGE1hlxv7QqumQwbvQEvk=; b=pEuilotXbedmV1U/m39scjr37F
	BD1d387hdfV5/gL4ieQiLbuPuw18BRgUXl5zQ7LCZLogbuNWL6XQAx9UEakbIr7vXzPjz06z9BAxf
	hBwW9tppA/VoISguhesLEwmMf2moGBGZ3rU7ziheUyAUejvRu0BfjroMfgImSxb7grv8gHRf7zTsH
	YB43gOa9/4Hitzh+QWHtkucDnyj7NsibLMUPfmxs1o+xvz0/QC6NoCgFrTiGmZwm6RfhaTB/uOXlp
	hy7+RNCITuCM9uufDOVzpRfVeHAd2/5Vn2u/ZZro48gwUaqkXo4rqmoottGiGFrotB4CYQHH6LX7d
	vGNHctNQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFtDh-003x8N-1j;
	Thu, 12 Jan 2023 08:46:04 +0000
X-UUID: 7e4704a0925511edbbe3f76fe852e059-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=a5HuUiTpabxEB8ZknlEA22SGE1hlxv7QqumQwbvQEvk=;
	b=t5ev90q0/z/xQs2nY2A++rv8NYxurHPTdvyIdkO/WJLPlkNSy0FQcRyVGxOqeNlAnSfSugU5cfDnmQWQrdv8LkFeG6qHLDnebNrd/fYyFkIVlUdvEsZkXnY25Sza0BU/x4R8tHDD2NTShNN5fogSwh4fXy5hVHElax64xyIUTRg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:ebc06ceb-dab4-4a48-b6bd-cc7e39c59952,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:2b399df5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 7e4704a0925511edbbe3f76fe852e059-20230112
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1090998510; Thu, 12 Jan 2023 01:45:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 12 Jan 2023 16:45:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 12 Jan 2023 16:45:04 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, Irui Wang
	<irui.wang@mediatek.com>
Subject: [V1,0/2] Add jpeg enc & dec device node for MT8195
Date: Thu, 12 Jan 2023 16:45:01 +0800
Message-ID: <20230112084503.4277-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_084600_252328_1526D364 
X-CRM114-Status: UNSURE (   8.91  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

This series add jpeg enc and dec device node to dts file
for the purpose of supporting multi hardwares jpeg
enc & dec of MT8195.

This series has been tested with MT8195 Gstreamer.
Encoding and decoding worked for this chip.

Patches 1 Adds jpeg encoder device node for mt8195.

Patches 2 Adds jpeg decoder device node for mt8195.

kyrie wu (2):
  arm64: dts: mt8195: add jpeg encode device node
  arm64: dts: mt8195: add jpeg decode device node

 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 100 +++++++++++++++++++++++
 1 file changed, 100 insertions(+)

-- 
2.18.0


