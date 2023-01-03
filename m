Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F72C46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 08:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnNplO8zsSj05CAnhZjssEtarwgdK7a3BUAmXeHqfTE=; b=EXV57C7ezB14EDBakTsqshH9Aq
	J2GJYy96XPt4ztyBDLeGGoC9/9/On/0k1vTBYA/NVeRlJNF9vBGVEWDrnkx7a0puQfN7WjSR5WMMm
	ba5Shl446QMsYz5RGFb+I9Fx8r1Bgfwa3KcQ1MToXweqm+I+aub6aOI96+tHFQ01Yp2Va7GFG4h2+
	4U6bYwmItbHmhlr9kz+ioMAnJZ64IRE/7e69eGSqBGtWwJPGJoedMImwnom18nPAUujVfPZJYFduc
	DZA1Dv6OTLO/JxXzxx45RU7FgEHtQzQ/hCb2YZl12s5TzRnxAd/5yb/gQCUlraChgYBGVLs/jBY6s
	ppqMD/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcaL-0009Sy-0c; Tue, 03 Jan 2023 08:23:49 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcYh-0008wi-4A
	for linux-mediatek@lists.infradead.org; Tue, 03 Jan 2023 08:22:10 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 1so44645168lfz.4
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Jan 2023 00:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hnNplO8zsSj05CAnhZjssEtarwgdK7a3BUAmXeHqfTE=;
        b=IRDYFhgv7CWgApeZ9OhEzu4ziX6vYEoYanJOwxAVtNXXyq/6zS+qWU0v9JYWo+nTfr
         75SUTilDQ6Wappp/0y36aU6HUHsoldMMAZOoCVs0bccvE8mHrAOQHuKhfI2OI8VjT+09
         UU8jLYsLpZFuNwRey5xq1BPaD4oO9teX0QXKL95viaZ5J/EdMvJtY3X+lQMZB4tbEvGN
         /tRbizkhie2NJuQiN0F8URex/wWIwEaW+ujREEPAJu8xRf2wnNfu8nz62Yr7iXHXrzLL
         WwePuWhjeCaZvvfrBZH3flKA+v9TKZBDYwjyDQyhGYOqRV99y8Jyq0EJw3wNGjPhG68b
         WQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hnNplO8zsSj05CAnhZjssEtarwgdK7a3BUAmXeHqfTE=;
        b=0uEZpWOhWTxWdBqTneJAaTymIU4rKt+FT1+b3OXnygQc1jC6Xizvm74xRVrzfmh9cu
         2EMiLtDImoe5hMyZnKHl3EJgyEh/UVu3XTsNjpp3UDGKC5Oj2b0aJ6ynX5CvffMWMDLu
         l36lzlDxgmCXRjiW3j3LF2m5eLVek6WrGjC39mTY1hBg6j/tLMtllD2PuLeAiw+hdQPg
         dOYtQd68wJOXJ6fsVeUXqSyEb8F8y/o4Dbzkfi253N3BWeumI9ehNi5lGRjf4haUmUFw
         PBczi5V6UQ64H3S429FFQbnF4ameT0ej2+AxE+z3j9QHKfLpREkUi1Cb6VgueeO8Y1Ll
         XhHw==
X-Gm-Message-State: AFqh2krboBe2QAcBwthtgCnzOt6OH/9lWdnSbO3LuOS7gl+qAF9xQqdh
	LHISrE2HBgUkSGpyr3PhZAlWPw==
X-Google-Smtp-Source: AMrXdXvbZP6isWmvcJTEe2l329jkWLKnwxKfmHzK41+F7rk8tb5+8boVcvSBIznNrbeyntQ/Q+zNzQ==
X-Received: by 2002:ac2:490f:0:b0:4b6:eca8:f6ca with SMTP id n15-20020ac2490f000000b004b6eca8f6camr10992900lfi.67.1672734122520;
        Tue, 03 Jan 2023 00:22:02 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p23-20020a056512139700b004b577085688sm4757340lfa.82.2023.01.03.00.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 00:22:02 -0800 (PST)
Message-ID: <dccc7a0f-9eaf-24ca-e800-8ee1417e74f9@linaro.org>
Date: Tue, 3 Jan 2023 09:22:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 2/4] dt-bindings: vendor-prefixes: Add lincolntech
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
 <20230103064615.5311-3-a-bhatia1@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103064615.5311-3-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_002207_396421_2A9330A5 
X-CRM114-Status: UNSURE (   9.34  )
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
> Add document vendor prefix for Lincoln Technology Solutions
> (lincolntech).
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


