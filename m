Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC0DC27C5F
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 07:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMjwlRoB1zUBrxnoriQTxC4qGPUpj37/BX99GwdlmqQ=; b=HtzQ9H+Dw/vm8cMwAkC04ss/Xl
	7sORH4N4JhefuWF9PKzAYusQ7deXaT2r0Jief8yQV42lk0ePIeHCVZ73O6QTXbqhzHq09B/FBLqQH
	IvzZCJseXBm1JLKyEZNQhuc9euugmLgpnNJec6VO6yCO6vUPvryJ7lf4d1ieVy7HqABWPsTWlFoFg
	ge4++LJ5f7M+0YH3ytq2oIStVsNguQ+4Hn+jLVUOzgfkUFiuZBjCJ9Yqz7c9YMs60cC1KQSsEj4PP
	/UjxWkDz7iTCkuIlEj+vT/3/OogJ3YOCwPUELXb5RZsxj+XjqQsnLqCGRK14cNd1lnueLPjuRA9nF
	/sVpJiYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGZdP-0000000471l-2nuN;
	Mon, 10 Jun 2024 07:40:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGZdK-000000046xj-3DeT
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jun 2024 07:40:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4217c7eb6b4so10490395e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jun 2024 00:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718005197; x=1718609997; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vMjwlRoB1zUBrxnoriQTxC4qGPUpj37/BX99GwdlmqQ=;
        b=rDrDW9+Rnup5Vmd2uwkJMuS2CcribDNuGLw9WxpHN1diaTKvlK+rYHz1IczI5bHwIs
         AFchP/LHB2MlFtBGQfiXPguy42/6fnKMNcJPBOhh2+QRi8kHGT8rSj9jgNHcC5myK0rd
         GEUMzDqGEeMGXM3PK9DajpjFynxxrwZNJCyR6tb/itNsD6vlEIAG4SeN1qeBIjwxt/+M
         j95818+oH3k16Tht/bbxjk4WUBLKQq1ii6oI0pHrhPyxZLsMAWPcLHBKSzZZKDsxgFkH
         ysGMp69XfAsg79coeufCP/Vfy6i79g0ZwJq33d93ULTIviN/da07Eo5UxIthYOXWeT+L
         A5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718005197; x=1718609997;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMjwlRoB1zUBrxnoriQTxC4qGPUpj37/BX99GwdlmqQ=;
        b=geF/VUuV4ffBBDIIayjny1pMDOgAGXPeoe4w67Z3N1nJSbroF+a0V9A8HujzJ1Fx8j
         Y7LlhaDUrFSFJCs1b1+TWpsYwrTeaQqJvnOSG3Jm9A/6UWkGPzC2x0LuWO4Z8lyt89W/
         nkR9KEyrXdLvUO2fXPPC5RMzzs7R3a/QXSbo+6OAtpIGSMnZhGzJ9cT9vqrOi5605Ccl
         6YCpIwU1oDvKfSK2k0E/NHvEJC6IeHZsVMmBCDENKQvbPQp6ArNcQL7duerFQUM3dM4E
         UYfEOCqcw/oJiMtJ3cokdaa6LOY5Pk381tJH7ynYuIFEI+P32jaTBTnEvy2+XATKuN13
         4igQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY5bnWE/4RFDNV+/npIzzMwW9AE7emL6sfIovRrcds6MKsQpm9sR8PDrFulWPRsgw8xjfZxWWknrgals3begyblQGxaFMOavLefeRF2K/OmIlL
X-Gm-Message-State: AOJu0YyyKmVk60iF7xr85EMNUFk8DS9dtcSeeeAcMuEi09hfm2Mg0UL2
	1jgTSzerYvcF36mjWbwKMPTIEcQlpeJd6zyM7F2X1w3eN9iUr6wGAKaGpCxvavg=
X-Google-Smtp-Source: AGHT+IHMiLWtX71Xx57Du6Ke2BkcUOQRP6QZlXWDuZkcsDBndrQKFGzjYwkJnyZxt0sr/S5vnuNI5A==
X-Received: by 2002:a05:600c:1d88:b0:421:7e76:b85c with SMTP id 5b1f17b1804b1-4217e76b8b1mr33386945e9.23.1718005197169;
        Mon, 10 Jun 2024 00:39:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421dd8c3a9esm21868815e9.27.2024.06.10.00.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 00:39:56 -0700 (PDT)
Message-ID: <68c9bf8d-38c6-4f1b-b73d-a8ea03f8e1cd@linaro.org>
Date: Mon, 10 Jun 2024 09:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
To: Julien Stephan <jstephan@baylibre.com>
Cc: Louis Kuo <louis.kuo@mediatek.com>, Phi-Bang Nguyen
 <pnguyen@baylibre.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Andy Hsieh <andy.hsieh@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Paul Elder <paul.elder@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-2-jstephan@baylibre.com>
 <e0bf8667-cbb8-49ba-bb44-3edf93b019b8@linaro.org>
 <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_004003_146440_58A32E83 
X-CRM114-Status: UNSURE (   9.05  )
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

On 07/06/2024 10:52, Julien Stephan wrote:
> Le ven. 12 janv. 2024 à 08:32, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> a écrit :
>>
>> On 10/01/2024 15:14, Julien Stephan wrote:
>>> From: Louis Kuo <louis.kuo@mediatek.com>
>>>
>>> This adds the bindings, for the mediatek ISP3.0 SENINF module embedded in
>>> some Mediatek SoC, such as the mt8365
>>>
>>
>> ...
>>
>>> +  clock-names:
>>> +    items:
>>> +      - const: camsys
>>> +      - const: top_mux
>>> +
>>> +  phys:
>>> +    minItems: 1
>>> +    maxItems: 4
>>> +    description:
>>> +      phandle to the PHYs connected to CSI0/A, CSI1, CSI2 and CSI0B
>>> +
>>> +  phy-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - const: csi0
>>> +      - const: csi1
>>> +      - const: csi2
>>> +      - const: csi0b
>>
>> Why one hardware has flexible number of phys?
> 
> Hi Krzysztof,
> 
> seninf can have multiple port depending on the soc, each requiring its own phy

So it is fixed per soc? Then make it fixed per soc.

Best regards,
Krzysztof


