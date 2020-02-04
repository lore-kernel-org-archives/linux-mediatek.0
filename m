Return-Path: <SRS0=y3Z3=3Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF60C35247
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Feb 2020 00:54:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3ED82084E
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Feb 2020 00:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dfkx7fcH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bAGxRWqR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3ED82084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NqbVrXtj79teaO6vLlzWFctKBT5MNLA4wjgAoik/JD0=; b=dfkx7fcHznyaHn
	R6qQI/h1k8u1GR98nOYxduAH8hF3k7i0WY7eY/gQvuukl2itxsHHNp8lMRqEPOtT+RnR/g83Q9zfn
	wB4uhODv+9LYzurVrSW2+4SOVaNJwQ6HunmWraLiBrStxBan5n/XUAS4DiV5QobncuYrTAa7yKash
	eMt73qg2QFFVo78+wy5tJcFIYJbxcJTuXSptYIbywoTUCnxzczXtOzN7qH6AZKqoS/n73QwFXhHU8
	VgYXF+KyFDf1XCHY3jUCttbNYTL0Axeez6gL18rZ6r0yApFAh8wiNKI4LsxNHnG1HHCWRanjuNqeP
	4gVWz8zfBGbABxFUTqIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iymU9-000297-1h; Tue, 04 Feb 2020 00:54:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iymU0-00023w-IK; Tue, 04 Feb 2020 00:54:31 +0000
X-UUID: d391a02244254eceb83a790f4b61c53f-20200203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5GT0W0D4fp1R9e9GcyJmXd1HEmQL0ETrvY40fzATcrY=; 
 b=bAGxRWqRT1Ty4qarjsRGSiKWZfm4/fmRF+ofrie3juJEv//55/vg7Cx5pNzJa9jVLHFd97FCkMzVLrD7XdYpJPvNn8auiWS5FtQ2KyHUjgSCUIs9cjCQanmURnLcuYPD9OfAcynFXK1yP4ZJNbSmlZLHb2UMBd/6JyOZI+kbYhU=;
X-UUID: d391a02244254eceb83a790f4b61c53f-20200203
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1170873240; Mon, 03 Feb 2020 16:54:17 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 3 Feb 2020 16:44:13 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 4 Feb 2020 08:43:34 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Feb 2020 08:44:29 +0800
Message-ID: <1580777053.4621.1.camel@mtkswgap22>
Subject: Re: [PATCH 1/3] [1/3] mmc: core: expose MMC_CAP2_CQE* to dt
From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Feb 2020 08:44:13 +0800
In-Reply-To: <CAPDyKFropF-au2OTgyRL8-sO0MKXs3GtZGMqYpWpsKHtfdtpyw@mail.gmail.com>
References: <1572590582-11056-1-git-send-email-chun-hung.wu@mediatek.com>
 <CAPDyKFropF-au2OTgyRL8-sO0MKXs3GtZGMqYpWpsKHtfdtpyw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_165428_616348_DC2E3CF0 
X-CRM114-Status: GOOD (  16.29  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>, wsd_upstream@mediatek.com,
 DTML <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Pavel
 Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Pan Bian <bianpan2016@163.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Thanks for the review , will remove the tag in v2 driver.

On Mon, 2019-11-11 at 14:04 +0100, Ulf Hansson wrote:
> On Fri, 1 Nov 2019 at 07:43, Chun-Hung Wu <chun-hung.wu@mediatek.com> wrote:
> >
> > Expose MMC_CAP2_CQE and MMC_CAP2_CQE_DCMD
> > to host->caps2 if
> > 1. "supports-cqe" is defined in dt and
> > 2. "disable-cqe-dcmd" is not defined in dt.
> >
> > Change-Id: I3d172e6bcfac34520c3932a6f8df2e20f2c0d05b
> > CR-Id:
> > Feature:
> 
> Remove these tags please.
> 
> > Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> > ---
> >  drivers/mmc/core/host.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> > index 105b7a7..efb0dbe 100644
> > --- a/drivers/mmc/core/host.c
> > +++ b/drivers/mmc/core/host.c
> > @@ -319,6 +319,14 @@ int mmc_of_parse(struct mmc_host *host)
> >                 host->caps2 |= MMC_CAP2_NO_SD;
> >         if (device_property_read_bool(dev, "no-mmc"))
> >                 host->caps2 |= MMC_CAP2_NO_MMC;
> > +       if (device_property_read_bool(dev, "supports-cqe"))
> > +               host->caps2 |= MMC_CAP2_CQE;
> > +
> > +       /* Must be after "supports-cqe" check */
> > +       if (!device_property_read_bool(dev, "disable-cqe-dcmd")) {
> > +               if (host->caps2 & MMC_CAP2_CQE)
> > +                       host->caps2 |= MMC_CAP2_CQE_DCMD;
> > +       }
> >
> >         /* Must be after "non-removable" check */
> >         if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {
> > --
> > 1.9.1
> >
> 
> Otherwise, this looks good to me.
> 
> Kind regards
> Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
