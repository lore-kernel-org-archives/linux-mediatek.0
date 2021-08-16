Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D802C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 01:11:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2081161359
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 01:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2081161359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GzRedAwl0+NqA89FI24dRiyLg+85nUUKuL2Qr7xTpK0=; b=uNgmIwwpX7aG+X
	hJ29WBNMZ8zszwYjo29/WGjVVDZzYrSnGly1PDcIz1cW/+5zbMiHBvWUPDm4BGpiqeY7VxfjZGVbr
	oF/va0XEXfHsO+gy3fKt9jeYBcs2Y/SEGPEHR15JBWEvG2oS3Y22tAEcqm/ATK7RhhnT1JVayqK53
	xv8wGVQ9OtkDuiELVJk56VJhWZeysGKtutete5capjsUTF6/JhlwZCiFnK88wlxhIRqPBtDUAhaIt
	aOPKiEYbyccsGTIzaMtaH1N3Es3kF4YygKO+0jw3akneEMViwpkCTb8y2Bn2Z9X4tyymKaHrsKNhC
	hN5CsqVbWh/Jx8S3/mdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFR9Z-00FvkV-Sx; Mon, 16 Aug 2021 01:11:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFR9K-00Fvif-EO; Mon, 16 Aug 2021 01:10:50 +0000
X-UUID: c7d6cf33b1cf493e962b195705f2fb49-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9kQBLZFj5ezpryuZ+bSvNEM9MjxNOcc+IorPW7rMt+o=; 
 b=UE4BSRmurjSNpi/cfISbz/FDyQqAc65rY7c4GwULgnLcw7OMrP8SHT7avaFXj27BGFS7yv71u1gr7uwayq3ErEZIIV8yeIYNgsjCq7YlaL+4Gp/lxMtZGINwPWaNTgHsMphgdSEE/HDQzdsEpaYqStBynwhpcW8RA+wGqkZ+uW4=;
X-UUID: c7d6cf33b1cf493e962b195705f2fb49-20210815
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 581563573; Sun, 15 Aug 2021 18:10:41 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 18:10:40 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 16 Aug 2021 09:10:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 09:10:32 +0800
Message-ID: <bef757c4a081bfb87aa3b429970e628641bf95a5.camel@mediatek.com>
Subject: Re: [PATCH v6 4/9] media: mtk-mdp: don't pm_run_time_get/put for
 master comp in clock_on
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
Date: Mon, 16 Aug 2021 09:10:33 +0800
In-Reply-To: <20210802220943.v6.4.Ifd87681955689a08cce4c65e72ee5e8c6d09af95@changeid>
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.4.Ifd87681955689a08cce4c65e72ee5e8c6d09af95@changeid>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0B2746CA6D771121B2563528A92B8BDB492B9CC0FE92280D4F162E39692BEA842000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_181046_513567_33BA04EC 
X-CRM114-Status: GOOD (  21.35  )
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
> The original intent of commit 86698b9505bbc ("media: mtk-mdp: convert
> mtk_mdp_dev.comp array to list") was to create a list to track all
> the
> MDP components that needed to have their clocks enabled/disabled when
> calling mtk_mdp_comp_clock_on/off. However, there was a bug inside
> mtk_mdp_register_component where the args to a call to list_add were
> swapped. The result is that only one component was added to
> mtk_mdp_dev.comp_list because comp_list was instead being
> repeatedly added to the single element lists headed by each
> mtk_mdp_comp.
> 
> The order of the args to list_add in mtk_mdp_register_component was
> fixed in https://patchwork.kernel.org/patch/11742895/ (Fix Null
> pointer
> dereference when calling list_add).
> 
> Then, as a result of https://patchwork.kernel.org/patch/11530769/
> (mtk-mdp: use pm_runtime in MDP component driver) if all the
> components
> are added to the component list, the mdp "master" / rdma0 component
> ends up having pm_runtime_get_sync() called on it twice recursively:
> 
>     rpm_resume+0x694/0x8f8
>     __pm_runtime_resume+0x7c/0xa0 ***NOTE***
>     mtk_mdp_comp_clock_on+0x48/0x104 [mtk_mdp]
>     mtk_mdp_pm_resume+0x2c/0x44 [mtk_mdp]
>     pm_generic_runtime_resume+0x34/0x48
>     __genpd_runtime_resume+0x6c/0x80
>     genpd_runtime_resume+0x104/0x1ac
>     __rpm_callback+0x120/0x238
>     rpm_callback+0x34/0x8c
>     rpm_resume+0x7a0/0x8f8
>     __pm_runtime_resume+0x7c/0xa0 ***NOTE***
>     mtk_mdp_m2m_start_streaming+0x2c/0x3c [mtk_mdp]
> 
> (The calls to pm_runtime_get_sync are inlined and correspond to the
> calls to __pm_runtime_resume). It is not correct to have
> pm_runtime_get_sync called recursively and the second call will block
> indefinitely.
> 
> As a result of all that, this change factors
> mtk_mdp_comp_clock_on/off
> into mtk_mdp_comp_power_on/off and moves the calls to
> pm_runtime_get/put into the power_on/off functions.
> 
> This change then special-cases the master/rdma0 MDP component and
> does
> these things:
> - the master/rdma0 component is not added to mtk_mdp_dev.comp_list
> - the master/rdma0 component has its clocks (*but not power*) toggled
>   by mtk_mpd_comp_clock_on/off inside mtk_mdp_clock_on/off.
> - the other components have their clocks *and* power toggled with
>   mtk_mdp_comp_power_on/off.
> 
> This change introduces the assumption that mtk_mdp_pm_resume will
> always be called though a callback from pm_runtime_get_sync made on
> the
> master / rdma0 component.
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
