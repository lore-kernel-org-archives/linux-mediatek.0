Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0097C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 05:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uslu0ZwIdbBAB9DtRFNhbaFYYXQ5l/7Bay9LuhkFhWA=; b=ScUrX1n75eF8lCfJX4KdF0LsGN
	lHRvOgCp/3XYxb3WKOdFr8ormSeSlFXsW45tInV07cPA9YE5R/mNF60FsFZWSY7TfB64XRxidZ/se
	OaMdgg+gzHqdzFxfrKggPAAiP8UPbb8svRFoJCEVmeFJ2SnQ6c6vX/0RrFcwWD3ldTt+MU5PW1Hfk
	VCF8LQ3ARiCkDD6DDwG9DHs2VEUOJ/s+/DlWmtZP/i+iQDAoEw++lQj8siB15ADUMKhm2Qczv13Ox
	YH8vRkSz4lK2jSDgbMIdEHfYKQDjpwhmVhNstczFVvkZ0DttVfowHcZIOlognr5Dlh4jmeiMLCJKs
	1MZqpgqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfD9j-000nxk-1G;
	Thu, 23 Mar 2023 05:06:31 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfD9c-000nw1-28;
	Thu, 23 Mar 2023 05:06:28 +0000
Received: by mail-pj1-x102a.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso816372pjb.3;
        Wed, 22 Mar 2023 22:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679547981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uslu0ZwIdbBAB9DtRFNhbaFYYXQ5l/7Bay9LuhkFhWA=;
        b=J8vXcQBi+56tXwzVdXHJT55bP1SfM6Cn6M25eb3QpZqiR6eZA0xVJbUx8P+RebeZmS
         azK2SPBLvNo6mA6M/GydZCzPD4dmqUjaftnwfjF0dqvzqajN94mxGTQZlZTiB1qlXWI6
         d19TaZE+TX3RTzhStG1H7CjsmTZmh54WblXKh6q0PHxH1TAIJFZM5doQ8br5COPNJyPO
         96lG9UN08nNpK9/5Z8x1nk5VcAAk+JcmuefXRf4D/OZ8PIwL3OwSVPBoauPCl2YHt4Gc
         TBnTjzerYodxGbxxsoQDWAEs63/8tNtCxvnfjtgAnqETfpmeM2mSgt0EGygJ36FcTvaR
         HkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679547981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uslu0ZwIdbBAB9DtRFNhbaFYYXQ5l/7Bay9LuhkFhWA=;
        b=wS7dSF0zFW9aoF5sL8RicYhHRxwcc0ymqwgNvJ0VNxpWlv2IR6gUxwBzp2khfs7EiY
         p8VoFrBADfTW4HQwXXvEX8l1b64mLSnCzSJzlQv9j3zqcsi5CB8o2sY0elnkqGI5AIci
         HZNcB5g3sbh+XPnTeQsOfnU3ZyZ+Qezkpt0b8uaeC8/2QRzuzwQznBlj2qrYSqeCUc3P
         j1z8jRLQfvlCrYrm8LmjQ/ZzA4gcZYg0S0R/b3GcZPWZQFk20oH6Im5BgouVTJgF60PQ
         97ZGIh77EBrEbntS09i+gt1MUUSKd5tjhqBsZKphHVaIfnAYj3QiO50enDaeULEv3V1G
         33SQ==
X-Gm-Message-State: AO0yUKURI6fJPAEMpzSI5HeGCjtTy+Jlu2Kx0Dx83HCVMpOLHupEWhM4
	g69X3aq4a/+G8F81mB0xFH9Iagrua5c=
X-Google-Smtp-Source: AK7set8pmIF3SpB2VlHJjep6SwQTSbIVUIZGhIu/mR5Peoy8RYSak9CpuzCZsgIi1ozBpqpqMySaMA==
X-Received: by 2002:a17:902:d50d:b0:1a1:cc0c:a5c0 with SMTP id b13-20020a170902d50d00b001a1cc0ca5c0mr6797000plg.63.1679547981613;
        Wed, 22 Mar 2023 22:06:21 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-43.three.co.id. [116.206.12.43])
        by smtp.gmail.com with ESMTPSA id k2-20020a170902760200b001991e4e0bdcsm11444168pll.233.2023.03.22.22.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 22:06:21 -0700 (PDT)
Message-ID: <2b8667b5-ea54-2ef4-f069-a86acd28ecea@gmail.com>
Date: Thu, 23 Mar 2023 12:06:14 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/3] Documentation fixes for MT6370 RGB
To: Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux MediaTek <linux-mediatek@lists.infradead.org>,
 Linux LEDs <linux-leds@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shuah Khan <skhan@linuxfoundation.org>, ChiaEn Wu <chiaen_wu@richtek.com>,
 Lee Jones <lee@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>
References: <20230319074903.13075-1-bagasdotme@gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230319074903.13075-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_220624_715390_2A12AF7B 
X-CRM114-Status: GOOD (  10.47  )
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

On 3/19/23 14:49, Bagas Sanjaya wrote:
> kernel test robot recently reported htmldocs warnings on documentation
> for MT6370 RGB LED. So here are the fixes.
> 
> Bagas Sanjaya (3):
>   Documentation: leds: Add MT6370 doc to the toctree
>   Documentation: leds: MT6370: Properly wrap hw_pattern chart
>   Documentation: leds: MT6370: Use bullet lists for timing variables
> 
>  Documentation/leds/index.rst           |  1 +
>  Documentation/leds/leds-mt6370-rgb.rst | 42 +++++++++++++-------------
>  2 files changed, 22 insertions(+), 21 deletions(-)
> 
> 
> base-commit: 4ba9df04b7ac66d2d000ed7ae2d8136302d99a57

ping

-- 
An old man doll... just what I always wanted! - Clara


