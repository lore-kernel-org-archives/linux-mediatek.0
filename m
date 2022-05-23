Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E799EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmdG8hvaE2s/2YlrRE/svqEAZcFdjM5+mGaxLX7CVMQ=; b=n4KsqIsus67bOz
	+Rvppm7metTkh2U2zsr6O5qPbq9KIf7DKPTELNZuX2nwfJ+tPdg7sV2g44lFSOCiUIrB8tNywaN/c
	4hatXyk+XPiMAqEVe5tkLOazK8bQ0Gir9PgpdKSxiZGggkTdpAzH1a3Ttt4aIZg3X7cC+HWCHFzog
	aG3O85MTBtSVz/dBsZZB/1RwyqszCHaO+LJNT+ypwmf8aclamG9DyKmC/SvEnzvUqXOZeDc5Y/PQK
	6ipF5BMMpedsV7C4IuEFfazwu1YiC1n3Z7A49Q6cITf5bQqktXY+x6gKopCxPJOIjOwcI8W9C4hhy
	1xLjixkvIfAN5VnK6EYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt68o-003etz-2E; Mon, 23 May 2022 11:22:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5Op-003ICQ-6q; Mon, 23 May 2022 10:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=8lOqa/U0iFZJZQRNdd6qSOqIGzqgaiyfkqFSIzGSEUY=; b=QxtwxnURxFp4Om6xJGfBnGr603
 yMs8ZEE4TNXA7WdAUQ8nswCcCbqLVJYbKyCVjOd+wteiJ5tqaWq+gGHIH6Mzf24ZH5eoPb6+dxAME
 cU14JfSw0IccrzQqXi3Rbu1bR1vherWvF1mnLqpBrN4hytob4xoRUvFttbtrWuBlmcmIuzon34da2
 lxEU/V/Tg2YZj8uVy0osRMke+cfWQLSjWwyj/Yxv/1jgtCaGcOTsPxrAWs8QS0MWkxB4+J8wfqSYT
 vRoC/rbj3BTWqAWfaYYePcFnZN8qFMAeXSuJeX1DCsAkiK+a2vPKeYemRhNq6ZrOiSDm8pcn3gkF/
 es+XP1LA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5Og-0011Mu-DZ; Mon, 23 May 2022 10:34:50 +0000
X-UUID: cf89804a35a648208611da97dfb03eb3-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:1fb87a92-4261-44fd-b758-da8c962361d3, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:35043ae3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: cf89804a35a648208611da97dfb03eb3-20220523
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1389118437; Mon, 23 May 2022 03:34:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 03:34:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 18:34:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 May 2022 18:34:34 +0800
Message-ID: <cfc1799482e74c6610993773eb7ee2ec056c6787.camel@mediatek.com>
Subject: Re: [PATCH v9 2/2] phy: mediatek: Add PCIe PHY driver
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, "Vinod
 Koul" <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
CC: Wei-Shun Chang <weishunc@google.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <randy.wu@mediatek.com>,
 <jieyy.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <qizhong.cheng@mediatek.com>, <jian.yang@mediatek.com>
Date: Mon, 23 May 2022 18:34:34 +0800
In-Reply-To: <20220520064920.27313-3-jianjun.wang@mediatek.com>
References: <20220520064920.27313-1-jianjun.wang@mediatek.com>
 <20220520064920.27313-3-jianjun.wang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_113447_448452_3F63FEDF 
X-CRM114-Status: UNSURE (   8.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2022-05-20 at 14:49 +0800, Jianjun Wang wrote:
> Add PCIe GEN3 PHY driver support on MediaTek chipsets.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  drivers/phy/mediatek/Kconfig        |  11 ++
>  drivers/phy/mediatek/Makefile       |   1 +
>  drivers/phy/mediatek/phy-mtk-pcie.c | 267
> ++++++++++++++++++++++++++++

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
