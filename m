Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28923C388F7
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 23:01:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50D520782
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 23:01:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h+VD0D3Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gHeFlHOn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TfHby8VV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A50D520782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mA3ZeQni9mxhDvZ+mZH1khhVZK+q49+ibt6AmC7n5iw=; b=h+VD0D3ZKe2xgwhwyRyUSUL5q
	+gGIt9a6LGVx/NjcotR5nmlrMNw6e8eN9+0AZ1H5RO1Wp9fd3Zbom00jMlpJqF0ulEzfqjyzIegG5
	ThTD3CLpsIRFl6JnxFgBhGQAqELifq+7QYh0oXTRhbUiXa6T3vEv+eZDHldI/H3wnhaevi++rlNxC
	QtuDTQ6bRPc8YhrT9DO7jILwJs+qcgOwAQwMVcKXejrSouWXtjAwzzdVHSuTLV9Wmu0LQcMWNSAW3
	24isHymtnA2Gu6RqyvBXfeX7IHk0Gi4MB6eixW/1HaV5uVFLm091MzI0Cl1yePWQQqmpFIhRSzREV
	vv/SY7qsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaoFM-0006a1-1U; Thu, 05 Nov 2020 23:00:48 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaoFJ-0006ZI-PO
 for linux-mediatek@lists.infradead.org; Thu, 05 Nov 2020 23:00:46 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604617241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tz7m6BIOMuQlyFY37lHCaVeHt6JeUnmsr+dDR5lFJn8=;
 b=gHeFlHOna6JrJgqSnxi/s5nT3Ju0xpCJK5lZ3BFoV3zddqdHkEibo1fav4UT1JDXNvUoyC
 Dca6+/Zp5erjKWLsZluVuHgkmRnBwvRinNTIh75zMlDWAOLFwlD/kcIIgt80g9ka7+1c0Q
 GdJH1yVXGBBSC8fdUMockqHuwoXJEAMCS9uEOzUoJaK6hJmYT5tmbKuGWvQwu8vglLffTD
 OQrTGEo+urMvkUqkKQr+fGVPEcuPgw3pP7ZT2wu29emTNyBdzFcDqpT+ottxtAd+4UGFee
 lNEbNzUAWxq1cH5hDrPD7i/v433TAPCuxZdAUJctj5xxb60aIlR4r+/f03y3Yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604617241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tz7m6BIOMuQlyFY37lHCaVeHt6JeUnmsr+dDR5lFJn8=;
 b=TfHby8VV4W1CChr0voWomcazL5DKNae6yYtIu+oRcJgKYQzAhuxGqoH9/N1QOdYkbu0L+8
 Yl++Nidf+A30u1Cw==
To: Marc Zyngier <maz@kernel.org>
Subject: Re: Aw: Re:  Re: [PATCH] pci: mediatek: fix warning in msi.h
In-Reply-To: <074d057910c3e834f4bd58821e8583b1@kernel.org>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org> <1604253261.22363.0.camel@mtkswgap22>
 <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
 <87k0v4u4uq.wl-maz@kernel.org> <87pn4w90hm.fsf@nanos.tec.linutronix.de>
 <df5565a2f1e821041c7c531ad52a3344@kernel.org>
 <87h7q791j8.fsf@nanos.tec.linutronix.de>
 <877dr38kt8.fsf@nanos.tec.linutronix.de>
 <901c5eb8bbaa3fe53ddc8f65917e48ef@kernel.org>
 <87o8ke7njb.fsf@nanos.tec.linutronix.de>
 <trinity-1d7f8900-10db-40c0-a0aa-47bb99ed84cd-1604508571909@3c-app-gmx-bs02>
 <87h7q4lnoz.fsf@nanos.tec.linutronix.de>
 <074d057910c3e834f4bd58821e8583b1@kernel.org>
Date: Fri, 06 Nov 2020 00:00:40 +0100
Message-ID: <87blgbl887.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_180045_975810_17C3C6B6 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message.
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
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 05 2020 at 09:20, Marc Zyngier wrote:
> On 2020-11-04 23:14, Thomas Gleixner wrote:
>>  	/* Resource alignment requirements */
>>  	resource_size_t (*align_resource)(struct pci_dev *dev,
>
> If that's the direction of travel, we also need something like this
> for configuration where the host bridge relies on an external MSI block
> that uses MSI domains (boot-tested in a GICv3 guest).

Some more context would be helpful. Brain fails to decode the logic
here.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
