Return-Path: <SRS0=UFSY=QB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D44C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Nov 2021 03:37:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 065DD6023D
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Nov 2021 03:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 065DD6023D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRHlZOrePiBbhlRyI1UeQTZXzcP9xZwclWp7OQV1x0k=; b=pwRqSmm4+miR5A
	t3TuJqv5pNojDpiv+aN3jlQjUFen/8szVB4vUgQuwtDMqwTI3iTEECN88t6cD5W1Gg6s3ZEDwlw1b
	EnzQbA1sXkOA2ESny4VGko5c6iaSfXiE7E8vW84SrLDFRA1EnX2vkjMKGsAQFAx8jlC48J0VOVvu5
	XbrlOelrHX9+8+DleRRDUdXmE6D/pv1YleMMG7lcZJ+PgS/kC3G5xhyQReLCYeCFhdOzA7zPrp+YF
	FO83pP07N/DOgVsyjHVVmnzD29zDDapzsI9YZxV6zoFMM9B0m/vDmlczh29eWUJtLpbiFpAuEDTjJ
	KpPr6cgfAxHBVbTRQ5iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mm6KZ-00DISw-Cn; Sun, 14 Nov 2021 03:37:23 +0000
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mm6KW-00DISO-U6
 for linux-mediatek@lists.infradead.org; Sun, 14 Nov 2021 03:37:22 +0000
Received: by mail-lf1-f49.google.com with SMTP id b40so33247867lfv.10
 for <linux-mediatek@lists.infradead.org>; Sat, 13 Nov 2021 19:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fu4fzInvccWJH5qlQyFo9/55jqJ9+GftHv+kByBnqz0=;
 b=sHjRZu8P7IfADNbzdyGC1QR3LhpruWdCWSW+JgzXzqadwnolYXuqBn4smpdyI/kk3j
 u0oBzpOeNwOYDJV9LS6eVLqfjJVAZ0QQNXpojDZU5p3mOJqUEwqu5vU00lKR2vapyW7j
 GXKyTldnKlNuSXb5M6WtCQHxPBjGuQVSMTc7e1Wdp7Iqj6uneCyhDdCP/JL2z0hVy+Gf
 AQSjrunI7EEZ+gLWXFutxmfBpRlAW7SZ1AukYSo2+ctAvejEj04lea7r8caVm6DegWsR
 2ENw1UhAgHw6HmkdeLEvxBPGOC6RlGFplJbPwL539ODkgFHmg3jnWA2BzTAN1bt2uzZr
 UdXQ==
X-Gm-Message-State: AOAM532Hw4R+lteUMP3m7sOxmN2rRDeHeJVW/ildPlan9HxLpxGYx7VQ
 7Ihh02cGiE+54kL1O7W9U9I=
X-Google-Smtp-Source: ABdhPJyGmBlzHI2eOMbfte8P3J4h1aZZftqa0OIs0Pdx96y+IloCRpnCskVdQKfKoMJ0CKbPUSm/PQ==
X-Received: by 2002:ac2:4c81:: with SMTP id d1mr10898365lfl.588.1636861038674; 
 Sat, 13 Nov 2021 19:37:18 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id y32sm1025103lfa.171.2021.11.13.19.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 19:37:17 -0800 (PST)
Date: Sun, 14 Nov 2021 04:37:16 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Fan Fei <ffclaire1224@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Re: Distinguish mediatek drivers
Message-ID: <YZCEbMP3Mw+hHDAw@rocinante>
References: <20211105202913.GA944432@bhelgaas>
 <98d237693bc618cba62e93495b7b3379c18ac6b5.camel@mediatek.com>
 <YYlHzMGAdO1eOQLn@rocinante>
 <0982a0743a2e6fd5678719db0ac6ee74b54f3ee3.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0982a0743a2e6fd5678719db0ac6ee74b54f3ee3.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211113_193721_016493_B2893DF5 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

Hello!

> That's really a good idea, yes, we can combine both drivers into a
> single one. 
> 
> But the real problem is that the old driver has been used to a lot of
> platforms and it works stable for now. When we combine these drivers,
> we will have a very huge effort to adjust the driver style and test it
> in all platforms.

Some very good points, indeed.  The idea seems like a good idea, but in
reality it's not feasible, like you say.

Thank you!

	Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
