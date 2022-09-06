Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2540DC38145
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 20:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h237n7/UKMUwrtK2SdW8VgK2awMEb5gtKYbegstNBYY=; b=gRGRlL6o0/iT1Q3S3Rw1JpjWdP
	xUetw2CSGwmEvr0xTDJre9qQSnhvWx1Y3lvHg3nkUaWrW7hxFHHZ9c/OVl/oaxeoXdMr88k+x0eQR
	nuk2OaRB6JBllC82rKLionHms0423CJzIBudsRjC3Tf2m+MtnNOEJMdUvCptf0rSv8vZt4+dWkw5r
	x5zoxwx7hYNxwgntFVZVPZgRobFOH/AEVYqDDSUmFm1RUpfkHH9Rw50b9qtAb0KktF6X6pE+7IG9a
	mlR8NtmczXT0w5EcZvBihuA7VCsA7BD7662776Wd6eEmwUG0xFLWENvvk7bN5pwry7tiujxdknD7u
	mgSwKwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVfLb-00HBwE-Is; Tue, 06 Sep 2022 20:39:03 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVfLO-00HBpB-Pb; Tue, 06 Sep 2022 20:38:52 +0000
Received: by mail-qt1-x82a.google.com with SMTP id y18so9006171qtv.5;
        Tue, 06 Sep 2022 13:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=h237n7/UKMUwrtK2SdW8VgK2awMEb5gtKYbegstNBYY=;
        b=C9Ss8byNwMFLSuiFD4ppV8owA9/4wkUTBP/U9WKwcHSUI4M6aleZ6JI47wDpnkXwvP
         sZOiL5B8tm854nQMBnoWx0QFNoZAC40OYRWf3oCu0hnqVdbYj86/gybzpnL3oBIPPAZh
         B53R+G9LFexSWJa8KlhN098kxoLc/uAlOUrSWZ8IgB4ORIpBlIj3V7ZDsxkySiy77FAo
         jF809Cgn/tHn57YHP3b+oVVszQzoN3sVs4fU6e/0EylbBuZTDwcFJsF0CpFHEx6YUo5m
         DCDD2ERnMUeNyjy99d2P8UijGtKO5WqpGOcppPHDPOBaSMIdO1jnJGIW2VRCtez5JZ5f
         764w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=h237n7/UKMUwrtK2SdW8VgK2awMEb5gtKYbegstNBYY=;
        b=7hBhsJFDrY5oGvlgiFTpaOVr6C3Qac8DTHpyyi/5P9oPtHYoL9R6MhitA8Hlx73knM
         k5Q5+mUP+hGc+EdiRvIOCYo9q3w/FAxp55uCqvFATOqAj2vbfaVxR9rT++OBtRTaKHST
         f3kkJVMT+lcDetSGBBZ3hwQ+NMCHI6P5z5TLqYF5t9pATTkOkSGr2BEGUmWyat5FumJB
         Sh/7bYMm5KaWhjvWRi38TOYNBjiDFFMdxmcplrtygHrYcDjiRkrNJ1i6tAy5nrKUNc2b
         fgCJVC7SqCadgTIowVpdiB3Ie/gMdfruyxhwudqIntHIISv2TfMJmECWWnge4U5c5L0U
         oRiw==
X-Gm-Message-State: ACgBeo3/n9VsxKk0waNaIqhYpQxvqddixyCh12N1gWf6DPU4y+rLoTj4
	e8izKNQs2dPneZJYaSg7PqI=
X-Google-Smtp-Source: AA6agR7jUYM/thCW3aozvylNyqUlO54iIfwG+TJITPxh00AjybJsEh/bVfCV5cWcRER/xBmwVBiXKw==
X-Received: by 2002:ac8:5907:0:b0:344:e61b:8c0e with SMTP id 7-20020ac85907000000b00344e61b8c0emr335730qty.349.1662496729120;
        Tue, 06 Sep 2022 13:38:49 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id 137-20020a37078f000000b006be68f9bdddsm11617656qkh.133.2022.09.06.13.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 13:38:46 -0700 (PDT)
Message-ID: <a475ec3e-a1ce-c81c-5d80-8254e9b62068@gmail.com>
Date: Tue, 6 Sep 2022 13:38:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 05/11] leds: bcm6358: Get rid of custom
 led_init_default_state_get()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Gene Chen <gene_chen@richtek.com>, Andrew Jeffery <andrew@aj.id.au>,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Kurt Kanzenbach <kurt@linutronix.de>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Lee Jones <lee@kernel.org>
References: <20220906135004.14885-1-andriy.shevchenko@linux.intel.com>
 <20220906135004.14885-6-andriy.shevchenko@linux.intel.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220906135004.14885-6-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_133850_838185_FAD0EE86 
X-CRM114-Status: UNSURE (   7.18  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 9/6/2022 6:49 AM, Andy Shevchenko wrote:
> LED core provides a helper to parse default state from firmware node.
> Use it instead of custom implementation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

