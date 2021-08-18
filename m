Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A9CC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 15:43:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FFAF6101A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 15:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FFAF6101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDTnR6M9P0M+3PUcwbc3AjjwxuazJB2cI6YgjkXQhpI=; b=ahT3LOFNwKDVWW
	GGSiQqPQ2H85G6JG2KWXxd5gknC+4Cf+RUsQfzlEhwN4eX4Kx2H7JBH7nOs+k3SE75OKZjtVJnUb+
	7Z5PQz1p5uiVZgiNvaNnsUcDeX4Uc+IAjGFnRezJC2njP3dbp9+Zggx/zpT00v3qKw0t5pIxPw6ev
	rSpuWnEEp+moZGYEv8qOVX8BcAQSHgXe12WAzSWLElr9QO2aKwQYiz0pSeN776ZjY/PhIxBRHJpDi
	uwD01LH3Cge4FtaH/qYHoOuWDhfKKu8Em6XbnwwO8PSNLxw0I9LrFHaa1FTVfvh79WP5Rf027huk1
	40qQKbWFtDSLO1mz+QIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGNiu-0065Nw-29; Wed, 18 Aug 2021 15:43:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGNiV-0065Gb-7Q; Wed, 18 Aug 2021 15:43:03 +0000
X-UUID: ef5bc703514f4bd9b4ac4f760354c15b-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=86dDfb5H+rm8NM4C/7EdNI/WVjklVl5YtluKeCEmmaM=; 
 b=eNAVTRP/8B0Cd9Y+OmdpIOZuavkd4hWENR14F5n8GYSyF2kQ2akOrTcuVART60ga2cugPN2BIeUdhAsIuuYnTje8EEMIrY0hjr+SMuA6/mem8HOy81H4kzF/0VjLBSO+pJv1lYgodFkkYfPdrQ1kaRfUaW+1fwmZ4rx0vHjIscg=;
X-UUID: ef5bc703514f4bd9b4ac4f760354c15b-20210818
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 376009704; Wed, 18 Aug 2021 08:42:51 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 08:42:49 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 18 Aug 2021 23:42:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Aug 2021 23:42:44 +0800
Message-ID: <14b9c2efb28d84712b7b4e7b67b6c87558cd9f5d.camel@mediatek.com>
Subject: Re: [PATCH v6 7/9] media: mtk-mdp: use mdp-rdma0 alias to point to
 MDP master
From: houlong wei <houlong.wei@mediatek.com>
To: Eizan Miyamoto <eizan@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wenst@chromium.org" <wenst@chromium.org>, Yong Wu
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
Date: Wed, 18 Aug 2021 23:42:45 +0800
In-Reply-To: <CAOak1e924x8E+kM2WJ3oGPxxt_R=b79BtbxPAdENamvjVamnEw@mail.gmail.com>
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
 <bf98c5ee749bca755bd46832f858536dbf51a2a4.camel@mediatek.com>
 <9f23beea197495d017a548ef483584714a3673f9.camel@mediatek.com>
 <CAOak1e924x8E+kM2WJ3oGPxxt_R=b79BtbxPAdENamvjVamnEw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5605CBA0DE33A0953E955550ED951D96D8291363804197D7A25242AB0FE584F32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_084259_319325_D6840BC4 
X-CRM114-Status: GOOD (  23.08  )
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

On Wed, 2021-08-18 at 15:50 +0800, Eizan Miyamoto wrote:
> Hi Houlong,
> 
> Thank you for your review on this series, it is much appreciated.
> 
> On Mon, Aug 16, 2021 at 2:53 PM houlong wei <houlong.wei@mediatek.com
> > wrote:
> > Is your removing "mediatek,vpu" necessary for this series "Refactor
> > MTK
> > MDP driver into core/components" ?
> 
> Removing it is not strictly necessary for the series to function, I
> will re-upload the series and omit the following changes:
> - [PATCH v6 8/9] dts: mtk-mdp: remove mediatek,vpu property from
> primary MDP device
> - [PATCH v6 9/9] dt-bindings: mediatek: remove vpu requirement from
> mtk-mdp
> 
> Do please let me know if you meant something different.
> 
> Thanks,
> 
> Eizan
> 
> 
Hi Eizan,

Thanks for your help and effort. It's exactly what I expressed.

Regards,
Houlong
> 
> 
> > 
> > In some MediaTek projects (not upstream yet), the device-tree node
> > name
> > "vpu" may be changed to something like "vpu0", "vpu1" or other
> > name,
> > which depends on the implementation of "mtk-vpu" driver. We can
> > specify
> > the different phandle to "mediatek,vpu" in .dtsi file. If we use
> > of_find_node_by_name() to get the vpu_node, we have to modify the
> > name
> > string in different project.
> > If the answer of my previous questions is "No", I prefer to slow
> > down
> > the modification of removing "mediatek,vpu".
> > 
> > Sorry for late reply.
> > 
> > Regards,
> > Houlong
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
