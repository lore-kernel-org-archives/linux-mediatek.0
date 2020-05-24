Return-Path: <SRS0=6j47=7G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CB1C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 May 2020 20:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE8F02076C
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 May 2020 20:34:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VJ4Lo4xR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE8F02076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EEtIenP7zW32jNdb3eJSqzvvXxtDsGK1st3PrJ2YAg=; b=VJ4Lo4xRQ+VThb
	mRjkMHuXKGZV4dUsbviMi/t61bhneCpnxFheb8feuZAmAWAEU+w4K8HszdmxwBjiPQOktxiDRMXly
	0VPZ1EghlN5oNGG7A6vF+9Sop0g0a3W8XKbeo7pIOwhQAu/ItcWzCfoubZFkRqcdNXRozPKmhVPCN
	blz57OK6ykzcYzU3+LMGiCrNFDa67Zsu/LkYs09vzgudMwlZBj+KpYL7q5ABy28Zf7dRYIS/qDZw/
	0cEKwiZKxx/NAzcTtrArzWOzDQacIGXqnc+mDkPr4z8E3cy5Sk/poWs5W81VB36Mni22WrgZYbZrd
	2oKq1RYaKWspSS/Mhnxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcxJq-0000k5-7d; Sun, 24 May 2020 20:34:02 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcxJh-0000dJ-Mx; Sun, 24 May 2020 20:33:54 +0000
IronPort-SDR: MXlUsN45YX5w7/DWhd7wLz5Z596ipRFk+BF+hLtwQ+dRWG4UVwa0epoje4mb0V2zJFKmmDVlJY
 aIBOPip/bq0g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2020 13:33:50 -0700
IronPort-SDR: hGO7Y3wYazKbBMeBckgS76jnZK8vgx3/d2+Tum7KpIZBE7Os41Bbvt3Qwb/u2VDS+n2UM4fhvq
 Z18P3EudgMLg==
X-IronPort-AV: E=Sophos;i="5.73,430,1583222400"; d="scan'208";a="254745249"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2020 13:33:46 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 554C820736; Sun, 24 May 2020 23:33:44 +0300 (EEST)
Date: Sun, 24 May 2020 23:33:44 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [V8, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200524203344.GB7618@paasikivi.fi.intel.com>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-2-dongchun.zhu@mediatek.com>
 <20200511160207.GA32476@bogus>
 <1589251221.8804.289.camel@mhfsdcap03>
 <CAAFQd5DgrDwPEpdN9ErJWsHbMDpo2s_u3pwsqtpNwVk4g3_CdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5DgrDwPEpdN9ErJWsHbMDpo2s_u3pwsqtpNwVk4g3_CdQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_133353_762774_00298EB2 
X-CRM114-Status: GOOD (  17.19  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= <shengnan.wang@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>, Louis Kuo <louis.kuo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 21, 2020 at 08:59:56PM +0200, Tomasz Figa wrote:
> Hi Dongchun, Rob,
> 
> On Tue, May 12, 2020 at 4:41 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> >
> > Hi Rob,
> >
> > Thanks for the review.
> >
> > On Mon, 2020-05-11 at 11:02 -0500, Rob Herring wrote:
> > > On Sat, May 09, 2020 at 04:06:26PM +0800, Dongchun Zhu wrote:
> [snip]
> > > > +            port {
> > > > +                wcam_out: endpoint {
> > > > +                    remote-endpoint = <&mipi_in_wcam>;
> > > > +                    data-lanes = <1>;
> > >
> > > This doesn't match the schema which says this should be 4 entries.
> > >
> >
> > Property "data-lanes" shows the number of lanes that sensor supports.
> > If this property is omitted, four-lane operation is assumed.
> > For OV02A10, it is one-lane operation, so the property is supposed to be
> > set to <1>.
> >
> 
> To clarify on this, the ov02a10 sensor supports only 1 lane. It's not
> a driver limitation.

If there's nothing to configure there, then the property should be omitted.
I understood the sensor supported one to four lanes...

-- 
Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
