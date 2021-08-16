Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337F0C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 01:21:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0505D6140A
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 01:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0505D6140A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qwqKmdAUTjbhbPshvY3ES9+3aaJNNcA005RLOuvJ7hg=; b=3X42NoLlE6MZSc
	S3/una443o4o4Idh4smKAgRrHrTDItCt1h+SsBPvGz0aTD7arDykjMTZZLgf0GFuhFr6AXSsWuLPc
	QhPUsJ0d1JCYN8vGeleLOGFpAJFC76VP8QdtOARyJhOmbaITru89y3KGSjTPRY0l7mDYok5sNv6Qf
	A34DWEOHM/RvaGX22229FHXlpN48NHNpKARi4tYjVaaan/P5ODwsHn9gkC/hpNJIraJgpNhYFaYrN
	kjgsACvpk67o+YrOjP0a0yERakXs5bkYCcu5knmVcM2kr5zIE8DVwYz85NJ7ZEDge/cZGGoTqtJad
	9CcuPbSBEs37VgY4VrbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFRJs-00FxMn-2T; Mon, 16 Aug 2021 01:21:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFRJa-00FxGx-Sy; Mon, 16 Aug 2021 01:21:26 +0000
X-UUID: 1e2ed98a68e847ffbdaa540f0adf5936-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RQEr/zdFCuICuxl+OW0xx9STP8PX6Pu3KpkKJuqMDno=; 
 b=NLBm1rf6bbb9i0odKI5Fuzy7VTdlxueYeYsB4qTSDbhVPWeSN1CC2LvMuSLDLo0IfhfW36MFhCEx1tMG4430g7kpFcgu8AWKt+Yu6sBuiO9NYMe34AW/kp1lguTnASe5yWWqqiONf6XUwjlH5EGwaaL7knDdkJSQRPaI7ba+lzk=;
X-UUID: 1e2ed98a68e847ffbdaa540f0adf5936-20210815
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1854246082; Sun, 15 Aug 2021 18:21:20 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 18:15:11 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 16 Aug 2021 09:15:06 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 09:15:06 +0800
Message-ID: <4d2e4210c74f7fe14d933571df768dc58a1e9266.camel@mediatek.com>
Subject: Re: [PATCH v6 5/9] mtk-mdp: make mdp driver to be loadable by
 platform_device_register*()
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
Date: Mon, 16 Aug 2021 09:15:07 +0800
In-Reply-To: <20210802220943.v6.5.Iedb6b4f47788548b0cf7bfffae85cac917344c2f@changeid>
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.5.Iedb6b4f47788548b0cf7bfffae85cac917344c2f@changeid>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 680883F27902D823AF960F84F7F7E0839A133A61DAECBD205F7E444452E6F9492000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_182122_968799_37A5A68E 
X-CRM114-Status: GOOD (  21.55  )
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
> Rather than hanging the MDP master component driver off of the rdma0
> device, make it possible too create a "virtual" device by registering
> it with platform_device_register_*() to be probed by the mtk_mdp_core
> driver.
> 
> Broadly, three interdependent things are done by this change:
> - Make it is possible to search for MDP devices in the device tree
>   through the grandparent device's of_node.
> - v4l-related setup is moved into from the mtk_mdp_core driver to the
>   mtk_mdp_comp driver.
> - Presence of a mediatek,vpu property in an MDP component device node
>   is used to determine what device to use when dispatching DMA ops
> from
>   the relevant ioctl, and also do V4L2 initialization in this case.
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---

Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>

> Changes in v6:
> - Don't propagate errors from clock_on/off as an afterthought.
> - Split apart modifying mdp driver to be loadable from mmsys from
>   actually loading it from mmsys into two changs to make review
> easier.
> - Update devicetree bindings to reflect no longer needing the
>   mediatek,vpu property in the mdp_rdma0 device node.
> - Some stylistic cleanups.
> 
> Changes in v5:
> - rebase and test on 5.13-next @ e2f74b13dbe6
> 
> Changes in v4:
> - rebase and test on 5.13
> - don't depend on 
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=464873
> 
> Changes in v3:
> - get mdp master from aliases instead of strcmp against of_node->name
> 
> Changes in v2:
> - rebased onto Linux 5.12
> - 100 char line length allowance was utilized in a few places
> - Removal of a redundant dev_err() print at the end of
>   mtk_mdp_comp_init()
> - Instead of printing errors and ignoring them, I've added a patch to
>   correctly propagate them.
> - Use of C style comments.
> - Three additional patches were added to eliminate dependency on the
>   mediatek,vpu property inside the mdp_rdma0 device node.

[...]
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
