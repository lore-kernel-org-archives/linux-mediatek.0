Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B968BEB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 12:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/5wxHDy6mL4FcPapG0NJLXj6++vEZT2MS33NrQ/lTQ=; b=L8jfvy1SjZtOFvtVa+CFvg8b/t
	6kWn7cS4iLnJa+NaK7BQHnqI/IfIavkxk6xGKceN8E1yYBvBs6452PUZ+Pq+tPYqDQ952ghpa2im/
	w7Z+YisuoBfyOJMWjhMZsm5Wi/WhNkdZ8aG59DPHdTo4YAXf7fzZ58JO4FxB5oYkvv9D6W6bDA6y5
	0pwfgbFsOa98y6pi3qJ0d+M8nyZ/Zt3e5uUPHtKwftKEK9deY19dADtYE03l9P1dzHAVXrKxeXALF
	V3vHUJfoy8iypm49Po6fVCrvSUN+rAhsJvKlKxKq99rXZuhBOeHswQlxhxROC2AHOUj58esFjQ1Iw
	CCVIrjPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHNrh-001aCf-1R;
	Thu, 06 Jul 2023 12:13:41 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHNrd-001aAh-15
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jul 2023 12:13:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbc656873eso7836865e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Jul 2023 05:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688645613; x=1691237613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/5wxHDy6mL4FcPapG0NJLXj6++vEZT2MS33NrQ/lTQ=;
        b=IbzlafQusCaKto71OXk4bPoXEo7+FCrn+i1Hk7cATXwj6jD0FU8RZdq5IA1kP7kLfv
         3wa2qn53DE926m9gNw+SaXT8iilPDkuOnkdWh3rudUNg4TkmKbsep4bvf6f4ina/mf0n
         DRzQ5WErugGScBJuVhHq5WnqfJ+sbM8TC8wciV21yFhQIkvdpuXBfsE0yBYDKWNEyEzu
         lpnbDPWvcKk1agZbeYhhPixhkIwdNkyTBaE4WrvBvWEH7byJOAeR7mDKtmdQTgGRv1FI
         o1xazO6BOLl8JRFEvxnms30i4deFFBhipFbK+xh41OKOpj6wb+fGF1re4lHoK4boQTQD
         xVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688645613; x=1691237613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/5wxHDy6mL4FcPapG0NJLXj6++vEZT2MS33NrQ/lTQ=;
        b=EwIfCCVZVWg2tnXElEYhAmfYCJUj31dzQGxE0PfoVgejCUAyBUqkRFjZwEnw95U3lC
         Q/8Me3aIhFyN3g6/Sqg0hD8PKMlov4VC8Xv46TFyo/V9ZqPL1QsQLBBgX5wGoN4tKks4
         GphXIxZ+l7CdT3Tsjb5n+EtAmW7JVvMLCXfxGlcqj6t6HRPEdbo8UN++/FmYRIVqqqB8
         QieQ17NxxQBRWaMSm6Ps3XW4T/WvIGxJv157+N8alBV6oPY93E0STQZIMlpn9X/4JeEg
         HhOPY77LlfnA73QGWXTCOBJlqvIJ5Nallm8KbZzq/5U2AL81xJ5WgWwl/sDMWWu+edjS
         sq1g==
X-Gm-Message-State: ABy/qLY3LKgtzbhJ0WRb9pYVyVw8MDqIg995eVepUbJOOYYNj3WXXSsL
	rJk2+olwHRq47pKvWqxloDfHfg==
X-Google-Smtp-Source: APBJJlHrBYvDJNnzrZAW/qWNal0XP+4b2h86axDo0FU4omajc4qpoygiGFAh45R45C+UW4rrqkg3cQ==
X-Received: by 2002:a1c:f709:0:b0:3f5:fff8:d4f3 with SMTP id v9-20020a1cf709000000b003f5fff8d4f3mr1994310wmh.7.1688645613660;
        Thu, 06 Jul 2023 05:13:33 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003fbb2c0fce5sm4911847wml.25.2023.07.06.05.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 05:13:33 -0700 (PDT)
Message-ID: <4f493bc2-45b3-13b8-f1b1-1729a803c74c@baylibre.com>
Date: Thu, 6 Jul 2023 14:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/mediatek: Fix potential memory leak if vmap() fail
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230626185801.684451-1-suijingfeng@loongson.cn>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230626185801.684451-1-suijingfeng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_051337_372514_6B99E511 
X-CRM114-Status: UNSURE (   7.75  )
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



On 26/06/2023 20:58, Sui Jingfeng wrote:
> Also return -ENOMEM if such a failure happens, the implement should take
> responsibility for the error handling.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

