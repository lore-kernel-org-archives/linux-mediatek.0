Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D66C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:31:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C69F206D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:31:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a9gZ4Ru1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RfFQcZ/9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C69F206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1il60Y2HNYB4BhzJjgtVimzt9bz8dTbjvyCiQd1v1y8=; b=a9gZ4Ru1CbPibglCDuDqUTxPo
	NX3t03klGrt1fJ3E7imSdp1huWcFoNjMejqGbtRYdKpX5NCmq5yK/4SE6dERPo6c/GmH8DdYF0pLo
	CmkB0MJsvQD228HKbJWYPLjxI4yCEAiJJsrjtvw0kxt/BToCujUA164i2zFgYJ7c2LRhZD0LzU2S/
	PzyHtz+r/0kyYxLEQjQJXukKqSXN7YkSsek8Ezr6sH+ROivi76X61opL+WH72GakpfDfZfZTrfwAg
	AYVBLo65nBMzMenREb9DLe6bsjI4lLAv3Ujx0ZD1bTP3fcRwqBgMNEzGzdnf/akoteC6KeSLQE30f
	WT4h8ab1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE2S1-0002lg-2w; Fri, 04 Sep 2020 03:31:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE2Rw-0002kz-79; Fri, 04 Sep 2020 03:31:41 +0000
X-UUID: a638e8d826444015a124ef6a2ef907d8-20200903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MgYZSn5dO120VGKzJXvetFyHicODTuH1UC+5Qr8NQKo=; 
 b=RfFQcZ/956mQaCGQB8khZaUU64zSLA4lYxxs/0i+gC/TuB2wxWY1YlcCtXGUNtkKMhIQm1tZMo29EqPXPNLGv3Xz57DGpdqkCuVuQt7Cc9XdgSfeQVs3h/ORocY9PlmB+V7Bx1ALyaK0eLEoicHa8kEsXGcTR/I0Cltbxx+z8pw=;
X-UUID: a638e8d826444015a124ef6a2ef907d8-20200903
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 19380118; Thu, 03 Sep 2020 19:31:29 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 20:25:56 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 4 Sep 2020 11:25:52 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Sep 2020 11:25:50 +0800
Message-ID: <1599189850.4733.26.camel@mhfsdcap03>
Subject: Re: [PATCH v14 1/2] media: dt-bindings: media: i2c: Document
 OV02A10 bindings
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 4 Sep 2020 11:24:10 +0800
In-Reply-To: <20200903161346.GA2875415@bogus>
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
 <20200902120122.24456-2-dongchun.zhu@mediatek.com>
 <20200903161346.GA2875415@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A7ECABCC12E377294537EB3BB11E063BA24C5E44B727A27FB45E9077160807172000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_233140_460621_00E4E385 
X-CRM114-Status: GOOD (  17.69  )
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
 srv_heupstream@mediatek.com, mchehab@kernel.org, shengnan.wang@mediatek.com,
 tfiga@chromium.org, louis.kuo@mediatek.com, sj.huang@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 dongchun.zhu@mediatek.com, sakari.ailus@linux.intel.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, matrix.zhu@aliyun.com,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Rob,

Thanks for the review.

On Thu, 2020-09-03 at 10:13 -0600, Rob Herring wrote:
> On Wed, 02 Sep 2020 20:01:21 +0800, Dongchun Zhu wrote:
> > Add YAML device tree binding for OV02A10 CMOS image sensor,
> > and the relevant MAINTAINERS entries.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 161 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 +
> >  2 files changed, 168 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Error: Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.example.dts:28.45-46 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1366: dt_binding_check] Error 2
> 
> 
> See https://patchwork.ozlabs.org/patch/1355723
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 

So much sorry for the mistake I've made.
I forgot to include the header file 'dt-bindings/gpio/gpio.h'.
This would be fixed in next release :-)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
