Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7A5C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 20:24:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1BA8221E3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 20:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1BA8221E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=huiHV3/UFzpvs2Dw7dtQytVtPmb2oq5eTh2KcR4L59k=; b=RB7WHnuHZMq5B1GznwhUeqel1
	l6owoyUAPIJovF/pqiesKx1XApYoJSNQ/INWzKXl/6o9JoSKOyKZS+oTWTb3YibwxHZuNG9tsuCbU
	kUu5aLQgReXWl9HbJmdgKAZXQ5vmyiXqgXRPcexy9dcuQ77xvuCiMWYdfyfNfMk2AncAeoDjAxYwa
	ouPi5xRT4+kHNCOp4AqLxgkpYq/HYPaJeMrrO66p6/H+EP/qk+R6ikT2Ltrevs6ccWU9Z3My0ponN
	KYmvjx10BlVcjdkDhG/B03h617Kg9/xsstisy9phwyPOJYO16FPodroCj6Q4067efLj0OT8BcEaZj
	mHhq88lKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkv9h-00059q-QD; Thu, 03 Dec 2020 20:24:46 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkv9e-00059D-PL; Thu, 03 Dec 2020 20:24:43 +0000
Received: by mail-ej1-x644.google.com with SMTP id g20so5445778ejb.1;
 Thu, 03 Dec 2020 12:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WAMwGQJofZcxAkzkOGcHcKLf+ucZS6CWJ3WzoBEMmso=;
 b=VZr8zH5PzjZQU/7uboMkLfdntAYqEu8ZQXD7jgTo9VKJf9m3ehMTgwQG6ti5V4foGK
 ct1pHwR/cs8ocSH5tLC9y1DAvgDkUQmewpV8yX5ncBNSXoVbgR9/BsjelfhP/6rPjNtB
 S1YjFYe2fN6SUEIYc51QzvDPo4zSsD4DJWcleL+bhezem0soFIe1LnAz8baoEHH75hrD
 a2cPZ/jB/Gbp0uS+YMr4FliL2OQUo13gOs/5+XHRUcR30tWVTlXRgGzMHp1BaUI1plER
 qiHBoMTWlca2eK5GhEOB6yJVQsS0WNoKuX26vEakHxcEnVEsvSYTIcXnOhSj/Ds9jd/u
 EmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WAMwGQJofZcxAkzkOGcHcKLf+ucZS6CWJ3WzoBEMmso=;
 b=DVe047n0XT1cWLkS4t94MPc+FRPBrOkk+H6n9IpXVjZm40vFr9RLMFzw1l5xtef0gx
 Ec84SI9Eui+lsq48Lvp1ZdT73B4xu91OuB93pORPqp2C+RQyRmdaSxuMiqDX8gRW7ZvM
 eash9j8+LqcsshDF7gpuG/QpmTgC5/sO/vSZCAx7e84asO8a81c754VQXIr5EMh21im4
 91ZwFPhcJODB0zLRGmYcWD+SaP/bIVfl8Ez3lLF7FozoJdTHSb5zSIF7vgdNrjRqniEc
 w0B8zmxATdW0mQ2VcXFFD/96KbXNhMYRTs7uV3aCtWbqZBjB25AO7f3REIYTjQKJ6Rsv
 m1IQ==
X-Gm-Message-State: AOAM533gblXduRkcJTNvmxBu5SIauJ9eMc2djiTHgh+Kwva19Xf/VVY7
 Zltp4OS+q5of66DkziUvLNw=
X-Google-Smtp-Source: ABdhPJxozj0QaM9vnKJhVYPNhxjS2n2ZJ8JlOXZYHa24nHLU5Itc/+q+hxgVZXNeE5OygOJ7jtB8QQ==
X-Received: by 2002:a17:906:1cd4:: with SMTP id
 i20mr4170880ejh.415.1607027081299; 
 Thu, 03 Dec 2020 12:24:41 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:2969:dca1:ffae:a9ff?
 ([2a01:110f:b59:fd00:2969:dca1:ffae:a9ff])
 by smtp.gmail.com with ESMTPSA id w3sm1942365edt.84.2020.12.03.12.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 12:24:40 -0800 (PST)
Subject: Re: [PATCH v11 4/5] dt-bindings: leds: Add bindings for MT6360 LED
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606906011-25633-5-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <f9f3e471-8fbd-e8f9-31e9-2631703eda67@gmail.com>
Date: Thu, 3 Dec 2020 21:24:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606906011-25633-5-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_152442_906290_21703C5E 
X-CRM114-Status: GOOD (  15.94  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Gene,

Thanks for the update.

On 12/2/20 11:46 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   .../devicetree/bindings/leds/leds-mt6360.yaml      | 159 +++++++++++++++++++++
>   1 file changed, 159 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> new file mode 100644
> index 0000000..73c67b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
