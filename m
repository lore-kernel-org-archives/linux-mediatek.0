Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BDCC43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 02:22:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C772320732
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 02:22:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OgYXxRKi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GMdHIBZw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C772320732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmTGAyGuFf6Qr00oWrzZRh7/fUW0fw32z6OH0Zk/ECw=; b=OgYXxRKiStmWpy
	OICgWhhVut90h8az261SOXbcCSyoKtOwmLz0DI8nkw0McjMV/jO/JcywbUqsX8h0d9ja1x52MKv4w
	In2buOleWDbqxjVUYk1pS/WBPxOeVVkwwG5Kk2ThNH9CjCOoLPD4LFDs4tNI9WqcABgKUekyOZulA
	lLInLqLLAZdidyU0cjT/frCWJcotWoxr6Qd9hss0bRM9Tq8YlI9Er3617H6Hk+sO2+9cuqPH/w5uE
	4zfERRXG/uaSq0Hh8Lv5Kvs9+y4z4qwDgVvBgZIcH07CIM+r4Qrdr1XPD1ksyelEMM8EsPA0+vmZ0
	y4p/hRUcwzQ5vHgjwBZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ6Xa-0001p2-FE; Tue, 31 Mar 2020 02:22:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ6XX-0001ob-Tk; Tue, 31 Mar 2020 02:22:09 +0000
X-UUID: b8824937dcbf4c9d8adb35e561586801-20200330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Pi2gmU7gUHGbZuSoj+0wP9cb73MBtHR0fEjpiake8os=; 
 b=GMdHIBZw5IMWn6sQD7pbCNChTp5zKhE7hbHaMyfK8fyV/GrD3w+7aIfGZRqQN7ouclwJCGnCqdKXDEH8ZG04TdBss9yFTzgCYEyvxNMqzDgCcpHblbuJQ2U+zAi5X5mJgEttueYPwKWXsI4sHzEsAnqt1J+MlVzrOOoAbwF3lGk=;
X-UUID: b8824937dcbf4c9d8adb35e561586801-20200330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1962512452; Mon, 30 Mar 2020 18:21:52 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 19:16:15 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 31 Mar 2020 10:16:12 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 31 Mar 2020 10:16:10 +0800
Message-ID: <1585620980.5781.80.camel@mhfsdcap03>
Subject: Re: [V4, 2/2] media: i2c: Add DW9768 VCM driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 31 Mar 2020 10:16:20 +0800
In-Reply-To: <20200330135751.GQ1922688@smile.fi.intel.com>
References: <20200330123634.363-1-dongchun.zhu@mediatek.com>
 <20200330123634.363-3-dongchun.zhu@mediatek.com>
 <20200330135751.GQ1922688@smile.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B146E5EF035629031CDCFBF9CF89F0AFC588A22BD4E14778C43D5F924A3AA11C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_192207_988577_8F09FD04 
X-CRM114-Status: GOOD (  11.04  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org,
 srv_heupstream@mediatek.com, shengnan.wang@mediatek.com, tfiga@chromium.org,
 louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, sakari.ailus@linux.intel.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andy,

Thanks for the review.

On Mon, 2020-03-30 at 16:57 +0300, Andy Shevchenko wrote:
> On Mon, Mar 30, 2020 at 08:36:34PM +0800, Dongchun Zhu wrote:
> > This patch adds a V4L2 sub-device driver for DW9768 voice coil moter,
> > providing control to set the desired focus via I2C serial interface.
> 
> ...
> 
> > +static const struct dev_pm_ops dw9768_pm_ops = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > +				pm_runtime_force_resume)
> > +	SET_RUNTIME_PM_OPS(dw9768_runtime_suspend, dw9768_runtime_resume, NULL)
> > +};
> > +
> > +static struct i2c_driver dw9768_i2c_driver = {
> > +	.driver = {
> > +		.name = DW9768_NAME,
> 
> > +		.pm = IS_ENABLED(CONFIG_PM) ? &dw9768_pm_ops : NULL,
> 
> What is this conditional for?
> 

For the dw9768_pm_ops, here my idea is to use an IS_ENABLED() check to
avoid defining the structure when CONFIG_PM is not set.

> > +		.of_match_table = dw9768_of_table,
> > +	},
> > +	.probe_new  = dw9768_probe,
> > +	.remove = dw9768_remove,
> > +};
> 
> > +
> 
> Extra blank line.
> 

Weird, most V4L2 driver(I2C client) seems to keep this blank line.
Sakari, is it still the case or am I mistaken?

> > +module_i2c_driver(dw9768_i2c_driver);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
