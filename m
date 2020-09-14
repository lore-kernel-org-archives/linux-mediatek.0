Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5546C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 14:06:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3DFA2074B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 14:06:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GIuVEkbL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IvfVSwBv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3DFA2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nwDYs8L9Q/qm4a4Yy02H8Qd3M9Tm8V8CCV5AI5ZYXwg=; b=GIuVEkbLxje2jIHV/kzIpNFr+
	uJZn6yBTNj5VRWwWCl200nBpvz3DikPFrR5BYbYqMiJ84eJH05Bk+5MCFaaWjKHCgcTPFOu4VDHM7
	16rXrKadp7RTHptK+jJUj7JZeqBX8LkKY/lfbgJAnXthy8RN9PkZkMTIcrFgGjILpvmybT3zWJ6Er
	YawkEsg6ePPqQtG5y/7sUlX5PoTwB3bNX5YSEfQDAHdPoYawWrO7ugdg2JFd9pnM4Gk/aNa6G+rQk
	1bF8oVKOLRLWXoDjEqaISmtcXx6vBSt66L+E/4VrxNaQ2iRF9E/9tIr7HpyOySOEz+cbgKLU4+Xhr
	b/PcjjDRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHp7G-0004Vh-Bi; Mon, 14 Sep 2020 14:05:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHp7A-0004TF-Ss; Mon, 14 Sep 2020 14:05:54 +0000
X-UUID: 71135805e5e44d8fb0d6fa65273d0471-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cLdj0X30p6O5aAOutE1K4/oxJCAmQzrpPvIelAe8dXw=; 
 b=IvfVSwBvruvn11Wu7+kq5CSUIP1IVhSi/mjYCh7xR+v94CD55Tv6cY94A1hcrm4h4N7D55M0ZlzHBH2TZoVlnkOMFN8zfxMJqLkCM2D9C5ByWQpCaunamMrmdeFyFZGwSQq75EaoqRlpEzVdQvSZWOliNcUVi0NYC5pANZlZJDQ=;
X-UUID: 71135805e5e44d8fb0d6fa65273d0471-20200914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1440615605; Mon, 14 Sep 2020 06:02:27 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 07:02:25 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Sep 2020 22:02:20 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Sep 2020 22:02:20 +0800
Message-ID: <1600092019.14806.32.camel@mhfsdcap03>
Subject: Re: [v4,3/4] reset-controller: ti: introduce a new reset handler
From: Crystal Guo <crystal.guo@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>
Date: Mon, 14 Sep 2020 22:00:19 +0800
In-Reply-To: <407863ba-e336-11fc-297d-f1be1f58adaa@ti.com>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <20200817030324.5690-4-crystal.guo@mediatek.com>
 <3a5decee-5f31-e27d-a120-1f835241a87c@ti.com>
 <1599620279.14806.18.camel@mhfsdcap03>
 <096362e9-dee8-4e7a-2518-47328068c2fd@ti.com>
 <1599792140.14806.22.camel@mhfsdcap03>
 <9d72aaef-49fe-ebb6-215d-05ad3ab27af4@ti.com>
 <1599804422.14806.27.camel@mhfsdcap03>
 <dae4ab91ec20e72963f2658efca4874a35dd739e.camel@pengutronix.de>
 <407863ba-e336-11fc-297d-f1be1f58adaa@ti.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 45A69AB5EB0307C47D3EE730CE03B37B6DC73E1E5FF7A7ED01BBCA588A5E68AB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_100553_070726_BFA032B1 
X-CRM114-Status: GOOD (  20.06  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Yong
 Liang =?UTF-8?Q?=28=E6=A2=81=E5=8B=87=29?= <Yong.Liang@mediatek.com>,
 Stanley Chu =?UTF-8?Q?=28=E6=9C=B1=E5=8E=9F=E9=99=9E=29?=
 <stanley.chu@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>, Suman Anna <s-anna@ti.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-09-11 at 22:44 +0800, Suman Anna wrote:
> On 9/11/20 9:26 AM, Philipp Zabel wrote:
> > Hi Crystal,
> > 
> > On Fri, 2020-09-11 at 14:07 +0800, Crystal Guo wrote:
> > [...]
> >> Should I add the SoC-specific data as follows?
> >> This may also modify the ti original code, is it OK?
> >>
> >> +       data->reset_data = of_device_get_match_data(&pdev->dev);
> >> +
> >> +       list = of_get_property(np, data->reset_data->reset_bits, &size);
> >>
> >> +static const struct common_reset_data ti_reset_data = {
> >> +       .reset_op_available = false,
> >> +       .reset_bits = "ti, reset-bits",
> >                             ^
> > That space doesn't belong there.
> > 
> >> +};
> >> +
> >> +static const struct common_reset_data mediatek_reset_data = {
> >> +       .reset_op_available = true,
> >> +       .reset_bits = "mediatek, reset-bits",
> >> +};
> > 
> > I understand Robs comments as meaning "ti,reset-bits" should have been
> > called "reset-bits" in the first place, and you shouldn't repeat adding
> > the vendor prefix, as that is implied by the compatible. So this should
> > probably be just "reset-bits".
> 
> Hmm, not sure about that. I think Rob wants the reset data itself to be added in
> the driver as is being done on some other SoCs (eg: like in reset-qcom-pdc.c).
> 
> regards
> Suman
> 
Hi Rob,

Can you help to comment about this point?
Modify "ti,reset-bits" to "reset-bits" or add "mediatek,reset-bits" ?

Many thanks~
Crystal

> > 
> > Otherwise this looks like it should work.
> > 
> > regards
> > Philipp
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
