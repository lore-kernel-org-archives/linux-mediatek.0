Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B34C77B62
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 17:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TRHg+cTs43kfHGBM/5sDvwk2CMTBx+iHyHIRc3YKQQ=; b=GjFWBqcMYMZPNf
	lgFQ9PitulgqWK8Q793vSX0qfgNfFfgWsRQ/2fL9Kli/efz3Gzf+6KW83ohogTdoZCKpOzuhNXxlI
	n0pKUudRB8k7kUZKh1XrYCyuWCZmWLV+md2YUAY1/FMvXcj+k+l4j8Mem+9Awt32FKXXIJunqJ6T8
	qnkLHHPvh/Zpaos1H54EryCZq9xjzwNU46FG9gO5CkIG1lQ5UmS2F2H7jVbm2EYAorsgDNlR7EosS
	5QTx3dKb0gIE87iA5EFsNfLyjvwj9wXJWt5pZH/OIyCeCeKWq7LF8OTzr22yaabjjbdf0qpvXqiJe
	4E5YFg/WvoXtaiW9KoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phvmE-004aGn-0j;
	Thu, 30 Mar 2023 17:09:30 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phvmC-004aF4-07;
	Thu, 30 Mar 2023 17:09:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id m2so19820467wrh.6;
        Thu, 30 Mar 2023 10:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680196162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3TRHg+cTs43kfHGBM/5sDvwk2CMTBx+iHyHIRc3YKQQ=;
        b=CpJm8U3E2ngq5rxs2vxcVii+NSUiivF5PvrdcT9zIODeeTR8/M1driEylYB4tXc+Ji
         Q70bTtmldbgaiM6gPDCwwpP4JYUlZfvgOGXw/q3h2qmOruMVI77FkXK3uNKe7CJox0Ad
         mhTTSDEwVzmE6+lIwyuIXO03g7jGnZBHmdNdtlZ4WsGaX7oVflyFZ+t+FIvmVlTPvt1T
         0oCaLiyfvd3T+RPL/+MuOB0d4AX2qa2mVqZRGfAfnk9ooi64pwyxRcGoRGbQcvOowbCS
         u4Uz9nq51cWuuF9isJefbrSLM/wqoM+7sVBMfzf29x0m+F0fVhTU8L7vHJxPpxxMaYNC
         ew4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680196162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3TRHg+cTs43kfHGBM/5sDvwk2CMTBx+iHyHIRc3YKQQ=;
        b=2Hc2kLElsX3PHqHf1sEvZ9m51R09LJRNFJhFTeJZt6Gvx9vsx9xNn7BVgANJ3xNi7B
         rQxqEMvSbgCb2rvs8ERrVQz2QaHe+BkGtCoPN+FKKhcvkuY5J2mp0Ke0XfygTFDMd924
         gOTTzr3qxJ6jIGY5BR6NIt+sYS45O9VQOOvTgka37uZlQv1fzMIDvfRgiERNtuGR7HJ9
         Ox1JHuwfAoPsj+NcUiM/kpfptEFyfuhNxKkuld3xrVB2whmIyM2ZhNufztZ4eUWRRI5v
         YaCIeLOLBkVEH9Zva7MprpL5++vcC1P+Lf3CAEQ19X8S3MVJRW9jt4Qd1StK/3I4w8QW
         ZJOw==
X-Gm-Message-State: AAQBX9fHrIHC+x9QL9LDNlgt2yGgqtRnyusHatIyOKi8tX2beyUd+KNo
	Cm81EIVisO1lKBG/AblN/gk=
X-Google-Smtp-Source: AKy350brgt1+Yl/+qZ7NQ5as83uCi0jHokhPsY7zou3nvHJT9Eg+7r5f7fUfv8kl5fSyf5OCPkzRUA==
X-Received: by 2002:adf:efc3:0:b0:2ce:a944:2c6a with SMTP id i3-20020adfefc3000000b002cea9442c6amr18546399wrp.70.1680196161696;
        Thu, 30 Mar 2023 10:09:21 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j6-20020a5d5646000000b002d2f0e23acbsm33229184wrw.12.2023.03.30.10.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 10:09:20 -0700 (PDT)
Message-ID: <8a6d8107-436a-1b13-3799-59fa75c59635@gmail.com>
Date: Thu, 30 Mar 2023 19:09:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] dt-bindings: mt76: add active-low property for led
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@kernel.org>
References: <20230207133504.21826-1-linux@fw-web.de>
 <7aa132aa-d2fe-e2a1-a2a7-97321a74165c@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <7aa132aa-d2fe-e2a1-a2a7-97321a74165c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_100928_096233_C327313B 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Felix and Kalle,

On 07/02/2023 14:36, Krzysztof Kozlowski wrote:
> On 07/02/2023 14:35, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files.de>
>>
>> LEDs can be in low-active mode, driver already supports it, but
>> documentation is missing. Add documentation for the dt property.
>>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>\
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Can you take that through your tree or are fine if I take it through mine?

Regards,
Matthias

