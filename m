Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009B6E9A057
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 18:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IWO5m5WHHqRoC8lS5ugD/MQKoBV1QdUD735Fcl1Kkk=; b=PqSCQ2OJ/p+/lLn8ND8/lh05MP
	iFLOmLgqrgAA5WnA+XSeXnjdZUmRxq7/JCQL3VPAjxzG5C3iaLUV2H9fkv+rObZtPVPsmA45IEc0V
	mZTWtXC/4ArDslcKO3XaOB8FBdP7MGsfMOwCVF1pu5SySHtBkYQRFMmyK8c9iD3crwrTRNmoMGfQV
	Z4ztJJZ3ZIIRi4ZRhhBkDYl8j06U6AC/xYrvK9EQGauaIq57TtJVJ36pLSuYl41xakq5P0PK9PQ+R
	8tWDcq8FjwxKfKoh6yYBvXUpEDz+9RBaZO87gZVCOCrgcJax6FAieK95isqfC5J8pDa4JX1HfXica
	75xpkofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8x8-0000000BnNH-27to;
	Thu, 19 Feb 2026 18:40:42 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8x3-0000000BnLm-3Dsk
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 18:40:40 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-413acc82f38so475169fac.0
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Feb 2026 10:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771526436; x=1772131236; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IWO5m5WHHqRoC8lS5ugD/MQKoBV1QdUD735Fcl1Kkk=;
        b=byzKzpH0jBeVbTId1pSBu8fnLmaImUule1DNoaOnGoyaORwA8BsD8x48a/j4QAaNpo
         TzoXWefNF422G91U0qLqMu+ShGPOXWKsnLaPISzgE2CdIIXPArqjmUo6xYHmPpspUkwN
         nb739aYPCo/cPnSseceq1r8wCv/y5qws2s5UwcHkuPbv80VjsYM7XcR4kVJXTl4b0WuY
         5rc+MpwHGHivvodh8F3h3e34N3knzoHXlq82AU9FnSLV/2AhGeq07sA9RJN2jgQXUabC
         1VSJjH9sk+YgoIdGvxSoVYlFpLzlWv5zvzNEbSOXplRFhBRR0buW6e6VBmB+5fpJOkk6
         b1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771526436; x=1772131236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9IWO5m5WHHqRoC8lS5ugD/MQKoBV1QdUD735Fcl1Kkk=;
        b=P7hwTSEUT8n+1wV8yZ0OPK/V4zZGiz919DAhqnJJERNbQIx273RiGBKUtWFCIKcITG
         7h+H2WOkfCWLonTtq0uPyW1hY4FVdd4jcuk1W9SW+9799/+W7+P6j7u6Aa7XFbS5GthV
         TkQdI4ZnHzD4hl7AAfTP2gTm481sigxaG/Oi78OSx8XNp6/LQhp0ne3ifiDwvJYTWq8c
         S+DwROhIMnFYvJ+6lA95uBc2aTvODhPAGVOoVt02BTlzgyPGn1nx9M6hCYORHDGumkbC
         KfoX/f0jQhmCyNG9NCul4Bu5Gv2Zy3DXo7i/U+NpNDj3U2xTCO5e8eb1odZiA1pt8fkt
         V3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfPqIz0ZGhyo3mPj/osslsUaith5Hp2A+NcLFFrjlLCX3FqF4Phi7phMxPbFWlp7N+x8hGka/rkrwfLSmyrw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw/jJHR+A1DUQSGTthF9a6DCiniXFjg48xpIikyHtjCKWHFZp4
	lCFLrOUqgqHLBlKwK+S2ICFmAnCtX3SansRZ9k9RVTS38698R34FwmrUj3vufn38yZ4=
X-Gm-Gg: AZuq6aJEW6fNFpO29jT5DXmNNGE0TYwPNPf+kZn/06Bt3/+0uClK5RMfRDF+o1mfVrI
	bveEyCUmTseKRFkroS+xjAD3owhETYjHe9DMAN0aIxs1L5wyN+MKcJG6zgtH35fI2kfWmPEqsVz
	UNpFezqxD9NL5EFLvgEMJ/WyzPDcAVRfTTi5yDaBgYzeuvLkY+eyLr2bXS3tILCkj2JWQhqIfjo
	iuq2kzSkQJnrWKbzSEup6oeTgP5/gnpnFlZf4OaJ687X7KRxhyF/Wb1Dt0kRDUU7DMfVzh7XW/u
	+tV6YxWXI698tiDeOXKj54tA8I9rDX+5PvpvhQxwT3zD2/ar2MZm3dFUYXziHVfd0sug30WxeC+
	vmNxcXs4HKMXYTCkeMndmZHqGLtuktpyqL4Q4DCsW2sU1PawUaNYTB/bbaFIHkUAS1wsPnVpu0G
	X64+p68tTwFPE639IWrjp+oOcICYitV9N1evV4LpP3IL3zdpV03W7CLfy1E1vINvrW9z8ypqIBj
	7EZ7xTZ
X-Received: by 2002:a05:6870:1587:b0:409:a121:19d9 with SMTP id 586e51a60fabf-40f0d9b194dmr9062080fac.47.1771526436041;
        Thu, 19 Feb 2026 10:40:36 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d4c1:bce:26a1:c903? ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40ee62b6f61sm21460634fac.10.2026.02.19.10.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 10:40:34 -0800 (PST)
Message-ID: <751d82d2-0d03-48ed-a917-dbb0cc8a3418@baylibre.com>
Date: Thu, 19 Feb 2026 12:40:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/18] clk: mediatek: Add MT8189 vlpcfg clock support
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
 <20260202062840.342707-7-irving-ch.lin@mediatek.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202062840.342707-7-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_104037_980390_F77933AD 
X-CRM114-Status: GOOD (  11.68  )
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

On 2/2/26 12:28 AM, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add support for the MT8189 vlpcfg clock controller,
> which provides clock gate control for vlp domain IPs.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> ---

...

> +static const struct of_device_id of_match_clk_mt8189_vlpcfg[] = {
> +	{ .compatible = "mediatek,mt8189-vlp-ao", .data = &vlpcfg_ao_reg_mcd },
> +	{ .compatible = "mediatek,mt8189-vlpcfg-ao", .data = &vlpcfg_reg_mcd },

These names are a bit confusing to me. I would expect vlpcfg_ao_reg_mcd
to match "mediatek,mt8189-vlpcfg-ao" since they both contain "vlpcfg" and
"ao" in the name.

In other words, this is the naming I would expect to avoid confusion:

	{ .compatible = "mediatek,mt8189-vlp-ao", .data = &vlp_ao_reg_mcd },
	{ .compatible = "mediatek,mt8189-vlpcfg-ao", .data = &vlpcfg_ao_reg_mcd },

I suspect that the same improvement could be made in the other patches in
this series as well.

> +	{ /* sentinel */ }
> +};
> +

