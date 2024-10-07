Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8D9CFB441
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 14:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqBERla7cNT4lhQEnVIR6EnNAL58omsDr6jI2Hs2sQY=; b=HArS2scV1f2fWEpUJG/cG9TkKw
	4rognYz/T48/wGAtljtz9VOG4yPY07hIyJ4DCbQWWe84/XxBw4o9B4bt1AOWBlQRWuFJ+R7QKuzyW
	XVgFskhT/YcwN5ypAYh356vg9dDSyTiAcJChJLtBOTdXQ5/btsTXj9zKmEk+imj8qwTw7VlXcoEoG
	7PdZXFh8SzzIwrTZV10kSAa2mQQ3CAS/ta1Y1xMg+1CYZWOtgk2+TFudFYk0GXNW/KKCofwXnJKtQ
	z2WBQXM9Yg0boRznbG+4hfGqMnzBjc91pc65eNDjrBqlZvSfV40UxrYsf8abxd0EOYHNDJmJJdwbi
	rZU5NHXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxojh-00000002j9C-0IN7;
	Mon, 07 Oct 2024 14:29:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoXM-00000002fg3-1ITm;
	Mon, 07 Oct 2024 14:16:38 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42ca4e0299eso39727105e9.2;
        Mon, 07 Oct 2024 07:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728310595; x=1728915395; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nqBERla7cNT4lhQEnVIR6EnNAL58omsDr6jI2Hs2sQY=;
        b=foS4zDd1Rr9bRTJpw+lT7xAlNsMl4rBG/TSEtMMAhmlKFMUrrbIY2TDdHa8Diah8pv
         yR83gT9+ysKk7t9MfMKvM+5L8QJa4V3ho7gck0KmLHa2GMBu7SM108JBl5gIrBy6IuuS
         Iu5W0Te9KjhsZ5VYg8g0Y9zktS1vwSyFsOt4yRn7IP0/Udqol4fN3Q/P+vBacHSRSPP1
         vOAkQcEEg/Or3HCqah+L7KjZ0QTJmBIZWrL+h5sCETIEQz2lXry+Sx/z6JpOBMD8YfNs
         drfpzYP4Hdm9BMVFeF71idzRBcfqfL+bUH8j4W7Vwko442DNfYGyEUp8CMlPBUjDD1It
         OB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310595; x=1728915395;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqBERla7cNT4lhQEnVIR6EnNAL58omsDr6jI2Hs2sQY=;
        b=NeQlFS08gmJDC7nWFR7Vynl60L6MtgemjWd9PIW0k7BhUmf5P4XiBQ9RtSYjwMkaVo
         kF3VTwV6oZmsFaknXTPeWVO5bh4q28zr/qEtckOUpxgzLv9WiZl5EWuO4iPwy/ayBYl0
         yUA3TpfYMzh5nIgWV5SIP4UGpBNinpascbmcllwrewLdWjGKRybMW0NX5uLPP7RojJhQ
         5ezLot2c/Lj19hQE+xVlQZSBWy7D/qu06I4VuXChP7t2Z3E4RtlbmFeXgFNtf5aHK6Ow
         aZ5zorv0a3uWs7U4+7cLDRMisx8uuMtU6yzXe/g9EmL2Q6QEtIWjI9cHkFKBn2MX1nd6
         45qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVClrGlhzHUGBJqdFp/eKdozZvnZ0j4XUG41n4vihWNfuDczJnZ1TCuBDaPcyQk24jh3ZTxvakp15xedgjk7HJq@lists.infradead.org, AJvYcCXuZe9gxaU6/Ah9iqJV8V7iC9yJtpt29q2oPMJlU98y37GriNoc8EpzRN2KQ7Lg/JhERIzdEGLt6zibrGahM/Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YyuBwzCkUSAUaQXfjpxkjbjsOoLOAxWLMQZBhaJyF63NCDi7P8m
	BVmiv5uUGpfBXUP2CLy2Bgu1Uc1/sE8RzChYMplNokg/GEPj74AM
X-Google-Smtp-Source: AGHT+IEz4aEeV7QpqFysBezbHUdc56w4toBz8Fy9xUMFwmnvP59awFl/7fFjw2jZhM+HWsEE85VRsg==
X-Received: by 2002:a05:600c:4692:b0:425:7884:6b29 with SMTP id 5b1f17b1804b1-42f85ac1168mr84385255e9.19.1728310594413;
        Mon, 07 Oct 2024 07:16:34 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.162.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a20393sm93428535e9.12.2024.10.07.07.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 07:16:33 -0700 (PDT)
Message-ID: <00894b3b-a79f-4d6f-bdfb-249535901e00@gmail.com>
Date: Mon, 7 Oct 2024 16:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Aw: Re: [PATCH v1] dt-bindings: spi: add compatibles for mt7988
To: Frank Wunderlich <frank-w@public-files.de>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Wunderlich <linux@fw-web.de>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Leilk Liu <leilk.liu@mediatek.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, john@phrozen.org, eladwf@gmail.com,
 ansuelsmth@gmail.com
References: <20241006102740.17948-1-linux@fw-web.de>
 <kmzl5zmqqudoq2jcdacfsbwq3axdvcml4m5kw5oqqo2hj6iiuq@xzeg6penuic3>
 <trinity-5ceed296-8a65-4892-b449-6f832a978d69-1728227502700@3c-app-gmx-bs41>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <trinity-5ceed296-8a65-4892-b449-6f832a978d69-1728227502700@3c-app-gmx-bs41>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_071636_382934_9250310D 
X-CRM114-Status: GOOD (  10.73  )
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



On 06/10/2024 17:11, Frank Wunderlich wrote:
> Hi
> 
>> Gesendet: Sonntag, 06. Oktober 2024 um 14:48 Uhr
>> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
>> Betreff: Re: [PATCH v1] dt-bindings: spi: add compatibles for mt7988
>>
>> On Sun, Oct 06, 2024 at 12:27:39PM +0200, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> MT7988 has 2 different spi controllers. Add mediatek,ipm-spi-single
>>> and mediatek,ipm-spi-quad compatibles.
>>
>> Why generic compatibles?
>>
>> These are supposed to be SoC-specific.
> 
> currently i used the compatibles used in SDK, but got info now, that there is some more discussion needed with mtk.
> 

Ok, but please don't introduce generic compatibles. We prever SoC specific ones 
with a fall-back (to a different SoC specific one).

Regards,
Matthias

