Return-Path: <SRS0=vCgL=N2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C44C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Sep 2021 12:34:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD5F160F56
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Sep 2021 12:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD5F160F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaeIWTCZ+58g0iZ+owWwSJqvRmjdF6liax/iUVk6HTY=; b=Cp/YKBqbOFK192
	B35W+GQ445NGNwxUKFrxXWNTnemtiA3N6qytKQ+or/2DNb9vviFowmcCR8pi9ScI3onbkOMqc2jEK
	sBBnAJQIOp/URW6cyu/VqxoECDCwqE9BNUyr7hdWQ9Mbr+KDGlwvNZlCq0ye7N5D6Dh5W9dA6v9gh
	KX6HfBP/JhdqczgyPfzyLFr7w77xExHly3883CzC7yNkMxjV0hRB6n8ZRcQ6c+Gy2KjxFk8Q+XxRA
	HXkxW8q+X0JHChIOMnAcVqqcwwM4NdZRIn6qqTc1WanuKguioaob3AiNttIojACFxnQkUoz3SLdIG
	cc+/ZjSR4LeVOE0gO0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMUsZ-00E7j5-EU; Sat, 04 Sep 2021 12:34:39 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMUsL-00E7hM-Qb
 for linux-mediatek@lists.infradead.org; Sat, 04 Sep 2021 12:34:27 +0000
Received: by mail-ed1-x531.google.com with SMTP id g21so2689177edw.4
 for <linux-mediatek@lists.infradead.org>; Sat, 04 Sep 2021 05:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5+zo+4Wr/N1+qtO0Bo0/5IH229VcLBJpVABLvaQw9+Y=;
 b=krzH3n/yLFz4lPCd5+4cvhdNx8SktbX09J5W/CdMMARjeDou9AzW9SqJzGIebu+Ab2
 MdDRqy34f4ie9SozTFLwUoo+1t/BK2GrDXuYKX28lskqLzd8milT7/L0awCvLzh154ew
 PPC5pl76KQD75u4Xpkf7Iviu8qcuXpjD30XSk6XBqKY7M2HbFSZRvGMLoyKWwxtvi0AP
 nO10GPONuy7MSn62griUv8x9flscDyJNmSI17PCzXQ2xy5erSe6tuyq5uEcB5C700n2Q
 D8rH17FaQ2FLMVneAd7et9prM1nnZHLIlALAcEjTHIOLESHNij8o3S8N3Y937WNUibds
 xzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5+zo+4Wr/N1+qtO0Bo0/5IH229VcLBJpVABLvaQw9+Y=;
 b=rqHFri7b1kJe2uq0egIaFNWIVEEVwSPzNa2HC7yWW8E7S7ebYDB4YdBsUC70g4fEb6
 YlWIQ236YLGGA1O6rXMeJqAAhUAXXMtoc3j2Um3s3xXxrYN7lUe861PK2flW6QJ10fGM
 3vruMHEAgH/Q+UBXGfa9mDQQp35EfMdrv/Hzng9b1wwuElfQ9v3Sfy6FAj2AAOIXc0X1
 WhBZseHfSGRp2+cShQstxYr2c5B7/PXDAKP/336yjmZX/Z27vZCo2UPee+PoWhcwydsR
 7bXCGMcX8mn+nYI+GWRP3mni7jC5J+Cdvv79mVKUZ3CcnSUzpFupNyQNq2jfQAsEJSZD
 Y2/g==
X-Gm-Message-State: AOAM531Wt0dRKlzM/NG6RnpS/8mVmm6VJU+bGXu1J4O8K+P5yU4VbRgg
 SgA7wRRCRsorVI2tS6o7UEBVPXULz7uGqa65i4BUug==
X-Google-Smtp-Source: ABdhPJxTnsvckyGgNMH1nCQCPjnCx2xmJcfaKIBG5ezGLlI/cFtqEY0Wn5EOslI/SFO5VcI8R4u9GAwp2c4cQxyl6L8=
X-Received: by 2002:a05:6402:743:: with SMTP id
 p3mr3988258edy.26.1630758863159; 
 Sat, 04 Sep 2021 05:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210825063323.3607738-1-eizan@chromium.org>
 <20210825163247.v7.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
In-Reply-To: <20210825163247.v7.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 4 Sep 2021 09:34:11 -0300
Message-ID: <CAAEAJfDNDXdJFfB-bHhFcqnnKZ0TY--d_wLGddKRymQOLQY4TQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] mtk-mdp: add driver to probe mdp components
To: Eizan Miyamoto <eizan@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 chunkuang.hu@kernel.org, 
 Yong Wu <yong.wu@mediatek.com>, wenst@chromium.org, ck.hu@mediatek.com, 
 houlong.wei@mediatek.com, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 yongqiang.niu@mediatek.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-media <linux-media@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210904_053426_101564_10E9D3D2 
X-CRM114-Status: GOOD (  33.17  )
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

Hi Eizan,

Sorry for seeing this series so late.

On Wed, 25 Aug 2021 at 03:35, Eizan Miyamoto <eizan@chromium.org> wrote:
>
> Broadly, this patch (1) adds a driver for various MTK MDP components to
> go alongside the main MTK MDP driver, and (2) hooks them all together
> using the component framework.
>
> (1) Up until now, the MTK MDP driver controls 8 devices in the device
> tree on its own. When running tests for the hardware video decoder, we
> found that the iommus and LARBs were not being properly configured.

Why were not being properly configured? What was the problem?
Why not fixing that instead?

Does this mean the driver is currently broken and unusable?

> To
> configure them, a driver for each be added to mtk_mdp_comp so that
> mtk_iommu_add_device() can (eventually) be called from dma_configure()
> inside really_probe().
>
> (2) The integration into the component framework allows us to defer the
> registration with the v4l2 subsystem until all the MDP-related devices
> have been probed, so that the relevant device node does not become
> available until initialization of all the components is complete.
>
> Some notes about how the component framework has been integrated:
>
> - The driver for the rdma0 component serves double duty as the "master"
>   (aggregate) driver as well as a component driver. This is a non-ideal
>   compromise until a better solution is developed. This device is
>   differentiated from the rest by checking for a "mediatek,vpu" property
>   in the device node.
>

As I have stated in Yunfei, I am not convinced you need an async framework
at all. It seems all these devices could have been linked together
in the device tree, and then have a master device to tie them.

I.e. something like

mdp {
  mdp_rdma0 {
  }
  mdp_rsz0 {
  }
  mdp_rsz1 {
  }
}

All this async games seem like making the driver really obfuscated,
which will mean harder to debug and maintain.
I am not sure we want that burden.

Even if we are all fully convinced that you absolutely need
an async framework, then what's wrong with v4l2-async?

I would start by addressing what is wrong with the IOMMUs
in the current design.

Thanks,
Ezequiel

> - The list of mdp components remains hard-coded as mtk_mdp_comp_dt_ids[]
>   in mtk_mdp_core.c, and as mtk_mdp_comp_driver_dt_match[] in
>   mtk_mdp_comp.c. This unfortunate duplication of information is
>   addressed in a following patch in this series.
>
> - The component driver calls component_add() for each device that is
>   probed.
>
> - In mtk_mdp_probe (the "master" device), we scan the device tree for
>   any matching nodes against mtk_mdp_comp_dt_ids, and add component
>   matches for them. The match criteria is a matching device node
>   pointer.
>
> - When the set of components devices that have been probed corresponds
>   with the list that is generated by the "master", the callback to
>   mtk_mdp_master_bind() is made, which then calls the component bind
>   functions.
>
> - Inside mtk_mdp_master_bind(), once all the component bind functions
>   have been called, we can then register our device to the v4l2
>   subsystem.
>
> - The call to pm_runtime_enable() in the master device is called after
>   all the components have been registered by their bind() functions
>   called by mtk_mtp_master_bind(). As a result, the list of components
>   will not change while power management callbacks mtk_mdp_suspend()/
>   resume() are accessing the list of components.
>
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
> ---
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
