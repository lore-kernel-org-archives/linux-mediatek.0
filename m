Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95452C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 09:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GEKH51OqqmhzEXBT5Za0fng4+a3XYQDcdIRjGpggntU=; b=XObGenhIDLlpg7
	Yck2mUpJxGMGf840m3sgNsGgr7ku9t+HrPp+Fhe+Ph6KAoAN03LbtcYvhETI7swUUhVv3t5Sfn59/
	JeJJ4gDNDnS9LFtKDnAK9Iqpyu8hHoAFnwvJJgGQfV/pc3AEBUZEQ0Mli3fqQiQM6UKCgPFvPdZUF
	SsEcKhaj5sxW0I95hIO4WeO3b3ILe6F5SZNqhUshmrqK4PurWubnjhIL0OL1WgjcsNveeLMxJN0sX
	DVxzN2t7BQL2mKkCXXQ8sVSgPONd5LmP1ZU0BKwU0+IT0fs48wQSHk/EZP3V48TS89668ypNxEHfm
	uihDw4dMX6j775CZ609Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntRHi-007XJH-4D; Tue, 24 May 2022 09:57:02 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntRHe-007XHR-Qc
 for linux-mediatek@lists.infradead.org; Tue, 24 May 2022 09:57:00 +0000
Received: by mail-lj1-x22f.google.com with SMTP id m6so20271815ljb.2
 for <linux-mediatek@lists.infradead.org>; Tue, 24 May 2022 02:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mMxI+vIFAKlvMM/NNNRrfjLscB/Hbv7+Maz61XKAWyA=;
 b=eU4yl0l31L/KpXnKHjgCiMjKeODJvHLX4bAJIC/Bgf9WhrDDsYvDkxDYux4M8ysIXn
 muelLq4XnBBQgTZJr28+tk+I83FfIeM7o/yp1UK4OK2hsndiHU0nUKhEM47UTUmRL8sr
 4p0g5WhCzG5f9tdaFxT0kXRO1Cgxp3/BGtf4OuupzUzjPxqX46EeTrAocsOuy0tOhvRg
 s+O9vdQBL06gfyrPcmt+soT09s0gQOK44SHubQqcR9aipwoWTbkXJgnfsgO7a+WMpK4/
 Rwi/xrdhrXj0B/KOF9gTQDTfVgJvEdZhiRcTNCtl9BPeFdJoNhrt/eWzU0gcZZM7+2jy
 SnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mMxI+vIFAKlvMM/NNNRrfjLscB/Hbv7+Maz61XKAWyA=;
 b=w6Dc+fsCVYWnQVBicxvJcrNO64iuu2xJw5lTCn0C0zZnkEr9WtY0/bZiG4eO+oS+zj
 eM0Rr1jL6TlYVlmNQeeZRNV5IbQTMFQtnfaVnaoj1uRNMLYouOheQp3hEufye0QAqBUU
 rFf8e9XCNLFQkU6CN2RXKq97AD6IDjkKEfIMsoj1fIHqhVq4+dySc/bYloI+j2zeoNdI
 /tWvwGBJiRaIb2gGpatiQAjGFzx3DYg0i4D+hgLC4UDTGQNTYQ3s6rjIC74+lXAqSXmB
 2u3Cv1nu/NKcEiTQBJhZAg2aHNaI+3eRHpGTv47P8dB9jSbr01bQmDYGb8M3tBl6P0gZ
 kdKg==
X-Gm-Message-State: AOAM530sz/wCLIvphXyc0zg8sUV3YtbRCukmen4+cox21MgoNn/K4nsC
 gdLFqPcHPJ2RIVLgO111SncoYPV+uFcDSw==
X-Google-Smtp-Source: ABdhPJwAQWdZq81MsCA0KTIn1olCkxhipKoBgusmjVHEC+VLehZ4vjazlcp0UE7Lei7jPV2iFKfTTA==
X-Received: by 2002:a2e:9ccb:0:b0:253:df97:ebd with SMTP id
 g11-20020a2e9ccb000000b00253df970ebdmr10572569ljj.280.1653386217371; 
 Tue, 24 May 2022 02:56:57 -0700 (PDT)
Received: from [172.20.68.48] ([91.221.145.6])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a2e980b000000b00253df2d526asm2267491ljj.77.2022.05.24.02.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 02:56:56 -0700 (PDT)
Message-ID: <7a34faa9-cdfc-3008-7cc6-89854dd0f183@linaro.org>
Date: Tue, 24 May 2022 11:56:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 3/4] dt-bindings: regulator: Add bindings for MT6332
 regulator
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 lgirdwood@gmail.com
Cc: broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220523154709.118663-1-angelogioacchino.delregno@collabora.com>
 <20220523154709.118663-4-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220523154709.118663-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_025658_929692_D61809B8 
X-CRM114-Status: UNSURE (   7.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 23/05/2022 17:47, AngeloGioacchino Del Regno wrote:
> Add devicetree bindings for the regulators found in the MT6332 PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
