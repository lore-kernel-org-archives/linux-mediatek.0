Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F418C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 10:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRYEKF+JKDUe+/4PWEAoIKSUJrQI9kSn3rwTj50a5SI=; b=sGGlwnXRynUpf3Vz6MyLRo0q8w
	01wOnksoBkG3Pp3GROguqlziFDB5Ol7WuXrDvV5BqcC/QyP+TJDTgCxTBVF1PtvimStec2r6Qe+Rj
	I0XfZCiKAPrnJTm2JPUI7eCC3tqRv09DTV1TuvD0WsK6kRjyEvUdSeiRTq9ZzBrb82d4CxN2y2WQr
	caqEId5U5bFFOQvAWrWnUEje4Pv/X/vhfrNC6b02pOxGveZIrI+fRETC3Xv3T+w4JbPm/gkUZ4zNk
	gkegg8/OdO0mGZKShD0ANTZGCKcpVS3vlmEEO2UOgsWkTlvmEoXnRiIpCOFr6ItZ4sDCisll6bIMV
	dzAKqgiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRTR-0056OE-Hi; Tue, 23 Aug 2022 10:49:33 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRT2-0056AX-Ho
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 10:49:11 +0000
Received: by mail-lj1-x22e.google.com with SMTP id by6so13105812ljb.11
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 03:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=tRYEKF+JKDUe+/4PWEAoIKSUJrQI9kSn3rwTj50a5SI=;
        b=IDvQiUDTFC9ng1VOeMeft4QD0fVE013eX0K61+0kW9iWz3RrjcL9jCHyEL8sz8Xdx1
         J01hMvc8yMKanFAuR2qOZbWLBmvFaNRuSEPzoL6qNUfCuQZfMXFrJlXHkn+4zkPUnXIK
         I4/VUXdVyxDHp5VTGswiy9yRgjzmd3CXEyH+CX/F7yUKrAKk8y92IFZhLRzoXYCGJpEB
         EieSmaRPNhS1brHHT+K+IWUr7AitagA6BJxTmnuwL9R1voPpwSJcZ6picYFHPuy/DWVZ
         CigslD767IEBjaDns0EJYUUvgErGiiSZb7ttvw+SEAbSgKDmoJ8K5+LsJWhYx/auRdBo
         qm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=tRYEKF+JKDUe+/4PWEAoIKSUJrQI9kSn3rwTj50a5SI=;
        b=Nl7isX1SjUCMvLnzOudVPaSrr+N5JM2n0EAanJiP5h1nXnaM6xRVRRPDZNyG2zz+lB
         7VcJgfX5aSvCot2wHxapT6iZkovt77HqgPT84bqGj2UJ3bPzNcJjPfCYNzgIvKIF/9Na
         lCLLq47XaSoVhJX/3NAVZFUM59OfGV6gRk9gsMp7SSubWrnNB+nPdWEa6g882GM04coN
         BnU9iXYWCHTrB22YHa0DoXtz3PikZ11jbL7j4G45nfKn7q5aeSKj3AGEz7jY7phS/oFH
         uaU/SYXsdrsIGQaW003QY87FyxcfANaMuqjseyYmb/yC4kiyQqwj8Wiios51aJRA1rYB
         VELg==
X-Gm-Message-State: ACgBeo0H8GDtHlf5OTxMrLJVw0gsRBOFZGkKy51lfQKTX4QZWQCF86yo
	C8I2izCxMEcQHHz+26nh7Jvg/w==
X-Google-Smtp-Source: AA6agR7ghepHiUVhQI6lvQs9qB/m0STf+QZAEU8jUCMP/jFawUcPMZeqMdrPF9kXmcLsoAQDZOhTXw==
X-Received: by 2002:a05:651c:1208:b0:261:cc0e:7555 with SMTP id i8-20020a05651c120800b00261cc0e7555mr3006288lja.198.1661251747077;
        Tue, 23 Aug 2022 03:49:07 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id f7-20020a05651c03c700b00261cc46f4a1sm1053004ljp.0.2022.08.23.03.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 03:49:06 -0700 (PDT)
Message-ID: <5d5cf5e4-543b-ecdb-6719-0e6ca3c05640@linaro.org>
Date: Tue, 23 Aug 2022 13:49:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 6/6] dt-bindings: net: dsa: mediatek,mt7530: update
 binding description
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Frank Wunderlich
 <frank-w@public-files.de>, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sander Vanheule <sander@svanheule.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220820080758.9829-1-arinc.unal@arinc9.com>
 <20220820080758.9829-7-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220820080758.9829-7-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_034908_678026_E0BAC15A 
X-CRM114-Status: UNSURE (   9.32  )
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

On 20/08/2022 11:07, Arınç ÜNAL wrote:
> Update the description of the binding.
> 
> - Describe the switches, which SoCs they are in, or if they are standalone.
> - Explain the various ways of configuring MT7530's port 5.
> - Remove phy-mode = "rgmii-txid" from description. Same code path is
> followed for delayed rgmii and rgmii phy-mode on mtk_eth_soc.c.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

