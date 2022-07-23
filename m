Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D04FC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jul 2022 17:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtQ14uIFjSRWKjyHokB//t8/r+71OfqgVuwkNcmPeoA=; b=DBJWOABEzop6pZ26Lp43fiDPN7
	SGAvUb4I7B25sDhrF88R3wcjRPfbHdDOZOlBqRoDE4bGgRh6e7lhnc9Lt/NmNoL7CjUu0EZSBR1S0
	fpvDin0So9NtjKwfFjhYZwDZKZ1O2fB2zKRujVvbxumZgumkrjynTotsiNT1ux4s0VwmjbkBuGV4b
	y7di5QCXjD/a9SocAIWrz8ZqHT2KWhmIsMObtHUEtfGDInuHMIRGiNrhznW6QXqLEJe+Ok/fdcpw8
	TKNANnjsnn8wY98dOyucJD1KNOW+dHfk8s1yEyhOeNhKchbGXWNDOe3VCoD3f1vkZE5qDmlGdxZqc
	cIFY2WJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFJ11-00622K-NG; Sat, 23 Jul 2022 17:34:11 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFJ0o-0061v8-T6
	for linux-mediatek@lists.infradead.org; Sat, 23 Jul 2022 17:34:00 +0000
Received: by mail-lj1-x234.google.com with SMTP id by8so8676662ljb.13
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Jul 2022 10:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gtQ14uIFjSRWKjyHokB//t8/r+71OfqgVuwkNcmPeoA=;
        b=ESMwFonERbuKy1tCSV1hQL5WH+aJhXNLZRY/Mbbh/cHLp5d87ZI0B/mbISmXRxxSzG
         NkKTrbmSHJ9XNEirQZA8NAF9oQZd1NKbHheggMUejjbj8x8fFj8bkxp7MyU5dpWKothH
         4J1NxZnLs+IkrOh2X1cNGvP6na0RnJ30+yLZ0L2RZdjMKn27lz5WocVbcr13nbaUmiEe
         fA8hI5/9xbAS+ZQcHzH5+Gj6U85RWj9+MHg4MKdIrxsQtNBqXc2IJT4xWrU2JnZdV53Q
         vK+edK+yMFXVOTLt7J/fO1KfG6vGuRk0GizAGrmzs1YwlxKuUfQHW1TefPBoiv/Qkz9s
         3suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gtQ14uIFjSRWKjyHokB//t8/r+71OfqgVuwkNcmPeoA=;
        b=4IqhU0XgR2GdzvEzRe+voLO+AU/QGFplI//DADFl0I9EblTsn/D+vT7xOe1nfZcIfr
         4vxXB/OCqqgS6Zt8ZDFYtfnyMEO8vL13hWrFjtBXoOMpo0hMM+gztZBzLHG8rB3FXlbi
         vcY9CmEE2icH2QCSCfpy89KhhTCJG+yPmSQomlVHzsF0mAedN1iVZQVg05iArNebkFtU
         k0EXT2vb8elx0KrzprHA4BxI0u6de02WGgFpyP+U8C1N6q8yY7wdHfDTqgA+R79ToyXS
         mltGzP2QcFnG7AuREuO8EV91Nqn63T53qEL5EZnbl3XVX5WWsHp85haYaiMatpPUhUVP
         Jj4A==
X-Gm-Message-State: AJIora9dKMN/xv1flXCOKVu8pHNTc0jO+MV5sCMUb1msulmrVnqpE4YQ
	vcXCraxcKBHVy3xZKE+JwQoeMg==
X-Google-Smtp-Source: AGRyM1uU1eUauciMSqDhYkv5IwoplxEQwBcf8zmfZUOEgmhwKkBdpalR6T+snsJt3pQyFxc3nxS7QA==
X-Received: by 2002:a2e:9c86:0:b0:25d:fe25:3490 with SMTP id x6-20020a2e9c86000000b0025dfe253490mr588675lji.463.1658597634910;
        Sat, 23 Jul 2022 10:33:54 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id m2-20020a056512358200b00489d1896c06sm1756453lfr.125.2022.07.23.10.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 10:33:54 -0700 (PDT)
Message-ID: <576bcc5b-0587-1059-961c-4e35bbfcf392@linaro.org>
Date: Sat, 23 Jul 2022 19:33:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] memory: mtk-smi: Add enable IOMMU SMC command for MM
 master
Content-Language: en-US
To: "Chengci.Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220723031955.12552-1-chengci.xu@mediatek.com>
 <20220723031955.12552-3-chengci.xu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220723031955.12552-3-chengci.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_103358_950845_46E2214A 
X-CRM114-Status: UNSURE (   8.58  )
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

On 23/07/2022 05:19, Chengci.Xu wrote:
> For concerns about security, the register to enable/disable IOMMU of
> SMI LARB should only be configured in secure world. Thus, we add some
> SMC command for multimedia master to enable/disable MM IOMMU in ATF by
> setting the register of SMI LARB. This function is prepared for MT8188.

Could you not Cc non-existing email addresses? It causes annoying
bounces every time I deal with Mediatek:

 550 Relaying mail to srv_heupstream@mediatek.com is not allowed


Best regards,
Krzysztof

