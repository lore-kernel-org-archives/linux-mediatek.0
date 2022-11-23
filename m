Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A03C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 08:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Q69gDnyivpymFGK0Sd4Z0oFYEil0+SQlh0vDf2ji4M=; b=BM1bvSpbgVaixh4cWRFz1SEfpe
	/371/lUXkvLChBAQMx4AX/dheLdcH2zxOLh5X5hxDg7mnBuevBDz3kPeraputGoumv9tPEjzc5S2L
	qy/FXF0bWJM8M6/15Ctp55nL9WAXbV9rvKMyikXn7QePpoZfONEHvet49uNyXgGJELKSEF5u5qwR2
	+Z6WtJRCj2lFcvdhNFSn5trnXQ5AcXf4JlFGtr14jI+iYBWmIZv1A+cMaCd1cO2ti0HTM+KU2GQ0U
	q895kruqKy4MXMa0T/eD+LkpdKnsicf20RbRivsl3qfw/QzVowcwdEUSXzjUMva+bPk5gMyMP394p
	tOxGdjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxkxx-00FT2P-LQ; Wed, 23 Nov 2022 08:18:45 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxkxm-00FSyN-OZ
	for linux-mediatek@lists.infradead.org; Wed, 23 Nov 2022 08:18:35 +0000
Received: by mail-lj1-x22c.google.com with SMTP id d20so20495068ljc.12
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Nov 2022 00:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Q69gDnyivpymFGK0Sd4Z0oFYEil0+SQlh0vDf2ji4M=;
        b=XtMrpoWyvn3cnzL27g22jgXDVQ04ezHV5Jv6xIZYgEY/2N9Hsw9aXIPZbUtLkiqLRj
         UU6tSufpFQsR+FZiAQKrVH8qGyOg8UuGWz0MPKjRGz6HuzgvVoc+txyBkscWSh+DG6S7
         KP1wiUjOxcgj6ud9wpEF/ekxThrIiLyJZ8gLhWGSFdDE0kPDT6Nlcp/bJwWjDxrNwxQR
         YmrizrHQR+hNOa82phbI1MXa5PTx90gqoArGByVIvXEb4PuMHKed8hKtGVzRNAa0H3um
         v3KeIT070EcWVACvPooH8KEF468Wn5sO8WnoroLm1B29uEF7gWYWJyI3QL4XJZK99O0G
         e0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Q69gDnyivpymFGK0Sd4Z0oFYEil0+SQlh0vDf2ji4M=;
        b=tVFFzeIstxmvRmOX3vFaUMOvsTUZqFjG81eeaSda+qulDLN8r9vif+R0w+cklJa6Uw
         DXHKErijQt9yJp1iuC8gy0xv0ZPCUHzpiiNM5NWSAHR0u/geeNN+IzeEPQiMh6hYAK7C
         w0B5est2BJR5WxnFZpfRMp9xYvv2yO0vBqooiChetutULCh+vfDOtlchco0bb8j+IAeE
         1nUpNhzoIYC54qsrwYc4Jx6GklncR7/p3sPeVQS9JRp1C77doJqwzJoPvzdfEZqFJk2R
         jAjBkpYNPKd2MG+ahdOZ99Ft3wzitAcdScFFd4hlMwjaTySp4U7LjkvGH2XUucG6Maxx
         zvew==
X-Gm-Message-State: ANoB5pl5xEzvTe+h8nc4tHb48SN2rC2J3u76CPIz0LTeF62JYhEuJlbf
	jJOUR54aLCDTenYv2VnT57p/EQ==
X-Google-Smtp-Source: AA0mqf4Cv6SWGcVth3Vs6EVyMwqJvulw8RX9FsThcyK0W0bvw/KrzybZNWjmXpwJ855YvfP9H0sPwQ==
X-Received: by 2002:a2e:824e:0:b0:26f:be8e:5298 with SMTP id j14-20020a2e824e000000b0026fbe8e5298mr4042117ljh.418.1669191511108;
        Wed, 23 Nov 2022 00:18:31 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512202600b0047f7722b73csm2784810lfs.142.2022.11.23.00.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 00:18:30 -0800 (PST)
Message-ID: <3e7d045d-7416-d26f-1578-be83a82cc124@linaro.org>
Date: Wed, 23 Nov 2022 09:18:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 4/7] dt-bindings: pinctrl: st,stm32: Deprecate
 pins-are-numbered
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 khilman@baylibre.com
References: <20221122010753.3126828-1-bero@baylibre.com>
 <20221122010753.3126828-5-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122010753.3126828-5-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_001834_812676_1B29074E 
X-CRM114-Status: UNSURE (   6.12  )
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

On 22/11/2022 02:07, Bernhard Rosenkränzer wrote:
> Deprecate the pins-are-numbered property
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


