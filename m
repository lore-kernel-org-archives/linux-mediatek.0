Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E798C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 09:13:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71DF32084C
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 09:13:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZVm0DHD5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JNNHgxvd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71DF32084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XrhJGTAsG/hthoGhj8RvM+bdV6IVnK9ptStfrvHn4c=; b=ZVm0DHD5+BT3jb
	jOhzXX2jNjgTyktfkKLvjeZ/K3eSjIgp5Nuz0E0ve6q6Jt91DcNP0kPA6kJGTQscfgDe+PIVTZp0U
	+JD4T466WSD8EmsIKL2I+LQ4IX2kTQFZnj4ysjaNzLohhbsYV1mxpC9X/BLHR+6whAnPCSGsFGkrK
	n+jrS5dffKkADh73qCumz3Bxwqrtw7xpMC7nrgyb3AaTlh6AlxnnPWAiqQhxcUZnxpg/ZkPyQ9Jzr
	UnNjHiuh4/WATXHXLz7UvPvZ713OtXiQlaPx/AJF3cRmxnJmxzB96nTxKTxmnRO84WqaljPOJCGYZ
	FJYmgvrFXn6d1+7Dr+qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jds84-0005tJ-IW; Wed, 27 May 2020 09:13:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jds82-0005so-JX; Wed, 27 May 2020 09:13:40 +0000
X-UUID: d24be6cad85d457999452fbb36838512-20200527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=niIGUTjMuwM6Dzf6Aan1ADPLP3BVHBCxpGmXP1NJl2E=; 
 b=JNNHgxvdyaaY1E4KFGIN+iIuH39MdujciautPSaRta1Fms+78ZhpRWwlLkNPqPuubVmWPdNfdje1sg/Qqmxf8qj62ZEiE6yzl3S4jaLswbleEVeQcYsfQ3Qd+h76huQMd48qTeGmcE45H8B+hoLX4gI2DjGp/5j1UwdRjoBJQC0=;
X-UUID: d24be6cad85d457999452fbb36838512-20200527
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 888760595; Wed, 27 May 2020 01:13:24 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 May 2020 02:03:37 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 May 2020 17:03:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 May 2020 17:03:13 +0800
Message-ID: <1590570089.8804.453.camel@mhfsdcap03>
Subject: Re: [V6, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 27 May 2020 17:01:29 +0800
In-Reply-To: <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
 <20200518132731.20855-3-dongchun.zhu@mediatek.com>
 <20200521195113.GC14214@chromium.org>
 <1590139561.8804.390.camel@mhfsdcap03>
 <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C6DAD625A2A8FEE655D867D0563F7BB4655DD51B1E8845A1432CFAC0ED8261322000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_021338_650979_4B44FA0E 
X-CRM114-Status: GOOD (  16.95  )
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
 Nicolas Boichat <drinkcat@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Shengnan
 Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=
 <shengnan.wang@mediatek.com>, Louis Kuo <louis.kuo@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dongchun.zhu@mediatek.com, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, "list@263.net:IOMMU DRIVERS
 <iommu@lists.linux-foundation.org>, Joerg  Roedel <joro@8bytes.org>,
 " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tomasz,

On Mon, 2020-05-25 at 13:45 +0200, Tomasz Figa wrote:
> On Fri, May 22, 2020 at 11:27 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> >
> > Hi Tomasz,
> >
> > Thanks for the review. My replies are as below.
> >
> > On Thu, 2020-05-21 at 19:51 +0000, Tomasz Figa wrote:
> > > Hi Dongchun, Sakari,
> > >
> > > On Mon, May 18, 2020 at 09:27:31PM +0800, Dongchun Zhu wrote:
> [snip]
> > > > +   pm_runtime_enable(dev);
> > > > +   if (!pm_runtime_enabled(dev)) {
> > > > +           ret = dw9768_runtime_resume(dev);
> > > > +           if (ret < 0) {
> > > > +                   dev_err(dev, "failed to power on: %d\n", ret);
> > > > +                   goto entity_cleanup;
> > > > +           }
> > > > +   }
> > > > +
> > > > +   ret = v4l2_async_register_subdev(&dw9768->sd);
> > > > +   if (ret < 0)
> > > > +           goto entity_cleanup;
> > > > +
> > > > +   return 0;
> > > > +
> > > > +entity_cleanup:
> > >
> > > Need to power off if the code above powered on.
> > >
> >
> > Thanks for the reminder.
> > If there is something wrong with runtime PM, actuator is to be powered
> > on via dw9768_runtime_resume() API.
> > When actuator sub-device is powered on completely and async registered
> > successfully, we shall power off it afterwards.
> >
> 
> The code above calls dw9768_runtime_resume() if
> !pm_runtime_enabled(dev), but the clean-up code below the
> entity_cleanup label doesn't have the corresponding
> dw9768_runtime_suspend() call.
> 

Did you mean the 'entity_cleanup' after v4l2_async_register_subdev()?
Actually I made some changes for OV02A V9, according to this comment.
Could you help review that change? Thanks.

> Best regards,
> Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
