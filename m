Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A20CC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 16:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMLmRnYKe0DUjWE9KTZYR6ehi2COBaLIxPdbImhUBAk=; b=QK1lNsRyH1TTlGETiSqA4l2TYm
	ANMSw02MGS1dJI+ZIrFuvyf0CPP/hINw6XJfb1TJuQJiUdyMIQiGiLWkPjI5GixsntYb00oOp+/Qg
	CgimS4e/2zsKP6yYLwaioLoXccAymGY8CCSauj4syMYqverDOHGEq8V73FBzzBV7OcUv+bcZfyFMX
	YgBbXIxro5zKFAacXnHc9DX8wmPFVO0Pgvy6fJYMPmiMDV8WgCR0ZebQgsFrqg3UMMKoBcwAFNjU4
	ZDE0d6Gmuq91H4/+xQPOQXAaS31gs9/FcRsMyhVJd724s6x5FlvX6xgc/6HjknxSWitvU5/+rn//h
	eEOma/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAD6l-00Ebpf-Cy; Tue, 27 Dec 2022 16:47:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAD6U-00Ebg7-Pa; Tue, 27 Dec 2022 16:47:05 +0000
X-UUID: 8a766515f5ac43f88374691a40258518-20221227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BMLmRnYKe0DUjWE9KTZYR6ehi2COBaLIxPdbImhUBAk=;
	b=QO/GzbbAw4+qVjaPKCA9/GMUlhgaxwOzTMNumMtXL3xDdXD/EPTMRbhWeJD9AYUQhZ0KLqpvMBDCH55NAyXnHZXSDcysqvrfInwYz88P36/v2sShiIPhFGYMVav+P0A87qVe5jOxOOwCWe83chu29Ni0Vu3pY4C4agI+CyGzLvk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:e0d82820-b280-4a4b-adce-509150ba3879,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:e3def152-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8a766515f5ac43f88374691a40258518-20221227
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1770404086; Tue, 27 Dec 2022 09:46:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Dec 2022 00:26:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 28 Dec 2022 00:26:45 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <miles.chen@mediatek.com>
CC: <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
	<daniel@makrotopia.org>, <devicetree@vger.kernel.org>,
	<fparent@baylibre.com>, <ikjn@chromium.org>, <johnson.wang@mediatek.com>,
	<jose.exposito89@gmail.com>, <kernel@collabora.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<msp@baylibre.com>, <mturquette@baylibre.com>, <nfraprado@collabora.com>,
	<pablo.sun@mediatek.com>, <rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>,
	<ryder.lee@kernel.org>, <sam.shih@mediatek.com>, <sboyd@kernel.org>,
	<weiyi.lu@mediatek.com>, <wenst@chromium.org>, <y.oudjana@protonmail.com>,
	<yangyingliang@huawei.com>
Subject: Re: [PATCH v2 12/23] clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
Date: Wed, 28 Dec 2022 00:26:45 +0800
Message-ID: <20221227162645.18483-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221227161820.18186-1-miles.chen@mediatek.com>
References: <20221227161820.18186-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_084702_869179_C7377C8B 
X-CRM114-Status: UNSURE (   5.38  )
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

Replying for the wrong patch - this message should go to patch 12.

