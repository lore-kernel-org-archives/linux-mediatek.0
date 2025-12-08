Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB078D3B7E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Dec 2025 11:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KS9+fkJURzUJE1mmvUiBXK04jhbhsrgQmnTnkE10avY=; b=TN2hgJNiYh5PJRpUWrFQRF5cE9
	UfUrGh3a+ffeuzn7BaXYkPHD2sS1eXdE3oOhClmlQkmG0Ke3kNeKbjVRyJUF+xNTnZeEccvVMiRre
	soez4cfUPhKWn7LpuiEU2S/xAxVNql4cbwtxynFiPwxBjQyy5mNU5iAu3AIhhaUEVM4NoL20W5qfX
	R9LLJgAemgjniU1EKuf9zB6eRjjrMiAH73GM9PdDr9i3IrZ7qd46wgF3JaA//N3qDrHt/BJhE/aaO
	3hmW+fPOBKf4DaQWWNnJuUpRDcOtuVQ0lTas/AXnt424qpivaXq4EDaCnZcJ2Am5GclOBtVdpVfRw
	Fnx6eLZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZOa-0000000D0eW-1xqP;
	Mon, 08 Dec 2025 11:27:12 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZOW-0000000D0dE-3uDg
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Dec 2025 11:27:10 +0000
Message-ID: <3f2aee2b-578a-4d82-8dac-14cb9f2ada05@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765193224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KS9+fkJURzUJE1mmvUiBXK04jhbhsrgQmnTnkE10avY=;
	b=RZdoCdds7YbZnHkW/nYm6bY4Esp1KjkxKwlJIihYgTfYeYRjDlUR+QMDbixZCFIL3ijkfb
	MRc4SImvpFbKrkzgt+mxIM/1RqwJgHViy1Bvvv5PWU7XWqKJfJYPOIEoDHWSHfQFq+aJD9
	6YpG+e5x6gt+bZ2igvQFu1iLzobsD64=
Date: Mon, 8 Dec 2025 11:26:54 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] drm/tidss: Fix enable/disable order
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
 <20251205-drm-seq-fix-v1-4-fda68fa1b3de@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20251205-drm-seq-fix-v1-4-fda68fa1b3de@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_032709_117661_1AB8ACC3 
X-CRM114-Status: GOOD (  11.09  )
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



On 05/12/2025 09:51, Tomi Valkeinen wrote:
> TI's OLDI and DSI encoders need to be set up before the crtc is enabled,
> but the DRM helpers will enable the crtc first. This causes various
> issues on TI platforms, like visual artifacts or crtc sync lost
> warnings.
> 
> Thus drm_atomic_helper_commit_modeset_enables() and
> drm_atomic_helper_commit_modeset_disables() cannot be used, as they
> enable the crtc before bridges' pre-enable, and disable the crtc after
> bridges' post-disable.
> 
> Open code the drm_atomic_helper_commit_modeset_enables() and
> drm_atomic_helper_commit_modeset_disables(), and first call the bridges'
> pre-enables, then crtc enable, then bridges' post-enable (and vice versa
> for disable).
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: stable@vger.kernel.org # v6.17+
> ---
>  drivers/gpu/drm/tidss/tidss_kms.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

