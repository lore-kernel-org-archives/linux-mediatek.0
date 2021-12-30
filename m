Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1641C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 10:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERLl7wHzc0R+vFbM9JKimmV+tYJbCbZ0l2PKAszSpqQ=; b=Lwm3wVi8jwfiq2
	9ET1IjkSby4/+yDt0pxdSkMgoMPGdxRXgD8obdGCw2axlLXIqxD3yyxShu/XndWUu8kA7UbiHpMND
	JGvqZxBZuaVAsLrYUBHsYQQshAqYNBLCOk2Yibhfg4LWv/vwEVU3psQKJNh/0DDDnK5mYGcIPsLtL
	4AVf0WYJQXbLXyO+zhgjrcqb07ttKog6d5x1G0r2WaM6nBTCmQJ5mQQqaQqukUJd4wDAKYskG45fF
	YLMM34zHDETRd1WKHjsz5C9xOrUBX8P3aO/8O9pxEqyft5ML5PmG9MqOprJhzQTvUFkeAdYhwi1RV
	5mhejq5RF2ElvrUuVtDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2t0W-004F4j-96; Thu, 30 Dec 2021 10:50:04 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2t0R-004F3l-JC
 for linux-mediatek@lists.infradead.org; Thu, 30 Dec 2021 10:50:01 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 87A53406EA
 for <linux-mediatek@lists.infradead.org>; Thu, 30 Dec 2021 10:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1640861391;
 bh=T7SSQLzvNaGqombUsG5MeeLlkx6Boh3UgJFRdWX3IeM=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=VpBoGXbQwTbWH4m3S2vpPTBF27K55FxSnU5HoZbq/+UgAVDiJqe3tX8iP/w0ZXmSo
 kyOKtwdgLfz/+HBQA2y0IEgDZD6e+xHpEBQsPCYVvX+rQbz0opiWA2oA+CszBSORSa
 Pp/lVx7SJmmSKrwDY1TMypTK8pRmKD216szyTDZC2tytiKBSNgCkfkgBnIGyEjJt83
 /JS1KC+/mjA0JjhS6l68/XiiFOy0A2l0TXmlmIZEGLulx6696o0B5hJIi2dUVr9NXl
 x1xk8zowMNOwew3ddH34Pk5+Xzq6eSbb2emrJA+4ZlYhCIcyyaniZFTzcggZeJa8y+
 oXhQJFGXzLrgQ==
Received: by mail-lf1-f71.google.com with SMTP id
 o2-20020a198c02000000b00425d146a32bso4771987lfd.15
 for <linux-mediatek@lists.infradead.org>; Thu, 30 Dec 2021 02:49:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T7SSQLzvNaGqombUsG5MeeLlkx6Boh3UgJFRdWX3IeM=;
 b=I8AxMQbnC3NDvgCedXULyBuSORoD246w9q2Ua1Vu7HwpzOt4rH8lPNrG41VDPM7Gd3
 Ki/sDD9jZNpMOi4yXGn0C2CjZYvs9LrOUeLL+MMAkvxEFx2sdHu5qXqhjwEcMqRZWf23
 qPm5byQfkxZOmJGkNSQtMBnPaz9FrxFeGpt4wwnJ6+/mxIT6D3HD6jnKchTMHUhYnG2x
 mzFQ+mt3jckwk2N4TEIOIXlhoI2HvLtIAyVNOiY1rkaQGRvz1VPUFyVQofT8gsoKM/hy
 bspVsUCQZ2wo2dV+8YZb8MNIwNkviCWPSb37X3DlpxAEN7HEzVZbtvb+xulhEzqZZ2NX
 /Oww==
X-Gm-Message-State: AOAM5327q3yXQnjy5tiYvPVT2H5aAH+pemX/U8ufim7EJ+yHYx2Wx5NI
 FnlE6J1o1KDy5LGNgFIartKHsApJnk9OE57ZcmPewF3ndaNr66VJstSPR1p8L8ArhN2Q6ed99t2
 xFeJvWGbTONcGDgtKBZkCBbD8JjlviUSv6D1ZCa5iUJw4EvvYpw==
X-Received: by 2002:a2e:b7c9:: with SMTP id p9mr25714029ljo.255.1640861390622; 
 Thu, 30 Dec 2021 02:49:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8K8ZccB1+kw4+ZEpMxyuJwdEIzuctUDEAqF9O1N2eYr6XzKGsRZzlk12PPDs4nEswLC99ew==
X-Received: by 2002:a2e:b7c9:: with SMTP id p9mr25714011ljo.255.1640861390414; 
 Thu, 30 Dec 2021 02:49:50 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 y1sm2407792lja.132.2021.12.30.02.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 02:49:49 -0800 (PST)
Message-ID: <c1050d0d-55ae-a626-58c5-b0fab6f8f0c3@canonical.com>
Date: Thu, 30 Dec 2021 11:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] memory: mtk-smi: add missing put_device() call in
 mtk_smi_device_link_common
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20211230084115.5375-1-linmq006@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211230084115.5375-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_024959_937100_4439DD28 
X-CRM114-Status: GOOD (  18.29  )
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

On 30/12/2021 09:41, Miaoqian Lin wrote:
> The reference taken by 'of_find_device_by_node()' must be released when
> not needed anymore.
> Add the corresponding 'put_device()' in the error handling paths.
> 
> Fixes: 4740475 ("memory: mtk-smi: Add device link for smi-sub-common")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/memory/mtk-smi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index e201e5976f34..2131f2c9e7ed 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -386,8 +386,10 @@ static int mtk_smi_device_link_common(struct device *dev, struct device **com_de
>  	of_node_put(smi_com_node);
>  	if (smi_com_pdev) {
>  		/* smi common is the supplier, Make sure it is ready before */
> -		if (!platform_get_drvdata(smi_com_pdev))
> +		if (!platform_get_drvdata(smi_com_pdev)) {
> +			put_device(&smi_com_pdev->dev);
>  			return -EPROBE_DEFER;
> +		}

What about other return paths (-ENODEV, 0)?


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
