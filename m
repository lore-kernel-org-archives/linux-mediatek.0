Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B608EC3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 08:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ifCo5FOIwokCxO0n+MVhGa5ic/79OUh35i/SK2lVaA=; b=AeO4ndYvR82LndAghBf5354fLW
	l6kh43UvkUIzmLseFaTVu2Ux+g5r5Lj2EAdbTNAyuqn5flF1B5CSvKAwdR91V0uHJFLoH1TAAfMm6
	JAlJCqyE2zTWEgOL0GNQc0WgNnsRsE1c57/OpuMGM6+rJabJd18QxdtfYzayZeICBguR1eJ3E1EDo
	jcSGKRrXHFWANLtbnvGtOA01c3J+g+HqfCv8MKRwG4jkivPgM1y+xKHks67qKlnm2ObhfnwDD3XJR
	ppkGGcqClUDuNIifntShGGouyG4WrwPlmsHrGpVsVzMwWQdxO50JkrPaB2ilQdF3yIFA3KjW9+Hqp
	18MIh02g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcaJ-0009SM-8U; Tue, 03 Jan 2023 08:23:47 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcYg-0008vD-Hm
	for linux-mediatek@lists.infradead.org; Tue, 03 Jan 2023 08:22:09 +0000
Received: by mail-lf1-x133.google.com with SMTP id g13so44633491lfv.7
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Jan 2023 00:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ifCo5FOIwokCxO0n+MVhGa5ic/79OUh35i/SK2lVaA=;
        b=kM1Xdn4x5u6DrIrS/Lk4CaxK0H3MZ4Xp/ynvK1cN29tFo8bDKerM/ZQKiYqxpqY9PH
         nlzMLn8ProPaLuBjJbDnbGjOSiWb+I7LAceEs8MygPjHLyKU7GYQenpv5h1e4rsZHBAx
         y7lpwEEU9ofPxj+lOSkdri4oTD8h/6Ay13EB8ZuAXYJaj931itWDGFWUyX9FmBzzPpBa
         yzegMbb9ZM3AaO9+EspKdwrAyRuZTd0QEthQZUd74xx1An9Z8HmA96R94ntQ3dwwtmLq
         uVNMB4du7aOPVeNwxPx+YdWIhe2vImH5zh0ZV28Ur3ClE75235Cv2XpEkZLfhDBlfDpg
         4OEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ifCo5FOIwokCxO0n+MVhGa5ic/79OUh35i/SK2lVaA=;
        b=TdRq3uUGPDWXQnfNj7Q3kjIxKGuDq+QaBoCrNv85abVy4nviI1/c3rfTedIAnYPuMD
         OLgpB3c68J29srhGCu3g29ON+bejGxEhLT5m+2eI+3nqeBpUTzvFpm5ro0T33Bt1c+RF
         SFChL1E7Na9amMXtiZRDJaE9TJ6AjxxDFZh5qk/SDrC21yhVccIVoUvf779v1Kjreil6
         GmOiq8795OzbyhTOn5MNSQdihhozysrBaGs4P6nBgwzzHYLn2lgc+QO52tK7F38PXPRn
         DU/BAeGndbQQ+WiJ+T336rf5jupF9uXNgFsih6WXTh/MwAkJAQ7WogZAQXIcIZx8qWGw
         KJ7Q==
X-Gm-Message-State: AFqh2kqiBVwf7fPWZIpiTHreJYj3TSKld5v2f2LvqqNT2N85YsSV20Ap
	lzwgVFA7yE68CXclmFrt9dw5Cg==
X-Google-Smtp-Source: AMrXdXtsbVV3d08q2p6h3Fhxh5/w6BwJ0fVyFb+0dMKZcc2dYyw/NiHcC+TEEXH5jwusbWDSDl+m1A==
X-Received: by 2002:a05:6512:b0c:b0:4b5:97cf:8f1a with SMTP id w12-20020a0565120b0c00b004b597cf8f1amr14197071lfu.40.1672734117561;
        Tue, 03 Jan 2023 00:21:57 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512075300b004cafa01ebbfsm4286973lfs.101.2023.01.03.00.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 00:21:57 -0800 (PST)
Message-ID: <3f484fa3-680a-5f7f-c824-ec0cbd305d55@linaro.org>
Date: Tue, 3 Jan 2023 09:21:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 1/4] dt-bindings: vendor-prefixes: Add microtips
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Matthias Brugger <matthias.bgg@gmail.com>, Guo Ren <guoren@kernel.org>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Linux RISC-V List <linux-riscv@lists.infradead.org>,
 Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
 Linux Mediatek List <linux-mediatek@lists.infradead.org>,
 Linux C-SKY Arch List <linux-csky@vger.kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jai Luthra <j-luthra@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-2-a-bhatia1@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103064615.5311-2-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_002206_757421_3C48472A 
X-CRM114-Status: UNSURE (   8.97  )
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

On 03/01/2023 07:46, Aradhya Bhatia wrote:
> Add document vendor prefix for Microtips Technology USA (microtips).
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


