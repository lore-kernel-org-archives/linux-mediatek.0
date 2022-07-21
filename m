Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A965C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 14:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMWEsxHpInJ1xz9Gs6AtvSkVM4GO31cBlC1zLGqoQzg=; b=fw0r46zxC2mJHDPpylFdDJ5lQN
	ULFB1ljcnwnd7pUAMpa7f7ik+yJAxHMLv5kXZgDKNdPvM1DdZ4BMFiHMhqRo/wVA8tVLM6PhsIWvj
	Q4gH3vimsz5ay0yztHxBCyrv4g8BVFMx4cPT9KqPG70BRRM57SjXeDHv3Pt+SpnP1Yf/OM/NPqMh0
	CSVyESoH8HEJjosggYvVCv0O3U7/oRsdMxTaWmKZP5UH9mFsLMktFUauF+D7jluEwdL3bCssfjQJn
	nfWQHlIrUCVVfFuXGB4S10uNcxqw3R+m280rMwScR5E9W3QeHgSIa4l7JGdseYVuy6W820o10bQKN
	fUQjExgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXQB-008E3H-3W; Thu, 21 Jul 2022 14:44:59 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXPx-008DkU-BN
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 14:44:46 +0000
Received: by mail-lj1-x235.google.com with SMTP id o12so2105061ljc.3
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Jul 2022 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FMWEsxHpInJ1xz9Gs6AtvSkVM4GO31cBlC1zLGqoQzg=;
        b=tjJLv/UGjfvQJpvCQ33RuE6X0s3x88e32Phfvp0hTB5CvyJTNfViQdQMJZjgJr95RJ
         M1DhIFGCYV8S4RKnxt5Jv7SvnIEZJmZNYgPrSJSYnvCJtipTTNkSCqIzV3Bp/GXFc7bN
         2bh1G4BvwlmBGppJk+Lew6rYmlR/nktEiX7S2AFfFdkM75T2xdwesadxT4Z2oXPm/XNh
         asX65DPb616tMln9yU1TlNSpJ/csUBQleESxdeop7PVjkzFmMBtFgEVnXCWm+EL2C13n
         TotNrFrbcYM19moIdyMenDbbNlC4VVh+lw07G+x/SN4yUze6MpNfqae1wt4ccQ4/KUOU
         WgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FMWEsxHpInJ1xz9Gs6AtvSkVM4GO31cBlC1zLGqoQzg=;
        b=YwVbGUYf1bw14H5yIOebGJH1oVjajtN5naWbldckw0/SwOJSnZljEN+YjetSmdYQjG
         ZAVDaEcDBjnBUaHYjwgd5C5uC+nCXFHuk5BrEp/CzM2SS1FMEtLRkgY2uiJ1b+9hgLul
         jOhPxD7hLpXjVdcO7Lm4Gdk8FNadUsRLHGIf4Z5I2jwXH//H835IAMBhIcFL+QXVBVcg
         OGZa/RygfpVs8aZyeIUDdKbtKPGeRPwO+UM5r7YcnIbCMKBrJFPcY8Uy4qFmvh4uX/cx
         fSW0/24S7KsmFYSoGHZKbKSDGc3uxc1h5ohGTc0wiTrzEdM9+TZoJpAEIrQGn7Nix7RL
         D7gg==
X-Gm-Message-State: AJIora+V5VD6xruMlsloJGxTN9wsPpwzDy5Tx0TpQgumE67P8SjIira/
	/01xBWtxSGM/KbwJ+109Vn5O7w==
X-Google-Smtp-Source: AGRyM1syJRz5lw19BNkewuiPYEzwKNI6nibJa7ejYlb/nifC90WR3tPIgHeEmuSlf60Y8XpXN5pc5A==
X-Received: by 2002:a2e:bd89:0:b0:25a:86c8:93ca with SMTP id o9-20020a2ebd89000000b0025a86c893camr18419288ljq.419.1658414682866;
        Thu, 21 Jul 2022 07:44:42 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id i8-20020ac25228000000b0047fa02cd96csm479673lfl.162.2022.07.21.07.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 07:44:42 -0700 (PDT)
Message-ID: <35639a59-4a3d-5aa7-946c-22fbd2f25e89@linaro.org>
Date: Thu, 21 Jul 2022 16:44:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: add pinctrl definition for
 mt8188
Content-Language: en-US
To: "hui.liu" <hui.liu@mediatek.com>, linus.walleij@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: johnson.wang@mediatek.com, zhiyong.tao@mediatek.com,
 sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220718113813.23787-1-hui.liu@mediatek.com>
 <20220718113813.23787-2-hui.liu@mediatek.com>
 <b28dcbe5-d15f-1c4f-9b3d-650d5c39de6b@linaro.org>
 <08a7209fe198839093b3ef729fc97c1a950e1fbc.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <08a7209fe198839093b3ef729fc97c1a950e1fbc.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_074445_436228_B67EA47F 
X-CRM114-Status: UNSURE (   6.25  )
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

On 21/07/2022 15:46, hui.liu wrote:
>>> +
>>> +          bias-disable: true
>>> +
>>> +          output-high: true
>>> +
>>> +          output-low: true
>>> +
>>> +          input-enable: true
>>> +
>>> +          input-disable: true
>>> +
>>> +          input-schmitt-enable: true
>>> +
>>> +          input-schmitt-disable: true
>>> +
>>> +        required:
>>> +          - pinmux
>>> +
>>> +allOf:
>>> +  - $ref: "pinctrl.yaml#"
>>
>> No need for quotes, especially that you use different here " than in
>> other places '.

You quoted my entire email, where is the question?


Best regards,
Krzysztof

