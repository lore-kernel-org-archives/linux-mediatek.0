Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024B4C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 07:51:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA33020767
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 07:51:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VfnsQZbg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ufuncYV3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA33020767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+2V78mF28WFOAkWmwCRBzkkJrTkn9sQyI+VI4xhgCew=; b=VfnsQZbgpBB9PA4KXGbJWRz25
	OyIvNmv/85Di0ZeyOp/duj0ND8KPgEKmfvdyJqiDW8g0B7qzgWCIFm7tsamuvgmCkt6oSj9QEIJrt
	JqyYheKMipUNLBGVfsj4ml8CM/G8W9rVXYcv4L7pn8m2xZT2LERPwUQOmGdPBx0M/uqkeF+COAnoW
	onNNHCSMEscEw0qdqMt/gDOBuByrrPuEOvVO9ln0sq3pR97JdP2O1PNV9Zw3kmkIrPNYFhNirXRJv
	2irl05AUnB925y/GJGUr3LBL6ak+voS7G3+yLw35HW9IPt2oJaun0CBmPTDGwjqaGVzDLBB/8ePuN
	U33ZdDhkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAqCq-0001qM-4Q; Wed, 26 Aug 2020 07:50:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAqCn-0001pH-3M; Wed, 26 Aug 2020 07:50:50 +0000
X-UUID: 7aac07154e3e41ac95fed5e3e6fb9660-20200825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Mk/MVFxbDJOWelnRC4EXaAkQpD5FL2twqZna26deVKk=; 
 b=ufuncYV3CLwCGbQpoQ1rVUNCns+zAv3Xfcdpdd6QgYAZ75j9bBS40tLHOv/6GFyQIBAI7JJlrDXZwc7TzeoL+0idAQDTd0aZ03UejjSW9Sf4LQlsRvl2lOrKvI0HRHOMbL6R0Os287gdPjDuJbg0RPk6mwdAYDDlkurYHNe2sxc=;
X-UUID: 7aac07154e3e41ac95fed5e3e6fb9660-20200825
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1422960837; Tue, 25 Aug 2020 23:50:43 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 00:50:41 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 15:50:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Aug 2020 15:50:39 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <robh@kernel.org>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: interrupt-controller: Add MStar
 interrupt controller
Date: Wed, 26 Aug 2020 15:50:38 +0800
Message-ID: <20200826075038.29594-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200825214842.GA1367012@bogus>
References: <20200825214842.GA1367012@bogus>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 48D8998B49AFCB554C615D0F530C314DC0D9E5DDAA8310EBB8E99AA9277A48302000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_035049_315249_CAC42915 
X-CRM114-Status: GOOD (  18.45  )
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
Cc: devicetree@vger.kernel.org, alix.wu@mediatek.com, jason@lakedaemon.net,
 maz@kernel.org, yj.chiang@mediatek.com, daniel@0x0f.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rob Herring <robh@kernel.org>

>> +
>> +  "#interrupt-cells":
>> +    const: 3
>> +    description: |
>> +      Use the same format as specified by GIC in arm,gic.yaml.
>
>That's odd. You have the same SPI and PPI stuff?
>

No, but I just want to keep the format same as arm,gic, and let the
driver bypass 1st and 3rd cell to the parent GIC.
The mst-intc driver translate the interrupt number in 2nd cell to the
interrupt on the parent GIC.

>> +
>> +  reg:
>> +    description: |
>> +      Physical base address of the mstar interrupt controller
>> +      registers and length of memory mapped region.
>
>Drop this. That's every 'reg' property.
>
>> +    minItems: 1
>
>maxItems is more logical.
>
>> +
>> +  mstar,irqs-map-range:
>> +    description: |
>> +      The range of parent interrupt controller's interrupt lines
>> +      that are hardwired to mstar interrupt controller.
>
>Is this <start size> or <start end>?
>

<start end>.
I will add this in the description.

>Really, this should just use 'interrupts' even though that's a bit 
>verbose. Or be implied by the compatible string. What's the maximum 
>number of parent interrupts?
>
>In any case, we really need to stop having vendor specific properties 
>for this.

We use 64 interrupts per interrupt controller.
As you mentions, if we use the standard property 'interrupts',
then we need to put 64 interrupt property in the interrupt
controller node, and it will be hard to understand.
So I suppose we need an vendor specific property here.

>
>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +    items:
>> +      minItems: 2
>> +      maxItems: 2
>> +
>> +  mstar,intc-no-eoi:
>> +    description: |
>
>Don't need '|' if there's no formatting.
>
>> +      Mark this controller has no End Of Interrupt(EOI) implementation.
>> +      This is a empty, boolean property.
>
>You can drop this line. The schema says this.
>
>> +    type: boolean
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - mstar,irqs-map-range
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    mst_intc0: interrupt-controller@1f2032d0 {
>> +      compatible = "mstar,mst-intc", "mediatek,mt58xx-intc";
>> +      interrupt-controller;
>> +      #interrupt-cells = <3>;
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +      interrupt-parent = <&gic>;
>> +      reg = <0x1f2032d0 0x30>;
>> +      mstar,irqs-map-range = <0 63>;
>
>Is 0 a PPI or SPI? This property is making some assumption and wouldn't 
>be able to support both types or another parent interrupt controller.
>

0 is the interrupt number of the parent interrupt controller.
There's no SPI and PPI stuff in mst-intc, it will bypass the
1st cell to parent controller.

e.g. The device node as following will point to GIC SPI 31
("value in 2nd cell" + "start in irqs-map-range").
	usb: {
		interrupt-parent = <&mtk_intc0>;
		interrupts = <0x0 31 0x4>;
		...
	};

>> +    };
>> +...
>> -- 
>> 2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
