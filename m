Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3C2EB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 06:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87JKbcUVRlq+DNPw4nB+PH/NAlnJ1RS5NBqs41gMEOU=; b=lB1Yx4eFsALzGT8Rsq35GTlUoP
	AouusnAvOMI75j5N6vz9sqUZ0fJbEMPP8g+mX2su8N5jWxFX/bwMWbWRRvWbVuYlNkcRGhmCW5aHB
	Ca+DMGCC66ghU0+7GMehraJPlGbsg1fxVrFxgpF/KQtBENywMxjewbQJefRpMUllqMzg31EtD8rTY
	jdd8NW2o4g8DdCl8Qhpf8wmqZe94a3i3XhTNKDwczOrpT8JM4ZaGYh/ZEmQivlR9avVJSSZYKcI6t
	fOS3lTgxJpvLn5GlAJqdEp3MEAlu7GD0fwy6JUy3I2H2mWjtvWBgT2MfhG11lsPINq57kZglbEhqT
	CP47EO5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ6XQ-00DpSZ-1p;
	Tue, 11 Jul 2023 06:07:52 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ6XN-00DpR7-1z
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Jul 2023 06:07:51 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b703cbfaf5so83336661fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 23:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689055667; x=1691647667;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=87JKbcUVRlq+DNPw4nB+PH/NAlnJ1RS5NBqs41gMEOU=;
        b=hDyquc9TF089XR4hezU48avSlN536ZzYIGYagcXMkHzFtDub0l9RyYcfFRHc+NxyM6
         5D+j5tlFni5gn4Y2MJZkY3PoSwMtih+IATUuQkWmkzTdFP0BfrlZtSpXA24jaKNQLmXB
         szWHNBNGW28L4XwWj5Ir0guBDFc8kKQIWQhN8QTb7jE1drN3czpXDk7GVovoa+TRj5VB
         0NZbQXIdq8SOTHl+8h+0ZAZijSAaqQGtDLUGdgFtTqitWuqAM2I8z4wqWiTKCEvNLQZI
         Xi095NLulQqjZ76wW/lUKDFDmaiZCEYwISsZQQjTEUbUeKBjrbCTLfgC6uQ6pB/TvogJ
         7Jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689055667; x=1691647667;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=87JKbcUVRlq+DNPw4nB+PH/NAlnJ1RS5NBqs41gMEOU=;
        b=BoO4KHJEnjaFTxXRPRJlrPKfJldab8x8YdECPDW7ODR+KGshzJZJGbTPu/9e84p/WD
         XhxYK7F19+EkhIr5oZkSOqxYbXHhB8d+aWPx6tv4po6jcogu4iRABVndB0UZ/ZLiffHa
         VROQwWJG+kqvliCFFlDd6A8k0IF8qNCuCBrpDxz/UTo3cMzY5lNGjvYCAnrbhjul5ody
         D0IVLmYgmKhZkxVmbNgCKBRK8H3BeOMdwlnfMMpVoXX8xrfTEpg6KvUwpPemkcg+VFqE
         j2Fr233GXc39NUVijXGnVDF4HlDyzEsUtzJGKip+NbNirZfnQ7Y+PkhXaBzSPKLi8m78
         Ci2g==
X-Gm-Message-State: ABy/qLYAkw6RwYcK80QHMf3AnHpsrwY6nIoURHjlgF7a5C6VSJdqqN8O
	XG5MOi2h6HeDEUijsGWhDXzkhg==
X-Google-Smtp-Source: APBJJlGxS08q6S0u3P36CbSj4k2nCgfEdYovOwC7kb/zhvIVVpsqy8GgSc/0CcDKHxo8YOxQLLirMg==
X-Received: by 2002:a2e:7a16:0:b0:2b6:ee6d:b647 with SMTP id v22-20020a2e7a16000000b002b6ee6db647mr12391356ljc.28.1689055666942;
        Mon, 10 Jul 2023 23:07:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906261a00b00992f8110a2bsm668980ejc.150.2023.07.10.23.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 23:07:46 -0700 (PDT)
Message-ID: <84847777-bad0-0aff-5279-9b80fd95c2d5@linaro.org>
Date: Tue, 11 Jul 2023 08:07:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/4] dt-bindings: soc: mediatek: pwrap: Add compatible
 for MT8188
Content-Language: en-US
To: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?=
 <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230711023929.14381-1-jason-ch.chen@mediatek.com>
 <20230711023929.14381-4-jason-ch.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230711023929.14381-4-jason-ch.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_230749_650379_9CD64015 
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

On 11/07/2023 04:39, Jason-ch Chen wrote:
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
> 
> Add MT8188 PMIC Wrapper compatible to binding document.
> 
> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml     | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> index a06ac2177444..c2f22e7dbcfb 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> @@ -50,6 +50,11 @@ properties:
>                - mediatek,mt8186-pwrap
>                - mediatek,mt8195-pwrap
>            - const: syscon
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-pwrap

Why do you add duplicated entries? Test your DTS before sending patches.


Best regards,
Krzysztof


