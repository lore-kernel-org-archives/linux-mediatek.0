Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A3EC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 06:12:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A6B22B37
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 06:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A6B22B37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wM5IpmeNPeVDy01CiaJcWDmgz08eAoILJwU6a3ONRac=; b=qFPkb4YXQ+HqL55WQlSEZMuiT
	WlG1XiiOBllnNFzJIoODvbZWMju2It4N9Wgs8M6obxj8I7ifA1swMQduMYDI8Df8DzavEfi57cWiI
	zD2r7obYl90HGs+VymZsIKWji/B+HO4BsjpTzyCd4k4LJRjjGWAJM+xVm4Njy1nEcJoY6jCBhdUkm
	it6rdwraArwxe3W1Yx9NuiG0snxxcm9lM0HlWavgZcKsCuB53MGhIBYaSwQRR+QGnNmeCIOoqTdZD
	fL+rZz3OTO1DKRmL+LOcyHPMioXzk6Vvy946DpuDCs4fvhBkHKFkdSIztCqeei9Pmh/GJk/HyTF6e
	G01MXa/iQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4HaQ-0003Ds-2B; Tue, 26 Jan 2021 06:12:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4HaL-0003D1-LB; Tue, 26 Jan 2021 06:12:18 +0000
X-UUID: 36d7c2f5a1144f46a95d1b4d3e14c8af-20210125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2hSKPuelvgSnXJYZEXWh9wgPzMnweZ+FfzYCevNXc1E=; 
 b=IYxm+Yw0avS/AccpVuBr6WyCpjM79EwkNta4Y6x9vwq4bCKspodos6vnej0ybQGz/44FFbbWjgZnHUGMOrkF3qa9XlUBP/KdZroaiGQfon1QI91PZGl8P/TLmDBn4yYTWo1DV899OOBPs/APequzv4NRAIl2XtwjdZNBaxsRrvw=;
X-UUID: 36d7c2f5a1144f46a95d1b4d3e14c8af-20210125
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 955760266; Mon, 25 Jan 2021 22:12:11 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Jan 2021 22:12:09 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Jan 2021 14:12:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Jan 2021 14:12:04 +0800
Message-ID: <1611641524.5302.10.camel@mhfsdcap03>
Subject: Re: [PATCH 2/3] memory: mtk-smi: Add module_exit and module_license
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 26 Jan 2021 14:12:04 +0800
In-Reply-To: <20210125104033.2ewzumhmagmouvo5@kozik-lap>
References: <20210121062429.26504-1-yong.wu@mediatek.com>
 <20210121062429.26504-3-yong.wu@mediatek.com>
 <20210122213427.mwjyjn2wsgnko7mk@kozik-lap>
 <1611557381.3184.21.camel@mhfsdcap03>
 <20210125084051.ipgeu2ksucdag2u4@kozik-lap>
 <1611566885.5302.4.camel@mhfsdcap03>
 <20210125104033.2ewzumhmagmouvo5@kozik-lap>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8CD6A93D9A786D93DC46E5015D38F6B1D57C4AF0878B687D987EA2D78D9546862000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_011217_895080_FBBC7241 
X-CRM114-Status: GOOD (  31.33  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, yi.kuo@mediatek.com, Tomasz
 Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-01-25 at 11:40 +0100, Krzysztof Kozlowski wrote:
> On Mon, Jan 25, 2021 at 05:28:05PM +0800, Yong Wu wrote:
> > On Mon, 2021-01-25 at 09:40 +0100, Krzysztof Kozlowski wrote:
> > > On Mon, Jan 25, 2021 at 02:49:41PM +0800, Yong Wu wrote:
> > > > On Fri, 2021-01-22 at 22:34 +0100, Krzysztof Kozlowski wrote:
> > > > > On Thu, Jan 21, 2021 at 02:24:28PM +0800, Yong Wu wrote:
> > > > > > The config MTK_SMI always depends on MTK_IOMMU which is built-in
> > > > > > currently. Thus we don't have module_exit before. This patch adds
> > > > > > module_exit and module_license. It is a preparing patch for supporting
> > > > > > MTK_SMI could been built as a module.
> > > > > > 
> > > > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > > > ---
> > > > > >  drivers/memory/mtk-smi.c | 10 ++++++++++
> > > > > >  1 file changed, 10 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > > > > > index e2aebd2bfa8e..aa2a25abf04f 100644
> > > > > > --- a/drivers/memory/mtk-smi.c
> > > > > > +++ b/drivers/memory/mtk-smi.c
> > > > > > @@ -597,3 +597,13 @@ static int __init mtk_smi_init(void)
> > > > > >  	return platform_register_drivers(smidrivers, ARRAY_SIZE(smidrivers));
> > > > > >  }
> > > > > >  module_init(mtk_smi_init);
> > > > > > +
> > > > > > +static void __exit mtk_smi_exit(void)
> > > > > > +{
> > > > > > +	platform_unregister_drivers(smidrivers, ARRAY_SIZE(smidrivers));
> > > > > > +}
> > > > > > +module_exit(mtk_smi_exit);
> > > > > > +
> > > > > > +MODULE_DESCRIPTION("MediaTek SMI driver");
> > > > > > +MODULE_ALIAS("platform:MediaTek-SMI");
> > > > > 
> > > > > Drivers do not use capital letters, so I have doubts whether this alias
> > > > > is correct.
> > > > 
> > > > I didn't care the upper/lower-case. I will change to lower case in next
> > > > time.
> > > 
> > > Then why do you need the alias? The name does not match driver name, so
> > > what's the purpose of this alias/
> > 
> > I think it is not so necessary for us. I will delete this line in next
> > version.
> > 
> > Only curious what's alias is fit in our case? normally it should be the
> > file name: mtk-smi?
> 
> If autoloading of your module works, then remove it. The alias is
> necessary for some cases when a device table is missing (e.g. platform
> driver is matched via devicetree but not having the platform_device_id
> table) or matching is done via different method (e.g. driver is matched
> from MFD via devicetree compatible even though there is a
> platform_device_id table).

Thanks for explaination so detailly. v2 is sent just now.

> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
