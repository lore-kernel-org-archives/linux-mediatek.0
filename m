Return-Path: <SRS0=J3PH=OA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB95C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 11:00:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4929610C8
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 11:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4929610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ED8wmj889OASb0ydQmVuMJ5PKbjrWxgtp7JErbYH2ZQ=; b=jCgkRsh5BrS+fp
	D2nF5Ubf+aZYrCB8L2QgFtOmv6RopQaERemo2Va7UzoXoEjJ/0GfPwvjO9DN+ivVcZITdhkuMDvH1
	GrH9VurfyNiYofJKMFNmjGJMcJJaCNEoZbicZP/+sLfXcfq5B4AalBkkLVWcgAVfp1ND3Ie/+1I58
	RCsRXAKCnqdnqeOjut233o5c81sV0bGWgv21ID+oTBz68Nd6YkVvuT1MXwg2V7HgCXO+wHID5ZTqV
	zxmu+3ThiUjiiVLWDlaAwGAxoaZ5IEyKQEkwIHk8vIe1h47YiST/J1VY6Ww/2DS72BoHNsruSD0Yg
	ErVSuo+yC0X3wysJV6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOeGO-00CY9T-W4; Fri, 10 Sep 2021 11:00:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOeGL-00CY8M-Oj; Fri, 10 Sep 2021 11:00:07 +0000
X-UUID: f141df6016294a079ff65f0a2276e539-20210910
X-UUID: f141df6016294a079ff65f0a2276e539-20210910
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 544489632; Fri, 10 Sep 2021 04:00:02 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Sep 2021 03:52:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Sep 2021 18:52:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Sep 2021 18:52:21 +0800
Message-ID: <3b21154346c0a36868fb5e9ac187379be97a69c1.camel@mediatek.com>
Subject: Re: [v2 11/24] clk: mediatek: Add MT8195 ccusys clock support
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>, Devicetree
 List <devicetree@vger.kernel.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 10 Sep 2021 18:52:21 +0800
In-Reply-To: <CAGXv+5EMoZq8BohUA_OoChmEdHL988pphxUJX077hO88htRUtA@mail.gmail.com>
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-12-chun-jie.chen@mediatek.com>
 <CAGXv+5EMoZq8BohUA_OoChmEdHL988pphxUJX077hO88htRUtA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_040005_866628_77ED3FF5 
X-CRM114-Status: GOOD (  18.95  )
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

On Mon, 2021-08-23 at 20:13 +0800, Chen-Yu Tsai wrote:
> On Fri, Aug 20, 2021 at 7:23 PM Chun-Jie Chen
> <chun-jie.chen@mediatek.com> wrote:
> > 
> > Add MT8195 ccusys clock controller which provides clock gate
> > control in Camera Computing Unit.
> 
> Could you offer a bit more explanation about this unit? Is it an ISP?
> Or some other function that does computation on images?
> 

CCU could access ISP HW control register and could be used for ISP
pipeline control. The use case is like secure camera or doing post-
processing on ISP statistic data.

Thanks!
Best Regards,
Chun-Jie

> > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/clk/mediatek/Makefile         |  3 +-
> >  drivers/clk/mediatek/clk-mt8195-ccu.c | 50
> > +++++++++++++++++++++++++++
> >  2 files changed, 52 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/clk/mediatek/clk-mt8195-ccu.c
> > 
> > diff --git a/drivers/clk/mediatek/Makefile
> > b/drivers/clk/mediatek/Makefile
> > index 718bbb04191b..03fb020834f3 100644
> > --- a/drivers/clk/mediatek/Makefile
> > +++ b/drivers/clk/mediatek/Makefile
> > @@ -80,6 +80,7 @@ obj-$(CONFIG_COMMON_CLK_MT8192_MSDC) += clk-
> > mt8192-msdc.o
> >  obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
> >  obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
> >  obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
> > -obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-
> > mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-
> > mt8195-cam.o
> > +obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-
> > mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-
> > mt8195-cam.o \
> > +                                       clk-mt8195-ccu.o
> 
> When wrapping, please align with previous line. "clk-mt8195-ccu.o"
> should
> align with "clk-mt8195-apmixedsys.o".
> 
> 
> ChenYu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
