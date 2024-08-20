Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8781EC531DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Aug 2024 12:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxAcxGclIuOwfMb41R48bF4I8HWomP5VfYX9t0ZCnsA=; b=OY/cJGVmxnPe//7f9f3I10ctDJ
	ofA7EYOxzQTa0CbpZed9m+xWmSAKklQAJDzv56HaKj4+cKo1BjM8fFcvlizwgV4oe7wwP35UBtOoV
	oZSD+DyKlxVSPEYmmmW4sns87d13cb9qqE2syb0jeD/mpRa4pbTcdcZMrH6aZ5Tyst9bD2ZlaPIf6
	Dm/fkGCBk7uHi9B9d6VMCXLgE9ysEWZC/P5soLcJspdVNYve7N6lKGMILOau6KA+cJHtWzSwo88kI
	3y5ebX6a0Fh/3dfp6tTzcnDT719rFPmM7hlopL+GCzNfZW6TrOWasQ0XK1vYlvaVd9+Sm2IoHgbdw
	GlQvc8Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgNrH-00000005AgJ-3y3s;
	Tue, 20 Aug 2024 12:21:07 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgNp5-00000005A8Z-2gGD
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Aug 2024 12:18:53 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-70d1a74a43bso3687581b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Aug 2024 05:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724156330; x=1724761130; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dxAcxGclIuOwfMb41R48bF4I8HWomP5VfYX9t0ZCnsA=;
        b=GeEaUe9pqE0mPs7TyrVu2FscJF3GWtgHOu+lfDdhQJwzHceFti/RDOLbJvTl6YKdGr
         KRnZ8iUaChhAk32aFck643JIVNVJNbrvN6x7GyuPL04eVcBlm1/OH8fi+/a6QMpIxLUn
         WBWf8hiJRLXrdhT16EKPf4yaIVcM2IC7Rqr9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724156330; x=1724761130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dxAcxGclIuOwfMb41R48bF4I8HWomP5VfYX9t0ZCnsA=;
        b=F1mBrHV7MrqXogkYb9ssBMaI2+78nJKWdHJvKVzBKWMPabdqkD3IP1S3PnOH3JJ7Lq
         9fVio6JwqNDNth+vP+PmqBkVyiRe+JWuh3KyjVx8UeIVC3ngHBTA5Fg1U4hWhT41Y/ZY
         Qy6lCt2h+PPSHsYoMsdry5MxYvJtYUAanimgM0k8ugzQZsSnCq2kZ1UmqyYqBgSa72rK
         Tf4odZx5IrYHFoyRq2Y+guCm2HNhpbq226wMa3U8kOPlx1DV8i3tD8SOnSkQNi7nNTUk
         P2MQk3t72rG0HZg5cgyBMmW3iUSLB2otgIK2pPqv+TYw9SZyjX7k7v5MUqCd1cg1Kki7
         zSqw==
X-Forwarded-Encrypted: i=1; AJvYcCXmD9Jlc8JBZ1SayjS0MxAUH34jHK9ifD0cl5sZXvQKmZg3CYbWqssIQXBEL+/f9jXskKrrNhGUrHJnZLEvvKGVZB7lkM9wt75EVufQSM+K6zXp
X-Gm-Message-State: AOJu0Yx2TAsTui6uUROYDAdI+nPvtvXo8Kd4AzijdIL9LIOOQNDf40nY
	8WFBYb7NCoOa7cPsiygNfGZrAYAF78rVrFnrdNYGrqR4aUbg9FO6IWnacnkKlQ==
X-Google-Smtp-Source: AGHT+IEaftbPHnk5gj6LEhcatbaYAbzJyPyHa/VXh1Qov58HvRrDUW/6ESy2CXTKfuohmz6Oo+xhoQ==
X-Received: by 2002:a05:6a20:6f8a:b0:1c0:eba5:e192 with SMTP id adf61e73a8af0-1c904fb8e21mr14179130637.27.1724156330370;
        Tue, 20 Aug 2024 05:18:50 -0700 (PDT)
Received: from ?IPV6:2401:4900:5611:cde:9119:bcc9:db94:3510? ([2401:4900:5611:cde:9119:bcc9:db94:3510])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b6365998sm9309672a12.80.2024.08.20.05.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 05:18:49 -0700 (PDT)
Message-ID: <1899ea6f-b734-4748-aa00-d7049d553994@chromium.org>
Date: Tue, 20 Aug 2024 17:48:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: dpi: Add power
 domains
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240820080659.2136906-1-rohiagar@chromium.org>
 <20240820080659.2136906-2-rohiagar@chromium.org>
 <b5wtwpkwgg3tbwya6zllmymaaf2qvnyfbspkynr2ruzncej2ql@qloslxfinvos>
Content-Language: en-US
From: Rohit Agarwal <rohiagar@chromium.org>
In-Reply-To: <b5wtwpkwgg3tbwya6zllmymaaf2qvnyfbspkynr2ruzncej2ql@qloslxfinvos>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_051851_736815_504F45D8 
X-CRM114-Status: GOOD (  11.26  )
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


On 20/08/24 4:40 PM, Krzysztof Kozlowski wrote:
> On Tue, Aug 20, 2024 at 08:06:57AM +0000, Rohit Agarwal wrote:
>> Add power domain binding to the mediatek DPI controller.
> Why? Who needs it? Why all devices suddenly have it (IOW, why is it not
> constrained anyhow per variant)?
>
Ok, my intent was to introduce only for this particular variant.
Let me constrain it to this particular compatible.

Thanks,
Rohit.
>> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
>> ---
>>   .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml     | 3 +++
>>   1 file changed, 3 insertions(+)
> Best regards,
> Krzysztof
>

