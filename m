Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A97C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 07:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdAF+ibqcFz4f6UdI5r5abisS6qF8hg1G7lhZkeAXYk=; b=velPepZ3gKwAV9KfLrtSIlcIWX
	kiMqS6Sr4dgGuSzSC6HaJEeEIqHN/EZv/R/dJipwiVu5cgsVFSUz5TCaSRHiAnLRteRtfIr68Q13y
	V4MTaSERWbOp98N+Gsl7mwqN4BPfmCVLbHNwycnHIjT8XE9G9aK1OVwLdZpiAYg4zFCvjaU7rQ2B+
	VofDxS+8etXBXYiULGaUy6XgpNbwR/bQbCQeeefNFDNfy0LzHESewtupJbWU3BH7jzDbglIlcPN5d
	fX5SmJclzoqUKX2SHWCI+Yd1VKNokQgmzJTe9chmVBSwQHX0OxesxXdQrO7Us1J1WWcYyoXrq+iWn
	NkTKN+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2Qn-004RgM-0k;
	Wed, 19 Apr 2023 07:40:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2Qj-004Reo-1q
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Apr 2023 07:40:42 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f17b967bfbso24718915e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Apr 2023 00:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681890037; x=1684482037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdAF+ibqcFz4f6UdI5r5abisS6qF8hg1G7lhZkeAXYk=;
        b=BfbLruzbZXWfqzZ3zxLzyF8TUbZEB/dqtePUEBJC9VGlEGntmEqBL8S43nzFefkEHo
         1XS6njc7OJKnT6PmsgBi3jLJTsoas3icCqyD8cL2pGM5bS2K4aOejmYpm0AB4+J/NaCL
         Z8ROYe6XwwMaqUZ42rnlDmWzID/rNw57tFSURGS0qM5OdKtzbn8QkgTdncMAgjPPMk8D
         UYoIpME+xD+PtmLkeU389Z0wL+18w2FhaCH30zqkwFt8LZQjgA5oLrnRTkbKG3UYebpi
         pTQFvjulMDHNFeurQy5b3a/Zzz23KPbi7YdgXKNdmNt7m0dq224Ty0ug/KZOwR8vz+Kk
         3qEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681890037; x=1684482037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TdAF+ibqcFz4f6UdI5r5abisS6qF8hg1G7lhZkeAXYk=;
        b=NEbGa1R1ZWVe0jSJCdZlLalfQdlaDJTlwUqDWFljIA/D6/Ou6RDHDHr+UXuMN+AAY/
         DydoreaH7dymxWYnmLAkjZc6e6cVPFHHPaqLFmnqJwDYn6o91Q6aWQ5QN2G44iQlR8aX
         25YGd/MzklUv3JMuvmElv2eAqf5l23WOEHFl1w0ORXvyNdc0ozQk2qX+sLz80odBe20c
         TJ3orFOwa/rnXsx2RHAKRNvPqee2EZzFnh0Bx5AK4H1yn7cTUSHKHdYB5GjIXpCBz1dc
         bPIjifnkSA0outMnXeYxfH0+lG0ANljRxmYcu0bLWlwCSV3jbpY/RqOBlWqXdf6Jg7Ro
         qPuQ==
X-Gm-Message-State: AAQBX9eGjoZNc+xaFP9WflS1dCzKK879c52IIpK22tpvb5tKQNwL+5+7
	LQ88o4WS2OXJh4+7u/wC8YKrxO3eNKO3PWxICVEEXw==
X-Google-Smtp-Source: AKy350aqsESRxHSlCOW+FSrqiu4xHkLPIZBcls/gKehP6GtGDpV1jQDp02cCciwOdN4V0BccDQ0Iwg==
X-Received: by 2002:adf:ffc1:0:b0:2db:9c64:f759 with SMTP id x1-20020adfffc1000000b002db9c64f759mr1213937wrs.1.1681890037542;
        Wed, 19 Apr 2023 00:40:37 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id i15-20020a05600c354f00b003f180d6dbebsm968171wmq.48.2023.04.19.00.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 00:40:37 -0700 (PDT)
Message-ID: <d825230e-4265-6c3b-a9ea-c8ba5f13449b@linaro.org>
Date: Wed, 19 Apr 2023 09:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] thermal: mediatek: Use of_address_to_resource()
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230319163231.226738-1-robh@kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230319163231.226738-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_004041_612623_2DAA506A 
X-CRM114-Status: UNSURE (   7.95  )
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

On 19/03/2023 17:32, Rob Herring wrote:
> Replace of_get_address() and of_translate_address() calls with single
> call to of_address_to_resource().
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


