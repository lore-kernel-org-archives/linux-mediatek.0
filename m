Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71472C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 13:34:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34D9920DD4
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 13:34:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Znol+R75";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Xl4Iikkl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34D9920DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=llU3e9ph6bRuZyy9XNfsTHnxyrAyDgMntk1l4/HK5do=; b=Znol+R75ybr0dQm8ZjStof2NS
	nOnBcFMsMFr+1HXkoey9zIEDbA5UCAs910KGw5eJ/2TDW4bxmb1omSHM9r05CiyxD+WUIhJmnd+Za
	fX2a7Gf7AaNaZ2rU2YsrPpw0hYavTFqvfvzIgKNjJyX/G7dnAryxW/uPk8EJAcGsdpjou6BY/sRbf
	x73kW8rMI+FxqNE/rvJUCpThab/qsGQi7rUkCAtjLv4z8WV+xTWqDpFftTETRFzTESayf4i/24WQC
	tnOO8po6cT2xb0lVmNNjt0r4fpg8DklAP4McT+CJQGZAjmXu8MUcGPKiKVPl8guPH2qV2fnXaEsxJ
	RS0ee+MKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEBrL-0003qd-Lr; Fri, 04 Sep 2020 13:34:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEBrJ-0003pL-5g; Fri, 04 Sep 2020 13:34:30 +0000
X-UUID: 071df503748944619c3940689b93c1e8-20200904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WiFHXErEj76BZNPxRjW3J4xmOmUT5inytUFEOkb4Kqs=; 
 b=Xl4IikklDNaK8lCAI+EVmIa5pSyVCFBvi+tEWQvWkgzlNsO9F+/ewaYXKskUddRZgshjDAp87aQStlh8X7IKM68IzEvSueGpsPKK175lGRrn7SgwySb1MEWYWmSHUHDSWTGyg+RFaQU3G1frqrmbU0ab7BaDCH8UeFZlqh2T9fE=;
X-UUID: 071df503748944619c3940689b93c1e8-20200904
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1569703; Fri, 04 Sep 2020 05:34:21 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 06:34:19 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 4 Sep 2020 21:34:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Sep 2020 21:34:14 +0800
Message-ID: <1599226354.4733.69.camel@mhfsdcap03>
Subject: Re: [PATCH v14 2/2] media: i2c: Add OV02A10 image sensor driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Fri, 4 Sep 2020 21:32:34 +0800
In-Reply-To: <20200902135145.GO1891694@smile.fi.intel.com>
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
 <20200902120122.24456-3-dongchun.zhu@mediatek.com>
 <20200902134421.GN1891694@smile.fi.intel.com>
 <20200902135145.GO1891694@smile.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 386AAC2586955A2B46CD605CFB58BE67C464E85DE164D539730FF46DA6DFEAE12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_093429_459317_A9D58CCF 
X-CRM114-Status: GOOD (  12.96  )
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
 linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com,
 sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 matrix.zhu@aliyun.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-09-02 at 16:51 +0300, Andy Shevchenko wrote:
> On Wed, Sep 02, 2020 at 04:44:21PM +0300, Andy Shevchenko wrote:
> > On Wed, Sep 02, 2020 at 08:01:22PM +0800, Dongchun Zhu wrote:
> 
> > > +	ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);
> 
> > > +	ret = fwnode_property_read_u32_array(dev_fwnode(dev),
> 
> > > +		fwnode_property_read_u32_array(dev_fwnode(dev),
> 
> > > +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> 
> 
> Btw, can somebody explain, why it's fwnode API and not direct use of device property API?
> 
> In all above cases I see no reason why not to use device property API directly.
> 

From the fwnode API's usage:
@fwnode: Firmware node to get the property of.

It seems dev_fwnode(dev) could return dev->of_node->fwnode if CONFIG_OF
is enabled, or return dev->fwnode if not.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
