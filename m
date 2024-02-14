Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF2FC48BC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3DB/4/tXiyTIKZTEdyPuma7zWwJw6PWo/4Ker54APc=; b=zHjwbxVgLrk60oLWrbD5x3NQsa
	oWpfRlNzcg9iRUkdqYDLR3zU9NXgqKt9Nyt3y0LUoZgoYckIQRbMfQ/XHT/p3vpD/HkUigo6tkOej
	a3vboaXYaS6eu9eskZdYiIDtdA3LFUllAON1Afh+BscInDDhU3mzlXm13gD5/z1a+wYu156kXUkSO
	DGy6wVpxbmFa1oyXc06Rygky4fHwROdH2sPj/a7l3U0HqOsTWmolWdKVd0sl+h7cxeNnylB8+aqGi
	AJQX/caqHmeU+MeNU2nrR6QLmWYeeY/9/MvRIDBhrBdsrjkCPz1F+FrF6wIJUfbQFlO/sUiGKYZLJ
	6gRbIMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raHQx-0000000DMkd-2ghs;
	Wed, 14 Feb 2024 15:44:27 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raHQv-0000000DMjv-0Oag
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Feb 2024 15:44:26 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a3d1d085384so163437366b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Feb 2024 07:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707925463; x=1708530263; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t3DB/4/tXiyTIKZTEdyPuma7zWwJw6PWo/4Ker54APc=;
        b=GNfJjgNdTqTNO9EQ7pePyxyPX1JdsGb5Fe74aB8QAVwgOj2EIO1dCTMDiSfQiYP3fL
         KnFiJ1tX4laX57WcU+6qcv4Zh2ba8L+cxkp+ZLZYpkfifWSbtRxxB1m+y8DUWyEJ9sYn
         vtK/3+i//gqulPh/AK+Kr0lbg8fTKeFw2MJ4qsWMTB9TLVLX1Sfa5EKGAY4M416On891
         GYD2sNl2g5NpjzAlT3qAE6mS07EjmnTRAaCf11IY2C78PWz5WV/3t0/35TMaSKIg77LW
         t9/A9kBsf/qvxy537Q4/L3Y5xgv+v3UnZrWGvtPRy2NxqopotZpid7JIkFca7T0vU/eR
         t7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707925463; x=1708530263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3DB/4/tXiyTIKZTEdyPuma7zWwJw6PWo/4Ker54APc=;
        b=t+FrhFEjXG8OspOmGmKhRZsZ8RBTS/zVxzy2rhA3xIgVdrDoApDHrchqwxy3whfWmI
         2uaLaAl2f8OlJklQr2hJnd12HgKQL7JMfVi4hmP1iHGp6E5EQbaUbbH8D0LYBuRa6Hhk
         kzuemRRPP/mex+itWSZHbpNBP9b5QsdeG2ObIAy3Iv4so8O6SxxCRKJVl8wzy5mgmrJg
         mfixrSZ4mwb4fPRbpPHsUz/IBShDDniK2fHR3RyugCJc2PAz3k0+kPQYtr7NIu+foO/h
         z7ndttEq+t/ybJlRel0v2H9tusnsgaNZKHsls1NWva+/R+8iImL2xmT6ttB8Zu3zdbfA
         VbIg==
X-Forwarded-Encrypted: i=1; AJvYcCVb1fGUrkzT3tJbQ62ei8sSJ/zR+gRIGQz4kBNVHk24JFuNGVRpFNkYbgaph6KNNu+fWg8Glu0rjbFZz8l1VCsaOOHlESaCOuj832upGiOnL/Zq
X-Gm-Message-State: AOJu0YyDKOHJXP8zAj7Tp+pU0AnqcaZ5iWB2T3/bQNRyj8JjTaaUx0K8
	pSyuuj2wbHsb8wjo3fE/MoCDz4O9Z9NajkfbewdTItAH1DBQyd2dHsEMTJ+iJF0=
X-Google-Smtp-Source: AGHT+IHe/8nBMjza99svoj/66tlNJjDBen3KlN1gXPI2Fkm+lKNq9ZDzom3KKF85sCe6dl+DRwan7w==
X-Received: by 2002:a17:906:f158:b0:a3d:1458:5e58 with SMTP id gw24-20020a170906f15800b00a3d14585e58mr2096784ejb.46.1707925462746;
        Wed, 14 Feb 2024 07:44:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVi1iPa7wMM2Qi0EUYKp2Yq96WvRS4szgfEDtlZYuxISSPqR3WQuwyr/tm3wi5M/zDatIq3jtCew500TNVuT9CfofImXfOEyA30tNDkSvpHPp2AbNrzGzPqLyruP1X1n+hutoi+45OWXqUAjhk7MuYT8JLykyMqnAliMAVeCmHH1OCMWf7dVzKtRI6lkm+Fc7ckwTLQZUsPERoWaYtuc+Tlu3R87dfCHNgNHMF+gd9MPJyTi0zjm2ss9xd/T8X4dUqlbLhsowjkonN3GHO/iJ6ovKRRw1tgIUJgHXKe+6ERq+9aGcltGKbuiZfObVWc7qqb+Ke6MGvuD2FxzF3aeRaEXbsWD7HxOEqddbxB5Ph6EPSRSTUx/CIfsmboryaVHGO4LnmpFhDBL+CLU5UoE9G5mcQZPTmfGEdzm7jXUFrZHL/2HqaH4l3BHese6F6tQLYiAbDzbL7D9qEWcGa3FuT6cW9iSNzKusk39Dkris8Z1hUuGqEYwqTeCpJLooKaUNdFdd0=
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id ll5-20020a170907190500b00a382bcd9943sm2457921ejc.145.2024.02.14.07.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 07:44:22 -0800 (PST)
Message-ID: <1449b798-1486-47e9-b5fe-cf8e366b2e52@linaro.org>
Date: Wed, 14 Feb 2024 16:44:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] dt-bindings: pwm: mediatek,mt2712: add compatible
 for MT7988
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 John Crispin <john@phrozen.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240214140454.6438-1-zajec5@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240214140454.6438-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_074425_166385_EFA2307B 
X-CRM114-Status: UNSURE (   6.03  )
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

On 14/02/2024 15:04, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7988 has on-SoC controller that can control up to 8 PWM interfaces. It
> differs from blocks on other SoCs (amount of PWMs & registers) so it
> needs its own compatible string.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


