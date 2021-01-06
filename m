Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AC2C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 08:42:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D5D323107
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 08:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D5D323107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M1DG4YFvM/TOvGcXRA3CnLiFWfXcl6Hzuc0/mLY0880=; b=i7y922FLEUkxNgWxznAe2Ooqm
	rb6+4vH8F5s16w6uBGhMl19Osp1NhaUT3Kx845SutCa7eJDDdrhBY2ZsgHBJ1ItYEE2Dd5KiIn9k2
	d4vHRLFDu00D2t1c3amKMU4fS5Sin9FQhg3RONX7i3ypibEIVsCP+eqlSbsLuj0HkF3P5VjCUjaS2
	gysw7KCgpj22GoST6gG2MCN1UKenq1E+DaXKCwCSYLOwt3PLNTQdaW0EBeqPZU3BtHkkHw225S2ZS
	7SSYiMpLVRjy4iTZPhTMgU/SYpyKsRpu8xL6qMtYckeq5VnUKiHC3zWpFUErUBFPJ+tqf1aAjkHs5
	K1IZbecIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx4OR-0003wY-9y; Wed, 06 Jan 2021 08:42:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx4OM-0003uj-8o; Wed, 06 Jan 2021 08:42:07 +0000
X-UUID: 617c578dcd5a49798bec551490ec4eae-20210106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HjDudKT6CirLj9XUT1/FsMduOj9/1XKYdNqPso3wAXI=; 
 b=mbKCxtnYMIQHllRr295ViEQF+UZ4SJZ4cCY6PiSDHDNTopS6ohevVcvHM7B2uM3HzEzJjC9Rn28jJBVjJ3VmbzLiepZvB5dNe8EXy5wGdjXTC58cGWljyFhrKlpb4AmN2PadQSYNBeRgW9Tk1izF0pibt4vVIIsHvZhhyonjBH0=;
X-UUID: 617c578dcd5a49798bec551490ec4eae-20210106
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 967271068; Wed, 06 Jan 2021 00:41:58 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 00:41:56 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 16:41:54 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Jan 2021 16:41:55 +0800
Message-ID: <1609922515.18506.17.camel@mtksdaap41>
Subject: Re: [PATCH v10 3/7] [v10, 3/7]: soc: mediatek: SVS: introduce MTK
 SVS engine
From: Roger Lu <roger.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 6 Jan 2021 16:41:55 +0800
In-Reply-To: <1609750266.20758.40.camel@mtksdaap41>
References: <20201227105449.11452-1-roger.lu@mediatek.com>
 <20201227105449.11452-4-roger.lu@mediatek.com>
 <CANMq1KBNKy708Vz67WOc+n7V7ne4L1EZVkUVGj6abd5voxKjxA@mail.gmail.com>
 <1609750266.20758.40.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_034206_611296_CEB69818 
X-CRM114-Status: GOOD (  12.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Nishanth Menon <nm@ti.com>, "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Angus Lin <Angus.Lin@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Devicetree
 List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 HenryC Chen <HenryC.Chen@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, YT
 Lee <yt.lee@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm
 Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Nicolas,

[snip]
> > 
> > > +
> > > +       /* Svs efuse parsing */
> > > +       ft_pgm = (svsp->efuse[0] >> 4) & GENMASK(3, 0);
> > > +
> > > +       for (idx = 0; idx < svsp->bank_num; idx++) {
> > > +               svsb = &svsp->banks[idx];
> > > +
> > > +               if (ft_pgm <= 1)
> > > +                       svsb->init01_volt_flag = SVSB_INIT01_VOLT_IGNORE;
> > > +
> > > +               switch (svsb->sw_id) {
> > > +               case SVSB_CPU_LITTLE:
> > > +                       svsb->bdes = svsp->efuse[16] & GENMASK(7, 0);
> > > +                       svsb->mdes = (svsp->efuse[16] >> 8) & GENMASK(7, 0);
> > > +                       svsb->dcbdet = (svsp->efuse[16] >> 16) & GENMASK(7, 0);
> > > +                       svsb->dcmdet = (svsp->efuse[16] >> 24) & GENMASK(7, 0);
> > > +                       svsb->mtdes  = (svsp->efuse[17] >> 16) & GENMASK(7, 0);
> > 
> > Again, if all of those values were u8, there'd be no need for these GENMASK
> 
> Ok, I'll use u8 instead of GENMASK. Thanks.

After refining the codes, I think it's much explicit to assign the bits
I want by GENMASK() and will remove other GENMASK() that are repetitive
like in svs_set_bank_phase() or svs_set_freqs_pct_v2().

[snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
