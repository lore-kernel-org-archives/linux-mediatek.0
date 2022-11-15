Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59871C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 13:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83HRjZKoyBhiQsQuC/2fimMYvWtEYyPCZTwB6HczlYU=; b=nkoDouN0/rAtF43advovBKc1Vp
	iJdA4kK0xXnNF6K2ao6Q9cP2Va69XTZBVIn5pvinb91jWsxZJ76sTZ1hKXdlhP64Kse0LSRZGeKx3
	flDPIqqVOA4ML7xYPvo/q4H8SDZ+9x52dN/BpDCbL3xOabyRT8RTDXIsKSKlUoDUfbx02GphMti1t
	zGBSiAnlvLAtyZlr3PCZkdcb18VEXdFeVEXq1z1JooUabEjvAgBdI5gMTM/8CoDFsMF7DAwgZSRQz
	o9kdS5VbRAyGb9lUjL587VKQx/0PDEm+AvHhemmwOf3wRoTfr5ivhlJXjRFuGvMVUvGM/S7duhpnR
	IybONs3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwK1-00BawV-Ry; Tue, 15 Nov 2022 13:49:53 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwJz-00BauG-5e
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 13:49:52 +0000
Received: by mail-lf1-x12d.google.com with SMTP id j4so24565321lfk.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 05:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83HRjZKoyBhiQsQuC/2fimMYvWtEYyPCZTwB6HczlYU=;
        b=U8aNfCV8mQrF6+8xUdV+q1DsV+b4rovI818ppeddszlbjp3ubxcnLzMH/ZKp/GV5CV
         WqprIGc12o1WqT1enKPpTj+fFsbBNfFsRvFXB3A6iLwW0YjmguEY9dWOD91hoVQHja5N
         bH+LMyA8vFfleHQJO2H0Su2/6fhpHECFf3GaxoSQ+Ki2VrRAICyhdymSGlVfvfjiwj9H
         prrmSrf2iDSpt9owuBHRQg/LT4JczPXiMqNTtJEg+lPV7WvtzNkoKxbJ3KvnhAfBtuzE
         ekUPmQdYhjp7nrd19MVz5LD253YiMUNvMvI4nGJrL5Job5/tpnfxr3uQbEwrJhZGqngA
         nIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83HRjZKoyBhiQsQuC/2fimMYvWtEYyPCZTwB6HczlYU=;
        b=rF43vuCKHlrqYlbHol19oo5mVAav+LQ0bCn4TEX9ml5ZhRGCg4dXEImmelY3yZverz
         7qTMUx9AL4k3S43shPx4qOKa9iXSUYg3LcbLgM93F5PeANHU2P3EOWVwMeWzWuOyrNzw
         o4Op2z9z3jw4PmcxTZPWV21CoPjgWdxw9duZ1f+04zSochtbH9cmF898Zi9bnkCrSu0n
         vyKDWpn030ukotoZJKQA0mP0/6c9yZIoj7zsuJV60okXmshwX73Srq9QVMtqi4vXrskW
         vUFSRMDfIIRl8fDMIKMmBEBAxffVmkIV+f0QGZWk7UVr6vwaTU0y315BsNbH1XRGxtZU
         1oUw==
X-Gm-Message-State: ANoB5pkyU67pJM/nGDslhEptzriTxEubMZ/wrrlNJXHvxhlfz0wl9dlO
	E/emh/2ZN1ISxfd2Ief0IwktFA==
X-Google-Smtp-Source: AA0mqf5HS5gfxzBVMqFriEE4HJoPWmEr5IGzGDfjoRndsB7SSJmPfMrJ7RjHxXmJSplQzZN4BQIGTQ==
X-Received: by 2002:ac2:5c10:0:b0:4b4:6ca6:c658 with SMTP id r16-20020ac25c10000000b004b46ca6c658mr6341920lfp.359.1668520189681;
        Tue, 15 Nov 2022 05:49:49 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t14-20020a2e8e6e000000b0026bf0d71b1esm2508099ljk.93.2022.11.15.05.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 05:49:49 -0800 (PST)
Message-ID: <dcb65352-64c7-774f-3933-42f9dfe95cba@linaro.org>
Date: Tue, 15 Nov 2022 14:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 angelogioacchino.delregno@collabora.com, broonie@kernel.org,
 chen.zhong@mediatek.com, devicetree@vger.kernel.org,
 dmitry.torokhov@gmail.com, fabien.parent@linaro.org, fparent@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
 matthias.bgg@gmail.com, mkorpershoek@baylibre.com, pavel@ucw.cz,
 robh@kernel.org, sean.wang@mediatek.com
References: <09495553-e563-e12b-056e-bed95531ab6b@linaro.org>
 <ba0901a0-56c5-4e60-49b3-356899921934@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ba0901a0-56c5-4e60-49b3-356899921934@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_054951_283688_37CCA885 
X-CRM114-Status: UNSURE (   8.37  )
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

On 15/11/2022 11:34, Alexandre Mergnat wrote:
> I think I understand my error.
> Actually, the RTC (HW) support the "start-year" feature, then I suggest
> to fix the binding like that:
> 
> allOf:
>    - $ref: "rtc.yaml#"

No quotes.


Best regards,
Krzysztof


