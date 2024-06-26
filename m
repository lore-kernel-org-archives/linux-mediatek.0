Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE41C30653
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 09:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCBVuOeB1KzR+4NTiyvxBcDmIdIFE4PA/vDzBpF6qhw=; b=pXgbC4i/XBdgQB3je0f0TFwzjV
	EcHtH46CG0kxbKkMR/zNViYCshmufJFMHn3SrBYFST8It8XRqubd7CceebygQeBKPyMlPxUJAyJpo
	dLNZEHwPKQAH5ae0ePTjAgbPT3QnQIzpUCDJkWnCSRueg+KPwQa21WBp1hjsdUpARLacfKjoHHqqB
	zvu8pnXRV6w8GHZswGXjn3HMeVDd9c6/2ztJptAZBPfotZdFod9v6P3zqTT1x5D9cYXP4xzK4mBR3
	ihcoyOUybzh11piJasykkgYMx8WTswtPZuE+SABZ92VDGs32qxQ5e/hHs1IAyiqiY+ERNC4iOa8OE
	V2yu2j1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMOkV-000000066V2-2ItQ;
	Wed, 26 Jun 2024 09:15:31 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMOje-000000065xw-2fon
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 09:14:40 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2eaea28868dso85211391fa.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 02:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719393277; x=1719998077; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RCBVuOeB1KzR+4NTiyvxBcDmIdIFE4PA/vDzBpF6qhw=;
        b=zxETuPmm6QXWU+egWimHqfgxxpfSED5b0gS9Ndq9jbdI/cPZnWRto0dkRTGZzbi1N7
         SQhn8okX/eUfPLQLT8E6fcnCJzTfdhwVDk3tPRehwPYeKtNFg0geDxTNyzcbFBrTHWJG
         Dvy49BqeUNKuKtZaXynRQRfh5j+xdI2f52H2HwHIpyBe6cK/1QrxbBaH36UpVsUslO9N
         9Vnqtmbqt5fVhZYDI6ukOr8oCbmZuuy3reSggFOLfsOQVrF3YuKt83wNj3UQGhVhEV+Q
         wlcdsxaRv8gGsyibCDha7Q5LQigwc98t06ogk4c3wJAFVdDKvSF/BQgWYiHLfIWKkd65
         Vk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719393277; x=1719998077;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCBVuOeB1KzR+4NTiyvxBcDmIdIFE4PA/vDzBpF6qhw=;
        b=nt5wAgE1op6lbrYwhESRChGortG5LKPBLHBdd3V3j011DK5Y7tzEfC+AAwzDd1dcoP
         qrljZizNtpzMlz6O07H/0zvM2bhtqRJU+L5Z/ZBnxDcLewSpIjajb43LMvJveX2plZSD
         S/l2wtmwI2I11RTUq0ojT9BUY3u9/FR53Rhv0xWG2W1DpL2g3bEXb/B+rCXcKzBLdlHM
         jZ272mrq2ynAAhdZF7FdNmTuRg05Hok/2jfmFM/sUM/o29tAuOOHLzwYZwVU48pleO4Y
         YvwWp+MgKmWCLfrOr/G37uXxF9X3n/3D1H3oAvutn9+JcI2WQ00HfZ8iKauqvvQncgbT
         Ccqg==
X-Forwarded-Encrypted: i=1; AJvYcCUOWbLIVnVWiDoPUlo2hQMRCkSCJRMaeyyHxKkolEsnGd1KlOpSFBzDlf8SwgmJ+Lkyo9PqVdEyHA3ibYZRqvhGykh/lByamKdrsyjaAd5lR8RW
X-Gm-Message-State: AOJu0YwHy8iK6tQW+fowILXqeLr6+1SPOKEq4vo4fVYkLb321eIeMImg
	3SRugT4I/GZqf/zGZbDjLUZJsgFFXn9rEDbvtsbdyT+TYtcJ4CcJ0a+COFWusmU=
X-Google-Smtp-Source: AGHT+IEyoDyoCii/mhOlk0H2mucYX0c9wY30Sa+GeVQPuf0xyy0FeP1MIGRZx54uF776h/IgDud7gA==
X-Received: by 2002:a2e:9c98:0:b0:2ec:e719:c7ed with SMTP id 38308e7fff4ca-2ece719c93dmr14798521fa.27.1719393276914;
        Wed, 26 Jun 2024 02:14:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c826474fsm17837065e9.24.2024.06.26.02.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 02:14:36 -0700 (PDT)
Message-ID: <97706a9c-9fad-431b-b488-0cfdf765a46d@linaro.org>
Date: Wed, 26 Jun 2024 11:14:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-3-f754ec1a7634@baylibre.com>
 <cd190d35-1658-43d8-9606-5e73257bbf3a@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <cd190d35-1658-43d8-9606-5e73257bbf3a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_021438_871546_DC0E84AC 
X-CRM114-Status: UNSURE (   9.15  )
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

On 21/06/2024 17:00, Krzysztof Kozlowski wrote:
>> +
>> +  audio-codec:
>> +    type: object
> 
> Still not much improved. You do not have any resources there, so these
> should go to the parent node.

Just to clarify: comment is about audio-codec. I meant what's inside
audio-codec. "Parent node" -> parent of audio-codec, so the device node.
I guess this was inaccurate.


Best regards,
Krzysztof


