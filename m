Return-Path: <SRS0=9ZOH=45=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598D0C10DCE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 22:45:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2749E206CD
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 22:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bYRXn4sS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oiPs69xd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2749E206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6sU6jhEOAaF/pRN7yQSbEjJ7ZGW5ajErfJVRPUB3eA=; b=bYRXn4sSFFBQrc
	v/iSYiaxdF0oyWHtyePRfxW2ZKJzoKEvscUHrBf5zgY7kWiwbLzQi9/rgGACc5mNWXsZlDFEaI6Sn
	nN1e8ZdWzZlFDYMLipi07HRVhyErbr0EcplDRg+bc8NOg+2/DHUfDy/Rjc/tkRNnr4HA26Jjb+A2/
	/VCvfG37K1xlZEEGFjdIpyIbOqB5kPMwHENW9TjUuw0ktddWToYF1fASarsdQS3KLVaohy6/bg9k9
	YRg29EYb0o5wsfADpAF9VcLvEfFnCDXBfE+qi1lR7JPjFYFvjK+IsziFNxYBh4p9K++dSbVPF/UIH
	tjjyhtxmlR58X5+zWeFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCWa8-0003jX-Ec; Thu, 12 Mar 2020 22:45:36 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCWa5-0003fX-0W
 for linux-mediatek@lists.infradead.org; Thu, 12 Mar 2020 22:45:34 +0000
Received: by mail-lj1-x244.google.com with SMTP id r24so8410639ljd.4
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2020 15:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+ZeV6SGwYz2oD3/6K0sLROfW8IF3ilKt8DtskElDrSY=;
 b=oiPs69xdfQO1PidLik8ECa+vZDnXjhz4IA9cfdIrSFWeQSVkq3f6Vuqtg7nqOSGpzz
 aPWaBfMxN76W6k+YcI62A04x9LTXaoGqfRVdTioZMtxmFIZ2XX/m9C8hi/X99aUXJ914
 9ZtRAdysFJjEsfngds8YFemQQIhGyWn7G4Y+IJL3vZL9RHKV9oZAdCdRXkqabn6itURW
 KehVOuHkxHYZ9iwT8WXYqXYA8GHnZmhc1a05rnJWy6NO2Zi4yA063X/yFhLO6pNOpfVR
 Nonz5KsXWFXaNuIPo/oM14mD6mg9ict9ghMTx/DvkJzdTyQWtVsc+S8eNXdCJTm1ZqhJ
 Kd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ZeV6SGwYz2oD3/6K0sLROfW8IF3ilKt8DtskElDrSY=;
 b=pbFV5KU/tcN0N664RjHxwE1k/x1uqmsz7JVnmCxGv7eyhQLa5Y8Npk7o+vLmRlncnE
 rdjAFMiT0GNEzh7WWAHyoGENcr1P+LVF7v+47blNRTP6VXie/eXG8J5ErOktj8LGXUNE
 nt1vGhnF0Ft9Rki2dhiScnK3jopnIPIWqKdfioXS+iRcbyI59K40VuPBqnb+Gh2YE0YR
 LU216K9oEy4CnIArbgX7V7uN9ecyNCAEq/U3EGRqX9IYwtir/flV5JakDrcAKTiWjwhE
 KO6e2GDOsw/u2O5yHvw8spFC5dt5b3EMoTR7byXlT5GSyJRBdden9Ps7b7y/X3pUMq3E
 6zHw==
X-Gm-Message-State: ANhLgQ2xS0iPkiWOOKIjvlfq44eX1BlX/VqABnue/2KUiv427bElZCfq
 wz5qKiTDuEJOol5//C4MqlQGltF2222FvDuwUzx6Sw==
X-Google-Smtp-Source: ADFU+vtWfdH9h+8ouBw1URtkmc7DSWqDje0HNsyXDSW5sqzgoSdTiC3LGQo1g/WEOkxlBaUBFPb4j6lbqK8aPWb9ouk=
X-Received: by 2002:a2e:894d:: with SMTP id b13mr5954798ljk.99.1584053130191; 
 Thu, 12 Mar 2020 15:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdYv0U0RmT7snp+UejEXecq4wLkhc11DUniUfGYAgyXC=A@mail.gmail.com>
 <20200312190202.GA110276@google.com>
In-Reply-To: <20200312190202.GA110276@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 12 Mar 2020 23:45:21 +0100
Message-ID: <CACRpkdZrSHTry1fmFbrAAwbVu_zi1oez-uD5-8RtOVL_H54O+w@mail.gmail.com>
Subject: Re: [PATCH 1/5] pci: handled return value of platform_get_irq
 correctly
To: Bjorn Helgaas <helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_154533_120131_D9C9CEB6 
X-CRM114-Status: UNSURE (   9.17  )
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
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, linux-pci <linux-pci@vger.kernel.org>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Aman Sharma <amanharitsh123@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marc Zyngier <maz@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mans Rullgard <mans@mansr.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 12, 2020 at 8:02 PM Bjorn Helgaas <helgaas@kernel.org> wrote:

> IIUC, in the link you mentioned, Linus T says that "dev->irq == 0"
> means we don't have a valid IRQ.  I think that makes sense, but I'm
> not sure it follows that 0 must be a sensical return value for
> platform_get_irq().  It seems to me that platform_get_irq() ought to
> return either a valid IRQ or an error, and the convention for errors
> is a negative errno.

OK I see your point.

I would be fine of the code is changed from:

if (irq <= 0)
  error;

To:

if (irq < 0)
   error retrieving IRQ

if (!irq)
   error driver requires a valid IRQ

To the driver (this one in specific) the IRQ is expected and
necessary and I think it holds for most PCI hosts.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
