Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0758DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 06:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmEOHQeOZK/npXE+Evlegf5GI6+Q8+0iOgrZe5ZNElY=; b=iD259wtnNV/wfO
	EETHm6Hkx16tlprGEjKpOGvrIU8Ptfw/ETm23CcTdcO20KMBnbAxHO94vAa8R1GLeUPZXoksgGDIa
	iVYQ98gomqbX/3KQoPd//ViRHbbeNzngWEj/+jKGXEElOSInkV0MhPcGrjQ4Nqkax10BLr7hFS7zL
	FVoTwAPQ0Ry7WCrKAfBP9l7Mp5Yo4HXx1KwnwxyI9LFTa1SavCH8qrX9bMuTtavlRqmKHQtcUTC0o
	GuBK39dFKtsxW3ytS8yJoVqrJMW5ozfnMYgKsayLpJFCciewd4wXHgusEdMUd2q6P3fD0nPqU0kO/
	GKTXyJbeO74GtJJVUlHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQf4-00Bru7-IG; Thu, 21 Apr 2022 06:51:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQel-00Brmg-Ux; Thu, 21 Apr 2022 06:51:13 +0000
X-UUID: 28f7527c1a814a7b949c8165ba0121de-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:eccf9c25-6c60-48be-9d18-aa0aedab9068, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:c25473f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 28f7527c1a814a7b949c8165ba0121de-20220420
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 390796042; Wed, 20 Apr 2022 23:51:08 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 23:51:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 21 Apr 2022 14:50:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Apr 2022 14:50:53 +0800
Message-ID: <82cc5e6900138e13ed9d75c6d2a42c6d7afc1959.camel@mediatek.com>
Subject: Re: [PATCH v20 2/8] soc: mediatek: add mtk-mutex support for mt8195
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
Date: Thu, 21 Apr 2022 14:50:53 +0800
In-Reply-To: <20220419094143.9561-3-jason-jh.lin@mediatek.com>
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-3-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_235112_037248_727CC29C 
X-CRM114-Status: GOOD (  14.44  )
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
> Add mtk-mutex support for mt8195 vdosys0.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Tested-by: Fei Shao <fshao@chromium.org>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 87
> ++++++++++++++++++++++++++++++--
>  1 file changed, 84 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c
> b/drivers/soc/mediatek/mtk-mutex.c
> index aaf8fc1abb43..729ee88035ed 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -17,6 +17,9 @@
>  #define MT8183_MUTEX0_MOD0			0x30
>  #define MT8183_MUTEX0_SOF0			0x2c
>  
> +#define MT8195_DISP_MUTEX0_MOD0			0x30
> +#define MT8195_DISP_MUTEX0_SOF			0x2c

This is identical to mt8183, so use mt8183 one instead of creating new
one.

Regards,
CK

> 
>  
> +static const struct mtk_mutex_data mt8195_mutex_driver_data = {
> +	.mutex_mod = mt8195_mutex_mod,
> +	.mutex_sof = mt8195_mutex_sof,
> +	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
> +};
> +
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
