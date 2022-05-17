Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE22C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 18:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4h6yfV3ObJrzzOBYvRA4rx+9ZV46lLDJeE+G+8RCmc=; b=SL14Z1wXWY4+Nw
	agbTTGsrMYEsT5E/sSiEnwI7AJT8YghWgCTw2s8ioauZ/ar1weGRGSSC9l1To5IAwuMsEjSLc49G0
	EO3P2/lFEnu3uZfRDBZ6yaupiKUgxwuCCK8ngePjPbFunwDPi8zBkymXJGvyTzKKI5ahuZD1VAz74
	PHDkxAvJsyePFDOj5dfvAk/E8u5uPgRHCojSbY01CdYK8YepLnrrZtbORmUH/gsfbqIYQ5pSWMoqE
	pQKBgeyQNbNUuyLBAzk1ftj+8QEhtmpJO2Kt6SrOkzbS5wb7a5JuVQBOO5VJ+yweJLNIZn2NEBoUD
	8Ii3EQbQNkSe5qbWORPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr1cV-00F9k3-Kg; Tue, 17 May 2022 18:08:31 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr1cS-00F9gb-4k; Tue, 17 May 2022 18:08:30 +0000
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-f1d5464c48so705157fac.6; 
 Tue, 17 May 2022 11:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yA1WC/CMw1QTEhMlwWP3KRXXpyfEqJZV8ewG6GE6Q2w=;
 b=G5SceTQ4wSkOrfm1qX0cIxcyXC5gOdVJjtdIynaVgQe2UwhIq638TSQ9S2SuZAGapU
 m119SHXUbpnhFcixSWzvbR4xFdWFAn0/mg9E0FUPmK85Fpk5RBEsM/aHGCVEZoimcpel
 Gd18fpRXQ6KnbANl6SePpXdE23L3w6kvNfNQmhcmITGC2OJhSYZUewAAWhEdV1PN0+8N
 DH0cQJrYxcZYsFXZ922Ww6QsNnk+v/RUqlI9LzBvjpDZeULmSFtdLN8mpc5eSmFkadOK
 mDM6geJY2OSvXaMubVJtjj/65tOy0nbWyYlmPtlu9RLdRQiAknRsHREBkb7/Ry7Nh+GD
 Jjug==
X-Gm-Message-State: AOAM532kd09fy8kbY8dK9jkHX2g5AedLyUm4ktEyFR1yGrPdKRWVPafM
 vI1huUxXFxh23+bqaVrwFA==
X-Google-Smtp-Source: ABdhPJyHxM+gcy+aOGsVHVFJUXDmZbeAjCxX3XCZt6jlOXXTkRGryo+YYnDX3wQV6bhyF7oqpe2Ofg==
X-Received: by 2002:a05:6870:a40a:b0:f1:9240:2776 with SMTP id
 m10-20020a056870a40a00b000f192402776mr7214742oal.140.1652810901432; 
 Tue, 17 May 2022 11:08:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d5-20020a056870e24500b000e90544b79fsm40017oac.41.2022.05.17.11.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 11:08:20 -0700 (PDT)
Received: (nullmailer pid 1342262 invoked by uid 1000);
 Tue, 17 May 2022 18:08:19 -0000
Date: Tue, 17 May 2022 13:08:19 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH next v5 2/4] dt-bindings: nvmem: mediatek: efuse: add
 support mt8183
Message-ID: <20220517180819.GA1342202-robh@kernel.org>
References: <20220512062622.31484-1-chunfeng.yun@mediatek.com>
 <20220512062622.31484-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512062622.31484-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_110828_208024_B51C5F78 
X-CRM114-Status: UNSURE (   9.30  )
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

On Thu, 12 May 2022 14:26:20 +0800, Chunfeng Yun wrote:
> Add "mediatek,mt8183-efuse" to fix dtbs check warning.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v5: new patch
> ---
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
