Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAF4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 11:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DG3mQYvrbxifuSieCsPZPe6bvsycFfZQyADC1g6sfCM=; b=USOIn9v7n0dkaL
	OhDcYwyR/OcPZNi977sXFrKIIaTeWCtxqZ1nsvYPPLhC65GmcXCck4oajG8WGb6H2KKtnf95IuFRx
	ZwI3oVCCgTbbu4wwJC0iYQ/1uRyRnoAwsxqZQNWaPvMV/0aG0GdDQRV2uCyf4Z3oc+Q6Y62LlJfP7
	pMUAwWRApF9PH0Ox+1ss9EhA2/CV4c9EaPCT9l7DRaC03741TX11WA+/Jyok389w17K1tIdwh3eBc
	d5ZMK8EgedIhKZsg1XmUd5icXjflBwoJonb1Oyox8ZLVijxdKe9VnA+QHfrnsIYDg5nVbIikdv531
	qvFzYsFGXeL35Ejy3YUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIUMA-006vu3-Ey; Fri, 11 Feb 2022 11:44:54 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIULw-006vmV-2t
 for linux-mediatek@lists.infradead.org; Fri, 11 Feb 2022 11:44:45 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0939E3F1E3
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Feb 2022 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644579878;
 bh=ecHVwDlq+AQYKeIGcf4CvkI7mMqME8Svegbv9eL0bmA=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=IXlLL6OtfmBNivpUQXvoQnsXfGg/xds0/6qPxL9Rcg9KV00mIceMRzOgBggycQOjk
 cVpZeURair+Lb3f7VrgYdDSrms0SVrT75BMmnbxIJV69JZIUyUyqId8D+jsWNRgnZo
 Sz92XcVZ4MjhgmuKnnT+/dM9pLbOhnqEPoUskJfga/bK/5UDtOAgA9uU2Io5ZXsDpb
 SkL8rX9INOTOCFJh9Yg4VmpTwLskgPCNrZtiuIo2RrMeL/Pejb72kLAhpfTd7NvHz4
 LylNYwyaIEvmO8gpjP5yji7kwPfTLk3exsC12f/t5BShX2SjR2RkopCZhduCB9bhXV
 IAzMaX7OsmTNQ==
Received: by mail-ej1-f71.google.com with SMTP id
 l18-20020a1709063d3200b006a93f7d4941so4011547ejf.1
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Feb 2022 03:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ecHVwDlq+AQYKeIGcf4CvkI7mMqME8Svegbv9eL0bmA=;
 b=ShTYhyAsb4tb528WmNpCowO0Ta6VmmnaqYOvyX1UOWgiq1Ah8nDbSEHFM74txPY0Wk
 YSNnJj1jNIGJmzzPfFtZ3YAU7h7v08cKq1MBRCCRoCFkzoZYc2aMKi3rVvyUuXPbp8iE
 hsSUSyctISfuu2vsokirAhQ4UzWybIk6dvMb4TzeIHliO7QmXC6FQ+tPPyotbWZz0FPS
 IDvm22hmSiW4XNJXE1KwSXMt0GCIkeZkjj53oSrCR29LkFVC4chGxWfMwwf9xsHD5SZB
 urswV49aw5tZUdjEj3jQqS2diP9rduvzDji97g2sJgKAeRY4OVccunn2NRm/MVM625NA
 hWZg==
X-Gm-Message-State: AOAM5325o8OF79xOw9j+MTfnIDGiZYiDXpd5eunXaL/tQzGMhw5p6To9
 HXYeWxH7kWJoeL98P4IS6bOPkMlQah2kpUuYi4bwaQzAcOvI3IcF3sUHMJjpLp1sWpcuGs+PKMd
 yvOVquBnvLkOtDIU27XHxd4KRsXsE07raM5pVdeH48K3CF+DosQ==
X-Received: by 2002:a17:907:c26:: with SMTP id
 ga38mr1032322ejc.626.1644579877733; 
 Fri, 11 Feb 2022 03:44:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznqvvnq5wXIqGOsU+p8aV3YUjGCSFQ0QQ2p8CHvwjdn3oe9wCw8FEpPx+8TbAPH99rTQcjyA==
X-Received: by 2002:a17:907:c26:: with SMTP id
 ga38mr1032314ejc.626.1644579877581; 
 Fri, 11 Feb 2022 03:44:37 -0800 (PST)
Received: from [192.168.0.99] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v28sm10808602edw.95.2022.02.11.03.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 03:44:37 -0800 (PST)
Message-ID: <bed10d2e-a3eb-ddcb-8b84-9b5ba7f138f1@canonical.com>
Date: Fri, 11 Feb 2022 12:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/6] dt-bindings: spi: Add compatible for Mediatek IPM IP
 with quad mode
Content-Language: en-US
To: Leilk Liu <leilk.liu@mediatek.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220209111938.16137-1-leilk.liu@mediatek.com>
 <20220209111938.16137-4-leilk.liu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220209111938.16137-4-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_034440_295691_46FD5DD3 
X-CRM114-Status: GOOD (  11.76  )
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

On 09/02/2022 12:19, Leilk Liu wrote:
> This commit adds dt-binding documentation for
> Mediatek SPI IPM IP with quad mode.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)

Same comments as for patch 1 apply.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
