Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AB9C56201
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 21:03:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97DCA217A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 21:03:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vupb2LAd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cak6NKWh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97DCA217A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KL0dgSKhjgfFtUH/QjEENeb47Gtu8/27+COBCPGw+J0=; b=vupb2LAdmctpYn1TiyTzp3y0m
	48kgZV1ZyzaTK+36ZkGNIhL8l2dYTyuT+vteSup3j4EdTYUYkORYFHrI+6xzIKWsZrso8BB4GZe2q
	xBfS13amTU30tQqjzBXzAZ609JO+5JwoGDFLlK0Oo/WDm8xiornnGmjekxOAbSBqbCe8GgcRx5FuX
	7weZ+1Dx+bfG4iqnuZrI3gujyvZlGkfw82yOxvOBFbyy/v2/39Ds4cVhv6jX3wwnY7AywdKrTd0Rq
	UXNIL2jNFCrdxc7EIYLGQilcyPa+OEY/BUYfvqYBfWiAjsUkK8xbVFkjXmPqu/mZZaIrQrerb5qU3
	dfPe0en2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfr5O-0000lt-UM; Thu, 19 Nov 2020 21:03:23 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfr5M-0000lS-L3; Thu, 19 Nov 2020 21:03:21 +0000
Received: by mail-ed1-x541.google.com with SMTP id e18so7326697edy.6;
 Thu, 19 Nov 2020 13:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z+6guBZn9GHmdHYk8ZmUrPsCpMGVrAJ66ziNvmZxoyA=;
 b=Cak6NKWhvWwm87Bj0XHStuYGSzcAzR3vwi8cod/Z519qxht6kEtXz7I34XZOH/fqIa
 AWDnlXQw0Tik0Jh+Vk6mXoZbCXPY/DsVFFFE5BYo4PYx4AnFJobLcYza4Hax0QRQt0bp
 qBtfCyOcK7qtMlbs7L/6dOXmP08YDieUuVmibrQ7qZJw5i4SsUGGb8SXEeaX4cL0piOh
 Qq9/vTMUOnfSf52e4stWPzb1iKYxzyLYmCs5CDH52L1aHKHl1cUh2XMkcqGKpnj3SXnm
 4jZMxPVUA8rskSFcyIpTAwWz9QmmzGzORokUafH9sStWRGmcayfnoN0stKhZTUuid9KR
 1Yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z+6guBZn9GHmdHYk8ZmUrPsCpMGVrAJ66ziNvmZxoyA=;
 b=H2PZtf2ostivq20qRBmGCmIxKVvK+p7bvMWGIb7IS/bRHlR30xLV5DUKBeUcp/OF8P
 mlvxqHJQ79RwTYS+kFzugJchR47dDZ41cav1jwTwGOF/f93oFw5t6e/kyvOVpEjLaK0D
 UybNeykNsca0I9dtxSFUMUaRTS+h7kdf5gKnwA3Ae5x0PqVlKQpZTetLJhWk0BkR7xYw
 mo8l39Q4ubAaql7XCKpK6ZpI69VFBb4EUhUmWE5/Sgm6RMMy4p/8uqtEudoKnxCvgEge
 l1Hn7SYyXCUPQNgKYbsOCNJLrwykzqaeRS5wvaZVvc2XO6TKLQOIpIL+ksXI9wQRX0r/
 4xzw==
X-Gm-Message-State: AOAM532Jw8n6AsNkZ2eTlNQd0a/AnEE0JN32hgl960eLsF68JjDR6R1D
 uXfAr53ejoUL2i/har/3ifs=
X-Google-Smtp-Source: ABdhPJwtMZKYg/8ElqODRGOr6xTnw62vC6bOi+oR6icynu4UyKAd85htDro+/oWjVAG5J8PU/pHF5A==
X-Received: by 2002:a05:6402:8d5:: with SMTP id
 d21mr2613263edz.11.1605819797950; 
 Thu, 19 Nov 2020 13:03:17 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:5807:584b:19c8:e7be?
 ([2a01:110f:b59:fd00:5807:584b:19c8:e7be])
 by smtp.gmail.com with ESMTPSA id p1sm286020edx.4.2020.11.19.13.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 13:03:16 -0800 (PST)
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
To: Pavel Machek <pavel@ucw.cz>, Gene Chen <gene.chen.richtek@gmail.com>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
Date: Thu, 19 Nov 2020 22:03:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201118213712.GA22371@amd>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_160320_709010_3078F886 
X-CRM114-Status: GOOD (  13.43  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, linux-kernel@vger.kernel.org, gene_chen@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, matthias.bgg@gmail.com,
 Wilma.Wu@mediatek.com, linux-leds@vger.kernel.org, shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Pavel, Gene,

On 11/18/20 10:37 PM, Pavel Machek wrote:
> Hi!
> 
>> From: Gene Chen <gene_chen@richtek.com>
>>
>> Add LED_COLOR_ID_MOONLIGHT definitions
> 
> Why is moonlight a color? Camera flashes are usually white, no?
> 
> At least it needs a comment...

That's my fault, In fact I should have asked about adding
LED_FUNCTION_MOONLIGHT, it was evidently too late for me that evening...

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
