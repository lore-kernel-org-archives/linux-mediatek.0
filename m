Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C530AC43457
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 08:32:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B45B214D8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 08:32:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lyuyTkVs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B45B214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g3c69yq4JZAUXf0js3ZHk6Fn3k8f3GHtOrJ7P6hGh/M=; b=lyuyTkVsFgfWQtTYqRo6aks9f
	oGigyN+69ipeO1eYIkreBPptBqvNuiLEOv9nZka5EHuryzFnf2oLc9y9SfG/CJf0CYW8cSLH0amEu
	vn3szpwWzMGw0osp/lrwwCkTS7iAn3++8FSFncAmGK9yc+KkzplT1YPdso0JOXESCY1J11ibrzxAp
	1kI3KDyuoM1R8NVsD7Pc3SL/b+ZIV7cULlFtLaKdvN5jlp0cMVFW6zaDgowcvlal7/xkcOj0ytu3q
	ZPdljE402eJhL8Lvj8GvDemFtcDZM6netvQ45H96y8yvE9yyGuXefJmTlJPq/8TSXVAkiPhPXv1n7
	ealMEktvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kScCO-0001Ot-L3; Wed, 14 Oct 2020 08:31:52 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kScCK-0001Nq-LU; Wed, 14 Oct 2020 08:31:49 +0000
IronPort-SDR: rrCU3XBswhv5R+/0elc6Ylw65MEdqiVutkNtIKc5pEv/ABrjesHXMDrmNQAnumyMe2YXxY/vHh
 dramGAIf27dQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="162595366"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; d="scan'208";a="162595366"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 01:31:45 -0700
IronPort-SDR: zbo01jgc7PH8Rw+C3AUgloG2Zo7L1nq574wq5hwhsjQb/FcN52ycKky7Von1N0ot7r1ThARJ0y
 RGjRmtUjfJCQ==
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; d="scan'208";a="299862191"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 01:31:41 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 9A81320609; Wed, 14 Oct 2020 11:31:39 +0300 (EEST)
Date: Wed, 14 Oct 2020 11:31:39 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20201014083139.GG13341@paasikivi.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com>
 <20201013161938.GE13341@paasikivi.fi.intel.com>
 <1602641418.4733.80.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602641418.4733.80.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_043148_846463_1AB4951F 
X-CRM114-Status: GOOD (  25.94  )
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
Cc: mark.rutland@arm.com, drinkcat@chromium.org,
 andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, shengnan.wang@mediatek.com, tfiga@chromium.org,
 louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 10:10:18AM +0800, Dongchun Zhu wrote:
> Hello Sakari,
> 
> Thanks for your timely review.
> 
> On Tue, 2020-10-13 at 19:19 +0300, Sakari Ailus wrote:
> > Hi Dongchun,
> > 
> > On Tue, Oct 13, 2020 at 09:05:02PM +0800, Dongchun Zhu wrote:
> > > Add YAML device tree binding for OV02A10 CMOS image sensor, and the
> > > relevant MAINTAINERS entries.
> > > 
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 162 +++++++++++++++++++++
> > >  MAINTAINERS                                        |   7 +
> > >  2 files changed, 169 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > 
> 
> [snip]...
> 
> > > +  ovti,mipi-clock-voltage:
> > > +    description:
> > > +      An array of 2-tuples items, and each item consists of link frequency and
> > > +      MIPI clock voltage unit like <freq-kHz volt-unit>. Clock voltage unit is
> > > +      dependent upon link speed, indicating MIPI transmission speed select that
> > > +      controls D-PHY timing setting by adjusting MIPI clock voltage to improve
> > > +      the clock driver capability.
> > > +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> > > +    minItems: 2
> > > +    default: [390000, 4]
> > 
> > Why do you have the link frequency here as well?
> > 
> > In principle this does belong to the endpoint as link frequencies are
> > specific to that, but I don't mind; there's just a single port anyway.
> > 
> 
> This is an optional property which we model as an array of <link speed,
> clock voltage> pairs. An example to have all link speeds up to 390MHz
> use the value 4 for current driver. If one wants to select different
> voltage for different link, they could do so as well.

If you think you'd need that, then you need to put this to the endpoint.

-- 
Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
