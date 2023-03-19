Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F04C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 12:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=; b=V4TRmNTes8NlnElqRGjqkyS4JI
	PmRsKcxBQAy5BOz3vT4pFiEsxQATj6lT3Dkt+4pV0gB6pdKm3T1W1EUVmS8gLcuSGN1ve57VrNmu1
	LVuRi4TF6EhilJUbcQALBs+FbhNvLf+6emsQU/l6XDeHOErnMtATC4ANoL8s3FP6rDvue8mI8g2Ax
	pXlnwzCt/ODReR0ZyqhHGReH79zZeMEN8AzfMCP+hpfXbnVu4f6ERn7WbFNp66Cb1hYJfmiEpG7LC
	JCXaeQ73zcR9PalhsHjm93rJq3mWwyBAsVkZENE3YTgyQip1v6b4b4nbDhBxS4zKlXWh/98kWXLpM
	L1dMljow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdrsz-006eA3-2Z;
	Sun, 19 Mar 2023 12:11:41 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdrsw-006e6w-26
	for linux-mediatek@lists.infradead.org;
	Sun, 19 Mar 2023 12:11:39 +0000
Received: by mail-ed1-x52a.google.com with SMTP id x3so36746743edb.10
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Mar 2023 05:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
        b=D1fP3GN2Ho75ugMAWO87ldGgGppe72Z3Y/fiWx4nspzwK7rloaOBoF9R19b0JbiRD3
         /mLXqx0QXb4f0L0ilB3j1w+e9Fwq4+LAGzNO+pIUKuu81K+Dhs2nyPPhOdR1hF6bDzbu
         0y3KFtdlTTRo3LySMTaY9gOhQSMrBFk88A8n+//C69MZejED+xn55zfOI7TYqDszOPc+
         fKWW/risjXSXRSuUrm5fQoJv/1hToGx7tQSgd3glFjr0Y54XW8bJZTY/vYLNslJ4g9T4
         gGptc50sPXOMaTIvYxS6fPpQP0vMqlYdWsQdm9P5lE+f6mWTqVQd8o0LR1x8SVnpFN1o
         NnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
        b=WgIrPEtBtTv4hCqeG+83RsiZnswYzJKVOmh+726DWmtifp/+6rytOT6WVY/niuGcjk
         ZWPh+n/weWZcp2AoWRWqkF8RZxLQuvq0wjdCNV79Acslst5A2Ar1vaXlZrdsrDumLyb1
         LnoXbHZXLe3qkv44SYnHQSqALkBxplEmiDoC9uxYxIClcm+pUzpC8lkY1+UkgfX5UIu3
         NbIVboNzgDuxWs4RY+KXc/8SNP50c/sP0lkilR1EIZABoRGjnGQjMeU44zY39IGf1hym
         byqod818XqZLUnBwth4V29xa4IPZa0/1r3MtMdZyLG2RIONXLR+GdzjwGWNucKfRxJqc
         336A==
X-Gm-Message-State: AO0yUKUewYYJ+TjrmbMhwtEWhbPb5JUT63WQrOKkkH2b55qLWOQcX20g
	XujwmNhisKdk6uOSB80byqq6tg==
X-Google-Smtp-Source: AK7set8iy8PHLbwswKclQFdAmwnEMv+GMXgczERgugb4jIY36ndBXldESO9YpLHBZGsBIL348OtAog==
X-Received: by 2002:a17:906:35d6:b0:932:be78:a728 with SMTP id p22-20020a17090635d600b00932be78a728mr5583291ejb.68.1679227896102;
        Sun, 19 Mar 2023 05:11:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id ja21-20020a170907989500b0093338259b2bsm1635711ejc.207.2023.03.19.05.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:11:35 -0700 (PDT)
Message-ID: <652a5f5e-6f01-4e5b-d1e3-4161b58d5ae5@linaro.org>
Date: Sun, 19 Mar 2023 13:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] regulator: dt-bindings: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Robert Marko <robert.marko@sartura.hr>, Luka Perkov <luka.perkov@sartura.hr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
References: <20230317233616.3968003-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233616.3968003-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_051138_688081_7A5C9CAC 
X-CRM114-Status: UNSURE (   9.18  )
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

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


