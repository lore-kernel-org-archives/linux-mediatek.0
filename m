Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C9CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 10:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+o2m7x6TPumkcAnF6jwLvy7u87O4AfceSLWZiEWVvs=; b=RvTGIgAPPEsAQE
	io7//kyVIwAyGLbOQupLYZW3n9l9mY8z3UZNqMbX6sSeHmmR6VUSQozDtqxVeFo/4euZ4oywFdsxj
	4zvMJXfEWSkOIkkMuIAay8uzNd2N4X4LLMYAgOKcjU+OXaDRKKTWqSW4JHrYqoJMS3KhTj7Nbzg3V
	Z5NDSoykCWe0P8JD+zdJfWeej1g1Xmc8qKuty3LBqfRX8B0woD9a03yDyeifg+2p7c7XMffLKVPEs
	BTXKSF/gJUI4mJs4/clHd1HpMZYyqQ7P3deqfCC7K9A1gsAKyVTNds1DGdHWEmPsOpUzf+cIao2uW
	9aNEkJH/V8s1uj2ixabg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSGQ9-00CUX1-B3; Thu, 10 Mar 2022 10:53:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSGPP-00CU4S-5I; Thu, 10 Mar 2022 10:52:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 548481F454C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646909557;
 bh=9aUbcW04U/4ptYzSIBnfoM+hXNE0ptVvNH6aQoyUu9Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=igI/BZK/FA9bN67UwQfOCHAz40Bvc+sn142E6OatI1gORrtDMHcmx5GF3v8WZv91W
 vPZERPUOJmWusSETIeJmIap+chaysvjB9mHy12BGGcAmNdiX04hWKNfZUYRJ8fkYF+
 3wlQvzgxLYKDFOXLNUwTcP1HEpAoqGRxwZm8W+wRCz80KfFZhdZFuUMBgEZAk5lfIL
 wBGH62C+lCVSyEpk/SjXWceXCuMjkv98X7YvpSQ5HpV+maoybrw/e9XDrbZhygD/Vn
 ktDhfvRlenO3eZv2Hua4o/4TCCr5Q+tc7I5uaBVrV9moXNPkeG/3NoBx6BxrWKNV7k
 rA2ucxVfYlTOA==
Message-ID: <fba2646a-6eb6-eabe-538f-ed54bfd60c14@collabora.com>
Date: Thu, 10 Mar 2022 11:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 10/22] drm/mediatek: add display MDP RDMA support for
 MT8195
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
 <20220310035515.16881-11-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-11-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_025239_395166_DCC9F1CD 
X-CRM114-Status: GOOD (  11.21  )
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
> Add MDP_RDMA driver for MT8195. MDP_RDMA is the DMA engine of
> the ovl_adaptor component.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/Makefile       |   3 +-
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h |   7 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c  |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   1 +
>   drivers/gpu/drm/mediatek/mtk_mdp_rdma.c | 315 ++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_mdp_rdma.h |  20 ++
>   6 files changed, 346 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
