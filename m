Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2923C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Nov 2022 20:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOdWYdGW3s/P7m5FZD4/WdL1KbYLkJOJKiY+fmsgK1Y=; b=RYHR3qbkR0ELwQJ9pOAItPr6VX
	awAHyleU0loAeAzPj2vZQxH8ETaqJmH3s9X3N8/wacZnXYIR6b7VuHXUE4EqQq2Rgjif2b2B6hGpQ
	+T138GXvemnQEvB4OcFSBwS6kJO46QBzin7/3HAMIiqyu49WW2GIchidTRkWIZMufSfZu/83DmYqx
	m3E9YDFhjnNarJ9zBvREM+EGsYX8gidqXrdt1d/R4Xs0KzVgk8qO+a5LaDmhsagXLgB8b4t0G1RU+
	knngG/LPnIzWrbVXAaOJsSjSNTyGye8ytWKnvDOcSwlUpZd9yTalW+4ZjRgRJYUObhJ/90UL6uprJ
	5xdSCnYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opy4D-006xUL-Qq; Tue, 01 Nov 2022 20:41:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opy42-006xNE-Fz
	for linux-mediatek@lists.infradead.org; Tue, 01 Nov 2022 20:40:51 +0000
Received: by mail-pl1-x634.google.com with SMTP id k7so4940341pll.6
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Nov 2022 13:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mOdWYdGW3s/P7m5FZD4/WdL1KbYLkJOJKiY+fmsgK1Y=;
        b=de8L7i8dhThB5jPU0QJ+wNCGKLfERSiRy+Nbh6pG252kQcQxnKnQdrC/dzwc2hsMlr
         aXSqguw0WCWoiHLlL8FFhFYXq5any+pt0sbBNK/Z6RyfW/Q96G2LiLAVl79je4VnNTZc
         rx7+QW6x2/TMYXuBQq6Crli0IYNQMfIW0re3/mURukLaYSLsG+CEd0VMlMAyPCD7M4C9
         9GGqwlrOuFinXjL1GQ/xEE6TwHb2EZbofdPaFWrE2pP5qCy4pczRGQwKJ17LIBJtMrYw
         lyxeDfIa0ZOR5vN8EbK8VDmf6DZ5plNsAi7rnapRAvQL37amHSUoIZZVL9z71/lBWZ0o
         pHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOdWYdGW3s/P7m5FZD4/WdL1KbYLkJOJKiY+fmsgK1Y=;
        b=w6NyUSGj1Jk5UxKadgvL/ILTYfqrevE9o4jcFpCwqt9i9S2YH715NzB7Wcs3bLlZFL
         C57btDTzPEPHVZbKEq3/3bzJaF5QvnHcuA7K9TgZ6DWG7hekbnzwGoVP7lUG9D/CMu8N
         Q+2yEFemd46YnA9PQpbJ5tCigmmFCs9mcukwisgmIcPMApJuZSvyuSteZLV4qJcOPIcX
         b71oyEPE3BTgccr6ncxQcaSJwKnHNtZYWzY2VZU0Mmtfp5VgucX6pDgKC6r1+erc5PJp
         hj7k4C5U35S3/MTCHX2rmqGVktgWDoP35nKVNc8e2PlRP217nyfyYOzDymlwMQEEKgF7
         XHsg==
X-Gm-Message-State: ACrzQf06ltAWsGLI6yElYrxHqfAGAiUexWppKg6+3J5qLvuQSNbDySYc
	UfZbePerEt71sYAJifaAC1d3dA==
X-Google-Smtp-Source: AMsMyM6VfVb9FYoLCNZggIxd4jHQV9YIO5CmtN8F82LNyD+04hIVSj/1BCmis1ty+4F5c9ub9uHCgA==
X-Received: by 2002:a17:902:d2c4:b0:187:a4e:f9c1 with SMTP id n4-20020a170902d2c400b001870a4ef9c1mr18314924plc.168.1667335240174;
        Tue, 01 Nov 2022 13:40:40 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id o10-20020a62f90a000000b005625d5ae760sm7103069pfh.11.2022.11.01.13.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 13:40:39 -0700 (PDT)
Date: Tue, 1 Nov 2022 14:40:37 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 00/11] Add support for MT8195 SCP 2nd core
Message-ID: <20221101204037.GA1656603@p14s>
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927025606.26673-1-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_134050_536936_A7F504DE 
X-CRM114-Status: GOOD (  17.81  )
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

Good day,

A lot of comments related to the handling of SCP 0 and 1 have already been made
on this patchset, along with my own advice from the previous patchset on how to
move forward.  As such I will wait for a new revision.

Thanks,
Mathieu

On Tue, Sep 27, 2022 at 10:55:55AM +0800, Tinghan Shen wrote:
> The mediatek remoteproc driver currently only allows bringing up a 
> single core SCP, e.g. MT8183. It also only bringing up the 1st 
> core in SoCs with a dual-core SCP, e.g. MT8195. This series support 
> to bring-up the 2nd core of the dual-core SCP.
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
> Tinghan Shen (11):
>   dt-bindings: remoteproc: mediatek: Give the subnode a persistent name
>   dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP
>   arm64: dts: mt8195: Add SCP core 1 node
>   remoteproc: mediatek: Remove redundant rproc_boot
>   remoteproc: mediatek: Add SCP core 1 register definitions
>   remoteproc: mediatek: Add MT8195 SCP core 1 operations
>   remoteproc: mediatek: Probe MT8195 SCP core 1
>   remoteproc: mediatek: Control SCP core 1 boot by rproc subdevice
>   remoteproc: mediatek: Setup MT8195 SCP core 1 SRAM offset
>   remoteproc: mediatek: Handle MT8195 SCP core 1 watchdog timeout
>   remoteproc: mediatek: Refine ipi handler error message
> 
>  .../bindings/remoteproc/mtk,scp.yaml          | 132 ++++++++--
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   2 +-
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  14 +-
>  .../mediatek/vcodec/mtk_vcodec_fw_scp.c       |   2 +-
>  drivers/remoteproc/mtk_common.h               |  35 +++
>  drivers/remoteproc/mtk_scp.c                  | 241 +++++++++++++++++-
>  include/linux/remoteproc/mtk_scp.h            |   1 +
>  7 files changed, 397 insertions(+), 30 deletions(-)
> 
> -- 
> 2.18.0
> 

