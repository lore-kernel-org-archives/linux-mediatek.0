Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F9BD3B7DE
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Dec 2025 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZslY/w57YIKP0V/RVk3ghb2uRO3E+hID8DGKnBOyko=; b=GbAVnEdOyFVoCvB4sijggipiGq
	7OIbpr0v4Hv+b6uyrNCt3MDXskSYnW6RgTH8IihB1KZXXOKDvMwW5Iimmy8NS0tqwRKVtKxfuCb55
	II6IU6p2AfZwEx/euCzk8bfk7St5DZxo8MgAK2FidW0hEoMaNJgmBgEYpIBpCR/YeafWbc2ZFzSlR
	DoEK8JwPQ8v/75qhh7mwYHxe/GeCD2MjjmQfrKlSqr2b3/BT8jhzpz/jh6aEzyfar73EWNPs8o5eY
	jsfxksLwkQjkeR6oj33+0EaKQNal8Oo1XR6RbY+m6DmsXvAUyPNS0LQ6/fHFylxmeE+fdpYhPvfPp
	UoLPaRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZLJ-0000000D0HV-2kxQ;
	Mon, 08 Dec 2025 11:23:49 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZLH-0000000D0FX-18WG
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Dec 2025 11:23:48 +0000
Message-ID: <6af17c1e-32fc-478a-8493-6c754c3020f0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765193003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AZslY/w57YIKP0V/RVk3ghb2uRO3E+hID8DGKnBOyko=;
	b=TEEGn4kAEneIFuOzRw5wMg1cnqgB7SFPVHa6cs4XPSb4GH5HySo343N5A1sYyvFvTqrYTy
	r2/l8gNPjmiD36xIvKFCcExTvKy4FQaMcH7l2RZ+uwpSiUPOR8+rMy75j8Z9KLum6no+a+
	zEkPnTpYrcBBvxOc3tzGsPzmrLXR3jI=
Date: Mon, 8 Dec 2025 11:23:17 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] Revert "drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable"
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Linus Walleij <linusw@kernel.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Vicente Bergas <vicencb@gmail.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, stable@vger.kernel.org
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
 <20251205-drm-seq-fix-v1-1-fda68fa1b3de@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20251205-drm-seq-fix-v1-1-fda68fa1b3de@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_032347_447799_3CCC3C91 
X-CRM114-Status: GOOD (  13.12  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tomi,

Thank you for posting this series.

It makes sense to change the order in tidss _commit_tail(), than to
undo the order changes in the regressed drivers.

On 05/12/2025 09:51, Tomi Valkeinen wrote:
> This reverts commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1.
> 
> Changing the enable/disable sequence has caused regressions on multiple
> platforms: R-Car, MCDE, Rockchip. A series (see link below)  was sent to
> fix these, but it was decided that it's better to revert the original
> patch and change the enable/disable sequence only in the tidss driver.
> 
> Reverting this commit breaks tidss's DSI and OLDI outputs, which will be
> fixed in the following commits.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Link: https://lore.kernel.org/all/20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa%40kernel.org/
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> Cc: stable@vger.kernel.org # v6.17+
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |   8 +-
>  include/drm/drm_bridge.h            | 249 ++++++++++--------------------------
>  2 files changed, 70 insertions(+), 187 deletions(-)
> 

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>


