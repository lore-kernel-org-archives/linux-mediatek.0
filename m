Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DC4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 03:09:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF44A60F56
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 03:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF44A60F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7jIHG3AJrcdRNHfgu7JorQJjAVSlfLRSNsbOTg5Ulg=; b=aRdGVG/D9lDMim
	Y9N1Mq3q/spLGBvChh8DCY1IE6W75OgZGfnUW5H4IsrVIedC9+vx1UY0xWj2PEj33q5mtvU1ouhNh
	+bs0B9ct/J1psWHPyQ8j/mEBv9tmIbtwlc4KIUWQDnTpwVn7O8qhe4Jt4EOEQ+fkKhScIEyq+qXOE
	fyshxlSl0BUn3XxwKPmZmhwa+unQPhywDUMKM92GZivN9rUIUbSr0C6XavYYXrCuu8qNqF3SVVpmd
	i0pn3NsanucFsNQAv/0Zl1E8fD89pBsi6mteC4l7TbORwz5ED/zsyVyWEpjOdzBCWAXyO2fx5vUjx
	86RPwSY69k8tcFzgP4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLzZI-00Asju-EM; Fri, 03 Sep 2021 03:08:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLzZ2-00Asha-6X; Fri, 03 Sep 2021 03:08:29 +0000
X-UUID: fd1e798ed9894395ad79e02bff381bda-20210902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=I7eErvKCjKSoZMUT8uEkUsYqIR3doV0E2tnrfW34Oyc=; 
 b=t1/A0CMwFK6DR/affEE0ye5ClSnjIKHGU3OBDCvCPOyO6Od+E/xqbUNw/ziy6jRhv6U3JgQdb6P3rlYIqukW4kA2N3h101qXVVMfKpmIbk+LHu9cZJdrA4nBgIjLrZ5XPD4s0ZJzd5KdzZMwvE0+EcR13iNfDv0IZ8eCkAtNAB4=;
X-UUID: fd1e798ed9894395ad79e02bff381bda-20210902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1949264595; Thu, 02 Sep 2021 20:08:20 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 20:08:18 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 3 Sep 2021 11:08:15 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Sep 2021 11:08:14 +0800
Message-ID: <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Irui Wang
 <irui.wang@mediatek.com>, linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 3 Sep 2021 11:08:13 +0800
In-Reply-To: <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_200826_021267_02D679EA 
X-CRM114-Status: GOOD (  37.15  )
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

Hi Ezequiel,

Thanks for your suggestion.
On Thu, 2021-09-02 at 13:30 -0300, Ezequiel Garcia wrote:
> On Wed, 1 Sept 2021 at 05:32, Yunfei Dong <yunfei.dong@mediatek.com>
> wrote:
> > 
> > This series adds support for multi hardware decode into mtk-vcodec, 
> > by first
> > adding component framework to manage each hardware information:
> > interrupt,
> > clock, register bases and power. Secondly add core thread to deal
> > with core
> > hardware message, at the same time, add msg queue for different
> > hardware
> > share messages. Lastly, the architecture of different specs are not
> > the same,
> > using specs type to separate them.
> > 
> > This series has been tested with both MT8183 and MT8173. Decoding
> > was working
> > for both chips.
> > 
> > Patches 1~3 rewrite get register bases and power on/off interface.
> > 
> > Patch 4 add component framework to support multi hardware.
> > 
> > Patch 5 separate video encoder and decoder document
> > 
> > Patches 6-15 add interfaces to support core hardware.
> > ----
> > This patch dependents on : "media: mtk-vcodec: support for MT8183
> > decoder"[1] and
> > "Mediatek MT8192 clock support"[2].
> > 
> > 1: Multi hardware decode is based on stateless decoder, MT8183 is
> > the first time
> > to add stateless decoder. Otherwise it will cause conflict. This
> > patch will be
> > accepted in 5.15[1].
> > 
> > 2: The definition of decoder clocks are in mt8192-clk.h, this patch
> > already in clk tree[2].
> > 
> > [1]
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=5826
> > [2]
> > https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=f35f1a23e0e12e3173e9e9dedbc150d139027189
> > ----
> > Changes compared with v5:
> > -Add decoder hardware block diagram for patch 13/15
> > 
> 
> 
> The discussion on v5 was still on-going, so sending this v6
> is not helpful. The context for v5's discussion is now harder to
> find.
> 

> Please avoid sending a new version without properly
> discussing all the feedback, and without reaching consensus.
> This is very important, please keep it in mind.
> 
Thanks for your remind, I will keep this patch until get the solution.

> Specifically, the feedback on v5 was NAK, with the request to avoid
> using any async framework, and instead try to find a simpler
> solution.
> 
> For instance, you can model things with a bus-like pattern,
> which ties all the devices together, under a parent node.
> This pattern is common in the kernel, the parent
> node can use of_platform_populate or similar
> (git grep of_platform_populate, you will see plenty of examples).
> 
> You will still have to do some work to have the proper
> regs resources, but this is doable. Each child is a device,
> so it can have its own resources (clocks, interrupts, iommus).
> 
> You don't need any async framework.
> 
If put the lat and core node in the parent node, need to check the
below things after discussed with iommu owner.

If putting the iommus property in the child node, then is the child
device a standard platform device?

The iommu registe like this:  
ret = bus_set_iommu(&platform_bus_type, &mtk_iommu_ops); 
It expect the consumer is a standard platform device. otherwise it
could not enter to the iommu of_xlate.)

Thanks
Yunfei Dong
>     vcodec_dec: vcodec_dec@16000000 {
>         compatible = "mediatek,mt8192-vcodec-dec";
>         reg = <something>;
>         mediatek,scp = <&scp>;
>         iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
>         dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> 
>         vcodec_lat@0x10000 {
>             compatible = "mediatek,mtk-vcodec-lat";
>             reg = <0x10000 0x800>;      /* VDEC_MISC */
>             interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
>             // etc
>         };
> 
>         vcodec_core@0x25000 {
>            compatible = "mediatek,mtk-vcodec-core";
>            reg = <0x25000 0x1000>;      /* VDEC_CORE_MISC */
>            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
>            // etc
>         };
>     };
> 
> Thanks,
> Ezequiel
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
