Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26F4C4829B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 06:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5QbIiyRM+fMrKstQjJH9uNnklIepSlFhtf1nMp0P7g=; b=fNA4J8FAWXKbCuPE2rkh9g6Eku
	0iGNaJEyD1C/BVJJal/9lyBorBjUUzuFOugcnNv07zfPcKccri6rAM/qoTjw6hU0IrUxn5llS3R0J
	MSETe8z/1bc+E96M62Al5OfEkJhVAQKCQdf0T0eENfrKTJrYCDhX2/W9vmVDkiAvnIycyaMXPiS3w
	ig82mq73bBrh1wgSuHwaS7/HFoy6OD5Vp4bNXQBXcR7zWEP1m5jOs8ZE20M1AtobdWivKgBsVYnQN
	MKkwAo6ws5qY6fr5DV47KYlf1ABs9xvyzBSQmjJspp7HcYMxcArca2JGjJQa2ub1enJKtX4c7IH0+
	m6v/V7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZPXo-00000004Nsu-00e1;
	Mon, 12 Feb 2024 06:11:56 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZPXk-00000004NsF-0LNL;
	Mon, 12 Feb 2024 06:11:53 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a3c0d92ca8aso240212566b.3;
        Sun, 11 Feb 2024 22:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707718310; x=1708323110; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5QbIiyRM+fMrKstQjJH9uNnklIepSlFhtf1nMp0P7g=;
        b=fwCUmkzoNb0e6v7SosQSGRWXyuSNgLdpyGAR8B2HaBqSH0+jfyeyQCWaVcstk/U+a+
         dAqMM2BrGmXi0io/V2KF6afsaDhrVuDbUZu6h09evCkuI60hd83u8geQwj4uflUpFs3p
         78ITJGTKLC0bbAXo0qe4yGx847cpBy/RY/N/gAOi4pCZxmyi7cdbDNWEj9Vv8kjhD7ny
         hX/moAKTRd6yTFIEsxP6C1TcYsDq/phENLShWi/P8+HRScPhNf2Be0g7ZhVMURtaY6so
         AL8URyqnZwI3LFKclCtW3cgr5Jf/3H5FjXXN1KIxjnyxpOQt79ewsTfAPuy/glxN6r45
         U9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707718310; x=1708323110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5QbIiyRM+fMrKstQjJH9uNnklIepSlFhtf1nMp0P7g=;
        b=JcahN6lf9oQIIH9E1iyYi4erlb+vyjD6/sVF2+jpsFNzJJ8Q9cVvVdmogFWG2+TgOF
         7q8G143enR8Z1esBGMJwZMtBP5uCh5/yl0kxavyzwGCYSCts8bqg0saJsQkTK6TtC64a
         ++j3wAnFbxjrlnqNTwCU3vtEXGqjErhavEvM2lO/uQabiLPPDe9sR5dxzXlVItZj2tea
         fFcxrvH3FXqJRvDrm3eTnyGRSDiFymAgQ9tRdWCECx81Mtox9UaYIMRT/SZX3MFKWxnl
         qRtjHT1H/+i//SsYodKLShcvhY7aKtrNpIP1ArYKmxpd61v4BZEIXWvzkjYTOnop6JKZ
         GsFw==
X-Gm-Message-State: AOJu0YyXYhsoPpZevO1qAy143gceCUtU6YoGX8UrbyHkOR9y5/jAmuab
	KXML6oeEicIkjcwjJ9LexS79MX5idnEVSpJP8r2bIuBkqWcEzBao
X-Google-Smtp-Source: AGHT+IFAfGb9D/1qfnDYuPJTF+gzyNmJ7c6d/v/wtsR71MQpk6I5dGl5tzWhoc3fL20LZ1w070TxhQ==
X-Received: by 2002:a17:906:560e:b0:a3c:2f9a:71d1 with SMTP id f14-20020a170906560e00b00a3c2f9a71d1mr3263751ejq.10.1707718309767;
        Sun, 11 Feb 2024 22:11:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMQLAJ1EeJ2Y3B5LJrtaiGj3Ihng8GWG7UeJeg2/KeNXdPkHZn1BAyQ9z6JMQEm1wbdZVXHAMu/EKIOUHZFU1lxE+U8qBYggvY/DemHmtsF6o4rH6HDUEj5GWNDvNLdug7CxJBssvbpUD6mRnaaT5yR3O239Xkjo9Mq0eBpZtDgI80ae0q5gfDgbHFybrbmK+Za8ZEF2ZGtynwwe4sQj4Gs0HyzE7XWYWrna/ZpFxJNza3SF7KVsHu7txEnc1u8rPwLuXfLYfqZtQ+iK0/+Dn3IMRN1lo61EEamXFmyZXovILUyl8lM3IzemCOwdCJHgJTnZsFWjsnYpvzx0ESE29ZjoqPt7Jz4GEhvie1CJuZGFAF1s5YRpTrmWJTjkad+nShFaMmWxyI8lfcRac6fMJ/T1Vbjc5eCPNZxDbEKyuRQZotCepYv6yDMoL1C3pnLXbZ5jfrd307lrHlFJE+/DlJJdCOYqUwWXnrBYSdQJ2bKskZUnp7NZF3G20bRGm1Pkef3JDbbIKNYcvdAXA+3wc7MqZHIPvPWiQiy9V0aoBBz5pTO72bhkcicrMunXc=
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id s6-20020a1709060c0600b00a3af8158bd7sm3526159ejf.67.2024.02.11.22.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 22:11:49 -0800 (PST)
Message-ID: <ddec28a5-8d65-4e52-bb3c-9587acf7bca1@gmail.com>
Date: Mon, 12 Feb 2024 07:11:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] dt-bindings: thermal: mediatek,thermal: document
 AUXADC 32k clock
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Daniel Golle <daniel@makrotopia.org>,
 Sam Shih <sam.shih@mediatek.com>
References: <20240209055203.17144-1-zajec5@gmail.com>
 <17d143aa-576e-4d67-a0ea-b79f3518b81c@collabora.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <17d143aa-576e-4d67-a0ea-b79f3518b81c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_221152_142662_65DE0DA1 
X-CRM114-Status: UNSURE (   7.99  )
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

On 9.02.2024 10:13, AngeloGioacchino Del Regno wrote:
> Il 09/02/24 06:52, Rafał Miłecki ha scritto:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> SoCs MT7981 and MT7986 include a newer thermal block (V3) that requires
>> enabling one more clock called AUXADC 32k. Require it in binding.
>>
>> Cc: Daniel Golle <daniel@makrotopia.org>
>> Cc: Sam Shih <sam.shih@mediatek.com>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> 
> So, I've made some research on this matter.. and this is a NACK.

Well, I can only thank you for the research.

Let's drop this patch. I'll sort out the rest later.

