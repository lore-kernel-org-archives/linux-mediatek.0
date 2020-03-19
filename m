Return-Path: <SRS0=inF0=5E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFFCC4332B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 12:04:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A188420663
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 12:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DpguZRh9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Pd7SSTef"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A188420663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEVct0YKQ6GQ2np1eLwCaVNAAGVLVkpvUHaYiOai4Hc=; b=DpguZRh9Q6kGIf
	/caRbnKnWvFuiUO+TVU+Fgv12TRalj+zyMp19SDG1274PK5QAh5GP2T874qpxcVkjsEsvE1YtT1Fa
	Xnn5s3IL/iJpSgiXiVakrw3FScj2heXFLdgLBRZaYD7qCe8aHh6m9c265/EvR1F1UP8gEqv+KjB3W
	qzhmtMQXsfcevKoWPRGiCKOIOzkqKIhBDgVg/20RRhxz5SSUoorM+IeEy4S09Soto8D2CZCvYn7wO
	ylHJRJlpulSQt26XWEN6jztRtHqaWvm9oRwY4tbu63C4EOgRpCo6d9CD908FWy8xLHuJz77hTRJnV
	LkCiPf4+xhzttZxEVj9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEtuo-0003PR-Ib; Thu, 19 Mar 2020 12:04:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEtul-0003Oc-LC; Thu, 19 Mar 2020 12:04:45 +0000
X-UUID: d3c5b95c75044af39af05c126815ef61-20200319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FLsmkHJTejAiVrcG26B7Mjj7M9Wn+0Q8IDeLw5c59Hc=; 
 b=Pd7SSTefh0MrG4TdS7RwTPq/ifDVK3eMan7B1l1bdaBpvM5znv7Fw8YaAUXU5gI17qV2cULleGJ1yctqQed2/R0HbSv+kJcUgWSVTmyQqjY6viQ58a65S/AGXzxo1kZaDwTql5Lp0bUYiWWoU84C6fdBCiDRHNEYDAfhhDLlANE=;
X-UUID: d3c5b95c75044af39af05c126815ef61-20200319
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1650253883; Thu, 19 Mar 2020 04:04:34 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Mar 2020 04:55:05 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 19 Mar 2020 19:53:37 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 19 Mar 2020 19:54:11 +0800
Message-ID: <1584618861.5781.69.camel@mhfsdcap03>
Subject: Re: [V3, 2/2] media: i2c: Add DW9768 VCM driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 19 Mar 2020 19:54:21 +0800
In-Reply-To: <20200319113611.GJ1922688@smile.fi.intel.com>
References: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
 <20200228155958.20657-3-dongchun.zhu@mediatek.com>
 <20200305120516.GQ5379@paasikivi.fi.intel.com>
 <CAHp75Vf5km-YitoTUAFkr8LZVq2QMep1rC19ZpR-YRbeXgJOVQ@mail.gmail.com>
 <1584612215.5781.62.camel@mhfsdcap03>
 <20200319113611.GJ1922688@smile.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AF442A7775ED82EC5799039873DB4E926EA64828482E17C5046CDA13BAF303552000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_050443_703946_4667440B 
X-CRM114-Status: GOOD (  13.24  )
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
 devicetree <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 shengnan.wang@mediatek.com, Tomasz
 Figa <tfiga@chromium.org>, louis.kuo@mediatek.com, sj.huang@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, bingbu.cao@intel.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andy,

On Thu, 2020-03-19 at 13:36 +0200, Andy Shevchenko wrote:
> On Thu, Mar 19, 2020 at 06:03:35PM +0800, Dongchun Zhu wrote:
> > On Tue, 2020-03-10 at 12:10 +0200, Andy Shevchenko wrote:
> > > On Thu, Mar 5, 2020 at 2:07 PM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
> > > > On Fri, Feb 28, 2020 at 11:59:58PM +0800, Dongchun Zhu wrote:
> > > > > This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
> > > > > and provides control to set the desired focus via I2C serial interface.
> > > 
> > > ...
> > > 
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -5139,6 +5139,7 @@ M:      Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > >  L:   linux-media@vger.kernel.org
> > > > >  T:   git git://linuxtv.org/media_tree.git
> > > > >  S:   Maintained
> > > > > +F:   drivers/media/i2c/dw9768.c
> > > > >  F:   Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > > 
> > > This has ordering issues.
> > > Run parse-maintainers.pl to fix.
> > > 
> > 
> > Pardon, how to run parse-maintainers.pl?
> > Locally I ran this script, it occurs some syntax as below.
> > $./scripts/parse-maintainers.pl
> 
> It's a perl script which is made non-executable by some reason.
> 
> So, proper run as a parameter to the language interpreter, i.e.
> 	$ perl scripts/parse-maintainer.pl
> 

I tried-run again on mtk server, which has perl5(version 18.2).
But it still report the same error.
Is there any requirement for perl version?

$perl scripts/parse-maintainers.pl
syntax error at scripts/parse-maintainers.pl line 108, near "$hashref{"
Global symbol "$pattern" requires explicit package name at
scripts/parse-maintainers.pl line 109.
syntax error at scripts/parse-maintainers.pl line 112, near "}"
Global symbol "$file" requires explicit package name at
scripts/parse-maintainers.pl line 113.
Can't use global @_ in "my" at scripts/parse-maintainers.pl line 117,
near "(@_"
syntax error at scripts/parse-maintainers.pl line 152, near "}"
Execution of scripts/parse-maintainers.pl aborted due to compilation
errors.

Local perl version is as below.
$ls -al /usr/bin/perl
perl        perl5.18.2 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
