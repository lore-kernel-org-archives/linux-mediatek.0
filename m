Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D638C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 14:26:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EAA52073E
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 14:26:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c8yy4/w8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EAA52073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iFHdM3t+M5A41tytiribTleCzwu+rWtwgaBHAX/lI18=; b=c8yy4/w8z+B99WjdJlcrn8ZvP
	gjF8jJEzfgOOm2VJDblpagtVgE2URjkX8COlYXpfkJOKuFo9ylafqoSnY1EClUa+sOJYOaPhepIV7
	1dh7f3LkSANWXmB0UEMfgN7OQQuCgaDpyEqgQ6eTANO2Qf8+mD0SuuK6PbxeaWwn2igjjX1pCr3Wy
	IwCl/0nmYoDmgrYN8FsdB5Fd3MiLeya5k7Rx9zZSe75hm4vzWZDczl0qjcwoCoKQcG4R1LVWsJMDM
	R93AlSqjRlrCBnqA6iNJoBsDZtGt3zEr8PN/iELH5CmSfciasVEE6DVJqvwhpuB2WI69JY+a1TLGg
	eXWyUWD8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGk0h-0000hr-6d; Fri, 11 Sep 2020 14:26:43 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGk0f-0000h8-UG
 for linux-mediatek@lists.infradead.org; Fri, 11 Sep 2020 14:26:42 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGk0a-0003r9-8y; Fri, 11 Sep 2020 16:26:36 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGk0Y-0003Gl-Ik; Fri, 11 Sep 2020 16:26:34 +0200
Message-ID: <dae4ab91ec20e72963f2658efca4874a35dd739e.camel@pengutronix.de>
Subject: Re: [v4,3/4] reset-controller: ti: introduce a new reset handler
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Crystal Guo <crystal.guo@mediatek.com>, Suman Anna <s-anna@ti.com>
Date: Fri, 11 Sep 2020 16:26:34 +0200
In-Reply-To: <1599804422.14806.27.camel@mhfsdcap03>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <20200817030324.5690-4-crystal.guo@mediatek.com>
 <3a5decee-5f31-e27d-a120-1f835241a87c@ti.com>
 <1599620279.14806.18.camel@mhfsdcap03>
 <096362e9-dee8-4e7a-2518-47328068c2fd@ti.com>
 <1599792140.14806.22.camel@mhfsdcap03>
 <9d72aaef-49fe-ebb6-215d-05ad3ab27af4@ti.com>
 <1599804422.14806.27.camel@mhfsdcap03>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_102641_978526_96EA1DC0 
X-CRM114-Status: GOOD (  10.49  )
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
 Yong Liang =?UTF-8?Q?=28=E6=A2=81=E5=8B=87=29?= <Yong.Liang@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>,
 Stanley Chu =?UTF-8?Q?=28=E6=9C=B1=E5=8E=9F=E9=99=9E=29?=
 <stanley.chu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Crystal,

On Fri, 2020-09-11 at 14:07 +0800, Crystal Guo wrote:
[...]
> Should I add the SoC-specific data as follows?
> This may also modify the ti original code, is it OK?
> 
> +       data->reset_data = of_device_get_match_data(&pdev->dev);
> +
> +       list = of_get_property(np, data->reset_data->reset_bits, &size);
> 
> +static const struct common_reset_data ti_reset_data = {
> +       .reset_op_available = false,
> +       .reset_bits = "ti, reset-bits",
                            ^
That space doesn't belong there.

> +};
> +
> +static const struct common_reset_data mediatek_reset_data = {
> +       .reset_op_available = true,
> +       .reset_bits = "mediatek, reset-bits",
> +};

I understand Robs comments as meaning "ti,reset-bits" should have been
called "reset-bits" in the first place, and you shouldn't repeat adding
the vendor prefix, as that is implied by the compatible. So this should
probably be just "reset-bits".

Otherwise this looks like it should work.

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
