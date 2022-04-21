Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92378C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xK+J/stDOUVUfRo66S1FsVSGn3aegXdC5LJE5LH5z10=; b=u5Y/Tl9jZm+VdH
	DE8XDo+mW37a177g5o8KO8VTPRcLwPEE8Qwhkv3dQKurRnGocA493P19qPcjPn9+CX2zW6PAy+K4q
	8c9uFKShWkkZdVudqAReA8gxNjozpozt1fFW27s8qzWmM4BEFlFzhzYF1x4BzYm47p0dbjGow9c3B
	BcpRPbHOwdQOd5yRNnVDOV9Z58ui97tLYjqROciZe3moc74knhtln6z87KlAnzuDSpd7ST2Mnqd1x
	NBMXpITq3KFqz1KymRuZDE+m6tr7DdVaSsJ6mU2nDv/UBTwY1HJrPtqhzLUv6ghwuzY9VygGljQsI
	svW++CQSIJ/9PbpkCCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQXP-00Bo6A-Mg; Thu, 21 Apr 2022 06:43:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQWv-00BnnR-G2; Thu, 21 Apr 2022 06:43:07 +0000
X-UUID: 1a3d42750ba94253a704e23e5aaca26b-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:08255614-f731-448a-8d63-0d99acae8c9b, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:9e0b73f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 1a3d42750ba94253a704e23e5aaca26b-20220420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1956585826; Wed, 20 Apr 2022 23:42:57 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 23:32:55 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 21 Apr 2022 14:32:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Apr 2022 14:32:42 +0800
Message-ID: <375dda13802f6212f7e90a4373a3945a3089b4d2.camel@mediatek.com>
Subject: Re: [PATCH v20 1/8] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 21 Apr 2022 14:32:42 +0800
In-Reply-To: <20220419094143.9561-2-jason-jh.lin@mediatek.com>
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-2-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_234305_566330_4F571348 
X-CRM114-Status: GOOD (  11.43  )
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

Hi, Jason:

On Tue, 2022-04-19 at 17:41 +0800, jason-jh.lin wrote:
> 1. Add mt8195 mmsys compatible for 2 vdosys.
> 2. Add io_start into each driver data of mt8195 vdosys.
> 3. Add get match data function to identify mmsys by io_start.
> 4. Add mt8195 routing table settings of vdosys0.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
> Based on series [1]
> 
> [1] MediaTek MT8195 display binding
> - 
> https://patchwork.ozlabs.org/project/devicetree-bindings/list/?series=295669
> ---
>  drivers/soc/mediatek/mt8195-mmsys.h    | 370
> +++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       | 152 +++++++++-
>  drivers/soc/mediatek/mtk-mmsys.h       |   6 +
>  include/linux/soc/mediatek/mtk-mmsys.h |  11 +
>  4 files changed, 528 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
