Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEACC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 10:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Ihv54qrn82lNnQeZqCeHozZrEPO2lTra8GZjAk6kPE=; b=O0ctyq8wL2F4EX
	p4y7FKjay2JhirjjW2RSkqDR3PRpw0JN+aejSq7FNKs3q9oZy33QU4KQ1pfsNZNw34qHYepoc/JGB
	8YmaJNRK1TyMBV1dUC434yJMJe/SuQgSp/tXi98LHKa4PERRuwCnbxdExz/oIeiALLdc53lhTdXAG
	PpuPCJIO/PR/8pAmXoB3Nw3DAd25Nrt1kpn+p+96aKZ5jqUtBSxwgwzdcEGEY77t+NQC98pCno5Y6
	bGu5xnxyFH/z9BAQ6wFREw1WG3l3PwSHPp6exzRdx+oigx1utNT6ETZlx6/uQA1U8X0HG0XoecNFV
	ZiwipIzg0mqldNH/hm0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np6F0-00BPlv-NJ; Thu, 12 May 2022 10:40:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np6Ex-00BPl3-Qt; Thu, 12 May 2022 10:40:17 +0000
X-UUID: b46b03d9a0e04a7da3759121b33630af-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:31c8f43d-9341-42ce-aa87-f3b40459a82d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:555f0fa7-eab7-4b74-a74d-5359964535a9,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: b46b03d9a0e04a7da3759121b33630af-20220512
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2020819823; Thu, 12 May 2022 03:40:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 03:30:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 12 May 2022 18:30:05 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 May 2022 18:30:05 +0800
Message-ID: <694b90f3d95d6e029d343d98e84c888ddf4eb855.camel@mediatek.com>
Subject: Re: [PATCH v18 1/6] soc: mediatek: mutex: add common interface for
 modules setting
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Moudy Ho <moudy.ho@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Alexandre Courbot
 <acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
 <pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
 <randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <cellopoint.kai@gmail.com>
Date: Thu, 12 May 2022 18:30:05 +0800
In-Reply-To: <20220512084139.15086-2-moudy.ho@mediatek.com>
References: <20220512084139.15086-1-moudy.ho@mediatek.com>
 <20220512084139.15086-2-moudy.ho@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_034015_905562_F78156A9 
X-CRM114-Status: GOOD (  11.82  )
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

On Thu, 2022-05-12 at 16:41 +0800, Moudy Ho wrote:
> In order to allow multiple modules to operate MUTEX hardware through
> a common interfrace, a flexible index "mtk_mutex_table_index" needs
> to
> be added to replace original component ID so that like DDP and MDP
> can add their own MUTEX table settings independently.
> 
> In addition, 4 generic interface "mtk_mutex_set_mod",
> "mtk_mutex_set_sof",
> "mtk_mutex_clear_mod" and "mtk_mutex_clear_sof" have been added,
> which is
> expected to replace the "mtk_mutex_add_comp" and
> "mtk_mutex_remove_comp"
> pair originally dedicated to DDP in the future.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
