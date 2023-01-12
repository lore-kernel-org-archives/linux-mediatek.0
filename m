Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5DAC54EBC
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 09:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVQDEVhmqO4sgcOXdj4mcnu6JqTblyj60RYXipJ+fRY=; b=O9EirIKxPRUFc/qIV8BUuQCHF3
	c+qnqIXRTNoORitoBF7y4h7yY8uXhBse/8VvFqJHyRnqMGLLc9jwLzAXOw9JuwETRzhAtPkx8lJ6k
	m3pk6r7fFfuihCvc2JnJWpqUH+cEUbpobMXfMIGVLksonbDO7kmxHPdO46GJlEuQ6QAs9VBk0oMGX
	L45nfv7Bo7KqqXj7VDYFFMBsw5mn4WyL09s5/ijqeC/In6a1Fr28nRoQoLuwhSEYudHGE4zl17PMz
	f5XN2vmliz/vZHlcbcKJucSZiux3EwxaWzvG0YOapeMf3D0uvF8Q1Mmp9s/9aJieeq1GnJkTs518v
	5CccOChg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtUP-00EFEK-72; Thu, 12 Jan 2023 09:03:13 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtUM-00EFCN-DV
	for linux-mediatek@lists.infradead.org; Thu, 12 Jan 2023 09:03:11 +0000
Received: by mail-ej1-x629.google.com with SMTP id jo4so43134685ejb.7
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jan 2023 01:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gVQDEVhmqO4sgcOXdj4mcnu6JqTblyj60RYXipJ+fRY=;
        b=yRgKjWr9Nv0UFBLyj0uDXk928R3LCKNkJldBI8nbkDYuUhXAjiPCmrSj4OCZSMq4bZ
         UXZjppYpkTGDjv8o/1tYhkE8hDp5fYDOUR+DVmPLtCN7naGdTo1YjhWqXpsp+hLbfptb
         Cb9+hJkXDL/lSuCPTkO6ugHzIJleuTXVM8aIF5alsEbtvEiugts8ZXGtp/pAu42UjJZv
         +r6cAOdFx68r8B86PwoCYBwTrku479xxrmQdxtmYMtnMOvIkIZ7616PcGM4B7sN0Vvnc
         ioBtrdJAcgJyHQLVHO/13KwcM64NQs92JqY/AKmSbpu0PlnZbpr4lkCvsTHx5KATBoHa
         YL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVQDEVhmqO4sgcOXdj4mcnu6JqTblyj60RYXipJ+fRY=;
        b=jYTqvlnV6DmjLVZvQV2L5yvq8asMMFHFh+/H9SRJFbsHeK1/jo7zJQUCuMR9lfoLJT
         U3OvP77fxHI67I3YLds3VHNPtGBb+k0sMpDUF6upPg1vjlHYRcgwQG74lXc8AejfUGwe
         XK6XDQ86PuMcTij8q2TZt21to7t08d/0Ifq2t3/btBHbnu5ylRG8BnsoqVqoJlKMi9xK
         dTmyoWO/+1ZMkUnYflWDgLi7WB79YnqQMx3ZnnIPCE+OYrQiyEs/Fwx3n9JJzryZiOZR
         kKzJlAjQGIkZIbjLnIudD5bFGbpiHosJhp1zFudFnigz5I0NIXMHOtWpin68iKiJGXuK
         3ZDw==
X-Gm-Message-State: AFqh2krPnJ9ctDOssZdAxM5pjWx0vN6uFaJ/hvwZA5EdhvRMBlSFEmUm
	Lf2d3Hn8oPtCdgQm7zD1exIgPg==
X-Google-Smtp-Source: AMrXdXtXL/qJQ+0tabMkwVX+Mi6xriBlWoHWdL9LJKoT7hxFrLQ1toZowaBk1Vanz5nmWRIlNt0DOQ==
X-Received: by 2002:a17:906:3ec8:b0:846:cdd9:d23 with SMTP id d8-20020a1709063ec800b00846cdd90d23mr61180807ejj.19.1673514189146;
        Thu, 12 Jan 2023 01:03:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v19-20020a509553000000b0046cbcc86bdesm7065250eda.7.2023.01.12.01.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:03:08 -0800 (PST)
Message-ID: <e1f9b552-cdcb-11fd-c90b-4e9aef2124c4@linaro.org>
Date: Thu, 12 Jan 2023 10:03:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/6] dt-bindings: pinctrl: rt305x: add proper function
 muxing binding
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 erkin.bozoglu@xeront.com
References: <20221231160849.40544-1-arinc.unal@arinc9.com>
 <20221231160849.40544-6-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231160849.40544-6-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_010310_493431_2E0A4AAF 
X-CRM114-Status: UNSURE (   9.68  )
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

On 31/12/2022 17:08, Arınç ÜNAL wrote:
> Not every function can be muxed to a group. Add proper binding which
> documents which function can be muxed to a group or set of groups.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../pinctrl/ralink,rt305x-pinctrl.yaml        | 236 ++++++++++++++++--
>  1 file changed, 211 insertions(+), 25 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


