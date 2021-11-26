Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165FDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wop1zY6iSX2lNS80iYjgeGh8XwwRfzCIqFy4oRyEhI8=; b=NppaVwIj7IEeo5CVG/l5d1HSL/
	IwIl+BG9fnzCi4Mjdm8cS3LgK2Kl2TEgL0WASOMkkoVOLf2n4vv3xIspj6Dqs0uLV7/C2u1vRKMwa
	arKWUUxjlvzddWcp4yJ3cYEpypXGmgU8il4ovPFwvF9EbpdWLlBmdk0PVN6Q/ZElml0WfE/oFw3ep
	U7+PO/Ct+0AUiBFm4KkDSUf7KamFgYRmMWvKwNNQ3VYtMersztcjew8HDKGSrtox5ytYcSNNZFd/q
	MNqr9jqduTjeMDf/mStqu0+k2uT6/+JADkYLIDf8quzitvsV19ob3gfQ6sExaxsHZZLsr756P74Jx
	IvzIBysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqYOB-009zM2-UU; Fri, 26 Nov 2021 10:23:31 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqYNn-009zBd-7g; Fri, 26 Nov 2021 10:23:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3C2961F46711
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637922183; bh=tC0SyAbEYha2W5DuJX/94Auu6fwRk+YS3BdMTsOqCdQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UxZ/ODblNQq6rPMmMzGLyqXXC0AE0V/nQ+htGUUpwUEQH0D779nSlUlFsHQNi307j
 juPEvS65RPTmfd/UjwP/UH8YE8coYc2sIJxyqdvF8pIjNOCHzKrkxn0jCmZ0WAFP+e
 e7UwH6W89PnouveUvnuxq1Tf/qdVrWOmAuxVbR/j3nroA1nkkERAE8fvQZKoxygEVk
 SVhFI2B9T2F4rGPmrgf7dj7j0bcplou6T7frX3lZjBvzriKau62r6WhbtLoFVct5vZ
 Wb9bNsUUWpigBdW2bqk6rMKPiCthm6xxEUH4rrYvi6SrfNChFgKfA4B3FpGsdSmgee
 VO72zcFnUhEEQ==
Subject: Re: [PATCH v6 5/7] drm/mediatek: dpi: Add dpintf support
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-6-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <d7e5e360-0a0e-344e-0c96-8209403aad88@collabora.com>
Date: Fri, 26 Nov 2021 11:23:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110130623.20553-6-granquet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_022307_452502_EC9BCA4A 
X-CRM114-Status: GOOD (  20.62  )
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

Il 10/11/21 14:06, Guillaume Ranquet ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> dpintf is the displayport interface hardware unit. This unit is similar
> to dpi and can reuse most of the code.
> 
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>   - Some features/functional components are not available for dpintf
>     which are now excluded from code execution once is_dpintf is set
>   - dpintf can and needs to choose between different clockdividers based
>     on the clockspeed. This is done by choosing a different clock parent.
>   - There are two additional clocks that need to be managed. These are
>     only set for dpintf and will be set to NULL if not supplied. The
>     clk_* calls handle these as normal clocks then.
>   - Some register contents differ slightly between the two components. To
>     work around this I added register bits/masks with a DPINTF_ prefix
>     and use them where different.
> 
> Based on a separate driver for dpintf created by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>


Hello Guillaume, Markus



Strictly speaking about functionality, the entire series is totally fine,

however, I cannot give you a R-b on patches 6 and 7, since this code should

*really* make use of phy_get(), like suggested by Vinod.



In any case, for this patch:



Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
