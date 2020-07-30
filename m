Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764C6C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 06:28:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F5E62075F
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 06:28:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aln71R98";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qfsWkCdW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F5E62075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lfv7JpH54IhzRdm795Bk/jGoJQ0gwDCQn1PutjzRRQA=; b=aln71R98OriN6D/QkZbLMBiwW
	udKlY9MYRhR9/BFZC4ue6epkPkv6lsCDkdKu92yFCUz1hpuTJFTirb9oia5wHgTggHldA7lS+3BQg
	CCMx0/3oP5q+QQA/95T9tC6yi3XYwYPhj/TqCZCbc0rqlkt1AqouDWefrPIbWg3ghs+VDbtch0pye
	+Jo4ihZttjdmr/y/co4NekbIg6QJB4uSd+EwmbQpyYd+B4asp+BGNA2eKYcEUO5g7CZCx2p9Nfab0
	RxZMeL16T7k+ME9+V9CxvsuvnzxLgc5AwsOQUo8zip1Bzb5gYQMCCve5QmA6V0clikPnx9FJF8Rla
	KWaPaFUdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k122s-0001jc-Ji; Thu, 30 Jul 2020 06:28:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k122o-0001iM-Ho; Thu, 30 Jul 2020 06:28:00 +0000
X-UUID: f79a17b8a20d417aabe641e183539a71-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8lty/uyzCDwACFd7jNKNUuVqC+GMWXy2t8oEvgAMM2Q=; 
 b=qfsWkCdWlfL0cl4OTeF8Cz8oj5cetDwwD1bIqxQrWEWGKwI3CxNw5KXV00UT2cVSNFSCljEzCzF7cYIdDePPJIxyFeJsNh8TizXx9roZ4zSzPcjFdqV2tfhA/rMgBnCK7DbubVDn6AvypnvoCZ1XtcQQ1uu+Nlglbho09RCIqdQ=;
X-UUID: f79a17b8a20d417aabe641e183539a71-20200729
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 741957506; Wed, 29 Jul 2020 22:27:52 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 23:27:48 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 30 Jul 2020 14:27:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 14:27:45 +0800
Message-ID: <1596090441.11360.27.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] reset-controller: ti: adjust the reset assert and
 deassert interface
From: Crystal Guo <crystal.guo@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 30 Jul 2020 14:27:21 +0800
In-Reply-To: <d259a74ca9e425f9b39ebbf47b0decb6be0beed5.camel@pengutronix.de>
References: <1596008357-11213-1-git-send-email-crystal.guo@mediatek.com>
 <1596008357-11213-2-git-send-email-crystal.guo@mediatek.com>
 <ba0d1e29-3ba3-5379-d03e-1ccec21c2ffa@gmail.com>
 <d259a74ca9e425f9b39ebbf47b0decb6be0beed5.camel@pengutronix.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_022759_026978_5A3E1C20 
X-CRM114-Status: GOOD (  32.01  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 fan.chen@mediatek.com, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 stanley.chu@mediatek.com,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-29 at 16:02 +0800, Philipp Zabel wrote:
> Hi Crystal, Matthias,
> 
> On Wed, 2020-07-29 at 09:48 +0200, Matthias Brugger wrote:
> > 
> > On 29/07/2020 09:39, Crystal Guo wrote:
> > > Add ti_syscon_reset() to integrate assert and deassert together,
> > > and change return value of the reset assert and deassert interface
> > > from regmap_update_bits to regmap_write_bits.
> > > 
> > > when clear bit is already 1, regmap_update_bits can not write 1 to it again.
> > > Some IC has the feature that, when set bit is 1, the clear bit change
> > > to 1 together. It will truly clear bit to 0 by write 1 to the clear bit
> > > 
> > > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > > ---
> > >   drivers/reset/reset-ti-syscon.c | 13 +++++++++++--
> > >   1 file changed, 11 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
> > > index a2635c2..5a8ec8f 100644
> > > --- a/drivers/reset/reset-ti-syscon.c
> > > +++ b/drivers/reset/reset-ti-syscon.c
> > > @@ -89,7 +89,7 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
> > >   	mask = BIT(control->assert_bit);
> > >   	value = (control->flags & ASSERT_SET) ? mask : 0x0;
> > >   
> > > -	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
> > > +	return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
> > 
> > Nack, this will break the driver for the other devices.
> 
> I don't think this will break the driver for existing hardware.
> regmap_write_bits() is the same as regmap_update_bits(), it just forces
> the write in case the read already happens to return the correct value.
> Of course it would be good to check that this actually works.

Yes, regmap_write_bits() is the same as regmap_update_bits(), it would
not affect existed users. Or should I use a property to separate
regmap_write_bits() and regmap_update_bits() ?

> 
> > The kernel has to work not just for your SoC but for all devices of all 
> > architectures. You can't just hack something up, that will work on your specific 
> > SoC.
> > 
> > Regards,
> > Matthias 
> > 

This TI driver was intend to be a generic reset controller
(https://lore.kernel.org/patchwork/cover/683585/), so this patch may
not just work on a specific SoC.

Thanks,
Crystal

> > >   }
> > >   
> > >   /**
> > > @@ -120,7 +120,7 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
> > >   	mask = BIT(control->deassert_bit);
> > >   	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
> > >   
> > > -	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
> > > +	return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
> > >   }
> > >   
> > >   /**
> > > @@ -158,10 +158,19 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
> > >   		!(control->flags & STATUS_SET);
> > >   }
> > >   
> > > +static int ti_syscon_reset(struct reset_controller_dev *rcdev,
> > > +			   unsigned long id)
> > > +{
> > > +	ti_syscon_reset_assert(rcdev, id);
> > > +
> > > +	return ti_syscon_reset_deassert(rcdev, id);
> > > +}
> > > +
> 
> I'm unsure about this one, though. This is an incompatible change. At
> the very least this would have to be optional depending on compatible.
> 
> regards
> Philipp

I will add a property to make this change be optional, thanks for you
advice.

Thanks,
Crystal


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
