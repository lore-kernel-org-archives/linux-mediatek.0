Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AEDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 15:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANSl5YLjXQ2tgqwSSQp9adX73plI2ZW9AetmcmUlyUM=; b=HSO8mpEguygEMz
	J64zVcvM1tnVBbKjH+1xCYvphxTxPzMBI8EtruQ9fJKEjac/dEQle2VrciuCZIH5dGMhUWQAhYkco
	deCEwTwkBDsXVwRKM5EA8eP585tvRpCtmABLpkxvpTnS9mYXc0CNwjaNLEcM5UziKYtFJ1pymNiSP
	PfZb/LetlHGtkZ05NiMEH9C2oO94FO9weF1Ro0ddykphYbuP1wo9JWgaeegJ0VforkxoK13M1ADFG
	IOMbWkFsh1e2oGYQVXM1lMgpF3twVCoPXwiB6dnPnBMVqRAk5suwgtBb6p03VV2mQ9A6iWs5RLSss
	QAJRJo8rVwUqZ/2W4XXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nooOR-007bmN-2Q; Wed, 11 May 2022 15:36:51 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nooOG-007bjX-D6
 for linux-mediatek@lists.infradead.org; Wed, 11 May 2022 15:36:42 +0000
Received: by mail-ej1-x62b.google.com with SMTP id dk23so4831369ejb.8
 for <linux-mediatek@lists.infradead.org>; Wed, 11 May 2022 08:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=s9lNfI7TcwVigUjSYULy3QOAhvngUhwQle5drwFbVL8=;
 b=UDgM/7CIdwpg7TQ80bRyU4TfD8ldDTOoKUvXkBAypeBetC/ZXehem74fuUzxgv+673
 bhZsUJVYmDXQBKCv9mVxNT8DkjGrWu575i4uN/rDyEsQmfOc6vQUpk0YNPBuYIog7qSF
 2P7vnyyI3dNCAXfw6r4b/OFSIbV3X72g+t/iC2ugWlmt63dHNsvUrFCQag+pIgIRSy/6
 X36SH1wzjqfPwgFhXAZvmlXcvWdB/VD/2hcsTQ/y3/3g4kKsewQPRK5kEV+ivnAT0Has
 XPQ1xpoU6Mm7OLy5zsSHsf7Du68T8Kp4P0usibTXcfIPsjW5zgQZt1EAuku2OITtLhZQ
 Qh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s9lNfI7TcwVigUjSYULy3QOAhvngUhwQle5drwFbVL8=;
 b=FD60bdusiAXPx2UM+pBDYUioRrR+Gm2tXQYgfSqBSzlDsol41f7enAJg7bUe8swYuU
 QYtiZyU0BQW/8vvcTvy5cRnkBRy7G7NIFIN17BZy34j6uHQDftgcm8JEDeQTLWDK4GvQ
 HUvF7qXBT/CHde/uGXGr8KapJtLAG9gHhA4lxyA78IxFaGQDfa3vaUilDEzBQaz/31wn
 AFNyps7hBayalikJPfbaiRR5y/iQie9LaGcI8/3xTn49+jq0+bS1b7k4OCnhNEbrTD7y
 8SrtNogqIMCPkqG+VrPfVgReC9pmG9hremH8qrayDRYfFJWaPyzuLhlKp+9mgs6x0QLJ
 B9Cw==
X-Gm-Message-State: AOAM532PEDN/kSxV0TS2xdnMzG2u5FCEkoa2AgSLpC8bqp3P8uTvTnhw
 DxuNs7yHbPNz9AniOUW/DU6r+A==
X-Google-Smtp-Source: ABdhPJzGKntoTYFAsjQgyRo8QHUf6eZ/sVXe1HlTdWu11CGW4leRLMnpi935aU7hwUOVWkAuFyelPw==
X-Received: by 2002:a17:906:dc89:b0:6f4:d3a9:6862 with SMTP id
 cs9-20020a170906dc8900b006f4d3a96862mr25676309ejc.571.1652283396618; 
 Wed, 11 May 2022 08:36:36 -0700 (PDT)
Received: from [192.168.0.154] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 x1-20020aa7d381000000b0042617ba63casm1356919edq.84.2022.05.11.08.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 08:36:35 -0700 (PDT)
Message-ID: <3e5ddde1-9d0c-a5e8-1828-aef1d1165a3e@linaro.org>
Date: Wed, 11 May 2022 17:36:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] dt-bindings: pmic: mt6366: add binding document
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, eddie.huang@mediatek.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, fshao@chromium.org
Cc: srv_heupstream@mediatek.com, hui.liu@mediatek.com,
 tinghan.shen@mediatek.com, hsin-hsiung.wang@mediatek.com,
 sean.wang@mediatek.com, macpaul.lin@mediatek.com, wen.su@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220510064603.15920-1-zhiyong.tao@mediatek.com>
 <20220510064603.15920-2-zhiyong.tao@mediatek.com>
 <6614cd3783666caa529106464e7684caf16d6582.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6614cd3783666caa529106464e7684caf16d6582.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_083640_467373_E263C84D 
X-CRM114-Status: GOOD (  10.00  )
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

On 10/05/2022 09:56, Rex-BC Chen wrote:
>> +examples:
>> +  - |
>> +    pmic {
>> +      regulators {
>> +        mt6366_vdram1_reg: buck_vdram1 {
>> +            regulator-name = "vdram1";
>> +            regulator-min-microvolt = <500000>;
>> +            regulator-max-microvolt = <2087500>;
>> +            regulator-ramp-delay = <12500>;
>> +            regulator-enable-ramp-delay = <0>;
>> +            regulator-always-on;
>> +            regulator-allowed-modes = <0 1>;
> 
> should be two space instead of 4 space?
> mt6366_vdram1_reg: buck_vdram1 {
>   regulator-name = "vdram1";
>   ...
> };
> 
> There is the same issue for this example.

Indentation is four spaces.
https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/tree/Documentation/devicetree/bindings/writing-schema.rst?h=for-next&id=7a150b0d850e37e7bdfc87459edd0ff302f67478#n111


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
