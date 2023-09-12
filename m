Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A1ECA0EEC
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 14:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3T2cJ5Dg3KIAmwCPxCvyN1h31PBOD8rwtyP0zH6rYc=; b=WYG02Mx0pNpTLJ4A07IH/ke1IE
	xBLeOZLzZpemOgEOAeWFFMJQGCP4bw+8QkVSbfD+fWjRKH6eNXeniMK3V9RIcaEsIYzbpYLfU8QP2
	Tj98Etqw5hSOILfoAEWlPhYvosxR55K4pqbd6YD0itxQb/WWQxd7RulImlKqDOpgZMPHXtIozNJV+
	KwcvUkY5aReeDMzW8XYraq9ENh/zFonlN7PpGQRO90DmwsZsuw8asQG74HT1KRaVzNleLZ/251CS/
	8cjCCGIDFPOLHO6dJnaLfP36pG63RUkTlg0s2ZJYFkApmr2XjMZViAkYo6vM0uGJEmTIJ3o3cwWvp
	LNOV+eOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4Tp-003bD6-0L;
	Tue, 12 Sep 2023 14:35:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4Tm-003bBv-29
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 14:35:03 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-401da71b7c5so64676055e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 07:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694529301; x=1695134101; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N3T2cJ5Dg3KIAmwCPxCvyN1h31PBOD8rwtyP0zH6rYc=;
        b=gm0Nm0Ab6jKRGMaSyZp+D6pmtIzqlxtT4IrM/0lhLhKUYHRBbOiJmxqz1pzTG1Ivyj
         z5HeB3b3u89k/bukGgAFV37CE3au8lgvZhdkQEJiiIW/GN0xeeo4WlbqkcNIvmSptzLe
         qyO0s9pu+BXjDxKtuTvzJTr16nslhuX2UlOqEi1zG6BnZQhKTEiTcou05nsqtlMaxfl0
         7mt5vJT/3VN4N/MQZCgvUF3kyAOR2cGVZNqPBRrG+S4qFysIBELjcq5cUjwhl79c/job
         6HnSAeohg4lcD8Tfqk0stHX+NKirEWNDsoxh2soVx23JYnAn0JFD2xaTeVfl9+sTqy+v
         EsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694529301; x=1695134101;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N3T2cJ5Dg3KIAmwCPxCvyN1h31PBOD8rwtyP0zH6rYc=;
        b=gTkegs8phjTYyP77mSB88917p+3+ycZXusWWEYE7L2fVoacO8SnVDZ1YNFrv2YSgOA
         j8GmMnNgLEysE2/8uzXF8UVdq5h4eI+v0Z7+X26/6uu3H5f0nm+dcM6x/3YJN7R1XYw0
         aDcpySNgDiujGQhRyLuAYlRVj/DTVgFzI51jC4s1WuFw7y8aYm3ngV8GdULH+/D2TB6s
         Hcpdoqr7R8PPDRqxQKf2WKS4WKYIn7+9b10EbQS8hYuGHYBAHhix33XeBkvWLVWJ/V1b
         XLHTtkY6oSFKsKaL0AkTWD1JlUTW7pJO/69VqZ6xDOMj2HUe13aK1x96DK42j9AbmYyP
         7b1A==
X-Gm-Message-State: AOJu0YxJIqZLeL2W+WTbOuaG7TBs4yPYm7MLH+eGA+SdvpzYDymLflaK
	Z9bDKCsb7wVcgUU+a7ZJgh12sg==
X-Google-Smtp-Source: AGHT+IGeR8boTA8vqNczXJ0BK+AGIug4TqyTfXy7WOaSTRnGdevow91B/8GXgcQ9xvO1ZycDBEh7Hg==
X-Received: by 2002:a5d:5446:0:b0:317:5849:c2e0 with SMTP id w6-20020a5d5446000000b003175849c2e0mr11385937wrv.9.1694529301359;
        Tue, 12 Sep 2023 07:35:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id y17-20020adff151000000b0031c5dda3aedsm13067440wro.95.2023.09.12.07.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 07:35:00 -0700 (PDT)
Message-ID: <f417f936-2f07-b8fd-2b7f-37f4cb287d63@linaro.org>
Date: Tue, 12 Sep 2023 16:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 1/2] dt-bindings: arm64: dts: mediatek: mt8365-evk:
 update compatible
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230912092444.31635-1-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912092444.31635-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_073502_729653_C3D01917 
X-CRM114-Status: UNSURE (   9.17  )
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

On 12/09/2023 11:24, Macpaul Lin wrote:
> Update compatible of 'mediatek,mt8365-evk' from 'enum' to 'const'.

This we see from the diff. But why? Sorry, this change is pointless.
Also not really helpful, as the entry soon should be converted back to
enum...
> 


Best regards,
Krzysztof


