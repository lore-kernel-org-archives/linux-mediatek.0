Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44AAC7EE24
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3WN1je6v4B4Dvah+zjLHAtCz4SeNWd9ZpzLJFhz44Q=; b=CAEoDIzX50OWbPitwV4f7aWYSZ
	Bl2ShyDp65FZiIKJPwfePUQRATFlYdApbYyfLACFD+RqRXa1Id9nN5wGi31Jb0ltaZqnyGW+v9ssK
	qGJrbqOXk+Mv5y6zehQmsNRcX8BFTG8T0g3dZCB5g6ZHTK4LYIfgVkEiynGQhFuZHW2kfv4vtRgdc
	p5ozBFvVGrrSH92WHOknSnnoCzlOFoVzduIAIZ5qSeY5un1NYhzBWGIEnNW51levZubgZrn2mQNla
	/BLNIW0u2xouGKHQ91sPV/NbFJvIDnaie8LTuyONBqvSiwwJGJ//87BntYdDrSqpstK3Xx3c0V6I7
	Q3Oxia4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Sk8-000xR7-36;
	Tue, 06 Jun 2023 09:12:44 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Sk5-000xPE-2F
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jun 2023 09:12:42 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-514953b3aa6so7799287a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jun 2023 02:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686042759; x=1688634759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3WN1je6v4B4Dvah+zjLHAtCz4SeNWd9ZpzLJFhz44Q=;
        b=xORk5DT9KXqk8Oic15QijshMr0gwFZmqB7cqA8dBujZw3oPsqLgsFbKkfbsU4QEuQG
         sqNATiGB9L/OBSPv/RHIZiNoSeXkVd6wHmQptWBXbPyCdmeVmJzvimKg1v/0PTg37PtW
         qMmsFIfkjwjOXgndEmL4dn6ES+LwSuVv27c1spnDKqNe3SG9oYcSGXQW5ftBfBBxvsNO
         o4Kb4COcvck0Lr9g2LSexTjXSmLQPIZs/mFK54Z01w/zf0aXmhpAlF1YOoYBnr9xcSX9
         aWZz8u8ta2VZZ8WcDNT5nVlISEwtpmkVhIg4O87yKD33zmXuvC7u4ZG11tIV3iK7f0GV
         E5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686042759; x=1688634759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3WN1je6v4B4Dvah+zjLHAtCz4SeNWd9ZpzLJFhz44Q=;
        b=i39o7xcgeQJELzdXKR5Ul00ACrcW6+k5kx1aUssxUb/CiIz3uxPswLa2I088znIS90
         u+5Itob93Hld1j8pdLBrSvH4P5tl9L5H23ESg0l9lsrbg9PWjhYMnwPmiHTeRK0SSJsf
         Z2KzypUszS5pd0LOZ5HLMSsn1zKwYniwBilngDwbNPG5AQcnBjvIWYAwX8U8nD9WMtAO
         nieMinrWCVdkZShUWP2eqU9RnfaCTP40bNJ5Ug3QaihQIoE9AY19xKJEMkkHA2lQTdAx
         fL0MolPsTyW0ruC9+wBr4cvn3tk3VNt6jMLnJAcXAJuguEX2NkLAmoBuv4rM3x4Y81AB
         PlCA==
X-Gm-Message-State: AC+VfDz0JJZ6NUTMtq/2xGqjSU7DXjGmWGcdHTQ095er91F2iOlPz+mP
	Fxp2Waeopsazmvym28VtIzsUeA==
X-Google-Smtp-Source: ACHHUZ6ER8OjzrnPiGlDlb+vJxPIK7gi5+1cw8bK+nT/iVLmBBhNrj/mWq7B9+5jEP67rOmqYqiL7A==
X-Received: by 2002:a17:907:971b:b0:96f:9962:be19 with SMTP id jg27-20020a170907971b00b0096f9962be19mr1627304ejc.31.1686042759160;
        Tue, 06 Jun 2023 02:12:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id bo28-20020a0564020b3c00b00514b1d2759bsm4784634edb.42.2023.06.06.02.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:12:38 -0700 (PDT)
Message-ID: <5d911f83-57f2-84ff-2cd6-d7979deda7f4@linaro.org>
Date: Tue, 6 Jun 2023 11:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/6] media: dt-bindings: mediatek,vcodec: Don't require
 assigned-clocks
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230605162030.274395-1-nfraprado@collabora.com>
 <20230605162030.274395-3-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605162030.274395-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_021241_735966_E964FDC8 
X-CRM114-Status: UNSURE (   8.92  )
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

On 05/06/2023 18:20, Nícolas F. R. A. Prado wrote:
> On MT8183 it's not necessary to configure the parent for the clocks.
> Remove the assigned-clocks and assigned-clock-parents from the required
> list.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


