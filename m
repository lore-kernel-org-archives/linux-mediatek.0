Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60363C04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/oxcJBIyXlY9TtgU1r7E6cgf1golLAQDrTLfXTTYDk=; b=dvKg/FOaA7fZ8uAtCM3pgS/LEN
	+D1mvxbnc+5tG/Yl7X0qrPpve2E9BkqUpVFAglc+s/0K+XAhe0JPbLWLPKbW5dXQYkSdRUc084V5c
	7nXunIAp2n6Qk617g55id0GbUMi7pUbWxsuNUYOsYKjmDYGrO6kMXbRN3Q+YG5+bluKbTVaEEQE1w
	KPoOzXg6m4LF80vd+z2LpeudESvd+zXghaaIXM+R6Ej5dIZD2/Y6CxBngCVYDuyyJd5ZYE4scHOLL
	v1Ut83yZc9aa2HnuEUFpBKTu4/jX2fsg9zThb8A6S1HpTIq9oQkgeYCO9+KrZ+E0kp6JjCpyXvZBt
	wTSq17EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s91WB-0000000EMQp-3sTh;
	Mon, 20 May 2024 11:49:27 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s91W8-0000000EMLo-0Ncy
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 11:49:26 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2e72224c395so11614991fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 May 2024 04:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716205757; x=1716810557; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/oxcJBIyXlY9TtgU1r7E6cgf1golLAQDrTLfXTTYDk=;
        b=CliZXRZAeCcGdNzdroHEldIO8x4HOd9Qb+EbROfm+N3ABGeERR/Wh+2LCDpEf55suC
         nKT3k8bBHGbyioeFjrPxPR/ZjzyC0rkroynndsUXOZlTML3x+y0T46tXzbc+A46m5gWa
         YQTeDCtQ2aVVVdN9K4Ogaz2Em8GJ0hixkbsITb0Kt0EAvu6UUnF9nOINUDV9MhJjFz1Z
         tbQoczfcQRJxZTefkZ0xLKVNDkGlVQXY0/z+Sam7jgPcoVBMMZMPQOjKTjuDbrxxlKgK
         LU5FOMg/yAMuV5PFEvUbck2c6F5lLMOlAzdvgehMTGkttN4wPQij2Hm/1h1Tu2U6MviE
         rEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716205757; x=1716810557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/oxcJBIyXlY9TtgU1r7E6cgf1golLAQDrTLfXTTYDk=;
        b=w/4JFhf8vK3N+AF3j0gVINNz7XTDLiO+Md5P7K4uN57hEWp+yD2hFO9ie52DH9zudw
         qAIaHONNMT3kweWAhVDuboRuTYZnNewH9ZML4qulKs9yaZLBnZxIGgLQkc7ulONlzxoF
         SE8F6QBiSVoM/jhYUJ6yyWtyrX0kX6JiI/Q53NH6lUIEJzxFRVBPR+chc8v97RX8XlKw
         GSPTIF4tNsg+sAXCrM/ktNBRZS6i6gq5XdKDC5SdqlLKtt4BG67yl4NI8e1KcJ+qU1Z8
         yd1Go75YqrbU0WDYAppwJYpdvixuodVZMIfycxNtrs2lmpVOrHv2Ci0pad9cp344mSoN
         P4Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXEQ3URQDld52mb48BAbuXQnw/iDw0cVR1jfqJaf9+qUB3ULPZ05vgqcNbTGIzChCGQM213e4b1X+cEBG/kNh453zQAiuYb2J4lPCYqyCef5r3Y
X-Gm-Message-State: AOJu0Yx7x5nREu9l9E2lSDw0EvBygjKNmc5iW8I4Ni1/KEYjujdiKpuN
	Ysh99K2NearRdHioA5ABOMBr2YN5IoVs4f36trUhgs+t+I+2weBr4cD+6zcVjUY=
X-Google-Smtp-Source: AGHT+IFlzaGIRfESALSLtsyNFlfZ1/JIBw7ONHINjG4LvPNB4eEcZEi71DkW5rhom1Y1o6Z5gbWZjw==
X-Received: by 2002:a2e:98c5:0:b0:2df:6b06:b5dc with SMTP id 38308e7fff4ca-2e51ff5cf54mr192231491fa.15.1716205756937;
        Mon, 20 May 2024 04:49:16 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-351b79e8e6bsm21316539f8f.65.2024.05.20.04.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 04:49:16 -0700 (PDT)
Message-ID: <67f13b3c-18b2-4042-9908-b4d41c24cdb0@baylibre.com>
Date: Mon, 20 May 2024 13:49:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-3-angelogioacchino.delregno@collabora.com>
 <ce1de395-3f60-4f7f-9424-bf036134de94@baylibre.com>
 <7dbe08cf-47a1-4da6-9035-6b0932cf8426@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <7dbe08cf-47a1-4da6-9035-6b0932cf8426@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_044924_332594_F8FEFFB2 
X-CRM114-Status: UNSURE (   7.85  )
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



On 20/05/2024 12:53, AngeloGioacchino Del Regno wrote:
>> So, I don't know how you want to manage multiple display, but IMHO there are 2 ways:
>> - removing the current "oneOf".
> 
> ...eh I think this should be anyOf instead :-)
> 
> I'll check later and send a v5.

"anyOf" behavior works as expected on my side, dt-validate pass ;)

-- 
Regards,
Alexandre

