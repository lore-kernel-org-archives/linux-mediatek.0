Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB734C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 10:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Ek1FsEypm+An9VTGuVnTsXpYZ7+0tcxqokX0MZZWCM=; b=LnkR4GVgmSzhCf
	cZpABDEej5MRResS8EEcZQcDUTqj/F4vH8R7uoUKokzCC9w+CdUl/mDsrhi6+fEp36lP/VZA99MFU
	HzyZzqBQjukRyp6roY4jAgMJPv04YN5BrlZ+xYe2yZPUqsnGR9hGE2XSFssQ3q4+FYSF/LSFhw820
	hocbc2u43t+UlKlGHn6ExszJI73ey1VzujVNuIrCjDXqFz8amM0RQUq7wlZ8BS8m4jTexxdXta8ce
	rtk7nQwxwnVIrVVJ59f5xFuSz6yIgE5ffT0ZbMqsCoqPCvtl2Z7IA1dha1/AiBvAFGZH6Whojr08I
	OYRqlqolS3Xx7XbIoLFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSGQl-00CUtw-Km; Thu, 10 Mar 2022 10:54:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSGPW-00CU91-3A; Thu, 10 Mar 2022 10:52:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D1F101F454CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646909564;
 bh=iaPl/wBMV7VEkkcx27N58lqaWdw70k/KuIUFajX1kAc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RILJR2YqXjGkvpAHxHrr3jwAbnum4SVrq42QjIyfd/U6mzmjVmXEwJGA3GDPB3DO4
 Jfb1HW8xJ6A3wl7fHbqrEm7YD2TsgEnlZGBjSNeyfjaHLlf29Yu4AYdPtPL73kEBPH
 +AFNY5/CqC0Ye48VGs4aa8KRAfYFVqmahs8rP9TQSzuJ9TXA8MCMqjMKGQ1Mx/K9lU
 bh+pbHvJIBw1NQQ6aZSkEd74YAket+2FFoq2/OYhuXB3zT/unQkyXk+MI261elMb9T
 1angw0DoqnGORe/su+wRIb94Pt30V/6rjLwS7lueq2PJKZ/t7nKfw4jkU1h5F5SuN+
 w4EuDulUnha8g==
Message-ID: <ab0dd83f-7630-4c2a-2d7e-14b4d7399736@collabora.com>
Date: Thu, 10 Mar 2022 11:52:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 12/22] drm/mediatek: add display merge start/stop API
 for cmdq support
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
 <20220310035515.16881-13-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-13-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_025246_341462_0C78F41D 
X-CRM114-Status: GOOD (  10.74  )
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
> Add merge start/stop API for cmdq support. The ovl_adaptor merges
> are configured with each drm plane update. Need to enable/disable
> merge with cmdq making sure all the settings taken effect in the
> same vblank.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 ++
>   drivers/gpu/drm/mediatek/mtk_disp_merge.c | 20 +++++++++++++++++---
>   2 files changed, 19 insertions(+), 3 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
