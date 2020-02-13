Return-Path: <SRS0=7p0Y=4B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3ABC352A4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 03:05:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B6532168B
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 03:05:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O+a01zr4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WA5Lm5U1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B6532168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5DVopoVe4vgL+VRtJIGH70esVe0iJmQ8vSPkjV4UeoQ=; b=O+a01zr49oCH84
	UonMubjFTfK6zH5pxqrR/mjmQWmirqmRDd2KX7l0yrqslJ/0kQt0lTRKoTbaS3pLtaqzjEi/EFiXa
	23e3PC/nw68vRZw0iHBYMxKvhNxjUrOhVYeZeTsPKBtc4sJWAZNjz2h6KmZhGEy5f2H4XgpDTpiHQ
	UYmw2HM7qsMkZo+NvZ6DF5CFedUeMtydPgInAe/yQC/34pyJLB4MfI/aatyYYm2XM4mpO1ghEkZq+
	12LziE6vhS1GkqWzXdkrdG8TrqqEgaspabbpx56eyWkS6G3k+AzpWdN/UmVJlUg/uXNH8QPjNSUTD
	xk4aH7lj/L8S6nTP8Hzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j24p0-0006YW-2w; Thu, 13 Feb 2020 03:05:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j24ox-0006Y0-Ki; Thu, 13 Feb 2020 03:05:44 +0000
X-UUID: a8d4a218f8f84154a9e14020f5eb9ac7-20200212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LJDuwYzpSPlqh0Fy0uu3RaMajNEpsKJmu5DTiLeNbr0=; 
 b=WA5Lm5U1jNPhmeVkjrKyWQaVYv86EZF0PhqiBLm5ohDsNEuejIMcH0yeDnmQmfLDpRT5zttmgpWR07MRU9d63FnxDZu23yYNZcidKGPG+KtjeSj13/9uni54/mz9nxc5E/PViHBAtIGQ9QT6b2vlQbTEs9S/Hi9vIaI35EEjky0=;
X-UUID: a8d4a218f8f84154a9e14020f5eb9ac7-20200212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1295600476; Wed, 12 Feb 2020 19:05:36 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 18:55:34 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 10:56:00 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Feb 2020 10:54:23 +0800
Message-ID: <1581562527.19053.18.camel@mtkswgap22>
Subject: Re: [PATCH v7 5/7] soc: mediatek: add MT6765 scpsys and subdomain
 support
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Wendell Lin
 =?UTF-8?Q?=28=E6=9E=97=E7=90=A6=E8=80=80=29?= <Wendell.Lin@mediatek.com>,
 Weiyi Lu <Weiyi.Lu@mediatek.com>, Mars Cheng <mars.cheng@mediatek.com>, "Sean
 Wang" <Sean.Wang@mediatek.com>, Owen Chen <owen.chen@mediatek.com>, ";Ryder
 Lee" <Ryder.Lee@mediatek.com>, Morven-CF Yeh <Morven-CF.Yeh@mediatek.com>,
 Kevin-CW Chen <Kevin-CW.Chen@mediatek.com>, Albert-ZL Huang
 <Albert-ZL.Huang@mediatek.com>
Date: Thu, 13 Feb 2020 10:55:27 +0800
In-Reply-To: <c704bdab-8489-0b54-59de-401bc4ab24e6@gmail.com>
References: <1581067250-12744-1-git-send-email-macpaul.lin@mediatek.com>
 <1581067250-12744-6-git-send-email-macpaul.lin@mediatek.com>
 <c704bdab-8489-0b54-59de-401bc4ab24e6@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_190543_690701_A7CA3F24 
X-CRM114-Status: GOOD (  18.36  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Mediatek WSD
 Upstream <wsd_upstream@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Loda Chou <loda.chou@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Mars Cheng <mars.cheng@mediatek.com>, Will Deacon <will@kernel.org>,
 linux-clk@vger.kernel.org, Ryder Lee <Ryder.Lee@mediatek.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Evan Green <evgreen@chromium.org>,
 Yong Wu <yong.wu@mediatek.com>, Chunfeng
 Yun <chunfeng.yun@mediatek.com>, mtk01761 <wendell.lin@mediatek.com>,
 Owen Chen <owen.chen@mediatek.com>, devicetree@vger.kernel.org,
 Joerg Roedel <jroedel@suse.de>, Marc Zyngier <marc.zyngier@arm.com>, Sean
 Wang <Sean.Wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 CC Hwang <cc.hwang@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2020-02-09 at 22:26 +0100, Matthias Brugger wrote:
>
> On 07/02/2020 10:20, Macpaul Lin wrote:
> > From: Mars Cheng <mars.cheng@mediatek.com>
> > 
> > This adds scpsys support for MT6765
> > Add subdomain support for MT6765:
> > isp, mm, connsys, mfg, and cam.
> > 
> > Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> > Signed-off-by: Owen Chen <owen.chen@mediatek.com>
> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-scpsys.c | 130 ++++++++++++++++++++++++++++++
> >  1 file changed, 130 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> > index f669d3754627..9940c6d13222 100644
> > --- a/drivers/soc/mediatek/mtk-scpsys.c
> > +++ b/drivers/soc/mediatek/mtk-scpsys.c
> > @@ -15,6 +15,7 @@
> >  
> >  #include <dt-bindings/power/mt2701-power.h>
> >  #include <dt-bindings/power/mt2712-power.h>
> > +#include <dt-bindings/power/mt6765-power.h>
> >  #include <dt-bindings/power/mt6797-power.h>
> >  #include <dt-bindings/power/mt7622-power.h>
> >  #include <dt-bindings/power/mt7623a-power.h>
> > @@ -749,6 +750,120 @@ static const struct scp_subdomain scp_subdomain_mt2712[] = {
> >  	{MT2712_POWER_DOMAIN_MFG_SC2, MT2712_POWER_DOMAIN_MFG_SC3},
> >  };
> >  
> > +/*
> > + * MT6765 power domain support
> > + */
> > +#define SPM_PWR_STATUS_MT6765			0x0180
> > +#define SPM_PWR_STATUS_2ND_MT6765		0x0184
> > +
> 
> The offsets are the same as for MT6797. Could we rename the define to something
> generic and move it up and put it just under SPM_PWR_STATUS_2ND? Probably as a
> separate patch.
> 
> Regards,
> Matthias
> 
Loop more related owners in this mail loop.

After check it with our clock driver owners, there are different
generations of clock IPs. Because different smart phone chips require
different cost-function oriented design, even they use the same
generation of clock IPs, might not have the same offsets. Take MT6765
and MT6797 for example, the listed offsets are just coincidence.

Our clock driver owners will work on this to summarize the common offset
parts for each generations, but at this moment, we suggest just separate
the files for mt6797 and mt6765. Commonly used header should be come
with the next chip which clock IP just the same generation of mt6797 or
mt6765.

Thanks
Macpaul Lin


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
