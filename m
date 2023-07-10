Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC976EB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 15:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15HUrMFa8dxK9KzsEl+ouTmZ6kntZ48dbRmvixbyrEU=; b=ngT96Z2LYXfADSOh0b3MiJ+mDL
	3Lx++6zUDHm1jXq3Zzaxgkr504LjNIGuW6GF5FAevp+/iO7PwCMoH2NVIQmuYO5TwoNk9qzcWpCV8
	EpKrV8wnFcYGWmS3ZprbxtWwqdon4zirFxIV/rWYmS4oFENDAVhQrw56qOl085XO+wD6fCxnw3lZL
	scpXoitJcpg3iKkkSFNTS9Sd8HdNJGn3V9AJ6CiNaRJGP979bIv0z093f9SW07rFSGatxbQMYBTPJ
	6fXPNKci3wxy/jIeQUFUM9uh098AlqUn5xEW15ekmUaG01S8LwIr4dR/UeEmccUDXlFDYxr6TtD1k
	eniLTp1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qItEC-00C7TC-37;
	Mon, 10 Jul 2023 15:55:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qItE9-00C7R5-35
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 15:55:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fc03aa6e04so26257705e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 08:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689004503; x=1691596503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15HUrMFa8dxK9KzsEl+ouTmZ6kntZ48dbRmvixbyrEU=;
        b=wseh35Z1Q6EHHEe07eefYQBGAh1eZEVS8sPkPIE9J9sqGi57aDJ1TL6/NWCNMPP9gP
         kTXmYoo2sF8rbGDYrrrAlU7V3Icqsm6Lpoihl0uUQyLojhpV4fCrEY+LXiVi5L+eB1Se
         9DPsdow6ivYFjDsAxn9f+T23kxvNQ4rz5AKhjtMVL/+iNcPCMzAB/8Vyz7KxubWpJzSt
         gteSeu2EPM32aFYASPHunpwsNPOAt/08Ljb3PavtDwr/CcJnqxgaEgvszUG/5sB9fpsl
         cbMurE+y6MrKQoZ6Ge4K8TsSfmePoXM3TuuCgnkLx5zrm/CT8aMPSRzpursHQoR3bbGs
         V+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689004503; x=1691596503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15HUrMFa8dxK9KzsEl+ouTmZ6kntZ48dbRmvixbyrEU=;
        b=AOYrqafK7yO/anQ5vaN8Usxje3s+RdmAiNyxaL4VU+zZNjGzuiQgu6ZPVTs5xMSxYr
         V0KyZZz9bRwCcPaEe7uCljUB8DzeVHJWnufMEBfF0iH54OW5GH25jYlXF6IKYxmvGfPD
         cCKqNG4Y1qONyTS20rT9tDfGILMn+Nuz5Ke9wv8TVP2Gf7oiMhqPB4SSEXmOXxRYSw9u
         cOu4CHaW6tRTl514+wJ8Y71ndERx3OLE0/td8uzjpBarGhbTmFGPR/lwDdi/aEdGAl1a
         RkNoD1yXZIhpKRKdY0wx+Qjt1YzucUgJXpW64lclhEW80ZpL6YsmMj7hnXysYzg3Hikz
         204w==
X-Gm-Message-State: ABy/qLZ1KuVnuTT6IGjnjbYKo/YHEOGnDBj5+erNw0z1SPGjWmbyNh81
	3lxch6QFBKr9F7bBIBbaWvfNrg==
X-Google-Smtp-Source: APBJJlGvD9YcC5ks5NN2WUHCCnE3qkj0yYJdyQ6e0vVfi8aEtkEJCZSnAjeYyXeimrIx/UhfTkXLdg==
X-Received: by 2002:a05:600c:2247:b0:3fc:8a:7c08 with SMTP id a7-20020a05600c224700b003fc008a7c08mr10089897wmm.35.1689004502979;
        Mon, 10 Jul 2023 08:55:02 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id w16-20020a5d6810000000b00315a1c160casm893090wru.99.2023.07.10.08.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 08:55:02 -0700 (PDT)
Message-ID: <2248d0e0-7e8d-e8cb-8e69-918da75b952d@baylibre.com>
Date: Mon, 10 Jul 2023 17:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 8/8] soc: mediatek: pm-domains: Add support for MT8365
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-9-msp@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230627131040.3418538-9-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_085505_993091_50A623B3 
X-CRM114-Status: UNSURE (   7.15  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>


On 27/06/2023 15:10, Markus Schneider-Pargmann wrote:
> Add the needed board data to support MT8365 SoC.

-- 
Regards,
Alexandre

