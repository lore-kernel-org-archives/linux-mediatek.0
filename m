Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D562C4321E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 07:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4xHBrRs6DEa09kxF3LA9GDj7CMR1kcIvrMK+3gx3o0=; b=GXg31bCLVCUu8U
	oWknsVWfJSYD6nz+Xv82W/54t2i4fKxB4gJinWeXI08HYiZAMSoC3GVHbr2T9s+dV0vSaWtpAkw/3
	0N3j2HzaZ0+eIiNcy2PxsU9vI4c59tg2R0xneq66gm7/Q8gBbjDK4GkwZ1wREmHI+CRXGRJXZ0P7V
	l+czGaUf8YRlaOQNtrWYvrrnfGgHCw3gYm2bh/IaPvCvtMCjYU3aMWuQf6abVRkmqdkz2gVF9AYdD
	8ZdeRkV1A+JDmEGNO0GEM7EOXySE9zCjoyMSY6NHyIgrluwrMQvYIJTQ9nK4scVaEIiZ4FRa2mm2c
	bmjWyGly2+aTwQvoXuMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njyy2-005LgA-CJ; Thu, 28 Apr 2022 07:53:38 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njyxv-005LYP-1T
 for linux-mediatek@lists.infradead.org; Thu, 28 Apr 2022 07:53:32 +0000
Received: by mail-ed1-x530.google.com with SMTP id d6so4540487ede.8
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Apr 2022 00:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7imria7AOBpaNTcOn+sNIMNFLxOEbQktxf1OYV+mCb4=;
 b=oBowMauFsKiWlMKoUFjyn0tQc0cXzAUCM6P9dHhlgL92tclsRV4WUlyxpCbFrqdUQV
 f72EXv37YQX7++jcHgvGug7uOJZMjXKPknstXCPo8mdnQ6W/yjWJA8+FSAdOsX32NYYZ
 fsXyvOfb0Nom1+G58YXrxnPZ3GGu1sPmlSt0HCNJfQmpEu9sQLfnkLoHg1velrva+EF7
 k1gnG95qwNsq5wyis8alM2bRH9lboBDlg0gaLToO7nrIZzpbt/bIB0fx8fvduysn1dav
 gS3stFU86bS/wAC2R6fWE+9PpjsZze00EBMkZcAXA//4EV7ZsKUnZe6D3R780BeNX3hH
 0WnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7imria7AOBpaNTcOn+sNIMNFLxOEbQktxf1OYV+mCb4=;
 b=2EeFovk/G5GNWKCTPD5bVN0j48haz8HyiASlAMGVhvFLn4Kwlk+VcKgqcPOzzBpsbn
 BPiio+QyecQRuv/EanEMqblM65tQ3FUY3uevMJIwsfqP+NnakgdLWd5lo6nq2MBFOIYQ
 RJ0lws/ecCFkrngd32pN7V1nG/vRWs2M5Zq8boaosKGPrKLTGJEiNMQbZwEveBlJUEvn
 4lENWLlPLu2DYabF9qImyBt9PQdAJ1Ob/313vx8kDFGGG2a7GKW1TqcwhJ2oIyYDDR3l
 idUB28zljGag524bIkeEdRyHWF0+kTpDAoDVNz69tw7fbrJI9gEa7mbDfgmSNfd+hJ9j
 IBSQ==
X-Gm-Message-State: AOAM531e59r58x1tFOvHQbFYxm4/hhLM6lZwoZSwThWJ9nZS2raqnhUu
 nO7m3E/eBwelCert5CJ12PrBnw==
X-Google-Smtp-Source: ABdhPJzviV5gS3KcyKsb8SDPBhzT7DiiOIR0C4FkBQNdYrbgZ3rUvu1yMYOzUNHDjnYGGQYf33IU4g==
X-Received: by 2002:aa7:c442:0:b0:425:ebed:4782 with SMTP id
 n2-20020aa7c442000000b00425ebed4782mr19873545edr.168.1651132409299; 
 Thu, 28 Apr 2022 00:53:29 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 l21-20020a056402345500b0042617ba6393sm1081334edc.29.2022.04.28.00.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:53:28 -0700 (PDT)
Message-ID: <1e3afa05-2e2f-fb0a-19a3-5a7a6af50863@linaro.org>
Date: Thu, 28 Apr 2022 09:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/8] dt-bindings: input: mtk-pmic-keys: add MT6359
 binding definition
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220426135313.245466-1-fparent@baylibre.com>
 <20220426135313.245466-2-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220426135313.245466-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_005331_134283_026FC6B8 
X-CRM114-Status: UNSURE (   8.43  )
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

On 26/04/2022 15:53, Fabien Parent wrote:
> Add binding definition for the support of the MT6359 keyboard driver.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> v2: no changes


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
