Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180DBC001DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJtekU7iYNArAtsU7VeTyVGW5swpEORD91LFWRVt94s=; b=Fv32kEppIx0weKuwmZ2+qa/wYz
	VoNF9Xckejha5fOJxqtuj4zLN8ou+xHx00Tzc2awyz7BWmPYq2dbv3o7nN05ouqkOfkE3fuSWLGCi
	1n12VoKvYe/FT70Yutjah1zQosaDVKQ7tz3FRCJDIuS6UQIPpMm7atpBxxAkerrjkMKdcp1ufTtL2
	79ywGYzv8mneE02myykpBirA4jQDiSuH/nq10AYxTtMNmjUDu882bqMARhhmz2ye2gZ+aY2UPSyhK
	jF5u9ALGcq0kRRteF90+yCF4WC5CS3G6ct0N1LdOnBMGC4ecwycjw9deOfkXMlUMk0enYwf4Cn6ZT
	cRPKMLXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqSz-002btC-0N;
	Tue, 01 Aug 2023 14:35:17 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqSw-002brq-1Z;
	Tue, 01 Aug 2023 14:35:15 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bba54f7eefso43943955ad.1;
        Tue, 01 Aug 2023 07:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690900509; x=1691505309;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lJtekU7iYNArAtsU7VeTyVGW5swpEORD91LFWRVt94s=;
        b=ryLp7WXFaj2drpBSmRl2LGHfP927CcAO+W2SGZwWnslyTyLf6tuJ/FkYPv5nc8KInX
         SM2WXe3D8HC44OIadFt9xgwYvFt+15NN0MrPsuTsgAkWdxTr/ifcVIgq5cQucF72kvf+
         FR5DT79DLc3ADHmwlJ6ycL0RRHQ9ZdAAdXjNY0MLKVM2Ft0ajcuHwGNAofZqHJgrh/+n
         teYboJ2OwprRH0/BGeOG3SJAkzkx4jIz+QKpgbthSk1SDbNyBVvw0Vxo3XdpP2Ly9WM3
         iwsvofjn4JPjUgaE3w6KRRWfKpETgKX6B7Hk6pf3sXyt4MX+HO8NDc5E5cqapx5sKXCi
         EzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690900509; x=1691505309;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJtekU7iYNArAtsU7VeTyVGW5swpEORD91LFWRVt94s=;
        b=F3tv2T5P1lVxuOzJ0zoTRp3qzatiBHvd4z3sHplg0sjUZRuzbSIsRPoafNfXU3Zgi2
         lTc/J03Tlz2ond5xQ9aHVrS6TcouwCTCcyy0xN1mQIORFQCG3YExfyPxJG0Sp1wJZQD+
         F4MNeXrF+kxFZs9Qeeai5UkzsxbtYjJ8vG+vfhcUwBsjSZr49vUrr4Bsg4AhkaUedXAy
         uvIwzVpAUaz/Nha+pNgp4lZDTxXK0BoEVKhp+vIWZl86PIivtaHiKpmPaBCejd4tFs04
         tEWH05U/wWgoO0Z/C12ZnP9vJDF6D0FPleCSz5Dn5MJLg9kfhGak3kV/kGU4z7rVcg3f
         Yqcw==
X-Gm-Message-State: ABy/qLZhOR2Uc5ctOZ4c5ZQsjDXmev07MpsSqh0ODqGEiDfn5RNJZNVe
	EmJvX3cSz7MQztPfhZoCcYU=
X-Google-Smtp-Source: APBJJlGEjU1esn5ww96Q26G5Cjme5PbcxruiY/d4kC2vXu8zIBXMIO7z1MRjwF6FyQASNB+nJXBkcQ==
X-Received: by 2002:a17:902:e745:b0:1b8:8682:62fb with SMTP id p5-20020a170902e74500b001b8868262fbmr15825031plf.4.1690900508862;
        Tue, 01 Aug 2023 07:35:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id jd20-20020a170903261400b001b8b0ac2258sm10570705plb.174.2023.08.01.07.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 07:35:08 -0700 (PDT)
Message-ID: <c8d0e527-b4ea-8df2-fb78-4e8dfc5d7b93@roeck-us.net>
Date: Tue, 1 Aug 2023 07:35:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] usb: typec: tcpci_mt6370: remove redundant
 dev_err_probe()
Content-Language: en-US
To: Zhu Wang <wangzhu9@huawei.com>, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230801122834.89168-1-wangzhu9@huawei.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230801122834.89168-1-wangzhu9@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_073514_527373_255393A0 
X-CRM114-Status: GOOD (  17.82  )
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

On 8/1/23 05:28, Zhu Wang wrote:
> When platform_get_irq() is called, the error message has been printed,
> so it need not to call dev_err_probe() to present error messages.
> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/usb/typec/tcpm/tcpci_mt6370.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> index 2a079464b398..9cda1005ef01 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6370.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> @@ -147,7 +147,7 @@ static int mt6370_tcpc_probe(struct platform_device *pdev)
>   
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0)
> -		return dev_err_probe(dev, irq, "Failed to get irq\n");
> +		return irq;
>   
>   	/* Assign TCPCI feature and ops */
>   	priv->tcpci_data.auto_discharge_disconnect = 1;


