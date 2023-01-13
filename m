Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676F3C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 10:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCKq+3CeXspv0d8FXq+drklgU4PqbEbjubXP8s8ISNY=; b=yQz/MT67oGJASL9Iy7fjAcEqHx
	MeR+BSyRdmGq8H8Q1WaTbZdd84qtF93Vf6pROJb6Yddq6OwvSzM4nU7+No/yGtWXLb1ebMwz5kbjo
	tv8NjRmWb9gBHmpMTls/gTYK3ldDBKDqVQwlix2glZov1rLJwBLV9R15E+ON5V+01hbA31Tzcfe/r
	wpsNXl+qVR9y/mtcq26O3P7kJ3TamaVuR6M8JWU41jv3tiG6recf+Zb7tRtUBwCQD+WxWWZ7b6lVQ
	IIo9FLBrUXMN9BbgWaB9b+TCWzKIRyrbaaqkAmfOkdQR6IllsGmu5WIOsWtvJG+n+zXFXgasb/Dyc
	FJ3PQGCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHfl-001uGI-LQ; Fri, 13 Jan 2023 10:52:33 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHax-001rsr-Fp
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 10:47:37 +0000
Received: by mail-wr1-x42b.google.com with SMTP id co23so20677031wrb.4
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Jan 2023 02:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCKq+3CeXspv0d8FXq+drklgU4PqbEbjubXP8s8ISNY=;
        b=zQM1ROKNS0lv0njzO8IlF8kS6u62cYpa9djllCqR8EyFB9jz/YeZGIIzf1YTPzEA3u
         RW9uZMnjVnS/JQL3Eew3HhXn2Zx0cKtFUP9oUkFR0NWErEjkNLq36WuC9R8X1xqjrzgm
         oh9wT/ZZFN2QFWVQtfF5In4t6K66RWlY8Fd7pJtyX0HXnbORsSthKyk0Tap1DxSCRwgV
         Z1EgvJhEqTgB9B+nE+HMKPPisuu9XfHKMYg1qRS8qV1o1SQ59HzLeLwQNC557YoKjjVn
         boei+WiOLV6zYg1b6KaenzPWMUI+MhTEJ0FDH8kSnOz0UTTQWRBr1RFtRPevT0rBS2U5
         DuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nCKq+3CeXspv0d8FXq+drklgU4PqbEbjubXP8s8ISNY=;
        b=xmuzQPANX+TKiwYuZIWfC4bUuGsLrzY+Mpks1D4N8SwwCjeLagR6e3TH6t/ivUxVx4
         uPTbj2CbWEOCoiBFMD7xwejxxb9fDv6Jka2ZyuvCn8RSGfdJBO3HGYmxJAE+azvIZiku
         GerkqRR1XiJeNUgibcUTT/WhaGMefH7HhwY4KIU54udb7mjyK+EBZSg0oWt5Zc1NfHSk
         rr5QjoiMVPxHFVi9xbcF28bzfdnITNVR5LFtx5eWbCt62YLPjH0FlXbngeOoaW6bGiBI
         jkc0h5N1Yq7GdiydlY/Vb/gDTiubX3K9WL2u+5V0eG6YvRixfvN4jHB37IYkvi6xisjo
         0ohw==
X-Gm-Message-State: AFqh2krmYA9pS2zWH+aBQpFiJjDlL7N+8ztcM9ZNgG1ZTbpAFPqV2/hO
	ok24RO7ZbLxmHZUGzuZJtoKq2w==
X-Google-Smtp-Source: AMrXdXulZs7fMY6nmb7bBhCC1eHU5O0QOYBucr/XwAPS1BKnehd+EoVOMBDJsbVYl/P6L2fkBk9RkA==
X-Received: by 2002:adf:fad0:0:b0:2bd:e539:46e0 with SMTP id a16-20020adffad0000000b002bde53946e0mr781170wrs.46.1673606851768;
        Fri, 13 Jan 2023 02:47:31 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id n10-20020a5d6b8a000000b002425787c5easm18553532wrx.96.2023.01.13.02.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 02:47:31 -0800 (PST)
Message-ID: <3dc0b861-04fe-317e-9c9a-39c238b71dd2@linaro.org>
Date: Fri, 13 Jan 2023 11:47:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v10 1/6] thermal/drivers/mediatek: Relocate driver to
 mediatek folder
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, bchihi@baylibre.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 james.lo@mediatek.com, rex-bc.chen@mediatek.com
References: <20230112152855.216072-2-bchihi@baylibre.com>
 <202301130353.wbXPctIq-lkp@intel.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <202301130353.wbXPctIq-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_024735_596096_F4E9DC65 
X-CRM114-Status: UNSURE (   7.07  )
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

On 12/01/2023 21:08, kernel test robot wrote:

[ ... ]

> All warnings (new ones prefixed by >>):
> 
>>> drivers/thermal/mediatek/auxadc_thermal.c:562: warning: expecting prototype for raw_to_mcelsius(). Prototype was for raw_to_mcelsius_v1() instead

That has been fixed by:

https://lore.kernel.org/all/20230113064449.15061-1-rdunlap@infradead.org/

and applied in the thermal/linux-next branch


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


