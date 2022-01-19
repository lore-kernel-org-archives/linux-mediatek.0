Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24391C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 11:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Varj1dpJvpOVp/aknjGrxC1VZIgltKV8CEAJ3efso/8=; b=t/XebwvQkSu1PC5IySLgQlRCMz
	1qSIIjiRkNH0VGaIodzCVqps57gVeHxXUh/9F1w3xYgSgLWBCMXR8+K08x1StMuouVCYLN20b4Ecs
	MOZBAAcurI/JU7Pr4tNaTilva7Of2S3I8Ioi+riZpAn+T9N2wex8nNO7AfpWbTtmFjHkVp2/vtVBh
	KG5X8EQVc92b/dVNadS2u9BAIdTWwj6ihChfb/Cgta/HLbmy/OiciFXYwE7FGG5a6SsyOUueWgxaZ
	zX3w1j6FzebwaxD1LxjUvzhfXsg2/RaypJad90jCoYKRj/RNWBfJUbHJ3r+Bvuye5/qGd6ynqG9Mc
	XWxGbYqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA98p-0059ar-Hq; Wed, 19 Jan 2022 11:28:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA98S-0059Tl-NS; Wed, 19 Jan 2022 11:28:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BB5251F42FBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642591694;
 bh=lb7PPlcJ+GrMTYv/gT1LuwvO/b872pTbvdtVBiWTWtY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FI84BMt5ymarsviUxIfVek2WSCGHenxzSp/V9xEAzp/naQnjWaEE+ph6KJ6URxnyD
 RjALW9mRrRtOVSDRt2UCx+WddhsLIP0AuL8h9bhZ7eTRkJIiGQJzVm1Dsq6uWiqkCH
 qUaCGhR4O6thcK62LABbAbE+uuRBLPvny0QyHADtXFHau/npGxjNZtqUEBGoouI7Xe
 oPsRthgEao7In+tmmKBXwvRYEcs/s1dET5oae7hb4/rfuEvWI4nMFw1IwEeFsm8hyv
 uFxBBCN76vlf16ErqiU2bk7H2nOiPSZb/GkltZyqWBqdeqmuEOO09BOM3Jqb2DkrI/
 yvOQqSY7fAr0g==
Subject: Re: [PATCH v5, 15/15] media: mtk-vcodec: support stateless VP9
 decoding
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220117094001.20049-1-yunfei.dong@mediatek.com>
 <20220117094001.20049-16-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <275affff-12d9-4659-e900-aa9c306e6701@collabora.com>
Date: Wed, 19 Jan 2022 12:28:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220117094001.20049-16-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_032816_987347_2F4B2614 
X-CRM114-Status: GOOD (  14.80  )
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

Il 17/01/22 10:40, Yunfei Dong ha scritto:
> Add support for VP9 decoding using the stateless API,
> as supported by MT8192. And the drivers is lat and core architecture.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: George Sun <george.sun@mediatek.com>
> ---
>   drivers/media/platform/mtk-vcodec/Makefile    |    1 +
>   .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |   26 +-
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |    1 +
>   .../mtk-vcodec/vdec/vdec_vp9_req_lat_if.c     | 1973 +++++++++++++++++
>   .../media/platform/mtk-vcodec/vdec_drv_if.c   |    4 +
>   .../media/platform/mtk-vcodec/vdec_drv_if.h   |    1 +
>   6 files changed, 2003 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c
> 

Hello Yunfei,
this driver is based on an older version of the VP9 stateless decoder uAPI,
hence this is not applicable upstream.

The latest linux-next tag (as of today) already contains the new and
accepted code; can you please rebase over that one?

Thanks,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
