Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09AEC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 12:48:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A909A2078B
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 12:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fdFBMCkO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0AEFL5Ug"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A909A2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VRw9XwAMt7Hp8rtL8jldNPNQtkMLP5d7ZO/oajCj83k=; b=fdFBMCkOxO1PlHHESh0pbGn5G
	eeQk0dxzxKyrZiAgn2jvUaXoGwxgpaQ5WTzsyXDn4urroQBCv7tz+nUub8kQ77eWiFY2luZ6Ue0UE
	F61Y3xeF4+lbG4f8QH6z9GSc1J1/Z3ObZh3LMQ6oq59IuoMKosgaU+rWW7I61tvQef2pJo2HHSjMA
	FMNXxDQvx0IcUTTXbQFhkJvR1xEQ8muyIFFsd06Xt/Cnei21G39fhEfFOw1Jhfw2IEB9ae8OLmUz/
	d68gQ4C02weBTmSIDoNeQ0x0ZOCg1FJKQ+Qt6uvW1NpWUhxExHbVeHKG8s2ezy9NKRRr4Josa90om
	EDOMcyywA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8jz1-0008Nr-Ab; Thu, 20 Aug 2020 12:47:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8jyw-0008Mb-Ry; Thu, 20 Aug 2020 12:47:51 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A17AE2078B;
 Thu, 20 Aug 2020 12:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597927668;
 bh=pFq7iB7XnrP7Joiut7KtoVnKCKN42jGESFbYRJbWaKI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0AEFL5Uga/yx7bmcfdjXBBqx6fyLXuznCa39VkuFXi1j1NQBDJLq3mvbmldMpd+Rw
 spaaiQ1Al2myjvxc41nBH1pzTuSK3jVfdOrfpqDVDOZArlgX5e3q96KqElaoO9sbvO
 +p0d3GTbl1r1YfKx4bmiF5XQ0tHqMYYk537DJVUU=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1k8jyt-004ZAx-4r; Thu, 20 Aug 2020 13:47:47 +0100
MIME-Version: 1.0
Date: Thu, 20 Aug 2020 13:47:47 +0100
From: Marc Zyngier <maz@kernel.org>
To: Daniel Palmer <daniel@0x0f.com>
Subject: Re: [PATCH v2 1/2] irqchip: irq-mst: Add MStar interrupt controller
 support
In-Reply-To: <CAFr9PXnzdHs2F3pyF-493xuhn9wFU1G9eLXRtiW-rYNB5bLX7w@mail.gmail.com>
References: <20200819034231.20726-1-mark-pk.tsai@mediatek.com>
 <20200819153757.28993-1-mark-pk.tsai@mediatek.com>
 <CAFr9PXnzdHs2F3pyF-493xuhn9wFU1G9eLXRtiW-rYNB5bLX7w@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.7
Message-ID: <ec3dd6b7664d647b2dc27926539eadda@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: daniel@0x0f.com, mark-pk.tsai@mediatek.com,
 alix.wu@mediatek.com, devicetree@vger.kernel.org, jason@lakedaemon.net,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 tglx@linutronix.de, yj.chiang@mediatek.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_084750_975558_72B903BB 
X-CRM114-Status: GOOD (  17.18  )
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
Cc: DTML <devicetree@vger.kernel.org>, alix.wu@mediatek.com,
 Jason Cooper <jason@lakedaemon.net>, yj.chiang@mediatek.com,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-20 13:36, Daniel Palmer wrote:
> Hi Mark-PK, Marc
> 
> I'm not sure this will be the final version but I'm going to try to
> integrate this with my current MStar/SigmaStar tree over the weekend
> and then I guess I can give this a tested-by?

That'd be good.

> Assuming this version or the next is acceptable can I just follow up
> with a small patch to add the instances I need in my dtsi or should I
> wait until it's merged before doing that?

No need to wait, although the platform-specific details should go
via the arm-soc tree.

I'm not going to review the new version before next week anyway
(I'm making a point in reviewing any given series at most once
a week).

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
