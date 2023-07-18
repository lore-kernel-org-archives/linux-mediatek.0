Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E16EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ch3HwCle8t0HQLKWqULDqCLL1QYxiM3sBmnYW05bGNA=; b=CT7kBRaS85R3/R9tIuGUp+RRVs
	9DqAJja6k1UaevyPmk22ZqdmMIbkFJu4WWNyb7F6KDU5LpPo4R6DuV/nMRyudWhDyq/Qt19b4zIIk
	D4sCvRV0ta6/TBtPzWW4EMlQcqkWbh+woB7Y+0egnK5rgFKP9HygaQU8JlHciWuZzS3oztFtt99qA
	V/jcu87e1XtWso0VT2dl6bWweqv0p7O5HEc+LZuA+dWNFy0NIYdJk+2mh7U0EMc5da+xmFbGRpMe1
	EN0FJSJrdpJwsS8ASHWfxgyCzB50/SbPOsQB9owYSohStMQZ6ZiFzUx/UQMdQTdKHno2ed6gNCEVe
	BQB+mkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0S2-005cME-2H;
	Wed, 19 Jul 2023 06:14:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0S0-005cKr-2e
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ch3HwCle8t0HQLKWqULDqCLL1QYxiM3sBmnYW05bGNA=; b=TPOduDE9yxDLQprypEB7dL8mz2
	7ZNcxiIUzKIw3eajGyEapr9YsqOr5Eo/K4r5hsAf9tvAgZKsMZbbCu6T7SEc8VlikMN/K3tFLcID3
	LdFhXH+t3KJW2nebeEe+HWgGK1SLx1CxBP4BuaJbwYGsXCF1/zSpTg0IgbswZylX3tKxms58SwaQp
	MypZXZAfuiKjDEhZxWebk2EG+PefXNBAFCda1CRSrzArAj8kH6WmIesbLLXUfw5k6FO4oN0nxhjKU
	jvIFqSicT4htkctGkOifs5pznY+Uk/lf4u1m+D9v4771slXhukTdA0PXbD8DkVNNw3dEN629TaQgL
	fdbzkdxA==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLeLE-00BDf2-22
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jul 2023 06:37:50 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so13527107a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Jul 2023 23:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689662189; x=1692254189;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ch3HwCle8t0HQLKWqULDqCLL1QYxiM3sBmnYW05bGNA=;
        b=U01zHKdAJgiJi/0OYb/CSSfHOz2/zNSoBAEgUiKefZlJG4K2lEaXeNmOo0fd/KjJN/
         GNrXRGOcWeplGdRxDl0UuSX7cxAyV2152b+0zHsyXKNHrGkLFaUaZExpVgohKOoqVp4W
         grOP/ixXRLG1ke2832ZUxGAGdXl1Wgnlg45qQbpqikw3XHdI/+slY81lMGchNjMr4Mbw
         ax11qvPWF7SE+Bip+NwfEfMV4CndoAgBjsGxt6Z7ASxHC2JsFItB+b6khlghBFXKT8qm
         PJ7VqArgSM1vUzwT2i/WLboRubatQVXp4eXsF2sKEDh3YPDEU44ewVx5CyabJNWeuNNb
         fpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689662189; x=1692254189;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ch3HwCle8t0HQLKWqULDqCLL1QYxiM3sBmnYW05bGNA=;
        b=BT2TodiHvb2i1/ZZROOqR6zjh/wmLS9wkjBZpJziSzfWbavRUoCb6Ii24MP5evQOtg
         eFR596esep2m57hTH9kL/pxsGTa3pj3j51TjPEEo/NIqYmX45mdcZgOC2eUavqT3WrN0
         hrmTvoYowJDY37LXoq2O1T6aBstls6JVCyhqjP5HeVYJYoJd9JhmrG3BQ45xl5IzsmAr
         HUpJ1O4qwXdGLQ3zOfCuTv13OzkcmWPoSJQ7CS+u0DChvNJb6w7XeaUrXlsY0IAIqCnl
         +2b4GlJRXk+Q+nQiL3BednjrBSKwWXJ77qs75cEwSU6c855TB0UAfxfs0/c7CTL0Mv6a
         xJzw==
X-Gm-Message-State: ABy/qLZS7FqZSlOHrPuXvvKJx6QLYwO+bFCbA12udXR4aDumBY/kc0BZ
	l8Qe1SNNTINyaAj4cCIkVYWChw==
X-Google-Smtp-Source: APBJJlEhoShmWCQpzx0q+oa55hWslQ8QawZIkwRQeOfACYcBu3IQCG1QXzCrCLzznEGJ4uOW4vc4Pw==
X-Received: by 2002:a05:6402:34c2:b0:51e:5206:d69e with SMTP id w2-20020a05640234c200b0051e5206d69emr13501477edc.10.1689662188884;
        Mon, 17 Jul 2023 23:36:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id y11-20020aa7d50b000000b0051e2a4edfd5sm722206edq.21.2023.07.17.23.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 23:36:28 -0700 (PDT)
Message-ID: <6ae63cd6-7e57-d81b-fd08-5699b4e6256b@linaro.org>
Date: Tue, 18 Jul 2023 08:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/4] dt-bindings: soc: mediatek: pwrap: Add compatible
 for MT8188
Content-Language: en-US
To: =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20230717120300.21388-1-jason-ch.chen@mediatek.com>
 <20230717120300.21388-4-jason-ch.chen@mediatek.com>
 <9e46c996-3e3b-b437-f2c4-2ca86a1c7e6c@linaro.org>
 <054014f207e24e1507199cd9833085346ed8cbd6.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <054014f207e24e1507199cd9833085346ed8cbd6.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_073749_054594_79EF5C63 
X-CRM114-Status: GOOD (  13.20  )
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

On 18/07/2023 08:34, Jason-ch Chen (陳建豪) wrote:
> Hi Krzysztof,
> 
> On Mon, 2023-07-17 at 21:55 +0200, Krzysztof Kozlowski wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  On 17/07/2023 14:02, Jason-ch Chen wrote:
>>> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
>>>
>>> Add MT8188 PMIC Wrapper compatible to binding document.
>>
>> No improvements here - the compatible is already there. Subject has
>> the
>> same issue. Explain what you are doing and why.
> 
> The reason for changing the patch was that while MT8188 uses the same
> pwrap as MT8195, the original code was applicable to 'compatible =
> "mediatek,mt8188-pwrap"'.
> 
> To resolve the DTBS check warning that '['mediatek,mt8188-pwrap',
> 'mediatek,mt8195-pwrap', 'syscon'] is too long', I modified the code as
> per the current patch.

Explain it in commit msg. Fix the subject in new patch.

Best regards,
Krzysztof


