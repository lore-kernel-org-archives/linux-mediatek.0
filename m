Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256F2C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 10:36:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B885465036
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 10:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B885465036
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tRu3hCJLsj1ENXwgxS00U4nqZAEShCW+OhjDfgIw2C4=; b=UNbHCrY5aOQBkDJ9RfTr+hXeC
	9IP5kVrgbmTZ0bJW+4eCLV5RKLVZZUQdu8EB7n9qNhTaerqU6g0dvEk+MZpa5MjMgGjxEIVPGAMdu
	YHXhTo+Jj65RecbmwuDtLIkeIQTFGyynrVivLIz1F1aGfMjLQ+Kk77Plk2eCIWhVYgUhtHmTDiBA6
	PZWnephNTwVCwGqBaTz/+IJrGfyCPZJy1t0ipLvyLzXpgE4gNm3tXvzyZL8KvoqOS9oynOyc+QiIs
	j0Y1wxVyNpbDVRErHT2ZeSVQ9GdhL+HQUTA3HsTm2Tx+BtWhUGtTtmJ+qZkAYtVev7rq8TdbXhmbz
	Dul8yYhMg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKf9C-00BBvb-Fb; Fri, 12 Mar 2021 10:35:58 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKf94-00BBsx-Ts
 for linux-mediatek@lists.infradead.org; Fri, 12 Mar 2021 10:35:55 +0000
Received: by mail-qt1-x82f.google.com with SMTP id x9so3360304qto.8
 for <linux-mediatek@lists.infradead.org>; Fri, 12 Mar 2021 02:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o9kZZ4ShtUBySG8kNNKPjt7UxcAfmn40nTCWrz8Qxyg=;
 b=Oxd+RJVTsSb0oiRRHZ8zf1GhpuY5tc4w9FZ9OwFxcp/02OWPNqeNkgWozSLXFIhtju
 KMeBauUuHhUuV23KKmHNa7OqcPA7mZq3AOpNlENixqy9OP5tKgfiLHecldmdIDDF/t61
 tkz57N8a53AXpEngmCCThh1X9XB06/K9dXJ6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o9kZZ4ShtUBySG8kNNKPjt7UxcAfmn40nTCWrz8Qxyg=;
 b=Nrz1KKiksJkMl5qJ2C2MoL186AH72ihVx2/yknCLTALqXZ04+fjRrjwwj5I/yv5a1X
 upRMQIT5pW37wtMXY4pQjy3IxMiSAgB/iFaMKl+q2Gq4IPZFZ0W6qrDFzy1HS1iwETHN
 SD5mUeEpDfioRTQDI/Tsl6GV0GnGD5QRmnjMUQ8g7dgGJYbSmqxzfpz7+SfvQ73fIKsH
 5lzFsFRtg6/VgwXwl9O/23jexrtkRJ4dywZq2tON2AKpJnuQN1adXRe4wyqziA69c6sT
 U7MdVBHWdKy1JbV5JZUV+y8q2lnfboXAP1QTKFigh3EY//oJv+f7LTtZIjMw3vG/TujI
 Uz2A==
X-Gm-Message-State: AOAM53270k6cxoKEq0bXUp7k94tNdmkV76VXSzsmhU5qs5GGp1WUcv7W
 l+jKgYDC7hqHZ4jXz7otRbe1U9MeFlVELcx97TUj8A==
X-Google-Smtp-Source: ABdhPJxc+3XPOzTj4jbVAtXgGbqiHsgkinTCAKBVlfD3N/JvECXuF+8EEA/bcbCXHL3hVa6UGcI4Yr5V3Rg46Q47H0c=
X-Received: by 2002:aed:2981:: with SMTP id o1mr10859464qtd.386.1615545348968; 
 Fri, 12 Mar 2021 02:35:48 -0800 (PST)
MIME-Version: 1.0
References: <CAFr9PXmHhB=PT1kRoYYowf2dw2fqa1-LGCD5S52hW9jJtq5Q4w@mail.gmail.com>
 <20210311161140.32678-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20210311161140.32678-1-mark-pk.tsai@mediatek.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 12 Mar 2021 19:35:38 +0900
Message-ID: <CAFr9PXmwp5FQP8dOZed0siz76qj4Lo-ytt=nt+1GR5qAFtEr9g@mail.gmail.com>
Subject: Re: [PATCH v2] irqchip/irq-mst: Support polarity configuration
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Daniel Palmer <daniel@thingy.jp>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?B?WUogQ2hpYW5nICjmsZ/oi7HmnbAp?= <yj.chiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_103553_352444_FE276F49 
X-CRM114-Status: GOOD (  17.27  )
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

On Fri, 12 Mar 2021 at 01:11, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> Why irq could accept either?

As the irq intc has no way to clear it's triggered state (no eoi) it
must just pass the signal through instead of latching it?
Otherwise it would latch once and never again right? That's what I
really didn't understand.
If it just passes the signal through and maybe inverts it then the GIC
can use edge or level I think.

> So maybe we don't need to do extra work to check the type for an fiq or irq controller?

I think without the eoi callback for the fiq it would only ever fire
once. I don't think doing the same eoi callback for the irq intc hurts
anything but it wouldn't do anything either from what I can tell.

> And I will update the patch as following:

I think maybe Marc or someone else that knows better than I do should
comment on what needs to happen.
My input is just that the fiq controller seems to trigger on an edge,
holds it's signal to the GIC high until eoi happens and then only
triggers again on an edge.
I guess it doesn't matter if it's an edge or level if that's how it
works but you'd only get one interrupt out of it per edge even if
configured as a level interrupt.

The main thing I didn't want was filtering out edge interrupts
entirely as that breaks using edge interrupts with gpios i.e. using
gpiomon.
With the changes to set the polarity it can now detect rising or
falling edge gpio events. :)

Thanks,

Daniel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
