Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1289CA0FE9
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 17:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rncWvuUlxPMD3w67Ey6ITQiyZ0HdBuQ5Y0WGNXnOpjc=; b=EmHh4fANsYhRDuN8tv8fUdb9Je
	1CLKoRTzgP9zoC/YS/vWMv38vX26FOOnk3+QtLZW89a+D/xbyM7JDNN3tQP3yNgZgbCRV8s2SdcHH
	ctfg11OARanOCLnEwhC8iaad8Gk+9nvBphK28XHdz4a8n4cQRLam35IZlW4lfoAFJTvTTb+Tt+6E4
	nKkZCa7aG2ihU0apzY5tkNI2BdxunSQ92sNuaj4MBIlkfWYVIezR7HPZ33P3SJbAL5pGYtPnyokwP
	2QRwqp2teOVe6wqeMwjUpt56qrlNbJxCmXspdGV+dt+kzCjx2mQBSvI2tOLYQ14qSnkbjBN4mQsCS
	MBXjFeZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdDiR-004XJG-1p;
	Mon, 04 Sep 2023 17:50:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdDiO-004XIF-0o
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Sep 2023 17:50:21 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31f4a286ae1so750666f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Sep 2023 10:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693849818; x=1694454618; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rncWvuUlxPMD3w67Ey6ITQiyZ0HdBuQ5Y0WGNXnOpjc=;
        b=y09DpPMEBy4AlGI04H/ZpNA5M3WuS7CYhFoOewAn+r22XIKwlsLS8HPi2Ud/iOzcdd
         S5rYTy/l5Sq1q/UqJ2ZqAMG/C5zD43g6OJ9z8321qWBEY/i1+ZFXGemMhhYf+C2EY4qm
         0jQ5MvC5Fl9itFxbji2+gU8tmYFtPey3r4553C19B4a50lhwj0coboSXlh2k+o1j5xYL
         W5ToS13R+cG7bQGJyizsikq7hvPacxw5gGuWD6bfj08exDrmTtsJvlXCjffL98b9/x0C
         xDQgQU3YoUZNo4snfEAc66F7vx3egKYwhq77w1Fmbb1nN+HNlbNb5jTTfIx6l8pHVAzJ
         bhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693849818; x=1694454618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rncWvuUlxPMD3w67Ey6ITQiyZ0HdBuQ5Y0WGNXnOpjc=;
        b=Q/6I8csLIP6pH2DfmBlZGTcLiED34mr9opztyIV9VfWmrZpzRykmMZG/prd1t/HgQi
         hbIcjCTPBrvba+A4DmXRsTUKGXCl+8NeDns0JxXbdAdmVJ9MzTd1ckPekyonLKq9ZIh1
         Kpx+9aVXDG7CyUGN5tFqbkfm3WRHxMlQ8B+VV3np0POcVUVMFn7s0FWpTxaj73fuE4sm
         3FOezdoQtFWzySrYEika0HmImoqOsWqNxoeJjef5YyfKzVReCipV0TQ95G7TPFVO3+wW
         KTb4TS5FxNf5UXa/XzSAgtfeRj+8nJImYVdHb6a59VIpVPFv1AxKNcXqS89M3EOrGFhH
         Loxg==
X-Gm-Message-State: AOJu0YyOyPQbmq2Jg0leY8hW4PDrMT/cuiVNWRPCfB2BU2ZiOvT7yLy5
	m/3ZPMQ54b23GIS3eRQUuzZqkr0Qcp47AEFtavhRaw==
X-Google-Smtp-Source: AGHT+IHePbk13jgFsSUIOOucKm/bV2pYbL3ioyUIE3rbr5yIXNlexJJisBEOHvx1BbsoV9yZB2mI0wbfVLb4771OS9Q=
X-Received: by 2002:adf:f58f:0:b0:319:55bc:4416 with SMTP id
 f15-20020adff58f000000b0031955bc4416mr8462609wro.5.1693849818349; Mon, 04 Sep
 2023 10:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230901080935.14571-1-tinghan.shen@mediatek.com>
In-Reply-To: <20230901080935.14571-1-tinghan.shen@mediatek.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 4 Sep 2023 11:50:07 -0600
Message-ID: <CANLsYkzwfJv7Wh7GBzzOp1VoAUZDkroy9mWKO9hUtdDH4JxuHQ@mail.gmail.com>
Subject: Re: [PATCH v17 00/14] Add support for MT8195 SCP 2nd core
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_105020_288877_1875716B 
X-CRM114-Status: GOOD (  27.52  )
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

On Fri, 1 Sept 2023 at 02:09, Tinghan Shen <tinghan.shen@mediatek.com> wrote:
>
> The mediatek remoteproc driver currently only allows bringing up a
> single core SCP, e.g. MT8183. It also only bringing up the 1st
> core in SoCs with a dual-core SCP, e.g. MT8195. This series support
> to bring-up the 2nd core of the dual-core SCP.
>
> v16 -> v17:
> 1. add a comment in scp_add_multi_core() at patchset 8
>

I will add this patchset to my tree when rc1 comes out next week.

Thanks,
Mathieu

> v15 -> v16:
> 1. fix the checkpatch warning at patchset 1
> 2. move changes on scp_probe() to the new added patchset 6
> 3. revise platform_set_drvdata() at patchset 8
> 4. fix commit message at patchset 9
>
> v15 -> v14:
> 1. use the common SCP registers in struct mtk_scp_of_cluster instead of
>    copy it to struct mtk_scp at patchset 5
> 2. use platform_set_drvdata instead of platform_device_add_data at patchset 5
> 3. rename l2tcm_lock to cluster_lock at patchset 8
> 4. check l2tcm_refcnt value before decreasing at patchset 8
> 5. revise the commit message at patchset 11
>
> v13 -> v14:
> 1. add review tag to patchset 1,6
> 2. exchange the order of sram power on and reset assert in
> mt8195_scp_c1_before_load at patchset 2
> 3. use ERR_CAST in patchset 5
> 4. re-write patchset 7 to remove dependency between core 0 and core 1
> 5. add patch set 10 to report watchdot timeout to all cores
>
> v12 -> v13:
> 1. replace subdevice with new mediatek scp operations in patchset 7
> 2. add review tag to patchset 3
> 3. modify mediatek,scp phandle name of video-codec@18000000 at patchset 11
>
> v11 -> v12:
> 1. add scp_add_single/multi_core() to patchset 6
> 2. remove unused comment in patchset 6
> 3. rename list name from mtk_scp_cluster to mtk_scp_list
> 4. rewrite the multi-core probe flow
> 5. disable rproc->autoboot and boot rproc by request_firmware_nowait at patchset 7
> 6. remove patchset 7 review tag
>
> v10 -> v11:
> 1. rewrite patchset 5 to probe single-core SCP with the cluster list
> 2. Also in patchset 5, move the pointer of mtk_scp object from the
>    platform data property to the driver data property
> 3. move the appearance of mtk_scp cluster property to patcheset 7
>
> v9 -> v10:
> 1. move the global mtk_scp list into the platform device driver data structure
> 2. remove an unnecessary if() condition
>
> v8 -> v9:
> 1. initialize l1tcm_size/l1tcm_phys at patchset 05/11
> 2. rewrite patchset 06/11 to unify the flow and remove hacks
>
> v7 -> v8:
> 1. update the node name of mt8192 asurada SCP rpmsg subnode
> 2. squash register definitions into driver patches
> 3. initialize local variables on the declaration at patch v8 06/11
>
> v6 -> v7:
> 1. merge the mtk_scp_cluster struct into the mtk_scp structure
>    at the "Probe multi-core SCP" patch
>
> v5 -> v6:
> 1. move the mtk_scp_of_regs structure from mtk_common.h to mtk_scp.c
> 2. rename the SCP core 0 label from 'scp' to 'scp_c0'
>
> v4 -> v5:
> 1. move resource release actions to the platform driver remove operation
> 2. fix dual-core watchdog handling
>
> v3 -> v4:
> 1. change the representation of dual-core SCP in dts file and update SCP yaml
> 2. rewrite SCP driver to reflect the change of dts node
> 3. drop 'remove redundant call of rproc_boot for SCP' in v3 for further investigation
>
> v2 -> v3:
> 1. change the representation of dual-core SCP in dts file and update SCP yaml
> 2. rewrite SCP driver to reflect the change of dts node
> 3. add SCP core 1 node to mt8195.dtsi
> 4. remove redundant call of rproc_boot for SCP
> 5. refine IPI error message
>
> v1 -> v2:
> 1. update dt-binding property description
> 2. remove kconfig for scp dual driver
> 3. merge mtk_scp_dual.c and mtk_scp_subdev.c to mtk_scp.c
>
>
> Tinghan Shen (14):
>   dt-bindings: remoteproc: mediatek: Improve the rpmsg subnode
>     definition
>   arm64: dts: mediatek: Update the node name of SCP rpmsg subnode
>   dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP
>   remoteproc: mediatek: Add MT8195 SCP core 1 operations
>   remoteproc: mediatek: Extract SCP common registers
>   remoteproc: mediatek: Revise SCP rproc initialization flow for
>     multi-core SCP
>   remoteproc: mediatek: Probe SCP cluster on single-core SCP
>   remoteproc: mediatek: Probe SCP cluster on multi-core SCP
>   remoteproc: mediatek: Remove dependency of MT8195 SCP L2TCM power
>     control on dual-core SCP
>   remoteproc: mediatek: Setup MT8195 SCP core 1 SRAM offset
>   remoteproc: mediatek: Handle MT8195 SCP core 1 watchdog timeout
>   remoteproc: mediatek: Report watchdog crash to all cores
>   remoteproc: mediatek: Refine ipi handler error message
>   arm64: dts: mediatek: mt8195: Add SCP 2nd core
>
>  .../bindings/remoteproc/mtk,scp.yaml          | 176 +++++-
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   2 +-
>  .../boot/dts/mediatek/mt8192-asurada.dtsi     |   2 +-
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      |   6 +-
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  34 +-
>  drivers/remoteproc/mtk_common.h               |  39 +-
>  drivers/remoteproc/mtk_scp.c                  | 539 ++++++++++++++----
>  drivers/remoteproc/mtk_scp_ipi.c              |   4 +-
>  8 files changed, 656 insertions(+), 146 deletions(-)
>
> --
> 2.18.0
>

