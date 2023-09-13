Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261F1EE01FC
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 17:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxGCcX5dO7Y4NrveLmTT3O1kgnmgg4vt0sVCX4yijHg=; b=xVJrcV9DiIQw5IzcmXN+jcax6n
	RStJ3zhTQTaTNj21Wv32lOhNDNVd+tDkGjNO8N1kIPT+1L91rQAVEEcvxULP72J5eriu0JnK7IkWX
	PPqjQj+Vsf/MZwocdlGDFjXRdXdOEcU9kIdFooIWyWcqYMFy5SbL43n+L49ksnYibUeOXil+d5ZVV
	bebblWh1lIBKkMh+LI4ZjQJRCqNkg80Z1xpMYVZs8Mt9ScsSyZlWt0+lp0+fCOiW2pY9PDblf48x6
	cVYx+5K0cCFL8RjWoRYTWnwrvue9KPhAdWTmUR8PwrxJ+zSdOZSo1Wpy7x0h1rWpvbqrISeWL8yw3
	8vUHOdMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgU0q-006Vij-2c;
	Wed, 13 Sep 2023 17:50:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgU0n-006Vhj-0O
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 17:50:50 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c0c6d4d650so467385ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Sep 2023 10:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694627447; x=1695232247; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bxGCcX5dO7Y4NrveLmTT3O1kgnmgg4vt0sVCX4yijHg=;
        b=h/wrVWOpBRTtl5J7A/afKP+xxSd7Rw/cvXl0owuV186Ye+/IusK5UtdCc9WIO0/+YX
         woGD6vUzwNk3+QrKYDGxnVEo/Jc30a0ws1RIOLs0JHjFeuPM0/bM02e1HJs8syIJOOoc
         ek0g4VsGnD3SVJLHryt21tjvb3kWev1bQAA82cZXAZ4ePKm99Si3JvqgvOUbwv8uzPz9
         CHQrdZMTgyP9B2a2gpkbqwIyubGlc27AT+n60jHk82qbV74zSdlXJfGCwaZEn1jV8Far
         cH2sgGKwxSOEAIntKvl3e3/KQkxyO9GL/dIFK3soTVJFx6dUdwv1fQWVGLJQ9WGvf8M3
         VS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694627447; x=1695232247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxGCcX5dO7Y4NrveLmTT3O1kgnmgg4vt0sVCX4yijHg=;
        b=lKqJ8YnvBwYsCjgDdkiUWflizT3q8SYj/R56F5gkyXhsxbfVBJnaZ5aZrsa/zH5hIJ
         rlIftmr3AOiuKJ1STQIn41VJORusrEulbsAqoZvq+cR+QGOmIidwy1sSMtjhP84/pDlJ
         qpjd5NkonTZhC+XOwBzjoUI4SNQIRlggwax01BdZA+GRYTqvyTt4eWSoS18X1M2CSw9V
         gXQmm/+r9CfBuArVvaK1iGLHKBWFJQ9RwOyX0x9rbE/ojVglKkSj9gc3JaNqGTOupeak
         X1vTVVJGb4GiBIpsJugqHJ+8thPTAD8URfRqnnKqPD5LpB1IPiltBzKSoQFc4Y57Clva
         Qn+Q==
X-Gm-Message-State: AOJu0YyPcyFG6pbBE7nWT9PsW1wlgImJbtZvWxjwiFERomp/oQGe5iEq
	HXyzgkV6YysgMa4llips+tMaLw==
X-Google-Smtp-Source: AGHT+IHQKLRS4pYFQ7w1F9tvvBOYbFGDDG3SzTX1ZLt74KPx5aEZdvG7A4CnAaBeINcr4SxERDkgDg==
X-Received: by 2002:a17:902:8345:b0:1bf:4a1f:2b57 with SMTP id z5-20020a170902834500b001bf4a1f2b57mr3522163pln.13.1694627447228;
        Wed, 13 Sep 2023 10:50:47 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d880:f5d9:a2c5:d083])
        by smtp.gmail.com with ESMTPSA id p15-20020a170902e74f00b001bb8be10a84sm6837728plf.304.2023.09.13.10.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 10:50:46 -0700 (PDT)
Date: Wed, 13 Sep 2023 11:50:44 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v17 00/14] Add support for MT8195 SCP 2nd core
Message-ID: <ZQH2dG+l/dONUsyi@p14s>
References: <20230901080935.14571-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901080935.14571-1-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_105049_206430_7819223B 
X-CRM114-Status: GOOD (  28.91  )
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

On Fri, Sep 01, 2023 at 04:09:21PM +0800, Tinghan Shen wrote:
> The mediatek remoteproc driver currently only allows bringing up a 
> single core SCP, e.g. MT8183. It also only bringing up the 1st 
> core in SoCs with a dual-core SCP, e.g. MT8195. This series support 
> to bring-up the 2nd core of the dual-core SCP.
> 
> v16 -> v17:
> 1. add a comment in scp_add_multi_core() at patchset 8

Other than patch 2 and 14, I have applied this set.  The remaining patches will
have to be resent to Matthias.

Thanks,
Mathieu

> 
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

