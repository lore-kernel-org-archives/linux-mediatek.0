Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9EAC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 03:13:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CE3F64FA8
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 03:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CE3F64FA8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WWZ5OwtNGAf0Uqhchr/uBgXeCBzIadQmgWkyzQiO5OI=; b=dr/MM7Dty2KFsB3uGQiT0wQCR
	hyXpUGMsOiYrsq104LLHfeRLtMYtcBt+bhMZ+acK1k9Rhp32ldINGhAlhKDxMFx2AxxRMuK/E6fod
	/BDvqNYCH1YcWM4R7m8/fBD6WUcId/OxHQiutWNachsF9isC92ObxK0KFsPxKGkYPJ+8Bqczm0kEj
	CD+69CFcnO4z1MzG9C/lv5Yq+jmmgE2OQPMr09TLlcvdt7TelM60Z2DL6R1siZXjc89Cx0wK5ie44
	Ur/fQEDXAxlyHK0yeKfcyixJ2bkibd7QCr//hiXie3PUzwwr/UaSuj5NknaiDpX2+oRjzGDxpN1/g
	NpaXVTUEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKBl1-008HYA-Cg; Thu, 11 Mar 2021 03:13:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKBkv-008HXR-Ua; Thu, 11 Mar 2021 03:13:01 +0000
X-UUID: 8e8c933536e3482aa0aa1944ed5383f7-20210310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=h7ry4YSvf1NdQpgRptUdu645gVCypCLSGZkRG28QNXo=; 
 b=qObToO26UResMKNNaKtrRc1vAifyS2DCR69O5FY3IVDejPTXmT/gR3fykAnnOPOrWZBp/cj6EajHWh47uAiqOwXk96pkYFYC+f78JUZU/ExLHM2RN1jiaawZCvhfJffMiLUuG37JvWYnM9FBkaovz+XZSdSSHPPSmTmZWgPmUnE=;
X-UUID: 8e8c933536e3482aa0aa1944ed5383f7-20210310
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1355918251; Wed, 10 Mar 2021 19:12:47 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 19:12:46 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Mar 2021 11:12:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 11 Mar 2021 11:12:44 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <daniel@0x0f.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>
CC: <daniel@thingy.jp>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <maz@kernel.org>, <tglx@linutronix.de>,
 <yj.chiang@mediatek.com>
Subject: Re: [PATCH v2] irqchip/irq-mst: Support polarity configuration
Date: Thu, 11 Mar 2021 11:12:42 +0800
Message-ID: <20210311031242.24232-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAFr9PX=dz1kt_BphpWr250asLiHFQNeBgNPhuPje==hzkcHWhg@mail.gmail.com>
References: <CAFr9PX=dz1kt_BphpWr250asLiHFQNeBgNPhuPje==hzkcHWhg@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_031258_560912_C09A4FFF 
X-CRM114-Status: GOOD (  17.15  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Daniel Palmer <daniel@0x0f.com>

>On Mon, 8 Mar 2021 at 23:30, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>> From: Daniel Palmer <daniel@0x0f.com>
>> >On Mon, 8 Mar 2021 at 15:05, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>> >> +static int mst_irq_chip_set_type(struct irq_data *data, unsigned int type)
>> >       > +{
>> >> +       if (type != IRQ_TYPE_LEVEL_LOW && type != IRQ_TYPE_LEVEL_HIGH)
>> >> +               return -EINVAL;
>> >> +
>> >
>> >Does this mean we can't do rising or falling edge interrupts?
>>
>> Yes, the interrupt of mst-intc is either level high or level low.
>> Actually the input signal can be pulse, but it will be converted to level
>> by the latch in mst-intc.
>
>Are the GPIO connected interrupts meant to be configured as level
>interrupts then?
>For the MStar MSC313(e) there are 4 (that I know of) GPIO lines that
>are wired into the mst-intc that requires EOI.
>Until this patch with those lines configured as a rising edge a single
>interrupt came each time the GPIO was pulled up as far as I remember.
>
>I'm probably misunderstanding but a level interrupt doesn't seem to
>make sense for a GPIO as it can't be serviced to clear the interrupt.


As I understand it, there are 2 types of mst-intc, one we need do EOI
operation(fiq) and the other we don't(irq).
For a fiq controller, the input edge signal will be convert to level and
keep the interrupt status until we do EOI operation.
That means if a rising edge input if trigger the ouput line will keep high
until we clear the interrupt status.

And I think you're right, make these kind of interrupts edge may make more sense.
So I will modify the patch as following:

 static int mst_irq_chip_set_type(struct irq_data *data, unsigned int type)
 {
-       if (type != IRQ_TYPE_LEVEL_LOW && type != IRQ_TYPE_LEVEL_HIGH)
-               return -EINVAL;
-
-       if (type == IRQ_TYPE_LEVEL_LOW) {
+       if (type == IRQ_TYPE_EDGE_FALLING) {
+               mst_set_irq(data, INTC_REV_POLARITY);
+               type = IRQ_TYPE_EDGE_RISING;
+       } else if (type == IRQ_TYPE_LEVEL_LOW) {
                mst_set_irq(data, INTC_REV_POLARITY);
                type = IRQ_TYPE_LEVEL_HIGH;
        }
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
