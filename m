Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AA0C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 05:57:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0492A20DD4
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 05:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0492A20DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NMwBv+Ik01Tn0Oaoqpk6t5EhLifO2XvVLnhXUIpi+A=; b=XDDPP8BribeoqORmstaLwYooLH
	TJ2VX5TcJlZJy1/+FU6q5gXXDBQ07TEYX8ch9+6+F7gTrM21jBpb5Aji4TwMJe25uzKFsIaHChIZl
	SOOLsb0hx3l7e229zJXhodYjvz4Cm5M/vyvzxTSUPpWKYfJwZ09foyb579ipE4URNsM3VwfrqNrlY
	7jPuXnOXNK0uB4ZMpvvCm7asJQoiLK/inblPwwDR7PzAT6iGOrLRzQ7bnrgy/Z+TCOVxCTt8N6uoB
	1ZJZ09bwIRkHSdtoXYmJc9/nafIHIbHgYqnOW09MSp6riVWs84JA7NPmpaGERhGIMHpXJ8R2Vbg12
	OBpFbX+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwIs7-0008NQ-7o; Mon, 04 Jan 2021 05:57:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwIs3-0008MQ-9k; Mon, 04 Jan 2021 05:57:36 +0000
X-UUID: 6d4e5dff216a4dedbb8b620eb65ec3a9-20210103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=QCHz3/xaCDIL21iydEhVWPDFe6T2A74wm/k7ncOkQ2s=; 
 b=tI9gLUCbvthOatbvvw4qJyzGRXi2r/wjliPxikRn3ktx5mB2tdkwTpr0JBpThrVkMdmqK1OPUGcB9mJsHbfhLBjm7tQMLFuL2fEEkhckSHS5EP6YVuifugIE8LQdNpQCnwHedX1GQP59hc9Ni3Mk/IpkK7ntLEwQs4mMr82MP1w=;
X-UUID: 6d4e5dff216a4dedbb8b620eb65ec3a9-20210103
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1633977428; Sun, 03 Jan 2021 21:57:28 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 Jan 2021 21:57:27 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 4 Jan 2021 13:57:25 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 4 Jan 2021 13:57:23 +0800
Message-ID: <1609739844.1574.2.camel@mhfsdcap03>
Subject: Re: [PATCH v3, 1/8] soc: mediatek: mmsys: create mmsys folder
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 4 Jan 2021 13:57:24 +0800
In-Reply-To: <CANMq1KCRBz-rY6y3nHp8yh_QSohkmaYS=DqNDSPzvwmq-a09DQ@mail.gmail.com>
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-2-git-send-email-yongqiang.niu@mediatek.com>
 <CANMq1KCRBz-rY6y3nHp8yh_QSohkmaYS=DqNDSPzvwmq-a09DQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_005735_582171_55B46357 
X-CRM114-Status: GOOD (  21.61  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, Daniel
 Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-31 at 09:21 +0800, Nicolas Boichat wrote:
> On Mon, Dec 28, 2020 at 4:38 PM Yongqiang Niu
> <yongqiang.niu@mediatek.com> wrote:
> >
> > the mmsys will more and more complicated after support
> > more and more SoCs, add an independent folder will be
> > more clear
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/Makefile          |   2 +-
> >  drivers/soc/mediatek/mmsys/Makefile    |   2 +
> >  drivers/soc/mediatek/mmsys/mtk-mmsys.c | 380 +++++++++++++++++++++++++++++++++
> >  drivers/soc/mediatek/mtk-mmsys.c       | 380 ---------------------------------
> 
> I wonder why this doesn't get detected as a rename?
> 

git commit --amend
[detached HEAD 1f10c05] soc: mediatek: mmsys: create mmsys folder
 3 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/mmsys/Makefile
 rename drivers/soc/mediatek/{ => mmsys}/mtk-mmsys.c (100%)


> >  4 files changed, 383 insertions(+), 381 deletions(-)
> >  create mode 100644 drivers/soc/mediatek/mmsys/Makefile
> >  create mode 100644 drivers/soc/mediatek/mmsys/mtk-mmsys.c
> >  delete mode 100644 drivers/soc/mediatek/mtk-mmsys.c
> >
> > diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> > index 01f9f87..b5987ca 100644
> > --- a/drivers/soc/mediatek/Makefile
> > +++ b/drivers/soc/mediatek/Makefile
> > @@ -3,4 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
> >  obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
> >  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
> >  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> > -obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> > +obj-$(CONFIG_MTK_MMSYS) += mmsys/
> > diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
> > new file mode 100644
> > index 0000000..5d976d7
> > --- /dev/null
> > +++ b/drivers/soc/mediatek/mmsys/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> > \ No newline at end of file
> 
> Nit: newline at end of file please.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
