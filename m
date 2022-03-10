Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC73C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GniJ+3DUMek9gxfALxl41pyYiGTDMA+RfARFZncV1L8=; b=HPjfCgozpNZPZP
	EJx7I1T/DA4oBTOT1oqFELaYpkphdvkD+WYDJK9TFQuWf423t5cjIpMFEFnsz9DkA4pHno6ZvQTl+
	bbg8hbamqPREj/lNV4+vfGOgWY5Gpu6uJJKXXeWlH49f6r+RI8w0Id733lr5UTbXaEzJJyt7AhKBN
	RuSdHzTCbjGqcekmGSCq4GyRPTNStTpKa68MfUyhbfevY5Pn3EmzIjwcRI12I2tAaYJUqi6MIbJZO
	IUxfMe0Ie75+rUJgAkSkqI6u0uWaBhL2GZVQI5HSWesIWJrrgq8dL+pMjUAzPcCqqVVnOnyQLkMLi
	oPvjowORLnH1Solzh1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSGQQ-00CUgD-Ik; Thu, 10 Mar 2022 10:53:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSGPS-00CU6l-JN; Thu, 10 Mar 2022 10:52:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 31F9C1F454C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646909561;
 bh=dwruVMKHe8Hzj+ZT1aHSQLRWF4u7URdyyePyiB1hmoY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j1F3PRLNQcQHEhimDXLzLRdU3QZPcoDHEIJoD4/sNChZVlNtrCCWY/wxyDDgvu3eQ
 uBIvRR0rBev+Jtv+Eb7Y+3hymYU+A9gnIp7lIkYnjrf8dHWrtOSfHwqs/gKtynbQTu
 Rnt5OfPv+U5hOqdt5QWKflQSciv/oSNpxmtOATeTFXC7/YtB40ZojqoDimsAptZsiU
 3Vt6eSmYBMotYjQPuRSNJqYoGLg0ThkzOM+qdvARgqdLE7yvejVp4ejoKfFZOK8IBS
 8SCp7Z3Om5TFdBvnUw9hQYcsExVV4TkuWsTEBY96mLOtLxvbJkJUEk2yJHI/TJZMJy
 ojQE0jCXKYGfg==
Message-ID: <3fa9546b-2331-e25e-7768-4bb56753ee4d@collabora.com>
Date: Thu, 10 Mar 2022 11:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 11/22] drm/mediatek: add display merge advance config
 API for MT8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-12-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-12-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_025242_825007_D578E983 
X-CRM114-Status: GOOD (  10.23  )
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

Il 10/03/22 04:55, Nancy.Lin ha scritto:
> Add merge new advance config API. The original merge API is
> mtk_ddp_comp_funcs function prototype. The API interface parameters
> cannot be modified, so add a new config API for extension. This is
> the preparation for ovl_adaptor merge control.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  3 ++
>   drivers/gpu/drm/mediatek/mtk_disp_merge.c | 52 ++++++++++++++++++++---
>   2 files changed, 48 insertions(+), 7 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
