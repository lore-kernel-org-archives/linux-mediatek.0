Return-Path: <SRS0=9f7n=PJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4446C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 09:21:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FC94610CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 09:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FC94610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=duYdYXkemG4txaKk33NWeQh7ArId1/CJLOKEzVck0aU=; b=MV/up9XVVTQzXS6iGGRldopirI
	fueQbPxuNW82VqOnF+AR3WZ8kJz9/0K2S91aF7R2PABSz6143xWNKqiOJfzsS7k2w6/+f2YUM0eYq
	oB4WB6BEZGNfMP+xxr039VYcqWDj7drcySc7yX7xfB+98yHES5uXOuV4vLzmUYz92UczfY0+EogX/
	CCtS7aV6DydzCjNKCIM6leE9jBvIUktQytdADJ1b/uo7QhWvF4rEPCBLAEt9m58VHTmjGjvqIqLKi
	om8FzVoBEAMHIm3umKxra3aJXglMWQ38liu2sNlw3lSXYuNy3Hj/ikrEloFQfteIzp7GdTsmh6qnN
	WuEBCeuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdUGP-006zon-G1; Thu, 21 Oct 2021 09:21:29 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdUGM-006zne-Ct
 for linux-mediatek@lists.infradead.org; Thu, 21 Oct 2021 09:21:27 +0000
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 10F7F3FFEE
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Oct 2021 09:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634808085;
 bh=1sNRxX5xVMTzDEASC0BUbYbJBe1HHP47v7+0z03lnfo=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=YneWpf1ep//udN5NfAwLI9N1f2xIdS8J2nOI0VTGtq9khVQ0vSxh5dGbMXV13A5Gx
 9S8FehcKqacgTfUlXELIcWKgyA/caJsG8DPDxwG6kagfjEMXDuISHXO5eAFbyL+E4T
 QJCGHBDSbG0aJPpRphHZzVAv0xTGdMA6Ai410Qdrd6BCH5gCjJ2xUXWPlOJg7MTkLk
 Ktx46rglhSFeTbsGw5aG2+lEps9oMPvflnvDym8mjEQW0A5dQgM9kCuKei0xTX0gTn
 Qs4Rk/8XXcf/XNFuUV9cJJRPwzvvS54j+HnBvoCZIyzZo/uS14qVECTRQV7+HkRM7q
 rj/YLvgQ5bI+A==
Received: by mail-lj1-f197.google.com with SMTP id
 v13-20020a2e2f0d000000b0021126b5cca2so2564012ljv.19
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Oct 2021 02:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1sNRxX5xVMTzDEASC0BUbYbJBe1HHP47v7+0z03lnfo=;
 b=7b4Yw7yQ9jQjM9RXnzxkpuM3OaUSlO3ZOUvMRdt9WjbTzOdeC2zuqQhFKdKceORV1x
 XAYQhRsY0g/W5lMUdHXkZ+VsykEBVqgbyQ89N6yo1x5iOK8n5vze6Hv5lvUU70jiuFyz
 ys1doIxWFP+JrPdiDHViJebH7dYvHgSYoh7vLZLFCFKFU8rFn2PkjKt69qXugH7gbHoK
 h0uMlt/jEKw9ZR+X958ghobXMF97uJX1hxNK2biAyHnlcrPS00vhi6Uv6vQoEh4VSyCp
 n+JMP0GeyJtcB6j1PWzTESnQN2pxdoXUuk5kI5Rqs5hFw3k/nEValoPqix+C9iI8UC32
 X2ug==
X-Gm-Message-State: AOAM531fzqKkzC04aLE3Ip5YFHcqO/JftfomlZYqKYYH7erL/AESWeUU
 PNMIi9fbxmUMTWZWo2vAAaXdK2int763E9Xrecv3Tn6/7LD97hoQ+6mRe7UF3UK392IaI8ivEXL
 t64JQFTBC3zUMT1u2AnthaiLxAV/py7qZF5+va+AZW6xsWbsSIA==
X-Received: by 2002:a05:6512:3191:: with SMTP id
 i17mr4275630lfe.485.1634808084612; 
 Thu, 21 Oct 2021 02:21:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTR7ZwqF7Ps9LYNUTgrRaJOZAqjlnwW/OzBDYFs9a7D6ppfeTaGTCufWcfkbF8WyTuRBmdmw==
X-Received: by 2002:a05:6512:3191:: with SMTP id
 i17mr4275606lfe.485.1634808084404; 
 Thu, 21 Oct 2021 02:21:24 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id bq8sm413345lfb.32.2021.10.21.02.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 02:21:23 -0700 (PDT)
Subject: Re: [PATCH] memory: mtk-smi: Use ARRAY_SIZE to define
 MTK_SMI_CLK_NR_MAX
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: yong.wu@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20211015151557.510726-1-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b6090131-9098-4a9a-7dfa-ba7eae977558@canonical.com>
Date: Thu, 21 Oct 2021 11:21:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015151557.510726-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_022126_680204_80B4FDA9 
X-CRM114-Status: GOOD (  14.96  )
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

On 15/10/2021 17:15, AngeloGioacchino Del Regno wrote:
> This definition is tied to the number of SMI common clocks (the array
> mtk_smi_common_clks): improve the definition by using the ARRAY_SIZE
> macro instead. That will also reduce room for mistakes when updating
> the aforementioned array in the future.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/memory/mtk-smi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Thanks for the patch. I sent mtk-smi pull request some time ago and it
is late in the cycle, so this might need to wait for next cycle. I'll
keep it in my queue.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
