Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5C8C4727C
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 13:54:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C680C207C4
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 13:54:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ReepkR0M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WeXwrHIS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C680C207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vic8p/++ZETchSvMXgxHPVCgnWqKM4l0d5ORB3y5LLU=; b=ReepkR0MeJekK4Ro3zgFHqHfR
	CrR1/j/VWANhVfqItjYK+s2bkWS7SlOgL4Ww5TbU2MBJ4gVdxNftm1koQPvp3utFJGYuU2SUy+puZ
	rkTsCNW6fvxjz+wvJEW5IUrvzRWel+xrKj6lBEc/3n6meV037yvdTvh+qJoZBv7KhrTe92k8wI3EF
	GHmDpkXzF1f7KStAfBQMgfYV66Js2wxq/CkTVTJsGwXKqcp37k92zTp/N4dy3uZtHZAyrRjl0CCRb
	vrvxRol+gZg9wZf5qZyij8IaQ+fkH/zI3YKu/qDlzYifYVRPzPp4rQePp2J2G+MbQkyVsCR1kpsiw
	HuhsSmDAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNG5M-00005X-S7; Tue, 29 Sep 2020 13:54:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNG53-0008OQ-Mj; Tue, 29 Sep 2020 13:54:13 +0000
X-UUID: 34b397ebf5d3451a85dff6c79a0c6ccc-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3R2Pn+c7IE5Q3v0Jn/QXjb/p34wUQS/L7+BGyE+G9mI=; 
 b=WeXwrHISHquz3QzyPWAaKebf0s5B9znLqBP5oWJZKPFciFAx1xExB17GCi8eOAKowVSv/8jgedrEgxXINPcIHAcagNJB0yPG3ZVPe23kBLzzQOiSC5bcKP/Vxki9AAWwsdZXknoF3UZdfk69iCnrnlEhPCZhG5btdW5PeChzgvE=;
X-UUID: 34b397ebf5d3451a85dff6c79a0c6ccc-20200929
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1147152929; Tue, 29 Sep 2020 05:54:04 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 06:54:02 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 29 Sep 2020 21:53:59 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Sep 2020 21:53:58 +0800
Message-ID: <1601387640.14806.37.camel@mhfsdcap03>
Subject: Re: [v4,3/4] reset-controller: ti: introduce a new reset handler
From: Crystal Guo <crystal.guo@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, Suman Anna <s-anna@ti.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Date: Tue, 29 Sep 2020 21:54:00 +0800
In-Reply-To: <1600092019.14806.32.camel@mhfsdcap03>
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
 <1600092019.14806.32.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4D3137281912B1B8192E5255475BC4C9F56539D105696DE295B344C9EB617AE12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_095410_042677_EC5E0825 
X-CRM114-Status: GOOD (  23.03  )
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
 srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>,
 Stanley Chu =?UTF-8?Q?=28=E6=9C=B1=E5=8E=9F=E9=99=9E=29?=
 <stanley.chu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-09-14 at 22:00 +0800, Crystal Guo wrote:
> On Fri, 2020-09-11 at 22:44 +0800, Suman Anna wrote:
> > On 9/11/20 9:26 AM, Philipp Zabel wrote:
> > > Hi Crystal,
> > > 
> > > On Fri, 2020-09-11 at 14:07 +0800, Crystal Guo wrote:
> > > [...]
> > >> Should I add the SoC-specific data as follows?
> > >> This may also modify the ti original code, is it OK?
> > >>
> > >> +       data->reset_data = of_device_get_match_data(&pdev->dev);
> > >> +
> > >> +       list = of_get_property(np, data->reset_data->reset_bits, &size);
> > >>
> > >> +static const struct common_reset_data ti_reset_data = {
> > >> +       .reset_op_available = false,
> > >> +       .reset_bits = "ti, reset-bits",
> > >                             ^
> > > That space doesn't belong there.
> > > 
> > >> +};
> > >> +
> > >> +static const struct common_reset_data mediatek_reset_data = {
> > >> +       .reset_op_available = true,
> > >> +       .reset_bits = "mediatek, reset-bits",
> > >> +};
> > > 
> > > I understand Robs comments as meaning "ti,reset-bits" should have been
> > > called "reset-bits" in the first place, and you shouldn't repeat adding
> > > the vendor prefix, as that is implied by the compatible. So this should
> > > probably be just "reset-bits".
> > 
> > Hmm, not sure about that. I think Rob wants the reset data itself to be added in
> > the driver as is being done on some other SoCs (eg: like in reset-qcom-pdc.c).
> > 
> > regards
> > Suman
> > 
> Hi Rob,
> 
> Can you help to comment about this point?
> Modify "ti,reset-bits" to "reset-bits" or add "mediatek,reset-bits" ?
> 
> Many thanks~
> Crystal
> 
> > > 
> > > Otherwise this looks like it should work.
> > > 
> > > regards
> > > Philipp
> > > 
> > 

Dears,

I have uploaded the changes at
https://patchwork.kernel.org/cover/11805937/
Please help me to review, many thanks~~

regards
Crystal
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
