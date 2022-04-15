Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2A0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 10:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B39b7bBk7I4TYM2oC/OaTp/T77Czsr3En1nCiAmaALc=; b=c/d4dQ3zWvrbtO
	AdnruS5dnVKRVy+8tsZ8vMe+vClgXTpAufF+HUKEp8FlOsD4TkiKZhQHCyepjJ699FDO4kSdpTIns
	B07enj503Ab1HMzbaYcwKvQ0EjueIUhzM4batmBYEvAvWHZyD9oeBlkS6Dz4ZVTjuzyKzKvhZtsxo
	q14eapaJdBqYrwH2vcPpgbrRWpT2WJITyUz6/Ej+oHgxWVbmW94W/crUVRSLlrTfKFQhMkU6lrnQQ
	QDvnPDBi/IwjdYJTBMg8VmWU9psEqoHkaG1BoGBilhK0lCQt2xJRR2YR5K++VHqEhP1nUUTIBclA5
	qy+2k0DqHN5d0XQgiCBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfJ2j-009b6b-PD; Fri, 15 Apr 2022 10:19:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfJ2R-009awc-OR; Fri, 15 Apr 2022 10:18:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1DA451F42643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650017926;
 bh=3nskTfZWuZt2VYfDTgr6VDBD1IupgXRqxVExf8eBPqo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oWz+8ZzASpEwN75z0H5uTPpshi0t04pw3CFLlWv3acCqEWSpUSoH7nX85QJ4TqtRM
 PzcmmKGeHS61PhbSXOASlYe5hww5Bi5We9/cBVcKomj3w3u4KTGLt1RMZoNG63lxKl
 +e1hY8vl9k11L0lCKQ2HyfQ3lufxPGQvnL/lCGTIwq41qjxZM7uwbObthIF3gr7Sab
 mlQmyaiGM4dPvttuniDtFW0QSGSTiECAiRMGA0qVbJd+8mqF/J/Ys3SK5dMt6LpUd1
 TOsvvEWwjJcYF2ni97/d/01YrjCZSKa/NXLEL4uqZodTqNHBJnWwjS8yX2/EXKKKML
 SuX82+wPvJBEA==
Message-ID: <3a905d21-26a7-654f-4ab7-7ad1fa1376c6@collabora.com>
Date: Fri, 15 Apr 2022 12:18:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v19 03/10] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: CK Hu <ck.hu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220415083911.5186-1-jason-jh.lin@mediatek.com>
 <20220415083911.5186-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415083911.5186-4-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_031851_954443_56017A42 
X-CRM114-Status: GOOD (  17.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 15/04/22 10:39, jason-jh.lin ha scritto:
> 1. Add mt8195 mmsys compatible for 2 vdosys.
> 2. Add io_start into each driver data of mt8195 vdosys.
> 3. Add get match data function to identify mmsys by io_start.
> 4. Add mt8195 routing table settings of vdosys0.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

Unless anyone wants this commit to be split in two, one for the match data
and one for the mt8195 addition, it looks almost good to me, apart one small
change that has to be done, check below:


> --- >   drivers/soc/mediatek/mt8195-mmsys.h    | 370 +++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c       | 152 +++++++++-
>   drivers/soc/mediatek/mtk-mmsys.h       |   6 +
>   include/linux/soc/mediatek/mtk-mmsys.h |  11 +
>   4 files changed, 528 insertions(+), 11 deletions(-)
>   create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 

..snip..

> diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
> index 77f37f8c715b..21cf300ba864 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -87,12 +87,18 @@ struct mtk_mmsys_routes {
>   };
>   
>   struct mtk_mmsys_driver_data {
> +	const u32 io_start;

I agree with you that this iostart is in 32bits boundaries, and that this will
practically never change... and I was in doubt whether this would be acceptable
or not, because of saving some memory.

Even though I would really love to have the savings, in order to avoid having any
"surprises" in the future (any future breakage for "reasons"), we shall comply
with the kernel types, so, this has to be...

	const resource_size_t io_start;

...and this is the same for both this file and mtk_drm_drv.h, which you modify in
patch 07/10.

After fixing that:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
