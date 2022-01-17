Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0919EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 12:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uu4Iv2TDhG3ON2zIH2+VTvg7VetZAOKnBLIUzL7ywbw=; b=eob53MlyRuWSv0
	/23D3o0rsGflBfLEXnIqhBDatwNZKfPtyqlin0Frvok+dbgXTRWjOo0icd1w0PueuOTr1q4SOvVaP
	a7qPa8CYrw8zxq2dbJcCF0QAFu4a+lNPwQz9xOQmhkBe399zybmBtoO1bbf4mtvAz2pUdR2PGVUXJ
	C8sifVCH7ayn7C9MzRRJdiK+CDXMU2IM57mvArQOklipDWqca14etwFltnJnbRvckQ8ldFDT80AjE
	5gSyHuYqwr6oAXrlk4tY/7wkFnZQgizEKBcyY9+GNL0D+2c/YFQoRZDV1/Kl2PYTOrgXB007mT0fC
	UbYpwra4lVpGBLuGSKjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Qi1-00Ekev-78; Mon, 17 Jan 2022 12:02:01 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Qhl-00Ekag-Eb
 for linux-mediatek@lists.infradead.org; Mon, 17 Jan 2022 12:01:46 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5579A402A9
 for <linux-mediatek@lists.infradead.org>; Mon, 17 Jan 2022 12:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642420903;
 bh=bAUdRzIm9/2z1tZx93HbZGiaxfI165En29R890ewPoU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=mf03TZJAsVjsA3aP7BLfJ0QB1zDJNULYvE+MFaDLUrQPJOaaHQhBF6nP4MursdAM7
 I8rZGThFm4prf9/j24+r3x0ciwingE5Mu9mLwa5Nh0QR/O19q+fZG9AeiLk5r5YD1U
 0Ha3jYPPTbeyxqfFUDvMcA+JBniE/lNlxrQY9CnMRn7xyuzHpxz6YNTQkJkA7FkZyF
 V1EJXrIv6V12m333qT+SNOMZtlHzBsIcA2fo9VE0b657NqiTJ7GYiBMkaK6qS7XH3W
 C7tOHt+hwbFLUrEa4HzU1b4J3R5bmfZz6ONDYVGOSx4GhgM62bjhP1zydsrva3cBEL
 /GHczjry0T8Dw==
Received: by mail-ed1-f71.google.com with SMTP id
 bs4-20020a056402304400b004032af6b7ebso748058edb.16
 for <linux-mediatek@lists.infradead.org>; Mon, 17 Jan 2022 04:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bAUdRzIm9/2z1tZx93HbZGiaxfI165En29R890ewPoU=;
 b=5jtqcmmPE1QFEG0301VU754quS9a48aJtHjAt+CrYLa/dATG1I2l2evnRP6Vq7YGAC
 61cqlkMxy+sMoHWgGERZ8q0mdnTVldpoy6+EXtDLvAq8cwWw5pNOiQLAr3jREqL4Wkq8
 OVxjfzTrXHdqZCUv2kLIdO+Dg7SQuD79vx7MnatxBXG8zLSVwDMI706U5z4/7oFWaGir
 s7cyfZmayRXU1TElQEgZZ+YNdi2SdhkPCGLJKe4QYI6ivUlE1FLc6zyHGrwLCu9r3V1S
 pt8nu4PVwFYkWhocat2pOkk4i2WtYVvjpRvvsZhkPiU02odWA4SjEaAXBOaKC/lloMmh
 OdMg==
X-Gm-Message-State: AOAM533B3QBguMLhUCnBYEebe8KLS4iAFmOeLOjRyK1WtL1XXMLP3XzL
 fhrXqAsScizsYm0GEwNxKiMUn1M6+mp9hTS4c/Faa99iNKiXjBY1Poajq37+DdiRkCkFGCw1RlP
 Um38XLQ2wwWJEyIPfBR2YF6JO22YJcSob+ZYE60Ml2o8+JvMqhA==
X-Received: by 2002:a17:906:e249:: with SMTP id
 gq9mr14818943ejb.258.1642420902682; 
 Mon, 17 Jan 2022 04:01:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdZgJNSpG3yPSHuygPWHopeMLD3qUZtx1G/vR+ammoYPGm5EgWxjMpAsCvVrMFa/M0hof7+A==
X-Received: by 2002:a17:906:e249:: with SMTP id
 gq9mr14818904ejb.258.1642420902250; 
 Mon, 17 Jan 2022 04:01:42 -0800 (PST)
Received: from [192.168.0.37] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id r15sm1766230ejz.39.2022.01.17.04.01.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 04:01:41 -0800 (PST)
Message-ID: <7370f18b-e273-69f2-1cc9-a42495e04874@canonical.com>
Date: Mon, 17 Jan 2022 13:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 5/7] memory: mtk-smi: Fix the return value for
 clk_bulk_prepare_enable
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, lc.kan@mediatek.com,
 yi.kuo@mediatek.com, anthony.huang@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220113111057.29918-1-yong.wu@mediatek.com>
 <20220113111057.29918-6-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113111057.29918-6-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_040145_708150_BF8EFFC0 
X-CRM114-Status: GOOD (  19.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13/01/2022 12:10, Yong Wu wrote:
> Function clk_bulk_prepare_enable() returns 0 for success or a negative
> number for error. Fix this code style issue.

The message does not really make sense. If negative is returned, then
the check (ret < 0) was correct.

I guess you wanted to say that common code style is to check for any
non-zero return value, just like it's implementation in clk.h does.

I'll adjust the commit msg when applying.

> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/memory/mtk-smi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index b883dcc0bbfa..e7b1a22b12ea 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -480,7 +480,7 @@ static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
>  	int ret;
>  
>  	ret = clk_bulk_prepare_enable(larb->smi.clk_num, larb->smi.clks);
> -	if (ret < 0)
> +	if (ret)
>  		return ret;
>  
>  	/* Configure the basic setting for this larb */
> 


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
