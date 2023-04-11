Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49436C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 11:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62hsVi+QUfoOKuYp2vpVkc9puq+N1iUtD/B1+czftAY=; b=dFGXzAV/5nK5X81RKof11RzZTq
	+dQlmVzNxgYaXgxa6dmGFD0Th/DEUNAKTNh1ug5jc4tJ5cGtjBMaPF63U2ZhiLdfBlNHiyzvv6w9J
	9Qpjivz7itTgOTJTyRTYBVFxZKNZwHZfHADoWFkFDbib8eA9ukPdPPerT1TKNsJYCm+/y2LqzcCm4
	vv25W5szwWNvrrebBm43d4FBBr7PqvYYthMoUJOGIhT2CuQpa8kv2rs9TkXxnBDd1lsUTIhUIl1Ov
	YVTEoP2qxTZoAURII9yLXNPwRzdI4Xu6l8d+CwewReDc/rrSqHpg+y+Kf9HL0lWvQFcdScnFK0Zbb
	vqdUXEPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmC0B-00HQYM-2F;
	Tue, 11 Apr 2023 11:17:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmC07-00HQX9-37
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Apr 2023 11:17:30 +0000
Received: by mail-wr1-x42b.google.com with SMTP id e22so7066611wra.6
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Apr 2023 04:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681211843; x=1683803843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=62hsVi+QUfoOKuYp2vpVkc9puq+N1iUtD/B1+czftAY=;
        b=SKe6JIxZ5X0t6jdZpOlho0qGWVej/qeJcAzcHLsAFQ2SIz+my/ILQMW5fDnLJkVjOs
         bhqBbOzrfDUk+HoC9Y3byrRbsKJMmwyhw8XgdhbD8tMIN0M4cMHdVk9JwnOE4TuP/KpA
         0LfmnPCaDeiu7BjfOQkN/7RDTGLyBo6P3JpIlzaRtO6pwNLbMRSPeulavEzDbp4T+oPx
         Rty8edAIOOtewbr6YPKvtANRaSkE1dj444PvmkMpalOhmZoODx6MDLth0H1GQqQrQXCo
         m7NX4DyS3OwbKmhpd+LGu2WnEoZa4f/1ohzmvwUObZ126vd3IE8fFL5NmSnbb5Wa4zKi
         b5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681211843; x=1683803843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=62hsVi+QUfoOKuYp2vpVkc9puq+N1iUtD/B1+czftAY=;
        b=urZutLJORLhE91JazGjTxW13jqK55EP1CSPn2uTKE8vizAOABC9kknDzfm2NY8HjtA
         gJVXQ3RyKJ0hViMNjVGbHJtYmxVvSDsawkej8gsnzKerW66T9EE1+fDi1jm7qbeV9BEY
         v8FDA69Wm8CY9f/Nn3NsvjiyTNe6czWKrz7KTSVmQSpri5K+qMLnHn32b5lYw5ctvghY
         f568nkYwQk+xXjZoFa0f0ud/8B6Df86EZ+bWTj7Swaibh7fTdNaDyABDFCgwiEOy9Lcl
         87Hf7168BPE1QTb+lHmB+siE0mlY2SX0Xuv39HjOcoCkvKbHvV8t/W5gMVjSQ8uNCH0d
         Tu9Q==
X-Gm-Message-State: AAQBX9f15PF1CV172cIKeusZiKM4qXhIm/DMPNqis6MISx5uzcnBeHBO
	DgcNg7GTGLdHqBnlG1L4avx9KA==
X-Google-Smtp-Source: AKy350YNIHpETfKFyNwriQojM4cwGMtxFd9k2BIAoqEoZyUD79V9JE8xJs9z66OhnfG3ED0jM+Quog==
X-Received: by 2002:adf:e34c:0:b0:2e5:a86c:fe74 with SMTP id n12-20020adfe34c000000b002e5a86cfe74mr6136269wrj.51.1681211843387;
        Tue, 11 Apr 2023 04:17:23 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id y9-20020adffa49000000b002c592535839sm14335619wrr.17.2023.04.11.04.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 04:17:22 -0700 (PDT)
Message-ID: <b7a43215-8c51-8609-63bb-c0748887688a@baylibre.com>
Date: Tue, 11 Apr 2023 13:17:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 07/12] arm64: dts: mediatek: set vmc regulator as
 always on
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
 <20230203-evk-board-support-v5-7-1883c1b405ad@baylibre.com>
 <ce6a9e78-efae-c430-c990-ceafdfc7be41@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <ce6a9e78-efae-c430-c990-ceafdfc7be41@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_041728_241065_CFAAA504 
X-CRM114-Status: GOOD (  10.53  )
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


On 11/04/2023 10:23, AngeloGioacchino Del Regno wrote:
> Il 07/04/23 14:59, amergnat@baylibre.com ha scritto:
>> From: Fabien Parent <fparent@baylibre.com>
>>
>> MSDC1 IP block is powered by VMC. Make sure it is always on.
>>
>
> Can't we set vmc as parent of vemc? 

I don't find parent property for regulators. AFAIK, vin-supply is used in other DTS to do that but is it supported by fixed-regulator and gpio-regulator, which is not the case here.
Based on this, I don't think so, but I'm probably missing something.

Regards,
Alexandre


