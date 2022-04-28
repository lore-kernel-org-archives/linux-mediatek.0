Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A9AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 07:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILkohXMFfFbzp6F2wC40rNXSQdxZb5DggBOVcBaWLV8=; b=PWEqIHrYwQYcJK
	9sKwmp7oc9i5A1UTrtjm+C3WNOX2G1Yx7af4vBqscepVsnsW5JlInaHf9MrDEKGvuAk02TAE+0p9D
	qQ3bHvMHWvne6KBHeAOM2SkeACyz1Vx7yP7Rnu7w9LR2AQLIVMvVnQ3cUFjfv1DNbM1Ix08IP7IxL
	tvYusjMR3dCSwA4wp0bA1T65Fl59f4lxqo7hFin2ljtXukn5aqiPaLYerHnX0HIH8sS2881hv/Qzs
	hPL8DmWJm/Qko0rUFv+0QB5d0kAUcRZLo5LHFS/OVdU1IsCNVJvj71sxPIl0PU6oAcgQbrpYL8Lye
	07xjFBCEk0h3XSQD5iEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njyPS-0057Jr-7a; Thu, 28 Apr 2022 07:17:54 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njyPB-0057CW-Q8
 for linux-mediatek@lists.infradead.org; Thu, 28 Apr 2022 07:17:39 +0000
Received: by mail-ej1-x62a.google.com with SMTP id y3so7671458ejo.12
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Apr 2022 00:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kiotrhzY6mHRDt2MpfojkktIKuOsbK8By3NB4Q/GZSI=;
 b=MTygZWqPOgvj4zfnDEGO0Dl7fWH8SPW4x5jXZgawyoAHH7BipTSQQY9dE4FYfaarZw
 Mn/0qJ6JvHHoztgL07j/MuzBEOgoRQRoUfnP+TJEDVfjXbVVje567VawSzeielDgUPT8
 9BvzFjKc7rZA5+WDHfGFTbBJ91bLc8yhfYW/BK5N8xB7S977ZqVMYCkK5tLMAu4O3HBC
 hfs3GPgom/wSf0ifKf7AAf7AiZvg46+ctEfdCTwqQYHoNmrr7H5EZikutbWucDRS9Qy8
 B5TcvJwcwEOg353CPL9N2hHCyCdLe+lKulnu1B3f2FtHc9YCkhBdwnPXu5D0UlDA4gRI
 esjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kiotrhzY6mHRDt2MpfojkktIKuOsbK8By3NB4Q/GZSI=;
 b=gsPthnDbX+PyQ/dZe6FoTH1d/nSo36gkt2oTD+hC3CpGlo7BR2EmyAzZdgKoKjd1S0
 BfBjZoGXcAbbFkVsPLf4mf/Q47XJ7xTtAAdWo8jXUuwpdPN7JuCoOXvaa6q0rLXJkN8W
 hO/metAnBrPCjGDZIReFIQUUr1KXacecripsPOF/pSzpLmqpiZzZSZIorrVmRxxuzRvB
 /rErhv+6I9W4Ce0CkeW5GupxnSc38DQdI+nHmKjqiEOA4jRP8L8knWwtm0agWP26w6Q9
 UFiSGLwPJ7Wdd62chCZyY7mDjV1+nsqHxZGqnCfsBAOwwU9g0lFT87/8oHCG+84TJXT6
 6R0A==
X-Gm-Message-State: AOAM532siJWp3yCRgcX7e3XfIFr3pWuPTr6acOvuBzeyADoOXDwxbY7H
 XnbuboWmEYenclRSP4bvDigOsg==
X-Google-Smtp-Source: ABdhPJwOzGc2ZqYmxfXfW9M4vuhzdmo/G5xgkjnVOJMaWrYUEVGUceHPm8UXhOi6f0Tq7bUzMH83Jg==
X-Received: by 2002:a17:907:2d1e:b0:6f3:6717:5f38 with SMTP id
 gs30-20020a1709072d1e00b006f367175f38mr26762237ejc.732.1651130248876; 
 Thu, 28 Apr 2022 00:17:28 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 g16-20020a170906521000b006d58773e992sm8045716ejm.188.2022.04.28.00.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:17:28 -0700 (PDT)
Message-ID: <a37b61fa-f199-0330-d741-ef737635d987@linaro.org>
Date: Thu, 28 Apr 2022 09:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V4 11/15] dt-bindings: arm: mediatek: Add #reset-cells
 property for MT8192/MT8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220427030950.23395-1-rex-bc.chen@mediatek.com>
 <20220427030950.23395-12-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220427030950.23395-12-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_001737_881067_55848DC2 
X-CRM114-Status: UNSURE (   8.07  )
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

On 27/04/2022 05:09, Rex-BC Chen wrote:
> We will use the infra_ao reset which is defined in mt8192-sys-clock
> and mt8195-sys-clock.
> The value of reset-cells is always equal to 1.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
