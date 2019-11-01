Return-Path: <SRS0=vEIf=YZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5394CA9EC9
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2019 08:09:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6920208E3
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2019 08:09:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zn7hs5Ll"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6920208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vozXp6+tax2OjD3wP1kABGDFGxWZ5Tqrl9hLo6IuBe0=; b=Zn7hs5Ll2kX8rW
	6msJ9VTqneGaP35wvD+dtBxmTddcAUQMmB3JKTl3WInaS+96DJxd8iuMvMnUwcB8Zgc9h1nTBrNSc
	ZQPnGwLgdUD1vv3kE6deC+4ve3az0k48oXA+420KVeFpp66BnMo94VXwLxLfDJYWi44LzXeKkQrl6
	RgqrPjFBXudlw5movOHyeSZPOU/w5ULE6dMpHDyTC1BaYTzwEgQi/glewtpe/HX5Z5Ol/ATeQvpZO
	eroI4LONk/CDGhBSwttctSkoJzrFEPTbxvlscwLIGI12XVqyH3qL12EJ9u3miLwMqg9J9R4S968AF
	KZfsSFKL9rjpOW8z+9ZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQRzv-0001c9-NQ; Fri, 01 Nov 2019 08:09:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQRzW-0001Fx-Py; Fri, 01 Nov 2019 08:09:08 +0000
X-UUID: b408e069da9a460ca37108bd0dda1a0f-20191101
X-UUID: b408e069da9a460ca37108bd0dda1a0f-20191101
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1579577412; Fri, 01 Nov 2019 00:09:15 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 1 Nov 2019 01:08:55 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 1 Nov 2019 16:08:54 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 1 Nov 2019 16:08:54 +0800
Message-ID: <1572595738.6939.7.camel@mtksdaap41>
Subject: Re: [v4, 6/8] PM / OPP: Support adjusting OPP voltages at runtime
From: Roger Lu <roger.lu@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 1 Nov 2019 16:08:58 +0800
In-Reply-To: <20190819111836.5cu245xre6ky6xav@vireshk-i7>
References: <1565703113-31479-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1565703113-31479-7-git-send-email-andrew-sh.cheng@mediatek.com>
 <20190819111836.5cu245xre6ky6xav@vireshk-i7>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DA0E43A199AF13C7A7A488606389C63F2A52057B18D158DDCD6B0E5FDE7197552000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191101_010906_842782_A0429A5A 
X-CRM114-Status: GOOD (  22.73  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 Andrew-sh Cheng =?UTF-8?Q?=28=E9=84=AD=E5=BC=8F=E5=8B=B3=29?=
 <andrew-sh.cheng@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Viresh,

Sorry for the late reply.

On Mon, 2019-08-19 at 19:18 +0800, Viresh Kumar wrote:
> On 13-08-19, 21:31, Andrew-sh.Cheng wrote:
> > From: Stephen Boyd <sboyd@codeaurora.org>
> > 
> > On some SoCs the Adaptive Voltage Scaling (AVS) technique is
> > employed to optimize the operating voltage of a device. At a
> > given frequency, the hardware monitors dynamic factors and either
> > makes a suggestion for how much to adjust a voltage for the
> > current frequency, or it automatically adjusts the voltage
> > without software intervention. Add an API to the OPP library for
> > the former case, so that AVS type devices can update the voltages
> > for an OPP when the hardware determines the voltage should
> > change. The assumption is that drivers like CPUfreq or devfreq
> > will register for the OPP notifiers and adjust the voltage
> > according to suggestions that AVS makes.
> > 
> > This patch is devired from [1] submitted by Stephen.
> > [1] https://lore.kernel.org/patchwork/patch/599279/
> > 
> > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > ---
> >  drivers/opp/core.c     | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/pm_opp.h | 11 +++++++++
> >  2 files changed, 74 insertions(+)
> > 
> > diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> > index c094d5d20fd7..407a07f29b12 100644
> > --- a/drivers/opp/core.c
> > +++ b/drivers/opp/core.c
> > @@ -2054,6 +2054,69 @@ static int _opp_set_availability(struct device *dev, unsigned long freq,
> >  }
> >  
> >  /**
> > + * dev_pm_opp_adjust_voltage() - helper to change the voltage of an OPP
> > + * @dev:		device for which we do this operation
> > + * @freq:		OPP frequency to adjust voltage of
> > + * @u_volt:		new OPP voltage
> > + *
> > + * Return: -EINVAL for bad pointers, -ENOMEM if no memory available for the
> > + * copy operation, returns 0 if no modifcation was done OR modification was
> > + * successful.
> > + */
> > +int dev_pm_opp_adjust_voltage(struct device *dev, unsigned long freq,
> > +			      unsigned long u_volt)
> 
> Can you please update this to take a triplet instead ? That is what we are
> storing in OPP core now a days.

I've studied opp/core.c and still don't know meaning of triplet here.
Could you give me more hints (reference API?) about how to take a
triplet instead? Thanks in advance.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
