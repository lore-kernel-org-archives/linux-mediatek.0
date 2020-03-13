Return-Path: <SRS0=2fV0=46=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F433C10DCE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 21:06:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 336E42074E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 21:06:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X2AycTnU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 336E42074E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJnEBeZXstzuany7WkkA/GYkQGW87hrDzKZK2vHl93E=; b=X2AycTnUjsssBJ
	XDbx/7XUN8cx35WgNWuWwKRrTHOn61FfDgzprmPbXzRuI2PCOrIaDqAwIeA7luh91s2ABfISvtzgR
	4b/ru3/kSwp68fbP/N2juz095+mdvnBLV/2DJNDw8Eq/1t4oVvqQrrmui0WMmkqyZkDNZVHMNiLjJ
	1Fc6h1MyrG0KU9I+Fy3Gtw91sYyE2w9LLT+QC2tmlsToLSAxaVB7MECmrSQlsqZMRqbQD02PeC57F
	Rkb97yCR++kBAIt1bCVC4fT0x54xonunYKTuVpUQzdVJG25nmUQIAUbSH0P4yKZI9e2zk3Z8Yeuhj
	1o0ZIDARm3CxNTPyNQjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCrVZ-00050i-UA; Fri, 13 Mar 2020 21:06:17 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCrVQ-0004su-KC; Fri, 13 Mar 2020 21:06:10 +0000
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jCrVH-0003IC-Bk; Fri, 13 Mar 2020 22:05:59 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 7674A100C8D; Fri, 13 Mar 2020 22:05:58 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Bjorn Helgaas <helgaas@kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: [PATCH 4/5] pci: handled return value of platform_get_irq
 correctly
In-Reply-To: <20200312141102.GA93224@google.com>
References: <20200312141102.GA93224@google.com>
Date: Fri, 13 Mar 2020 22:05:58 +0100
Message-ID: <871rpwhsnd.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_140608_807509_73D30780 
X-CRM114-Status: GOOD (  13.02  )
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
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Aman Sharma <amanharitsh123@gmail.com>, linux-kernel@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-mediatek@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marc Zyngier <maz@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mans Rullgard <mans@mansr.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Bjorn,

Bjorn Helgaas <helgaas@kernel.org> writes:
> On Thu, Mar 12, 2020 at 10:53:06AM +0100, Marc Gonzalez wrote:
>> Last time around, my understanding was that, going forward,
>> the best solution was:
>> 
>> 	virq = platform_get_irq(...)
>> 	if (virq <= 0)
>> 		return virq ? : -ENODEV;
>> 
>> i.e. map 0 to -ENODEV, pass other errors as-is, remove the dev_err
>> 
>> @Bjorn/Lorenzo did you have a change of heart?
>
> Yes.  In 10006651 (Oct 20, 2017), I thought:
>
>   irq = platform_get_irq(pdev, 0);
>   if (irq <= 0)
>     return -ENODEV;
>
> was fine.  In 11066455 (Aug 7, 2019), I said I thought I was wrong and
> that:
>
>   platform_get_irq() is a generic interface and we have to be able to
>   interpret return values consistently.  The overwhelming consensus
>   among platform_get_irq() callers is to treat "irq < 0" as an error,
>   and I think we should follow suit.
>   ...
>   I think the best pattern is:
>
>     irq = platform_get_irq(pdev, i);
>     if (irq < 0)
>       return irq;

Careful. 0 is not a valid interrupt.

Thanks,

        tglx

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
