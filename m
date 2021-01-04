Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35829C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 03:19:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 753D820DD4
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 03:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 753D820DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ihn6EVvuSClDgjIy5yVPbbyf9ogg0xhDEq63BWSvsdg=; b=NoJVOobPfrSvVQTSX44g8pq1Jd
	VFwgPdTID6hwDLDYdewlMVIhSQyABT+6kEZqqZn5VMVuTq9PBpZY02CezlgDpB0HR0EBV2R7ZOJSI
	9JpRmSyzWZhNt9ia6LD1Nc3Cmh+bxB966gC1vs8tJeIV4YV/dRh6k+fw3kLqdJVwpiWsVeNDc7D1E
	Pse2W39dMgDw77eqFYBsa18GR+yRuq/rdStMXgPMWRRki0JOE4rCgPouwVek47KqwFjj3Y1vaT/uM
	09qbhf7whd3RU57//294UNyRAvVgCscBHQkOvMpPZc+DUDXHLdJE07Z1liMlgKtTcGXU9j4AN8bBQ
	myGM2PCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwGOc-00037Y-LP; Mon, 04 Jan 2021 03:19:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwGOW-00035X-Lu; Mon, 04 Jan 2021 03:18:58 +0000
X-UUID: eb4d2e3fc15141c0b51f5fdc6cc3f837-20210103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=FPK9ETN/EBdUIpqEXkfjhWCeHs6PHnTTo754Tn/L8j8=; 
 b=lPLmCKpnnNTHryJBkOdTMntgUW3zQec55YYxMIW/moUHzOxYOWyPqjEHTG4tX3i5V0FM9+Ui/2s/Fl0MaBbwXKz0TZJ+CEfFCok/X/aRp41WZBjsmsOBwRW3KPJFiGYDNQFByR84xX67ZrFjA3+zaSOGdmI/acVbLTAEiid2Geg=;
X-UUID: eb4d2e3fc15141c0b51f5fdc6cc3f837-20210103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 365835068; Sun, 03 Jan 2021 19:18:48 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 Jan 2021 19:08:46 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 4 Jan 2021 11:08:44 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 4 Jan 2021 11:08:43 +0800
Message-ID: <1609729722.1574.1.camel@mhfsdcap03>
Subject: Re: [PATCH v3, 1/8] soc: mediatek: mmsys: create mmsys folder
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 4 Jan 2021 11:08:42 +0800
In-Reply-To: <CANMq1KCRBz-rY6y3nHp8yh_QSohkmaYS=DqNDSPzvwmq-a09DQ@mail.gmail.com>
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-2-git-send-email-yongqiang.niu@mediatek.com>
 <CANMq1KCRBz-rY6y3nHp8yh_QSohkmaYS=DqNDSPzvwmq-a09DQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_221857_623587_6A67CB4E 
X-CRM114-Status: GOOD (  21.12  )
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

the rename message displayed when git commit -s
git show will not show the rename information

> 
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

it will be fixed in next version

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
