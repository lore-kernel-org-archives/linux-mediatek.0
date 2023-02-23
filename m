Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37502C636D7
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 07:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+jFOqkoYWqSw1+0qeqxfa36Agj3gFvwn7anPXsJz5Q=; b=B13NuiB+gxfd9CBQBcfikygd5/
	EfDeDqdFVxY2dk6GFOXT3Ymkh8RLUrtfOX79w1bvTPCji+0vPI4ELffxZAX62nA/r8cygF9CTuK9U
	0Nvalo3um1A5YksmqkOQ6FTFReqACH1ikBfl+XVIyuGNGqmVD533qCdE2nhQIWbBEYEhCFsgXF3Je
	6rUI46ndv7zYOvTgBmoMbz2O3/KiFYDaoBpF4e4/mgmZNZW9dMwRsKRI0ibY8ZnPjrHVDlvweFkxe
	kdrwdGowDTJoBnCxbQeiKhFzl0Id9idDQdL0JvfNM8O2AROx+5SUFqxXhuO0bL2Jd638sGYgOcbqz
	E6vfVnUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV5oP-00FNqb-Le; Thu, 23 Feb 2023 07:14:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV5oK-00FNpV-RL; Thu, 23 Feb 2023 07:14:38 +0000
X-UUID: b76b7a26b34911edbbe3f76fe852e059-20230223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=f+jFOqkoYWqSw1+0qeqxfa36Agj3gFvwn7anPXsJz5Q=;
	b=NSnejEHK+VCv84h5IxK3Fb4UvsDXB8MNqgX0YW2dLd1RxLGi1mpegpbk6fkGEbWOD1nNPfmBF9kiOqJFE8IBE/bBWWEaE1u9FEoJQAfef6vUb1DjmwL6tLQbmeYrfkyN3fd/JlWnXRvrf6RkCDrBxZREgn/+nKPyHN7je+I50QY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:c13def2b-a807-4d42-b7b7-eb68aac4e5c4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:a35be4f3-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 1,FCT|NGT
X-UUID: b76b7a26b34911edbbe3f76fe852e059-20230223
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1960779787; Thu, 23 Feb 2023 00:14:30 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 23 Feb 2023 15:13:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 23 Feb 2023 15:13:59 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <chen.zhong@mediatek.com>, <chun-jie.chen@mediatek.com>,
	<daniel@makrotopia.org>, <edward-jw.yang@mediatek.com>,
	<fparent@baylibre.com>, <granquet@baylibre.com>, <johnson.wang@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <miles.chen@mediatek.com>, <msp@baylibre.com>,
	<mturquette@baylibre.com>, <nfraprado@collabora.com>,
	<pablo.sun@mediatek.com>, <rex-bc.chen@mediatek.com>,
	<sam.shih@mediatek.com>, <sboyd@kernel.org>, <sean.wang@mediatek.com>,
	<wenst@chromium.org>, <yangyingliang@huawei.com>, <zhaojh329@gmail.com>
Subject: Re: [PATCH v5 49/54] clk: mediatek: Add MODULE_DEVICE_TABLE() where appropriate
Date: Thu, 23 Feb 2023 15:13:59 +0800
Message-ID: <20230223071359.14962-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230222092543.19187-50-angelogioacchino.delregno@collabora.com>
References: <20230222092543.19187-50-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_231436_910949_DB5D9928 
X-CRM114-Status: UNSURE (   6.37  )
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

> Add a MODULE_DEVICE_TABLE() on all clocks that can be built as modules
> to allow auto-load at boot.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Miles Chen <miles.chen@mediatek.com>
>

update

ARCH=arm64 allmodconfig build pass

thanks,
Miles

