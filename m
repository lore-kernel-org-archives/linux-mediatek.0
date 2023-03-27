Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0834C76195
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xly0GzQvPfILGOWv1mMDVBgOAznYSMXIGKYil5doN4=; b=Y0DKuizWgp9uXISeRrN1l7BQUZ
	HZ4kTQE/IV8cdq/YMi+yYjZZClLhmehRhkjUXjIff4/OSv9o67lLWAFBInA1oDCqhpxQlfZqcVxR3
	9gSzj64WOcTg0teo5BfRxB2TPZXjedR4qEbzUXfPeVIngJ12GO2tdFe9t3016QzEsjUwVCipx2AYE
	c+1mljeORJioAQXm2saP5fCStFImQttAXSgAhKd57LxPc9HvPVK96HNes3kAgBRXfvQRi0RzvhjBO
	x/B1bkfzH/Xa33wxM+W+krLiDv98CG85tfsqJ6nf8hV84OgcXvX2ywLhSnJj8zTNMfiMHGTynkwe0
	DZjCuPSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqJj-00BqD6-2z;
	Mon, 27 Mar 2023 17:07:35 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqJd-00BqA0-0w;
	Mon, 27 Mar 2023 17:07:32 +0000
Received: by mail-pl1-x62b.google.com with SMTP id o11so9074988ple.1;
        Mon, 27 Mar 2023 10:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679936848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4xly0GzQvPfILGOWv1mMDVBgOAznYSMXIGKYil5doN4=;
        b=kPECvF8v9MrjYejXS1kTs26xLMq5QuebytHoSLEu0lLafedcZeLRjO0XvDiqPNdle1
         lspbWT4KByO1YXO7YRzn//6xQ2RgqpIC2cwzF8bixBiaIF00oIRsxoBhe0zk/6gsj1ou
         Fz3d1iMe7CWqep+NZc88OZ+8SG43swPScXCnV3D4E0tcy7EsJ2wnyZGk2DQhDmdkK5B7
         TvyHN9bD0R5/3QtsEyul54sIXQgnh4F+yl31jcgrCsHzGiXls/U7PzZ44k6a9omyVeRn
         WxQwzsw868WsC5X2scMvf/kdbzIoTreQUJaWmBPVjKACN6fIDO3c40dvmwPFnraoLzfF
         dUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679936848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4xly0GzQvPfILGOWv1mMDVBgOAznYSMXIGKYil5doN4=;
        b=RRXu0ns5ZKtdjffoIqSb7CkIFXw1s2sTIhIMR/LYNUTVAsWbb2s1o8eZ1VFi+SyrR2
         4cLX4R02oFh6Ms+Tp5OxspZqMYop81JkDq9sG0jUD8KIKXQGIP6nuPLn2LG0kUnn98eL
         MS9Ti+bsIOrnopT+vBDbjXca0u6diLbvcuy90ZnTFYdhIIdH24HtOsO3zGmFMv/kzsmK
         /4PMldfJZOB0VdMewbZC7/wj9x1Vf+cGdpTRPDrovCIOWSAFzSImE/3dFXVF3nKPVxtb
         sthkmYocjrnjFTdl29Sp+J6qzku0/e90QzJxB8W5WzRR2JLiy9L29l3qA4CtO2Vt28ip
         m76A==
X-Gm-Message-State: AAQBX9dupRGs2pTKSwx/giICHBustv43qMOdqu179Ul/mKjPHPXhNRgi
	TZiYErmsvivMdCuh0CHVB+8=
X-Google-Smtp-Source: AKy350b5i1zL+7Kc62BGEJOvl18jMSAOVQSlGlHcYfpt3b3Kh4/hMZv0Lolgjp0OESx8lwvFOgkRww==
X-Received: by 2002:a17:902:d492:b0:1a0:57df:861c with SMTP id c18-20020a170902d49200b001a057df861cmr20430671plg.1.1679936847754;
        Mon, 27 Mar 2023 10:07:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id u23-20020a170902a61700b00192fe452e17sm4979449plq.162.2023.03.27.10.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 10:07:25 -0700 (PDT)
Message-ID: <cbb30ff5-d247-e545-23df-ff9d393ba57c@gmail.com>
Date: Mon, 27 Mar 2023 10:07:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: rng: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230327170153.4105594-1-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230327170153.4105594-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_100729_339016_63394849 
X-CRM114-Status: UNSURE (   8.98  )
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

On 3/27/23 10:01, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml | 4 ++--
>   Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml | 4 ++--

Acked-by: Florian Fainelli <f.fainelli@gmail.com> #brcm,iproc-rng200
-- 
Florian


