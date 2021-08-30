Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A90C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 18:43:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63E4D60241
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 18:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63E4D60241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KR9Kq8/YnR7v3nZYl5uGTJ9b6g/iyFugCgnkiKhfmE4=; b=BF0mnC8p3Dfbu2
	fC97YetV2aT8En5mv3ptLWEtzoyfgG3hZN2IAvtqhQmfUrI2gh0WO8ENnmXJB5+nMppSunHVUuY/y
	N6s5A5yp/1viJAe4bmWgOtdvCeGa0Bpd2GVcCa/JWPJYv5YDZZF3Pd3vf7SR/OOik3HLa6ursD3rM
	UmBCesikHveZ3Y2/u1BppRH7DQfdBK8Rh9BHOp1CvpG/owphlXVUebw/yXRobg/mgyyEyqtJbVqRe
	sx+CH0rTKOCBBC7rxckhFPz7aqeLEcClFgrfLG1Vnq7YJnNwaoPEKHFd5RNlI/+Irr6oJXY4Bx6+Y
	AYp15lTAn9RBSsutRLyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKmFl-000NiA-Hk; Mon, 30 Aug 2021 18:43:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKmFT-000Nh4-Hn; Mon, 30 Aug 2021 18:43:16 +0000
X-UUID: 6d8c6b7768e5499b899d0251ac507f03-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=crEFcIJTwJOrLYU5quGGhCcTCYZ9VLSPd8BGPPPojGA=; 
 b=BSuZvyQw78QfkmkEI6Rrv5Klossyk2XJHBT8hKa5VpcgLWC5/9MyWDcOLQbRsXNSbIeW98kBGIUReWu90oudjM/gpS83yOUH6NGqPEpHldJtqByCwiPnen9ajEAWAd+KKheb1eU7+qCCX3uq9dtf7IwOYlo9VE325CvvfrBf+Hg=;
X-UUID: 6d8c6b7768e5499b899d0251ac507f03-20210830
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1922846307; Mon, 30 Aug 2021 11:43:06 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 11:43:05 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 02:43:04 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 Aug 2021 02:43:04 +0800
Message-ID: <1630348984.24981.2.camel@mtkswgap22>
Subject: Re: [RESEND PATCH 3/4] clk: mediatek: support COMMON_CLK_MT6779
 module build
From: Miles Chen <miles.chen@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Wendell Lin <wendell.lin@mediatek.com>, "Hanks
 Chen" <hanks.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Lee Jones
 <lee.jones@linaro.org>
Date: Tue, 31 Aug 2021 02:43:04 +0800
In-Reply-To: <163021049667.2676726.10138202396240942833@swboyd.mtv.corp.google.com>
References: <20210813032429.14715-1-miles.chen@mediatek.com>
 <20210813032429.14715-4-miles.chen@mediatek.com>
 <163021049667.2676726.10138202396240942833@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_114313_046061_AE5BBEA4 
X-CRM114-Status: GOOD (  17.21  )
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

On Sat, 2021-08-28 at 21:14 -0700, Stephen Boyd wrote:
> Quoting Miles Chen (2021-08-12 20:24:28)
> > diff --git a/drivers/clk/mediatek/clk-mt6779-aud.c b/drivers/clk/mediatek/clk-mt6779-aud.c
> > index 11b209f95e25..439c0bc94b73 100644
> > --- a/drivers/clk/mediatek/clk-mt6779-aud.c
> > +++ b/drivers/clk/mediatek/clk-mt6779-aud.c
> > @@ -4,6 +4,7 @@
> >   * Author: Wendell Lin <wendell.lin@mediatek.com>
> >   */
> >  
> > +#include <linux/module.h>
> >  #include <linux/clk-provider.h>
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> > @@ -115,3 +116,4 @@ static struct platform_driver clk_mt6779_aud_drv = {
> >  };
> >  
> >  builtin_platform_driver(clk_mt6779_aud_drv);
> > +MODULE_LICENSE("GPL");
> 
> How does this work? builtin_platform_driver() means that it's not
> modular code. Shouldn't that be module_platform_driver()? Have you tried
> loading and unloading the module?

sorry for my late response. 

Thanks for pointing this out. I have the same question when I was
building this patch. That time I found some examples where
they are using builtin_platform_driver and can be built as 
kernel modules:

config CLK_IMX8QXP (tristate) && drivers/clk/imx/clk-imx8qxp-lpcg.c
config CLK_RK3399 (tristate) && drivers/clk/rockchip/clk-rk3399.c

my load test:
load these moduless and do 'lsmod' on v5.14-rc1/mt6779 environment:

clk_mt6779_aud 16384 0 [permanent], Live 0xffff800008fd8000
clk_mt6779_mfg 16384 0 [permanent], Live 0xffff800008fd0000
clk_mt6779_venc 16384 0 [permanent], Live 0xffff800008fc8000
clk_mt6779_vdec 16384 0 [permanent], Live 0xffff800008fc0000
clk_mt6779_cam 16384 0 [permanent], Live 0xffff800008fb8000
clk_mt6779_ipe 16384 0 [permanent], Live 0xffff800008fb0000
clk_mt6779_img 16384 0 [permanent], Live 0xffff800008fa8000
clk_mt6779_mm 16384 0 [permanent], Live 0xffff800008fa0000

I did not test 'unload' kernel modules because I did not
define module_exit in this patch.

But as you pointed out, it should be module_platform_driver().
I will use module_platform_driver() in the next patch.


Miles
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
