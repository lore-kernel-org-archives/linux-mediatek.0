Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B89C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=seYV3C8Dg1QZLzzywpS7YgMSqaxf2KUUMYOySZTCuS8=; b=DJ0Q/E2wPqyQdh
	i6fbnKHQyXqz6J6SAlZA55U3m80/w9sEvBa+gNAYnPCBpFexwcjBqczL0ODTPSXuY3gh6uYikKhJq
	O9utX3OVmi/E9DwN0EQlDx9R7v3RRmtxMpjGQxEN1AKfK12hXJiLjU13dBMF8bNC9r6gxWSjB94O7
	CLna6VPa5dK+8uCbwhweVsna9w50SMcS6ImBdpCiknDV7wDnxgABRTpGB/QNYRnrBjeCdURx9s3LT
	5e9koHWtJh8NFLQCpv4h/rqjQGCZrT2NLu+xMre59wEg3CRTkHgjlXhXWX/hCBXFMUu+t8tTNvdtK
	EvkeB1dUqnDZcc7Xb68g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np6Hl-00BQ6e-93; Thu, 12 May 2022 10:43:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np6Hj-00BQ62-5D; Thu, 12 May 2022 10:43:08 +0000
X-UUID: d6098e53e08f40409b7291065b1aadd4-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:a00f88df-527e-4edf-aca0-28ad191318e8, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:4f740fa7-eab7-4b74-a74d-5359964535a9,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: d6098e53e08f40409b7291065b1aadd4-20220512
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 328216249; Thu, 12 May 2022 03:43:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 03:33:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 12 May 2022 18:32:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 May 2022 18:32:58 +0800
Message-ID: <e99b73e850780a104cf053e5e76bfd19256fc2a4.camel@mediatek.com>
Subject: Re: [PATCH v18 6/6] soc: mediatek: mutex: add functions that
 operate registers by CMDQ
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
Date: Thu, 12 May 2022 18:32:58 +0800
In-Reply-To: <20220512084139.15086-7-moudy.ho@mediatek.com>
References: <20220512084139.15086-1-moudy.ho@mediatek.com>
 <20220512084139.15086-7-moudy.ho@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_034307_242778_C16DD16B 
X-CRM114-Status: GOOD (  11.19  )
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
> Due to HW limitations, MDP3 is necessary to enable MUTEX in each
> frame
> for SOF triggering and cooperate with CMDQ control to reduce the
> amount
> of interrupts generated(also, reduce frame latency).
> 
> In response to the above situation, a new interface
> "mtk_mutex_enable_by_cmdq" has been added to achieve the purpose.
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
