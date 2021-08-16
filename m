Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB6EC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 01:06:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C01E613A1
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 01:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C01E613A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9ubE5IbmMO9r5EfVz/sjrf4PrKpZgJnrpm/CjcDHAc=; b=M+uYAbPJF2TYQM
	8ppogqdRSQRXmDd+2TpwYQ7aKQVoyku9gjn9hKY88XP/f+mFzCUmPcds7Did5mfRLmtKhlP7iwAXR
	xW/QCOYMJVfk4E2DtOJ54Fk1yPh5onlyWiwq31qV1EY5/YMnzG1tKuPBahOVNAkqRVIZViKEPZVDt
	CEobMIlU5St68ih9DD5ml94Ln4iQSO378yg3RFayOMDtmkuy2yz6vqBNl+QJzo+v0Z8HxdICa6+Ej
	CzmB4332a9DRUCMOTkrI94W+Q+LK62ka8QXvgDUzzX2fCvIqlFRMbLUXksQTRL9B6dD/JFiYY9TZp
	31fFIUqesadLCOaV2VjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFR50-00FvLC-NB; Mon, 16 Aug 2021 01:06:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFR4l-00FvJN-44; Mon, 16 Aug 2021 01:06:07 +0000
X-UUID: 736deb4289794115b06d9e12ca85729c-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cCh/bJfAbZNucKLCPO13R09wwwch9hhcF+Y61K8xM1c=; 
 b=HT25zCyhgN6t61n54bXk3MnSIhx74iYu1W6FsuIR/y3eVCJGNrAlvVwNuQTBEerH3KcbjePfZYT+SrEzVP/G/HowupTFafIA1YGra2AzY8MkNlEx74ZI9lsuYc1XF7fGSbajEDZ4aKRYCzBIPvscAAM0LTfNvGdnU0CjfAF0ln4=;
X-UUID: 736deb4289794115b06d9e12ca85729c-20210815
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 494859539; Sun, 15 Aug 2021 18:06:00 -0700
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 18:05:58 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 16 Aug 2021 09:05:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 09:05:53 +0800
Message-ID: <aef8182ffa2142f2c8ed6bda463d3c127530deae.camel@mediatek.com>
Subject: Re: [PATCH v6 2/9] mtk-mdp: add driver to probe mdp components
From: houlong wei <houlong.wei@mediatek.com>
To: Eizan Miyamoto <eizan@chromium.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "wenst@chromium.org" <wenst@chromium.org>, Yong Wu
 =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?= <Yong.Wu@mediatek.com>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, Andrew-CT Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= <Andrew-CT.Chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Minghsiu Tsai
 =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= <Minghsiu.Tsai@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date: Mon, 16 Aug 2021 09:05:54 +0800
In-Reply-To: <20210802220943.v6.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A659D5C5114DCB0D519E7AE6BF06F886D97DA649E2D55A72D3EC3A65199A1B172000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_180603_228987_F6442CD1 
X-CRM114-Status: GOOD (  29.00  )
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

On Mon, 2021-08-02 at 20:12 +0800, Eizan Miyamoto wrote:
> Broadly, this patch (1) adds a driver for various MTK MDP components
> to
> go alongside the main MTK MDP driver, and (2) hooks them all together
> using the component framework.
> 
> (1) Up until now, the MTK MDP driver controls 8 devices in the device
> tree on its own. When running tests for the hardware video decoder,
> we
> found that the iommus and LARBs were not being properly configured.
> To
> configure them, a driver for each be added to mtk_mdp_comp so that
> mtk_iommu_add_device() can (eventually) be called from
> dma_configure()
> inside really_probe().
> 
> (2) The integration into the component framework allows us to defer
> the
> registration with the v4l2 subsystem until all the MDP-related
> devices
> have been probed, so that the relevant device node does not become
> available until initialization of all the components is complete.
> 
> Some notes about how the component framework has been integrated:
> 
> - The driver for the rdma0 component serves double duty as the
> "master"
>   (aggregate) driver as well as a component driver. This is a non-
> ideal
>   compromise until a better solution is developed. This device is
>   differentiated from the rest by checking for a "mediatek,vpu"
> property
>   in the device node.
> 
> - The list of mdp components remains hard-coded as
> mtk_mdp_comp_dt_ids[]
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
> - When the set of components devices that have been probed
> corresponds
>   with the list that is generated by the "master", the callback to
>   mtk_mdp_master_bind() is made, which then calls the component bind
>   functions.
> 
> - Inside mtk_mdp_master_bind(), once all the component bind functions
>   have been called, we can then register our device to the v4l2
>   subsystem.
> 
> - The call to pm_runtime_enable() in the master device is called
> after
>   all the components have been registered by their bind() functions
>   called by mtk_mtp_master_bind(). As a result, the list of
> components
>   will not change while power management callbacks mtk_mdp_suspend()/
>   resume() are accessing the list of components.
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
> 

Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>

> (no changes since v1)
> 
[...]
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
