Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28307C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pp+Ibrdoqjff50hMwjuTIMMuaE7cEo4GAlZ3xNdh2mc=; b=HQ1Bt3lU9/+Ci00G3rmCiiTi1z
	6jO+340AxYOW3JX7qm/DnPFLJ9Z5wQAWJW1xilG2Tpzte3pSDujDg/KjPJB+r6/MfQDotvq6Js8/I
	Mg3M9kn9BAkGntY7v9yg5AfYoYo6LbdPzIufSd8lwrn+045jYxuphfYl5lcSlqY1SuzSLHmhz2Ctz
	0icXQQDF9QQnVzWWR/yl6hYLAgGk+xaWvjshiaoRsmPg4AP5MGA86PLmZ0j51ZcYA5fQMdYKoCCx0
	BO9XK+blBk081GT2KDU5jo0SgRa66LUbLCAQc6sbIiNQ/Zl/P9qpMZs9LtC7Dfsky5pBlFAAceALL
	FBKFZYCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMSU7-0094xH-F6; Tue, 22 Feb 2022 10:33:31 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMSLe-0090s7-1h; Tue, 22 Feb 2022 10:24:47 +0000
Received: by mail-qv1-xf36.google.com with SMTP id p7so40269548qvk.11;
 Tue, 22 Feb 2022 02:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZwVsXW12gm3VwwhPmVGdM4QmytARwditCmcefz+2r74=;
 b=Z1mQiaGgxCb9cd9lkH/PWqaC7V+yMwbi8iDmq2TQ4kPMn+Dhm9OXlqeFFF+rMvgQZE
 8/b7D5EtYdkfjwwtrUAf7pUFKB2+NgTSsiVs2WbKyMoYVQ69FLQdzDOFEa2MghOF06jO
 M/JBE0U0abxWVXw8mRF0MX4CV6fcS3JfA+R6qMUqmkOKLT+v+N2kt2nlDEYeaIJuu+jR
 xJ02RjQCyzFBjewl4i3R6pRfjFHD09KEOHWd+wDAjMiBe/kvBX4tRYIMhNuHZdRCXRIm
 703qF9SZZX+aDIspAJafIAXDPQca+8eflHkw3Uve9aGUzOgMh6foCNCgOAn9M5JKmznP
 Y1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZwVsXW12gm3VwwhPmVGdM4QmytARwditCmcefz+2r74=;
 b=mIbm8EdXXottmrumOA8bjF+30z7c/ab+0eHvlT0JrdnZzH2Ow3ZT3jJjt50u4jalwM
 O6uM+vTfoelFd52QkcP8OHCH+iHoZfHVX+IBfKD1s8ngmQQDXOkbtqTQKw4gwW0SS/Rp
 wsNLylhiSA9mhcJfuvaNF3EFuN6AAEQHit5DF55NOHJsXbKNBQgSBB8NPrmMyXnxssRF
 ESVeP/YH512AJIm9Q7pkwlW7GDRW4KT6yoKyOGSZwrSUL/uq4qeN2ju0PZt5N3sJfkmQ
 8LJ2QJ4kPcDghYRVM2EhLoWA5TeKBFx0cMCQ3GPGAl0hm6rwBmMPB1Q+lyk8cfWS5H/C
 ObTg==
X-Gm-Message-State: AOAM530IkWcLEJb4I89g3VgI+mQ232Yp2u3lR8k3Z3ycEPrAX7JNegMR
 htrKiNhYx3f6m6Vi0ThkpR0=
X-Google-Smtp-Source: ABdhPJwY72MpP1R5Ah7WW2R4pXSYtRWIGk0/fr7S/30d7VWzLmNB/IjZkS1+K5fOokHdqM4wX5Slow==
X-Received: by 2002:a05:6214:4a1:b0:432:3676:f227 with SMTP id
 w1-20020a05621404a100b004323676f227mr2877021qvz.25.1645525483968; 
 Tue, 22 Feb 2022 02:24:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id y18sm32215141qtj.33.2022.02.22.02.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 02:24:43 -0800 (PST)
Message-ID: <6534b889-41c5-dd7a-578b-27dc6668064a@roeck-us.net>
Date: Tue, 22 Feb 2022 02:24:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MIPS: Remove TX39XX support
Content-Language: en-US
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Paul Cercueil <paul@crapouillou.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20220222090435.62571-1-tsbogend@alpha.franken.de>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220222090435.62571-1-tsbogend@alpha.franken.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_022446_163052_BCE5A614 
X-CRM114-Status: UNSURE (   7.29  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2/22/22 01:04, Thomas Bogendoerfer wrote:
> No (active) developer owns this hardware, so let's remove Linux support.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
[ ... ]

>   drivers/watchdog/Kconfig                      |   2 +-

For watchdog:

Acked-by: Guenter Roeck <linux@roeck-us.net>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
