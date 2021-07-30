Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B8CC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 11:45:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E6CF60232
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 11:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E6CF60232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AvwsnFbewv+AqOF6o2jjhDw86pNiQz+xAL+AaEBBFZs=; b=GLq4OepsKTbMiRSCnTvui1Z3Km
	9KmZG23xu8Su/IVCzAT/zrB+pP7ojJdgACgx8iVSrnqeRHpi00haVdEbwbabsZHm61zYFR9yVnvWb
	FPgqQCfdjL9e0B59qkgYizxPapzbBN1dyDYWwiMScNMy+laNNZwt0DKvyFmmwPYOtpq0CBHHlTXUl
	zd/gEaNY6Bcyq9DY98dx2gRjJvpI32aje8xc2PDXvB9rFB5yuFtLLV1FeOAmQKkfb16Qboa7OTH7I
	TIaBr2/iAhq78umK+bGkHm4WhAJFyBB5iKX/+ra4vsgo3ZkJK0iZPjQXQbhKloJcuXo/xCzwthA3/
	2MYM3wfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9QxI-008Pfg-Jq; Fri, 30 Jul 2021 11:45:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Qwt-008PVE-D1; Fri, 30 Jul 2021 11:45:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 005DA1F41D20
Subject: Re: [PATCH v5 0/6] Add Mediatek Soc DRM (vdosys0) support for mt8195
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, fshao@chromium.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 nancy.lin@mediatek.com, singo.chang@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20210729170737.21424-1-jason-jh.lin@mediatek.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <a8ce9da7-21c2-f9ef-161a-647d3f8748f3@collabora.com>
Date: Fri, 30 Jul 2021 13:45:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729170737.21424-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_044507_680430_DA0FD60C 
X-CRM114-Status: GOOD (  19.93  )
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

Hi Jason,

Thank you for your patch.

On 29/7/21 19:07, jason-jh.lin wrote:
> The hardware path of vdosys0 with eDP panel output need to go through
> by several modules, such as, OVL, RDMA, COLOR, CCORR, AAL, GAMMA,
> DITHER, DSC and MERGE.
> 


You said in other discussions that vdosys0 has eDP panel output and vdosys1 has
DP output. Is it possible to switch the outputs? What I am wondering is if this
configuration is hardware specific or board specific, i.e it'll be possible to
have another board that has DP output on vdosys0 and eDP output for vdosys1?

Thanks,
  Enric


> Change in v5:
> - add power-domain property into vdosys0 and vdosys1 dts node.
> - add MT8195 prifix and remove unused VDO1 define in mt8195-mmsys.h
> 
> Change in v4:
> - extract dt-binding patches to another patch series
>   https://patchwork.kernel.org/project/linux-mediatek/list/?series=519597
> - squash DSC module into mtk_drm_ddp_comp.c
> - add coment and simplify MERGE config function
> 
> Change in v3:
> - change mmsys and display dt-bindings document from txt to yaml
> - add MERGE additional description in display dt-bindings document
> - fix mboxes-cells number of vdosys0 node in dts
> - drop mutex eof convert define
> - remove pm_runtime apis in DSC and MERGE
> - change DSC and MERGE enum to alphabetic order
> 
> Change in v2:
> - add DSC yaml file
> - add mt8195 drm driver porting parts in to one patch
> - remove useless define, variable, structure member and function
> - simplify DSC and MERGE file and switch threre order
> 
> jason-jh.lin (6):
>   arm64: dts: mt8195: add display node for vdosys0
>   soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
>   soc: mediatek: add mtk-mutex support for mt8195 vdosys0
>   drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
>   drm/mediatek: add DSC support for mt8195
>   drm/mediatek: add MERGE support for mt8195
> 
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi    | 112 ++++++++
>  drivers/gpu/drm/mediatek/Makefile           |   1 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 277 ++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |   6 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  62 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  32 ++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>  drivers/soc/mediatek/mt8195-mmsys.h         |  96 +++++++
>  drivers/soc/mediatek/mtk-mmsys.c            |  11 +
>  drivers/soc/mediatek/mtk-mutex.c            |  93 ++++++-
>  include/linux/soc/mediatek/mtk-mmsys.h      |   9 +
>  13 files changed, 706 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
>  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
