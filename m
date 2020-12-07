Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45621C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 07:44:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B200A2220B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 07:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B200A2220B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y33nbj+rsQnclF5tbRkqiUDBE1M4D1tMsZQQY25t7Ag=; b=OLYGlnDeQVZpu/nbA19fA4Do2
	FgxKPV3E/3meug7LjsGk94HRRzzGcjmUZ/nkYrXzPzZr3GbpdEu+tmi0GofOyYzdfImGdtgcpCDqU
	WuyYqvQdSd2I8N5pl2FatT66HiLdO4c+55AUkLzJZo2zYwBTypYZt64VP7uK0EJo3nnQMNkJmPzsz
	QlAK4925chK8h7kpOigg/Av1nNV6M2QdtR2OiCjW8ATbqppkH4To+L3wXlC6BDgSQB07mIGeaqazJ
	sZkPOJ4B2A8bBriGGt1V2i/TTHS65WrWRFAFcgD4Rb3Mdjxbz5yIp7Y5V0kn+tn7YBhQzYoTbnews
	W+GOYF53Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmBBi-0005om-NK; Mon, 07 Dec 2020 07:44:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmBBc-0005mm-NT; Mon, 07 Dec 2020 07:43:58 +0000
X-UUID: e3dc42c962e9453d97169b283b101dc5-20201206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nxMwRSEvNImRt8FLT/HpQDb52ECXSjRWAqaVtLi/YSA=; 
 b=D/ElVMRk8klFNvyJvUfwhPYrrvN9bs5WTguTCg3QFQ/XcLF6Swxo3VmEFIEMXMvGyAidS4HqAQ83UlF6kG/JpBJDE7Y0UxtQnBWetyQe6SjcVAy7q0s4kQM3DcPOJMikjDDCIVoMnKyWQi9KEQ7H/jp14xnpd05vm0QIv0KHgko=;
X-UUID: e3dc42c962e9453d97169b283b101dc5-20201206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1314165145; Sun, 06 Dec 2020 23:41:44 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Dec 2020 23:33:54 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Dec 2020 15:33:50 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Dec 2020 15:33:49 +0800
Message-ID: <1607326431.25719.33.camel@mhfsdcap03>
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
From: Qii Wang <qii.wang@mediatek.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Date: Mon, 7 Dec 2020 15:33:51 +0800
In-Reply-To: <629d171a-0e77-3d74-ae23-e6439dcf17b7@ti.com>
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
 <20201202153543.GG874@kunai> <1606958735.25719.29.camel@mhfsdcap03>
 <629d171a-0e77-3d74-ae23-e6439dcf17b7@ti.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 822D965A52E0536F39BE37E6EB109DFF6F0F10236684C611F6E4658D684AAC652000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_024356_905969_AAC96695 
X-CRM114-Status: GOOD (  19.49  )
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
Cc: srv_heupstream@mediatek.com, Wolfram Sang <wsa@the-dreams.de>,
 leilk.liu@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi:
Thank you very much for your patience review.
There are two main purposes of this patch:
1.i2c_mark_adapter_suspended&i2c_mark_adapter_resumed
Avoid accessing the adapter while it is suspended by marking it
suspended during suspend.  This allows the I2C core to catch this, and
print a warning.
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20181219164827.20985-2-wsa+renesas@sang-engineering.com/

2. IRQF_NO_SUSPEND.
Having interrupts disabled means not only that an interrupt will not
occur at an awkward time, but also that using any functionality that
requires interrupts will not work. So if the driver uses an I2C bus or
similar to tell the device to turn off, and if the I2C bus uses
interrupts to indicate completion (which is normal), then either the
device must be powered-off in suspend_late, so the I2C interrupt must be
marked IRQF_NO_SUSPEND.
https://patchwork.kernel.org/project/linux-acpi/patch/20180923135812.29574-8-hdegoede@redhat.com/

On Thu, 2020-12-03 at 10:01 +0200, Grygorii Strashko wrote:
> 
> On 03/12/2020 03:25, Qii Wang wrote:
> > On Wed, 2020-12-02 at 16:35 +0100, Wolfram Sang wrote:
> >> Hi,
> >>
> >>> Some i2c device driver indirectly uses I2C driver when it is now
> >>> being suspended. The i2c devices driver is suspended during the
> >>> NOIRQ phase and this cannot be changed due to other dependencies.
> >>> Therefore, we also need to move the suspend handling for the I2C
> >>> controller driver to the NOIRQ phase as well.
> >>>
> >>> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> >>
> >> Is this a bugfix and should go into 5.10? Or can it wait for 5.11?
> >>
> > 
> > Yes, Can you help to apply it into 5.10? Thanks
> 
> To be honest if you still do have any i2c device which accessing i2c buss after _noirq
> stage and your driver does not implement .master_xfer_atomic() - you definitely have a bigger problem.
> So adding IRQF_NO_SUSPEND sound like a hack and probably works just by luck.
> 

At present, it is only a problem caused by missing interrupts,
and .master_xfer_atomic() just a implement in polling mode. Why not set
the interrupt to a state that can always be triggered?


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
