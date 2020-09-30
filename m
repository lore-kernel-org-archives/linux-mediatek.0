Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BEFC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 03:53:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 249B12087D
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 03:53:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cxEU+pCX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jLzGBIU/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 249B12087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JviJ0b79V5cLA/mFN2alphGmzhWj74RAKkaF01kfWN4=; b=cxEU+pCXHcPTk7NSbsykUbqAZ
	SACbyyRo4TC53T4DcXOYjLfIli0g1+pypCxRGuLV4x3A/URdT19PavUkWs0xUYFvT1oZ1Ppr5hJ6X
	zsaxvHgxXMZL2pRP0AsgKq9izil5I03IMDl1UMB9nUpDOS37KDmdqqLjQ8WFTwzMCwN2syEgXzbXa
	lf8NwBX0LEZmjt0LQ3ETUugz4TSe2Xq4nN+2BwKIJSUMDMZpc/TjElrClneQCNYRNiyycdRD8m32m
	RKJWES4k4v7pmDB7/CsdG+gbZMYmD4jlnZXvDSq/77nzy3lAsBGWh2FhD6yIqTzyp4lKLaaXIme/j
	rYSzKSzSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNTBT-0002IM-JN; Wed, 30 Sep 2020 03:53:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNTBN-0002Hj-5U; Wed, 30 Sep 2020 03:53:36 +0000
X-UUID: 159b321a7e0149b88dbad23e6393b5ba-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nFjY+65HkqTIZS8cgP/4xc/0uFaZraXhLQV67OqTdbo=; 
 b=jLzGBIU/L7LxLBmXWaLGR2ayRZugR9e0ab3xyA5D9N2DlC+m38PdbbP2GCwMlN/Fb4ubVyrgmX3c8dAybi3aHg2Tp670nrUo+Pmx2uu90Bq3pWxRJ7XnUde3TLrDgb5w/smviMP3LgAyjaKvmZf3VFZB29AO8LJAfbE6UIwHpOQ=;
X-UUID: 159b321a7e0149b88dbad23e6393b5ba-20200929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1848495967; Tue, 29 Sep 2020 19:41:46 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 20:37:19 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 11:37:15 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 11:37:19 +0800
Message-ID: <1601437039.28469.3.camel@mtksdaap41>
Subject: Re: [PATCH v17 06/12] soc: mediatek: Add support for hierarchical
 scpsys device node
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 30 Sep 2020 11:37:19 +0800
In-Reply-To: <CANMq1KByYjeD0D81sPzDxx5SzrPvpGxPgm+xvLWcFsmfUJDWBQ@mail.gmail.com>
References: <1596705715-15320-1-git-send-email-weiyi.lu@mediatek.com>
 <1596705715-15320-7-git-send-email-weiyi.lu@mediatek.com>
 <CANMq1KByYjeD0D81sPzDxx5SzrPvpGxPgm+xvLWcFsmfUJDWBQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_235333_641840_25FEB2DD 
X-CRM114-Status: GOOD (  17.61  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, Rob Herring <robh@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 lkml <linux-kernel@vger.kernel.org>, Fan Chen <fan.chen@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-09-28 at 15:14 +0800, Nicolas Boichat wrote:
> On Thu, Aug 6, 2020 at 5:22 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> >
> > Try to list all the power domains of under power controller
> > node to show the dependency between each power domain directly
> > instead of filling the dependency in scp_soc_data.
> > And could be more clearly to group subsys clocks into power domain
> > sub node to introduce subsys clocks of bus protection in next patch.
> >
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> [snip]
> > +static int traverse_scp(struct platform_device *pdev, struct scp *scp,
> > +                       const struct scp_domain_data *scp_domain_data)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct device_node *np = dev->of_node;
> > +       struct device_node *sub;
> > +       int ret;
> > +
> > +       INIT_LIST_HEAD(&scp->dep_links);
> > +
> > +       for_each_available_child_of_node(np, sub) {
> > +               ret = scpsys_get_domain(pdev, scp, sub, scp_domain_data);
> > +               if (ret) {
> > +                       dev_err(&pdev->dev, "failed to handle node %pOFn: %d\n", sub, ret);
> 
> minor comment: this error should not be printed if ret ==
> -EPROBE_DEFER (use the new dev_err_probe?)
> 

You're right! I'll use dev_err_probe() instead if anyone is interested
in this series. Thank you!

> > +                       goto err;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +
> > +err:
> > +       of_node_put(sub);
> > +       return ret;
> > +}
> [snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
