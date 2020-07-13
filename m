Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8B1C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:25:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2E0020674
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:25:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fmOaubcI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FS11oL08"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2E0020674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ehg4Toukh5iqGXAGAZH03lvgTZLlogBmcj+SaM2kS6Y=; b=fmOaubcIxVaPfaj9UuynhEUCN
	HjHCN2UZp1A1BqaG6RDnhYEIIjMKedqqLslXejQVFlD8XI3k8xcuQ8yF+OMgWorqTMPckCIRJvF0v
	hzPcpw+d4YUrq5hmW0HxF1tGIRQxWFc0mj77lMs3D/mnBoBin4fAiFSuSVmriJOCij5k17ocQIP5T
	dPD0pEsx25ys/bX1NpLFyZdV1RfFa0mTOf3XMk/n5+amLHMrdZuNpFqJ3AOk24ghD0SOWYFsG43KK
	vH8KgY9toG2BfnCl3fFLd19FVIO5hX1r8O2PtIJ1I6hXc8zajqqbT/MDrD8o9bWXxKdAEno6Y+t39
	LtwT7uLfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jurtc-0003Fg-S8; Mon, 13 Jul 2020 06:25:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jurtL-00038l-MY; Mon, 13 Jul 2020 06:24:45 +0000
X-UUID: 810aec2b3ed44c79810a110a2aafab60-20200712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4vEP1HF0Q3QvDpYB3OMoRNc2npFo0RTElHQW9KJ35Dc=; 
 b=FS11oL08+hRTmcxJ6dQYj+ovay/NdyNli8ZllVhoC5r7Qitav/qNdbGubN/WcGlUyOHVf7I0bWeF0zgIYkJ5qFT0Mg5PGlJJ87i8hvZe02Kxmt9+9QbDO/TtnAOUsd4g54TlEeItGG/iS78NYVvZW+1EO0RYv2BpenIdSAdw61A=;
X-UUID: 810aec2b3ed44c79810a110a2aafab60-20200712
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1174071723; Sun, 12 Jul 2020 22:11:46 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jul 2020 23:11:43 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jul 2020 14:11:36 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jul 2020 14:11:36 +0800
Message-ID: <1594620698.22730.17.camel@mtkswgap22>
Subject: Re: [PATCH 2/2] soc: mediatek: devapc: add devapc-mt6779 driver
From: Neal Liu <neal.liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 13 Jul 2020 14:11:38 +0800
In-Reply-To: <922d93be-0243-bd7e-81fd-e0068a90ef4b@gmail.com>
References: <1594027693-19530-1-git-send-email-neal.liu@mediatek.com>
 <1594027693-19530-3-git-send-email-neal.liu@mediatek.com>
 <f3cf4ef4-8c85-8921-5457-cef7a3006690@gmail.com>
 <1594107170.20820.84.camel@mtkswgap22>
 <922d93be-0243-bd7e-81fd-e0068a90ef4b@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A4163080B86FE9835E37A8AABD162877054BB17FBCB2ED198E917A5C279E90912000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_022443_986679_AE644258 
X-CRM114-Status: GOOD (  28.88  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[snip]
> >>> +/*
> >>> + * devapc_violation_irq - the devapc Interrupt Service Routine (ISR) will dump
> >>> + *			  violation information including which master violates
> >>> + *			  access slave.
> >>> + */
> >>> +static irqreturn_t devapc_violation_irq(int irq_number,
> >>> +					struct mtk_devapc_context *devapc_ctx)
> >>> +{
> >>> +	const struct mtk_device_info **device_info = devapc_ctx->device_info;
> >>> +	int vio_idx = -1;
> >>> +	int index = -1;
> >>> +	int slave_type;
> >>> +
> >>> +	for (slave_type = 0; slave_type < SLAVE_TYPE_NUM; slave_type++) {
> >>> +		if (!mtk_devapc_dump_vio_dbg(devapc_ctx, slave_type, &vio_idx,
> >>> +					     &index))
> >>> +			continue;
> >>> +
> >>> +		/* Ensure that violation info are written before
> >>> +		 * further operations
> >>> +		 */
> >>> +		smp_mb();
> >>> +
> >>> +		mask_module_irq(devapc_ctx, slave_type, vio_idx, true);
> >>> +
> >>> +		clear_vio_status(devapc_ctx, slave_type, vio_idx);
> >>> +
> >>> +		pr_info(PFX "Violation - slave_type:0x%x, sys_index:0x%x, ctrl_index:0x%x, vio_index:0x%x\n",
> >>> +			slave_type,
> >>> +			device_info[slave_type][index].sys_index,
> >>> +			device_info[slave_type][index].ctrl_index,
> >>> +			device_info[slave_type][index].vio_index);
> >>
> >> How will that then be used? Will there some kind of user-space daemon which will
> >> parse the kernel log to see if a violation happens? What will it do with this
> >> information?
> >>
> >> I still don't understand why we need to do that in the kernel instead of in
> >> TF-A. Can you please explain?
> >>
> > 
> > We would do different extra handle for different bus masters internally.
> 
> Does this mean that this is only one part of the whole story? Are you planning 
> to hook into that code internally to implement the handling?
> In that we would need to support the whole thing in upstream. And this sounds 
> like you will need a new subsystem for bus firewall (or how you want to name 
> it). Which allows you to easily add support for other vendors SoCs.
> 

No, the extra handling is implemented by Mediatek proprietary drivers
which has no plan to upstream. And there is no need for first patch of
mtk-devapc driver.
Why do you think it need to support? and why it will need a new
subsystem?

The basic functionality of this driver is that it will handle violation
interrupt, and print violation information logs for further analysis.
Extra handling helps us to analyze violation more easily, but it's not a
basic functionality of it.

> > Basically, different bus masters have different debug mechanism.
> > And different customers have different severity about devapc violation.
> > For example, kernel exception, external exception, warning, don't
> > care,...
> > 
> > I list 2 reason why I put it in kernel instead of ATF.
> > 1. Rich OS such as Linux kernel has more debug mechanism and tools to
> > find murderer.
> 
> But you can access porgram counter from EL3 as well, so you could print all the 
> info you need in TF-A.

For least privilege principle, there is no reason we should print all
the violation information in TF-A.

> 
> > 2. If interrupt has to be handled in ATF, GIC intr would be set as G0S
> > (Group 0 Secure). For our interrupt routing, G0S intr would be fiq. When
> > we handle it in EL3, it would mask all EL1 irq temporarily. We do not
> > treat devapc interrupt as such critical.
> 
> But you said "violation scenario is unexpected" so actually you don't expect it 
> to happen.
> 
> > 
> > Doe it make sense? Or do you have any reason that it should be handled
> > in ATF?
> > 
> 
> My reasoning is that you bring a security mechanism into the kernel, which is in 
> none-secure state. That's a contradiction.

There are two functionality for Mediatek devapc hardware.
1. permission control/protection
2. violation info

You can see that 1. is security mechanism for sure, and we put it in
TF-A.
But 2. is not "security" at all. it's for debugging purpose, we think
it's no any security concern to put it in NS-EL1.

> 
> Regards,
> Matthias
> 
[snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
