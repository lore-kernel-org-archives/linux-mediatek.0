Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E456C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 07:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGzuwjjstlcwuMUa36bDWReUFFk+zmR6YNeVeZ7AQTg=; b=C7mgw7IAXxfR+prRGLdANx0FcT
	TwQ0FDD90/ibFrze73fC80gD++2sdkr1TchbhgfNmLv1d5JfYRqifYQX+Bz/uZ1rD08aV9xXUdcWX
	fia8noV+Deq96Y1maIMPL5/VNafFAVevPQOmU8QPg5x2za+dUIi6nSch1nA7q7PldbVzxWEM8zcxX
	QU3ZiazSQ8noMITdupdlxgGjO+prBwzTUZaZiPWAE5gkCKlyQ98eR7sg41wMUgk87CXEeBDYm5gNi
	StxGNiCQeE3yo6eGF75kaRqyuGHcPKe6C2PzB2juAYSKoLv2fSU9emiYE4b3NzeA+jXluL3OQF8ND
	EJp0jR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouqoV-008mms-Ko; Tue, 15 Nov 2022 07:56:59 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouqoH-008mTA-NT
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 07:56:47 +0000
Received: by mail-lj1-x229.google.com with SMTP id u2so16460319ljl.3
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 23:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iGzuwjjstlcwuMUa36bDWReUFFk+zmR6YNeVeZ7AQTg=;
        b=tMC9nv+8Etx4jSCXg1bs+XUP8414/Y5UzW0+KXcleaCm4/BsnPlOQF+fJPKQkL5Ri8
         rmBRJ4F30dJlrtTRVz07WFmZM2C5SeMhTYqI9X+299I4R34N+zBwrA5wRXzWlxV99WeZ
         AK2CE+0bdvVq7pg+UYSTiwn64fsVagrpG4Nxr8hzMpPx4QAueu3zDs7SfAyb1snLcPTQ
         99qAelIcyY4mGFrdlRiaQIMG60RggSqqtZxx8wuxUBodLG4wTd5MZPSbfTov+ghJ5sKU
         k1BsScRkU9ecejRnm7mAygXNVafa7rIguPqtr+LI0u56viP06e9R6L+6MfDDWgCTx0DM
         bKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGzuwjjstlcwuMUa36bDWReUFFk+zmR6YNeVeZ7AQTg=;
        b=Rn3mEqAyfxDFtHFQn+v9GcoYA7uLU/raTgFji2/qNvikrqbdmavB5ZQ7ZeqKWsZFIl
         EaIo0FJCkFwIBpgoaXOzuyqkL7oeAMz3ZTsVZ+Hf17fuQ1IMOUY75M+1I3wHFuhKgeRT
         VLALavuwfgmjKm23SpIUbY1vucbLAaRdHfeqc6MbpOgDHHVPMWQ5xFbUWl1yN9xI/w5c
         QKaqG+dE6T91KvwDxn2ZxcKdbc/vF5/mb/AMmSOgi/wYtrAWHG89ILOBTLl95iiW012+
         USrehSls3P6cdcmjGazscJ4ILgj66OUTJVRf1tMtYFdbY+Sc348GV4nAolJs98z/Q6L3
         kYGg==
X-Gm-Message-State: ANoB5pm5so2hMFOA9xvdDVv6FZdwh0fk7CEr43Zvx0EjTBU8/fB0SCIR
	0NSwTrV1aOOtXaA/U/vnmiCZMA==
X-Google-Smtp-Source: AA0mqf5+gjlHpOyr+vO/XgUJl4vyreJytarqzOI+bFglrS81lTEX5gXTw+x20Hc65HxE/f6KgWnIEQ==
X-Received: by 2002:a2e:b53c:0:b0:277:890a:f1cc with SMTP id z28-20020a2eb53c000000b00277890af1ccmr5377138ljm.395.1668499001885;
        Mon, 14 Nov 2022 23:56:41 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id l10-20020a056512110a00b00499b19f23e8sm2095497lfg.279.2022.11.14.23.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 23:56:41 -0800 (PST)
Message-ID: <37dc4e39-8033-a40f-edd7-4bd30f841e23@linaro.org>
Date: Tue, 15 Nov 2022 08:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-rtc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
 <20221109222916.GA2985917-robh@kernel.org> <Y2wwUOJ0KZdt1tZ6@mail.local>
 <adf8bc44-4cbc-af2a-4ec8-1859a98146d7@linaro.org>
 <Y3LHxDIzfZWhnQJN@mail.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3LHxDIzfZWhnQJN@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_235645_796991_2FD86843 
X-CRM114-Status: GOOD (  14.73  )
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

On 14/11/2022 23:57, Alexandre Belloni wrote:

>>>> As this is only a compatible string, just fold this into the MFD schema 
>>>> doc.
>>>
>>> Actually, it probably also supports the start-year property
>>
> 
> I checked and it doesn't support it but this needs to be fixed.
> 
>> What about rest of rtc.yaml schema?
>>
> 
> wakeup-source would make sense but the driver doesn't support it yet.

The question is about hardware - does hardware support waking up the
system via interrupt? This is usually a domain of PMICs which still are
powered on when system sleeps.

Best regards,
Krzysztof


