Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DE5C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 06:50:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10DAE229C5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 06:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10DAE229C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sncKV5bXHRkWAq5Y7Sz3hdEZHa9fzRHwppAEHZggF1g=; b=zVKApP3LaQnjxvehwpsLRWcbT
	3Zdg5pyjrZMvNgvnhX1ivBdMh0wknU/Qvn0tBV6s7QKWqdIObbWPMGB1HEuKbo9gSEuuSH5B1hXT8
	pz2Dl7hR8V4KmqOtnCf0LqnFERyFO/lgz/DXSX81K1cChjtTBff01FwulcdIE+5o/XzStx30javhc
	TBUCJKAAFUrOM2h6puoLwfR42ED6sqE6u5psdkCoTgHfDZ4gcd0C4i22s9y6vt6IwowC9CRuFuIyj
	RGx43GQ5AR1yKsqtMtCUusO2+AL0YtMIoomc9Re86m+MehFcaOXEDF0yIpkLVQEhlYuGPS2XuLBQA
	GbZ6BRNXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3vhS-00032W-Ev; Mon, 25 Jan 2021 06:50:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3vhL-00030f-NH; Mon, 25 Jan 2021 06:50:05 +0000
X-UUID: 91350289f2f244a49d52aa2c98ed9dc4-20210124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3sZdh7RRXxrc49QzROkGUluZgplDjz302X96USm+z90=; 
 b=lyNGNdf5ifIoBUKAMKQgVbnok7yPFUzj3s3YAglLUZiehZAHJwW6J3WzUtL2DXFatZwf7Xes3OvHu1/Zgs1aFeR2Bs3IMGbeNyQbLxvJ684Svru+w6ux+OMr1ILAFSTZYe/EK6L2Tg9pw9ZqZM1RVI8FGjYfNDCy/2nQPbJSmrQ=;
X-UUID: 91350289f2f244a49d52aa2c98ed9dc4-20210124
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1057698052; Sun, 24 Jan 2021 22:49:54 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Jan 2021 22:49:53 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 Jan 2021 14:49:45 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Jan 2021 14:49:44 +0800
Message-ID: <1611557384.3184.22.camel@mhfsdcap03>
Subject: Re: [PATCH 3/3] memory: mtk-smi: Switch MTK_SMI to tristate
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 25 Jan 2021 14:49:44 +0800
In-Reply-To: <20210122213558.qnboqc4obdmipxs4@kozik-lap>
References: <20210121062429.26504-1-yong.wu@mediatek.com>
 <20210121062429.26504-4-yong.wu@mediatek.com>
 <20210122213558.qnboqc4obdmipxs4@kozik-lap>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1D28C57D2118177B6DC247476BBB989F212A870F3047A08E71A51B66345267EE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_015003_993835_66E70189 
X-CRM114-Status: GOOD (  28.56  )
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

On Fri, 2021-01-22 at 22:35 +0100, Krzysztof Kozlowski wrote:
> On Thu, Jan 21, 2021 at 02:24:29PM +0800, Yong Wu wrote:
> > This patch switches MTK_SMI to tristate. Support it could be 'm'.
> > 
> > Meanwhile, Fix a build issue while MTK_SMI is built as module.
> 
> s/Fix/fix.
> 
> What error is being fixed here? How can I reproduce it? Aren't you just
> adjusting it to being buildable by module?

Sorry, I didn't copy the fail log here. This is the build log:

In file included from .../drivers/iommu/mtk_iommu.c:34:0:
.../drivers/iommu/mtk_iommu.h:84:28: error: array type has incomplete
element type 'struct mtk_smi_larb_iommu'
  struct mtk_smi_larb_iommu larb_imu[MTK_LARB_NR_MAX];

Our iommu driver will use this structure. but it was contained by
"#ifdef CONFIG_MTK_SMI". thus I change it to "#if
IS_ENABLED(CONFIG_MTK_SMI)"

If reproducing it, we should change mtk-iommu to module_init[1]. and
switch kconfig MTK_IOMMU to tristate, then change the CONFIG_MTK_IOMMU
to m. we could get the fail log.

In this case, Should I squash this change into this patch? I though this
is a preparing patch and the fail is caused by MTK_SMI. thus I squash
that into this patch. or change it as a independent patch and send when
I change MTK_IOMMU to tristate?

[1]
https://lore.kernel.org/linux-mediatek/1590826218-23653-14-git-send-email-yong.wu@mediatek.com/


> 
> Best regards,
> Krzysztof
> 
> 
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> > This patch has a little conflict with the mt8192 iommu patch which
> > delete the MTK_LARB_NR_MAX in smi.h(It's still reviewing).
> > This patch rebase on the clean v5.11-rc1.
> > ---
> >  drivers/memory/Kconfig     | 2 +-
> >  include/soc/mediatek/smi.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> > index 3ea6913df176..d5f0f4680880 100644
> > --- a/drivers/memory/Kconfig
> > +++ b/drivers/memory/Kconfig
> > @@ -173,7 +173,7 @@ config JZ4780_NEMC
> >  	  memory devices such as NAND and SRAM.
> >  
> >  config MTK_SMI
> > -	bool "Mediatek SoC Memory Controller driver" if COMPILE_TEST
> > +	tristate "Mediatek SoC Memory Controller driver" if COMPILE_TEST
> >  	depends on ARCH_MEDIATEK || COMPILE_TEST
> >  	help
> >  	  This driver is for the Memory Controller module in MediaTek SoCs,
> > diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
> > index 5a34b87d89e3..29e2fb8f33d6 100644
> > --- a/include/soc/mediatek/smi.h
> > +++ b/include/soc/mediatek/smi.h
> > @@ -9,7 +9,7 @@
> >  #include <linux/bitops.h>
> >  #include <linux/device.h>
> >  
> > -#ifdef CONFIG_MTK_SMI
> > +#if IS_ENABLED(CONFIG_MTK_SMI)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
