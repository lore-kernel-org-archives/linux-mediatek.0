Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44D2CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Nov 2025 16:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rq+cWEKtg2ZUTyxd/Vz8Kc9fcT1gEAUEGw1yp5hm07k=; b=QWD3V2pWe5rPEnJSAqTOexJYre
	O1fUBr6WOJpCQHvppT9eJOc7UFl6TXbTQw2ImvUWOPadPEU/MBtQZhUCV0uy0NaQsaBKEVmJVjJns
	aNIhbBUqYrSAmIrw4Xjf8WBG64T0x0/bInXDi6gRXCgTWE8n0A4AjI4aWQur1Es+AxIUnWJdGgJp7
	WUfvH6ywmlIz3bknMRj/+PHdfMdpRBHdYvdNVDi3DgdInRtzwfnFO+kF4xrZXGpcZ7V9npwib+1q2
	W+qgnfkNyzpYxoKNm1wlPr/a2eHZiQyIH9kUGgounOc3bHIz6YRmPqmbRYDB2Q3fD/b1hQ7gSg+Pz
	Cg0sg8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHP8y-000000004ld-1ISx;
	Fri, 07 Nov 2025 16:16:56 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHP8w-000000004kv-0Uis
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Nov 2025 16:16:55 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-429b72691b4so753840f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Nov 2025 08:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762532212; x=1763137012; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rq+cWEKtg2ZUTyxd/Vz8Kc9fcT1gEAUEGw1yp5hm07k=;
        b=NF7vUw9/7+qfOOVFz4D5I51zAdPYDCsnOLTzzgH55Y6WcY5/z31LdIj3QtvUhaHtap
         FCyOIqZhO72eehFV0qBMrIRVozAVsqdpyNCjyYa+H0rY7NrNxkKzCj40kSQZQUGGMuqu
         jYOtjmJuTgTPZmocS2LtT+xNPZQN4uCuNeGE0GHqnL+F3wKIVyyls2r2x7ur4QUnDcVm
         xd7OmvqoTuLxnY5EYiY8V1ssO522fMJ6GthKdGAkT4qWzOvL4ZxYRIDVTXy2U6UfQlBx
         3nDLsWmeL/xme4vYoM/cBBfIO8KbJ3mL8jp/PZZcRNtnp4a/LaSCXjH0sdPlXxGR+QfU
         OpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762532212; x=1763137012;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rq+cWEKtg2ZUTyxd/Vz8Kc9fcT1gEAUEGw1yp5hm07k=;
        b=ZOczO7mACD2QJhGge4T4vS0bD9L3WzoMh7kHTGPJ2EzUkj/YDTGSes2P8umWyRR/lF
         bmy9eH4Fz3VZhJNAiTbgQC6fNpIRERzLX1/G0XHH4BE+srnArHIWhokQx1eI5Wl0Ch4r
         PHMKNjtMhfNkqi4MI+Xg5DFIhoBMRJAHWu8P0rFyb+QiyNGri4Iyu4NAEJRk9EBVKEmU
         mpdyDBznp/aaWFDyGEMY5iyDmKQUUU9xxFUcMnFuOZIQt/HUCk/4EppqiwDcNXO5oHYS
         L1SsVZLf/2arC/wwCLvwUMOmFmG3NbPV3JWfUYrqOWRzI9QxTcFCDXWdrGcEP8sFhCrg
         z9pw==
X-Forwarded-Encrypted: i=1; AJvYcCV4t5YpWiG+6WG+peu/ZAEPQsnO1fX2qqegUn68u78gpBImwm6u2QM+X3+/BJ4bGOEV/vqoVzuzNqFgvZF8zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfSRZ0bl/LnR3818+VVu4RJmsu+icBMBUyCLBHjLyOzJISCK5c
	V2zapLWrJ5r66E6oLj4WeECxAs3Rv4StCWB2nGDb55r8A04Jffu6e2PH
X-Gm-Gg: ASbGncvpvneiwBs+1TySHE+pHHlkpf0boE38JzfTOmDh0GmggWelzkmBsp1TLfzad1r
	m9De1lHriYyzd3zVvFjJJr7pEkDYbQR/vPMAx2fWr/29YOP93Mkj9ZsOm2by8fsNwxuYMm7FTgJ
	jbdOI1fOP9aEROy/8+nGfksxFgO3Mww/HbVQ4iWoIlpC1SCwKdjfqTuRcOU88pPlhawkvPgvgrt
	79CEjuREKshaYxMb4GAf5mo6ZbeYVznrXPWufmRn579WYEjwJJS22yfopegpVgS1HszkcZR2wM7
	1EaYYAgswsFTF7o79z5ED8Qka/yJYJP75VgziaMo1LaADWUgMAcTMbQDqEhPe2b+cg60cZM/RFu
	xUPCRvtSMq3lOKgRiU620byNbIWtmzP7ZGJHnW9dQA5C/GnRFyTw4qWzgxEiDKA/heVge1/5i+O
	2LpHemlkP8F6g4fza0HLofZ4D2ef27
X-Google-Smtp-Source: AGHT+IGBls4w5DXj4dsI+iVzj/lD1T2JS8LC5CnrQ6tP++E+okDJx9McJEWsKb0hTWxZy1/eytT3yA==
X-Received: by 2002:a05:6000:26c9:b0:429:cf03:8b1a with SMTP id ffacd0b85a97d-42ae5ae9995mr3350125f8f.45.1762532212275;
        Fri, 07 Nov 2025 08:16:52 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm6344445f8f.20.2025.11.07.08.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:16:51 -0800 (PST)
Message-ID: <690e1b73.df0a0220.312af7.18e3@mx.google.com>
X-Google-Original-Message-ID: <aQ4bcJDWhgQINJry@Ansuel-XPS.>
Date: Fri, 7 Nov 2025 17:16:48 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 0/4] arm64: Add AN7583 DTSI
References: <20250929114917.5501-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929114917.5501-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_081654_203924_89B7B6FA 
X-CRM114-Status: GOOD (  14.93  )
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

On Mon, Sep 29, 2025 at 01:49:11PM +0200, Christian Marangi wrote:
> Simple series to add initial AN7583 DTSI. More node will be
> included as they will be supported.
> 
> Changes v4:
> - Add review tag
> - Fix alphabetical order in Makefile
> - Move PSCI node after CPU node
> Changes v3:
> - Fix typo EN7583 -> AN7583
> - Add specific compatible for watchdog and crypto engine
> Changes v2:
> - Fix DTB BOT warning (fix crypto compatible and OPP node name)
> 
> Christian Marangi (4):
>   dt-bindings: crypto: Add support for Airoha AN7583 SoC
>   dt-bindings: watchdog: airoha: Add support for Airoha AN7583 SoC
>   dt-bindings: arm64: dts: airoha: Add AN7583 compatible
>   arm64: dts: Add Airoha AN7583 SoC and AN7583 Evaluation Board
> 
>  .../devicetree/bindings/arm/airoha.yaml       |   4 +
>  .../crypto/inside-secure,safexcel-eip93.yaml  |   4 +
>  .../bindings/watchdog/airoha,en7581-wdt.yaml  |   6 +-
>  arch/arm64/boot/dts/airoha/Makefile           |   1 +
>  arch/arm64/boot/dts/airoha/an7583-evb.dts     |  22 ++
>  arch/arm64/boot/dts/airoha/an7583.dtsi        | 283 ++++++++++++++++++
>  6 files changed, 319 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/airoha/an7583-evb.dts
>  create mode 100644 arch/arm64/boot/dts/airoha/an7583.dtsi
> 

Any chance this can be picked? All the patch got a review tag I assume.

-- 
	Ansuel

