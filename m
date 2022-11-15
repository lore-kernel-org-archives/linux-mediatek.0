Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1800C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTCPHlKJiNqjfIcGyW+8cKWVQmtYwBfK2EmFcufHiE8=; b=WVVBSKOViR43qj9blt/vBa2eGa
	6/8+u4AY/htMSoMSd61Ma2hNc/ucpBdpTkK1i9KJJskpgqMJMHn67rez0AgEU22oIgNpL+pVJzq3Z
	D2IYc+GfgIlXnMf3xPvh3384+r6RnWl5v0Q5AuNIVP8opY0YfatWnVTFxTJjHilriUTC00abt3K2o
	zLTqQj8L6FjWrJPnTpk3+bHFL3gVSyPFRp3uP598ZMGvX0kUykVI4LU1agrJtJi2h4s4Wz3m10j0j
	whF9RFXisrYnDskauKwSY7AKRjOI5LK9v6gJHLxPeXzQp0zpjSvo290das+pMrsaZE+JHFlUmHYfN
	Nm9audCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ously-009gKq-CJ; Tue, 15 Nov 2022 10:02:30 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousWT-009XpU-S4
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 09:46:31 +0000
Received: by mail-lj1-x22a.google.com with SMTP id s24so16772669ljs.11
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 01:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KTCPHlKJiNqjfIcGyW+8cKWVQmtYwBfK2EmFcufHiE8=;
        b=UoJoJpNga2JN91C9mlsCc8amblFjryx7MwFX+YRWgXFhv3E+Qu8wZS1LcIjhDxIE4N
         zedEezVrZfERXru4BWS9TrCK0I7UKMY6XSe4DjgXnrzmEraLEx9VdkEL44nied7To91n
         FdVXQXpMfoB0BsMZr2DF8uDZTzhVtuDGmIdtBeUNK5Rq7cLaRrwi9TWoKGekT8dhCX5G
         1DipqTtLUHOCnXoTCk1Kzm3mwwAwk96twho6Pbvf8sj/0Dk/QDP0EGJLcpsFEUHKSFC/
         3Lm7KslBlbI5INGsTnKsleEHFy3ilDjqepIwsXYx3Qg/lkUrlvRk0wytdBjYwiXwYOZt
         kptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTCPHlKJiNqjfIcGyW+8cKWVQmtYwBfK2EmFcufHiE8=;
        b=EgVGcQGVxpa3EXtWMbcz74UEgusgiq4Q2A0asT8OZ6m82Rk4aCopM742qu6u/6MgwI
         RHYejay7bjgDK6UfZoqeYwGi/LEAWkoqMm66P7iDQU1pjt6sC0IkC6NmEvlQNu045dc3
         GJ8AQrWe3IklHzfRwsObVnz2nEU9OFiCqTgxHqt0+goINCNfrHNhLL0o/229uva02pF1
         3v1kJ+LR6DPQinWMulRz6lZjTV40PhGYWACvBpkVvGDXVJtCTMJi26zqfRBW0l7ujHKb
         V44whg17RhLkbCINuObGGTNQ+72XpOLCofjRCBCGgzfkxVARlHFPvSERdm4KVkPdwIBL
         BpNw==
X-Gm-Message-State: ANoB5plT0ALxg2EtvGmNEzPC3RhlfSCBP7hdK+Qk2O5tN1WkS3CGEEbc
	gZLxhR8uXoFPJJisKXUXincfwA==
X-Google-Smtp-Source: AA0mqf5Nu8UdAoc7UgGkcl4B6tJiLU5Cx9Yce67WDQMPaTN2UMUL7oUZZzzTczFOFrBNVji5CsvCWA==
X-Received: by 2002:a2e:a44a:0:b0:26e:89d6:e6fc with SMTP id v10-20020a2ea44a000000b0026e89d6e6fcmr5090612ljn.145.1668505587408;
        Tue, 15 Nov 2022 01:46:27 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t16-20020a056512069000b00497a41b3a42sm2149059lfe.88.2022.11.15.01.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 01:46:27 -0800 (PST)
Message-ID: <e125f05f-3f31-a5c3-e4c7-1132ce0be9b5@linaro.org>
Date: Tue, 15 Nov 2022 10:46:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 12/15] dt-bindings: soc: mediatek: pwrap: add
 compatible for mt8365
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
 <20221115025421.59847-13-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115025421.59847-13-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_014629_950069_5458C42D 
X-CRM114-Status: UNSURE (   7.76  )
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

On 15/11/2022 03:54, Bernhard Rosenkränzer wrote:
> Add dt-binding documentation of pwrap for Mediatek MT8365
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

I am not going to review this - please go through comments you received.

Best regards,
Krzysztof


