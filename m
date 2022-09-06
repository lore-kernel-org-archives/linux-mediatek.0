Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923EAECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 20:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h237n7/UKMUwrtK2SdW8VgK2awMEb5gtKYbegstNBYY=; b=bjSvvIC3QOmyOEsQYrLlnAozi2
	RIIgLFaBcNR1jKzDBBHFgLCOKuhNJ4dy5LlcRP20RX854ke0LhIbxxMuXpZ9661Y0c+ewzjsGCfns
	g/yeObKuA+eljz1AxDN8ZiBFiPqQ4cilPxyBFQmnUjf0z45E7DW6WsC7bWw72UQW5Jb5l3Mxs9N0H
	Sv6Qd3R0hJi2vqAFHJNTghKPFz+cjrN/LN8BuQ+eGsRIyoA1B7PsAQ5Gs2afEwVDFQbHKq9Hw3J4K
	0A6dwrEabZy6Efm2P2GL+6egMvIzY0XDZpmRXDmdMyg81rqVxud94Ipz2Lk8h39Z1DJGPWhXht4a1
	M9C3HgXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVfLG-00HBkf-2N; Tue, 06 Sep 2022 20:38:42 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVfL4-00HBfA-N9; Tue, 06 Sep 2022 20:38:32 +0000
Received: by mail-qv1-xf32.google.com with SMTP id d1so9261514qvs.0;
        Tue, 06 Sep 2022 13:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=h237n7/UKMUwrtK2SdW8VgK2awMEb5gtKYbegstNBYY=;
        b=lCUlfk1RNpuxwAiYCvs/3Af6ZbW9gCaXR/t4W5EZj0lvBH2IGsJKDmR0RcAgRSdjbG
         FIpDo9RB+OvUpMm3j3sp0ux9UB/EVGw6dw13YTCzjzUwUEUN8MpSur1hoUcF8dI+74ED
         BdnCwwU3de5L7GIapuk4DTxRQ5GvNLcLJak13f6Pzq46uyjgbaNchtVelkZ0LouCTEtk
         XinXrlCwiEKpdYkM7tWtGyPZUnAKprJ2+bTbUMnVyHrKJagiLap86OFpO5+gsHHG5YvD
         iWNkKF+Z0KCIagRozUWrRO9QgDLOHaoW2xn1lFtbOEB1DfDwB85A0OMG14DiKOH1JJau
         TEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=h237n7/UKMUwrtK2SdW8VgK2awMEb5gtKYbegstNBYY=;
        b=pTs9mwpwjLq3zxiM34x1O+KVEhtLPHbOeeGp+secgdEIcMbbU0B6z2Qy9I0476lsyr
         /dHT+OXu+Vf/ZF6gLVl5oOropSMFB8RHILu/+v/TY7ljl1wf7AqNmLW0slnr5StjSdnT
         0Q4l3c2ERC9T9bD26av1CCM5jPL3HrUFng/uzlbCpSM9NvxGPmLz0nCvXaufIPhK/ZEm
         QcNHu5XxRgEpKszdnXLFgfP0CGRnyTFR86kRTKcjGiaFQ2BlaM0TqwJy7p9AEvkfiIY8
         ZfZbyx0MujAjqfwjcQ6XWAkKYjKB/uFH9vsWwvdP0XOhz/FcGI6K8thU8OUpmazzvYWH
         CARQ==
X-Gm-Message-State: ACgBeo0oTuuRcJOeeS7QgkuMnULVXL4O17zR/TA6lotnXU8lbWGGAadf
	7L6lmWc77KCZDCrjNHQQd4hnqZrkE2E=
X-Google-Smtp-Source: AA6agR4/gnXe/kw9M8c9Ft8wZy+DRa7WhO497d/AyApMFfagKNLbUVb7qzJX/XoqxQvZyYcORdmRMg==
X-Received: by 2002:a0c:b2de:0:b0:499:363f:222f with SMTP id d30-20020a0cb2de000000b00499363f222fmr319781qvf.73.1662496706717;
        Tue, 06 Sep 2022 13:38:26 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id bn5-20020a05620a2ac500b006bb41ac3b6bsm12005175qkb.113.2022.09.06.13.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 13:38:26 -0700 (PDT)
Message-ID: <9df7311e-3b8c-40e0-d100-b8dbeb24373e@gmail.com>
Date: Tue, 6 Sep 2022 13:38:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 04/11] leds: bcm6328: Get rid of custom
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
 <20220906135004.14885-5-andriy.shevchenko@linux.intel.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220906135004.14885-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_133830_785516_1037D2D7 
X-CRM114-Status: UNSURE (   7.36  )
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

