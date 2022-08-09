Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FECC19F2D
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Aug 2022 06:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOJIjDQjfep1FYaf2pRey0ZR6Sf0THykhZ6WyFBAbTU=; b=ahWeFgg+E7JX5EuQxfnBrQijXk
	JA0SktY7pMUl9eKulJDXj8s7w5AkDxzV5+cBSOHuffU29jtlt3Q/iayo1ezpQ6OJ3pxoonZ5vBbPx
	F0Ji2s+GSbrdtW9FV0CB5ClfaFdDmOlTadbBLOPERGwjb/I7FtZo11sv6hsJ90tX77cKYuCbm5Zen
	WYhEYfw3Ix4w+eHnecmZUwFxhOBTw+4jTKerO2xDoHWANVLtHkI9d2IXaJEbR4O1rruFiJIS/m5OV
	KdKgoi+F4vMd/z7Nx+UyHQP6NeH7fmNCojmP4cTzUT1nz6H1VnPRW0GmiX/yMybA+xFUZMhXXo4i4
	GUFB3BIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLIQx-001oVV-8J; Tue, 09 Aug 2022 06:09:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLIQY-001oGZ-Lf; Tue, 09 Aug 2022 06:09:28 +0000
X-UUID: f296eda510634a0b847b21f519a92434-20220808
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:4af68c8a-9278-4444-82d0-e56055d92713,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:b66b4bae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f296eda510634a0b847b21f519a92434-20220808
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 140168763; Mon, 08 Aug 2022 23:09:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 9 Aug 2022 13:58:31 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 9 Aug 2022 13:58:30 +0800
Message-ID: <1758fd4b275a21dfee31264abfa010795e927226.camel@mediatek.com>
Subject: Re: [PATCH v4 4/4] memory: mtk-smi: mt8188: Add SMI Support
From: Yong Wu <yong.wu@mediatek.com>
To: Chengci.Xu <chengci.xu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yi.kuo@mediatek.com>,
	<anthony.huang@mediatek.com>, <wendy-st.lin@mediatek.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>
Date: Tue, 9 Aug 2022 13:58:30 +0800
In-Reply-To: <20220801021851.7169-5-chengci.xu@mediatek.com>
References: <20220801021851.7169-1-chengci.xu@mediatek.com>
	 <20220801021851.7169-5-chengci.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_230918_830369_B501265F 
X-CRM114-Status: UNSURE (   7.70  )
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

On Mon, 2022-08-01 at 10:18 +0800, Chengci.Xu wrote:
> Add mt8188 smi common & larb support
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

I remembered I have given this.


