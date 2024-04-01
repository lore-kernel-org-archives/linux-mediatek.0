Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626D4CD1288
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Apr 2024 17:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuHBdAm6bG+x3991K3l56+e/5a3asJZAEp2Z/vswAP0=; b=o/4WCs39Cm+2AKv0cv61+sUWin
	pBc/cpnpcNrl4Ovw8o/OZ4Iajym2VvQJppMJKImwNHHv6a7S28OazdctsAEn9prCwEtM47jDXPuep
	7sPKUYBfQ6EGwyg/JsMKPfzI29vvX/pd3S5fEyRYtm6z5sDOeEVel6iBjJ7lhTUBFMetOxE2XDnhD
	Tp+oNpg22cl8lY9m/PZjKEP/jvz3aiTe6q9fvQw8O17QTLF7c4OE+7yFPUA00GVN+ramE7VD1Q4dL
	TDECokDcRAeombN2x6eh60Gvo4uTpIGTWtv0jMRwFX5jc5Hv9ZmvgylYQwPPf8w7LXo8NDrmIiPU6
	TjEG8U8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrLcf-00000008TgY-3kVO;
	Mon, 01 Apr 2024 17:39:05 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrLcb-00000008TfL-3bCj;
	Mon, 01 Apr 2024 17:39:03 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1e252f2bf23so8826965ad.2;
        Mon, 01 Apr 2024 10:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711993140; x=1712597940; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VuHBdAm6bG+x3991K3l56+e/5a3asJZAEp2Z/vswAP0=;
        b=fWNoFD3kW/47+eZBsYQfIEI/Gp9UyRZcMWKF/B9d8BzecKLTnamI2lqjF3pOnvbjpG
         yOePbtnhVJWuiXy9f7gTcy51iF+KYfAmFPjCE0OXDRKb6VCQXf8Y34OdH33g5JJQbgki
         D2Tcsn1krxZ4Ts6SYjP3j/CSrNd65pkXFzCE/ryUh7LjHTVCc9E9BU4OQU22CRRGkWUL
         FQtgQiMOVlY+UCUvJS8atleTcRjJhrXettI6paO03DxtylXpZu8uKOWEDMVgCD0G4Gsz
         toLrR9rtl1ImL38k0UpkkUKpI7pd2Mf9AmSAkdgHYcO+vd5x+rQpqDbEurLOEihtczyx
         jEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711993140; x=1712597940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VuHBdAm6bG+x3991K3l56+e/5a3asJZAEp2Z/vswAP0=;
        b=XRxSsYHMwCUVwXs2NEagN1wIVLAiWE6eZ6gMMYulKdCey87jJS465ESxg0HzEoxmNw
         I/FjPNYXtHRvRsaT5qpRz8asHIYrvoC8s9rei3IjBGTaGnCWRXx2M2Nd2p/hEQykLMIP
         ZQGHQPoKRjhZbXgIpw223U0rFSRmPxn07xgH0Q8WhPWZ79zUU9JpWoospind2LuT0/l9
         xMp2UET1XRv/UwPV0K14WL4BfkEHt35FR/uH/xx7+AJhJ2DrrQetqtfynkMbx/ujRMzJ
         vsQQQpIv4g7MQoJt+7n6s4LiLhdTAXI+GgAWyPgsvoqpJ2XJG+u01sZpQgch1kA1SfGX
         HpHg==
X-Forwarded-Encrypted: i=1; AJvYcCVaRLfBh6Vya4MNjNn4LSkraOGvutFZx6jeMU3fQ1fof7djqGMOPWREGdnITGl79D9NLRDLk7m93R3xdWEllxpa6IXSejCUP9JD9SP0Ub9XckxT/XBbmHLTOGBLcxM6kGaPZpY4JPmjVeHS0hGPo5bd4ZB3Ac4pTxc=
X-Gm-Message-State: AOJu0YwLDRq6HYgYo+2Bfe8tii5bH8/P7hiRXDdJZB/46tHKAFjpyyR6
	Bz5RvW5EcT27tb1FJ5pYTCferDWE2JyytGo3evS/psbJKTtQGP6o
X-Google-Smtp-Source: AGHT+IEi7wdEb+LyhC3W/JvLP3/0ARCKgHKP7YsCRmImEvoAEcCSa/W7BQKezGxf6hMzkHv1zXdgMQ==
X-Received: by 2002:a17:902:ea8b:b0:1e0:c74c:dfcc with SMTP id x11-20020a170902ea8b00b001e0c74cdfccmr7136215plb.57.1711993139774;
        Mon, 01 Apr 2024 10:38:59 -0700 (PDT)
Received: from [10.5.5.43] ([117.239.226.201])
        by smtp.gmail.com with ESMTPSA id w9-20020a1709026f0900b001e245d90d6fsm5224810plk.59.2024.04.01.10.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Apr 2024 10:38:59 -0700 (PDT)
Message-ID: <bfce7a40-f657-4e80-a607-d242d79e6b80@gmail.com>
Date: Mon, 1 Apr 2024 23:08:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: mt2701-wm8960: Convert to dtschema
Content-Language: en-US, ar-LB
To: Rob Herring <robh@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240401043505.40972-1-agarwala.kartik@gmail.com>
 <20240401151414.GA706943-robh@kernel.org>
From: Kartik Agarwala <agarwala.kartik@gmail.com>
In-Reply-To: <20240401151414.GA706943-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_103902_098156_3C0215D8 
X-CRM114-Status: GOOD (  11.31  )
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

On 4/1/24 8:44 PM, Rob Herring wrote:
> On Mon, Apr 01, 2024 at 10:05:05AM +0530, Kartik Agarwala wrote:
>> +      A list of the connections between audio components. Each entry is a
>> +      pair of strings, the first being the connection's sink, the second
>> +      being the connection's source.
>> +
>> +  mediatek,audio-codec:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: The phandle of the WM8960 audio codec.
>> +  
>> +  pinctrl-names:
>> +    const: default
>> +
>> +  pinctrl-0: true
> 
> You can drop pinctrl properties. Those are implicitly supported.

Hi,
Thanks for the review!

Just to clarify, the removal of pinctrl properties should only apply
to this section and not to the required properties or the example,
is that correct?

Regards,
Kartik Agarwala



