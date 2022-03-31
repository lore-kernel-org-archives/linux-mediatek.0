Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6FEC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 20:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZcTpwOVnmr3rJ/HXAR4D7qb6hmg73VQjcqoAyRJxkQ=; b=HcMAzVeNKApSDo
	4RZ/4pkknJnIfFT2R0o5Iml77BcJMWgJeXVYjcjbskqJx6qcdQ1CClbkb4IAgub3YpfNRjdkfL2g9
	rxK4P/SUhEchiEIwtg3ffOiSxCvvmjbihyiom5oXs7ebt5Jn0GuaH18H5Mter1llwOkE2tkAWQA+8
	BSkR8MubLjcmLSMHbHcaBSyTzH7K110ohtjP2MkRbv4An3A4UTE+9y0jBJ/cfnwZQkNNt9zBLLsOt
	sGzId5HPw+BNTzlVfvHb+1zRcwW3KimfiZa3m8WMDFfhqJsxBYegmF6gOXzEJlOHWj7suYZ5k8zYU
	Co9caccdgSXtAlW7aCIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na1Mm-003ZTL-VS; Thu, 31 Mar 2022 20:26:01 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na1Mb-003ZNn-93
 for linux-mediatek@lists.infradead.org; Thu, 31 Mar 2022 20:25:50 +0000
Received: by mail-ej1-x633.google.com with SMTP id c10so1574041ejs.13
 for <linux-mediatek@lists.infradead.org>; Thu, 31 Mar 2022 13:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IVwmuWYXmc6PxSc6Y/RgcIvWvdH6cabgH6Cbl/2NYsE=;
 b=qF1s2bsIkIkwALQQbK9phUTbyM7EQv/ZWribu1fYZe3qcD+6pENraSXcfDi7Gsops2
 CQniF0O01DTnl+EvGvsYDnCmA0wDOeZ991a08nCzNXOrpQ4CmMeyqYDzYeYW6xfzu7qi
 IchxzVai5NYInNPiUMH/jxV9n4O21Af99bwvbreSxnqKu2bbClO7f86Idh/ySc3nwWxW
 oARRdSXUeNLuTwTUSakS+3uEmkRAUR0gGNE1UgnESoK555OamB0qws9A3e5Ef46bazfg
 UYb564kg6cW+DR2WDXgNZG9MA5qK66Vuk+u7RsiqTXNtLaSiw0Zz0yiWb/cUxFZUQz6N
 Fw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IVwmuWYXmc6PxSc6Y/RgcIvWvdH6cabgH6Cbl/2NYsE=;
 b=mtmFgrM5Elmsb6PbyPda6HjC2mRYu1xqhmXBqQ30PbpLfv8vGJq71s2tXrztw+oIQF
 ZKL7ZB7gqUZ9IrcgLoP6GAdOWIuoufiqZpZrJ2bJB7RXwDbv/aa2zgCcwPSdjRMVNGuN
 WDAlX3DRofLlh1D0FACLmpa6xqGbugz34UYKYoYNta4Gwh9ygapJs8Cet4d55i2lNKcB
 s154GTiRYOVNmQit4F/BYDhOcp+KZwf0yt8MB3b1chbG5xdd8Q+q8tG2ibkQTR3Dm1X+
 hnS1MFuDlnXoNWlQtOjp/RHmYIDLCpToojUFvkwUcyfIBFMDEBAV5tneL1mw5+h4ZfcT
 kEMw==
X-Gm-Message-State: AOAM533bzz0QRcVWAcvMouDW5tmPmrvkyDRmS/iiPFzQ/AI1SpxCGrBl
 kzWPTHVDhmw7Q3JkIPmk/3wFUw==
X-Google-Smtp-Source: ABdhPJzqQfEiQzRkvUB5+kDvhz2zj/QNg7xQta5N/nDJPmJJUTp0RbFPzOZLHRrPo7zDeKR3V1WGag==
X-Received: by 2002:a17:907:2cc6:b0:6e0:1ae5:d762 with SMTP id
 hg6-20020a1709072cc600b006e01ae5d762mr6610402ejc.291.1648758345516; 
 Thu, 31 Mar 2022 13:25:45 -0700 (PDT)
Received: from [192.168.0.168] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 k19-20020a1709062a5300b006c75a94c587sm175359eje.65.2022.03.31.13.25.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 13:25:45 -0700 (PDT)
Message-ID: <1aee818a-ca5f-098f-c549-4d500630c777@linaro.org>
Date: Thu, 31 Mar 2022 22:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5,3/4] dt-bindings: pwm: Add compatible for MediaTek
 MT8195
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 jitao.shi@mediatek.com
References: <1648730873-18505-1-git-send-email-xinlei.lee@mediatek.com>
 <1648730873-18505-4-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1648730873-18505-4-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_132549_345152_ECA63CC5 
X-CRM114-Status: UNSURE (   8.63  )
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

On 31/03/2022 14:47, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of pwm for MediaTek MT8195 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
