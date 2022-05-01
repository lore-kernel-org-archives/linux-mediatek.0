Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F70FC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 May 2022 10:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XYdYSsrk0gvGbgHU8GWZXswWbhfTCZOtTJvVXMZPOfs=; b=cyBlxjmNW2zHb7
	ula7H97OKV4evAmiMZlLLFUb0MIK/pF+VTXnrCIjuMB9Y6p0w7LhM1UaDZO6Oa56OUpGBrhDRX817
	+Xp04GRsWCZ5kRbIEB8IGRBKj4IZU9xP4c60el8a2Hw9J1/RjEHNHBPD2y0n4XD+HLCpR2KQgHgZG
	MzUep9Auw2X0x/CPuACQ+nZh7K1v+KZ54fwl0ao5VzPn7WmNmwkCrthfwp4QyaMqlSZky8xqUJTfM
	VHq8aVJUh7bd2k+TaX1LVm3lt1FocwsYcVfGqjLfhw32bNlW8ZQr+5TTzhjJniit4eKfmAyCHnZ0b
	NLPCxfZVLd7B/E8FaHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl77G-00G5Ih-3j; Sun, 01 May 2022 10:47:50 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl77E-00G5Hj-17
 for linux-mediatek@lists.infradead.org; Sun, 01 May 2022 10:47:49 +0000
Received: by mail-ed1-x52b.google.com with SMTP id y21so13732274edo.2
 for <linux-mediatek@lists.infradead.org>; Sun, 01 May 2022 03:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zZDvps19lTsjs3/du8HCOXvX5yBRInDpxD+6Q75q+Q0=;
 b=NIfHYLhx1GXMV6BN+JqI6crKL6q/qDhpxGOiHECiCuY8tYyirqtQP6PPcMKv9bXDJb
 EWS/tx1PuhjSCjPm7r3DlHWanYY+NSG6xmZxznpLj9j/0ek3zlV/HIzC/Y5bgX7IoIs/
 oZIT0XkGK4l3aJI+/w0E0BEK9Nb4WryS8IBassS3VaAoI6mf6TkrBNIYkb/n/rH4hX1B
 oCll9aDteNigR51XnkhLpdYCbDhd18/6Gc5R0rkFqU30CEzmVxGd97etPd1yPGQAM83i
 OPGr5h8iVQ+tmRMJNyIBkjq8CphbSjI2vrORtzMEdomvgz5x2pb5cS3X/TE0QtGuhxwE
 aQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zZDvps19lTsjs3/du8HCOXvX5yBRInDpxD+6Q75q+Q0=;
 b=C9ty3sfMq1eisPgGvDmMO7KxLRxVV7ePoOJj8TwaZRbLL+VgK7pOZslS4NqySQ3tOU
 DKJ59u9QpPZukKSfRFFDiKOGSv3PO21BTDGzdcVaMCkdou9w4ymVRw94bjGMDzOCC9pU
 aEC5J6t5J1JB34jduSKvQRDYPPMQpBYWS5e/AvK5GZoE6yYydmJA0nRAfhxlP/JfGWrH
 TvwNLohlkC6k7Nn/bwtD+qtpZIFRoO7ApyEWZdmO/y/uBmCQIWhUrWS6JWcKblnX7D0c
 PAbGQ3O5eSVzCymYxn0noMR+TFrCrWIX6Tr7nw3WN+af0yr8iVPGLjsEgyLFMj6QU4YI
 EzQg==
X-Gm-Message-State: AOAM533nu3zKr2+Po58KM/3Linv+egXQkd4KkHlTxey8pwVR6GAPA9IW
 YWUlYCU0nUAfgSy3X5u4s7jnnA==
X-Google-Smtp-Source: ABdhPJyMkcCOCw3l7YDl4BFMA/bMxqLZYwwd2T9wW+Vr8ZRkTY7Bp5siolxMqUw5cQCqJnl+Sp/ENw==
X-Received: by 2002:aa7:d4d4:0:b0:427:5f6:c5d0 with SMTP id
 t20-20020aa7d4d4000000b0042705f6c5d0mr8023105edr.207.1651402066798; 
 Sun, 01 May 2022 03:47:46 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 l24-20020a056402029800b0042617ba63a7sm5262256edv.49.2022.05.01.03.47.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 03:47:46 -0700 (PDT)
Message-ID: <74d9189a-6c15-61c0-19d2-beadb9e2cc61@linaro.org>
Date: Sun, 1 May 2022 12:47:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] dt-bindings: arm: mediatek: mmsys: refine power and
 gce properties
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Cellopoint <cellopoint.kai@gmail.com>
References: <20220501090117.19557-1-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220501090117.19557-1-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_034748_121665_5D4C11FE 
X-CRM114-Status: UNSURE (   8.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 01/05/2022 11:01, Jason-JH.Lin wrote:
> Power:
>   Refine description and add item number for power-domains property.
> 
> GCE:
>   Refine description and add item number for mboxes property and
>   mediatek,gce-client-reg property.
> 
> Fixes: 1da90b8a7bae ("dt-bindings: arm: mediatek: mmsys: add power and gce properties")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
> Change in v3:
>   Add maxItems condition for mboxes property.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
