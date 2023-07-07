Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8716C0015E
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJTnI5bOFiXZjxSo5gJqvfLEvH8akrdBST5kBTlYRFc=; b=x4rsyoUObWHiqCdYUopoEfsB7a
	DxyPSh39t9kbcVTUttWwGwWsO2Jf7QKOtxifEAuq+dI9GKuVsMBXlQo9UcBLOzPt/oPwPpEDsNrV3
	4zRLxqiq7j1igOdGms/xwsM7k1Ems1R2ulUF2Q/QVUCe5LestvWZ2f18AnZPAo0+4ZS5luvkAEwwv
	ngc9JfaSVuZYG4XCmljslPsKTwmzI7Q/v3aYdJ+Uxg2tKbvcDCoplGyjrAxgXnxSkzuZStQs9cyJt
	zPx66FqelGktnfS/Ff+vs8AB2RKE8+TkcOLrv/3pbcITLM9gyGDZfonyIY6GK6vaY/iodz5O9p0ng
	wx6PjTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHlv5-004mra-0M;
	Fri, 07 Jul 2023 13:54:47 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHlv2-004mqU-0B
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jul 2023 13:54:45 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3142970df44so1886093f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jul 2023 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688738082; x=1691330082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJTnI5bOFiXZjxSo5gJqvfLEvH8akrdBST5kBTlYRFc=;
        b=sJI9rAeW8PnR8hPPhBs1hw92d5MffHd6A8tD9J3bnyTqmrwlpJRem5yoxcmcZKdtQb
         fhginQmqQtbHo0VT/F2Bs3cv2U9Ik8GlIiRJKdAfqQoOy/12dsTt8yBcKw5wv7bodx2e
         uK6jOiozjTi4BniZM+JPjbUrmEN4pLCEMf+CWdGbKuK9qQB53tyT2uJsvSqQhbwE+Jmv
         vHiXGxxhUhSMwLTPs09/dQT1oXtPvikUVAE5uVh9gGGYrbVJWhIp46Q49b7Qq33wJGUa
         5Htztozuv8Wg9QzEIHvx+B90napody1iuDt/GS+63Wum00RdAmUdR5zIiCmq73S3Egbs
         O4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688738082; x=1691330082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJTnI5bOFiXZjxSo5gJqvfLEvH8akrdBST5kBTlYRFc=;
        b=BHphN6d57e8FbM6G/tKBwjxHE1+x5YZDB5O/6uemS6qFGKdYeapIMBelnhE4rI1lok
         KJmAz/6hAaEmygF5l8dp7jO/z1zvJN2jWLUuDXnfPjs0GdfZCraP0TVE17jaj74RVFmj
         LJQuZHXpZ7xiirp5qxsrbgUn52x+FR3H0hh4hbBdZ5zWWFGjG0V4wr7HKt5DbgID3WDI
         3gDILnpgJQN/RpPF1GsTRKLz5TWSSMY0GkFEunIg5Q+3zJl36cxyTAMhHVE6/ICAUXFd
         GeNgb8RKvfNmqOPBZLhPpZ1fOnxy/MDGWkSlUnkzg+pKmi1D/bdPculsPxq5olRUrWW0
         aGiQ==
X-Gm-Message-State: ABy/qLbCQl1PV5f+8GPVbMVdik05yVX07lKnI1/qAtzKLbf2LuKTuQlN
	aNZpyt80Y3Aza7JzJvQsEdwUZg==
X-Google-Smtp-Source: APBJJlG1MkdrB0Xj9FT9FqWVWR4LUOzvfLqDindJnHI+5SJr2VEpgOpqSvIWpTwJAITINDE/EiJxRQ==
X-Received: by 2002:adf:dd05:0:b0:314:3939:fa1c with SMTP id a5-20020adfdd05000000b003143939fa1cmr4529614wrm.8.1688738082129;
        Fri, 07 Jul 2023 06:54:42 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id e17-20020a5d4e91000000b0031433760a92sm4477755wru.115.2023.07.07.06.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 06:54:41 -0700 (PDT)
Message-ID: <a993d0a7-e7e7-d30a-0848-6a3612b72345@baylibre.com>
Date: Fri, 7 Jul 2023 15:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/6] thermal/drivers/mediatek/lvts_thermal: Use offset
 threshold for IRQ
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>,
 Balsam CHIHI <bchihi@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 Amit Kucheria <amitk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230706153823.201943-1-nfraprado@collabora.com>
 <20230706153823.201943-4-nfraprado@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230706153823.201943-4-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_065444_088994_DFCDDA12 
X-CRM114-Status: GOOD (  12.57  )
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



On 06/07/2023 17:37, Nícolas F. R. A. Prado wrote:
> There are two kinds of temperature monitoring interrupts available:
> * High Offset, Low Offset
> * Hot, Hot to normal, Cold
> 
> The code currently uses the hot/h2n/cold interrupts, however in a way
> that doesn't work: the cold threshold is left uninitialized, which
> prevents the other thresholds from ever triggering, and the h2n
> interrupt is used as the lower threshold, which prevents the hot
> interrupt from triggering again after the thresholds are updated by the
> thermal framework, since a hot interrupt can only trigger again after
> the hot to normal interrupt has been triggered.
> 
> But better yet than addressing those issues, is to use the high/low
> offset interrupts instead. This way only two thresholds need to be
> managed, which have a simpler state machine, making them a better match
> to the thermal framework's high and low thresholds.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

