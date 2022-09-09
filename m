Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC6BECAAD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 08:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaJgQP6mmOZSBtHCI9caEKhaJVZ90AwBEM8xc756oKU=; b=FVOMBzc0Tdk61Ybxa/MDr9H/es
	z3bOABA+hsRlbDokcQDG4beIl5j8iaA00PKs6J8o5OSz0Tzm7yBnnD+CQADpQi0AVgPkj/bNqRVip
	1qaQkG90Nv17Oe0GdXzmAvFfr6B3R0C6wE3WqfI93Xt6L0OI1eoXAqb9Np+k9i1pAHdNmEL/2Xmdk
	T99KasWWVeTL72PD5Bpmazx/az7K1dbTg4l7QM88N4HAe/9RhSxgzY2ApvOa261FmiN/Axq9ycuQ8
	N3Uighn6u2+E4OtPyXCBfDGSkLGdyjmXIppfj4JKC+4xgTzoBGmWtkS0nuHEIJm0G3OXPtqgukzvG
	VjxbwCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZMt-00EalD-Nh; Fri, 09 Sep 2022 08:28:07 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZMj-00Eahy-PS
	for linux-mediatek@lists.infradead.org; Fri, 09 Sep 2022 08:27:58 +0000
Received: by mail-lf1-x134.google.com with SMTP id w8so1430715lft.12
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Sep 2022 01:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=aaJgQP6mmOZSBtHCI9caEKhaJVZ90AwBEM8xc756oKU=;
        b=PkfSceaEsCN3DpwzT8WAOBHdhnr+T+3XRaGeaR7p49jx4tBR9Qj413xsXGQanqhfoU
         uue3QFM5syxSdoOsUTd+FPVTJejwBpH6Xy4kpd6YjS7OIjzBn1gW91Iu4lgohO+zUpes
         NVjdNvCCKSZKyCmQcZnvVzlqFNuZgZZgU++IpRQNCp22jAqHqRacoEip4/LRefcJkcfP
         1wdzAxA2JOc/DW5m9xTso4VANt357kwefrfBgAG8RvRoPoLd27pvP3A7qVhYEEevdzLG
         I43EfJlJeuTCZewT8kop0fv+dBAta9ME61DIoPj6MZTtfNdEF1ZnNfMYXbZlGXO+PiIR
         k/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=aaJgQP6mmOZSBtHCI9caEKhaJVZ90AwBEM8xc756oKU=;
        b=aV7Mg+1fpqTW2oSY89O12j/fxWyOY61npClGXRPYIEHvrOtSdjYBboghrR9GzhYCAY
         jx/fNH8Sotw6IMVK+ttPWMWU/HlhFpsdBkQYgnTT/dOwVuMCMD/aghOKjB0/7WOEDmIO
         Eo1ML6st5cxoCEHKU/mT7z/HcBX96ZpLGgM1NwRJpXULlDvvsa8PXjhU2SxI1OQxJ6XA
         KDZT+hxUUo+PuAA/m0LVxvgJGGM3GQApL79/9eFsqE1dLPH893Yl+FRjaNLgpMivfmO4
         2WKEKpWOMiyWGVTz+kVC3gHdPHeWWX/hPDCw6Vo8bxAVtWcNdg/FeHK/ryVmaJoLQjX3
         VM8Q==
X-Gm-Message-State: ACgBeo0OrLhXK2XFTWamrqrUyXx0MY2PQEPLj0+alf3jINbnkaO8uGkL
	TQYMz9TYKFjy3XShjN9NS7KfqA==
X-Google-Smtp-Source: AA6agR6q6dm061SxXLm4iCirWAM8P1i+n441YDphCVJBfNX6AwWGizOpXP2cFam8rCAb/gLNemJBIw==
X-Received: by 2002:a19:9157:0:b0:496:8bd6:a594 with SMTP id y23-20020a199157000000b004968bd6a594mr4174662lfj.314.1662712076092;
        Fri, 09 Sep 2022 01:27:56 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id l6-20020ac24a86000000b00497fed6cbb1sm188710lfp.71.2022.09.09.01.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 01:27:55 -0700 (PDT)
Message-ID: <36f9ed08-169b-dc92-2df0-842de4116d49@linaro.org>
Date: Fri, 9 Sep 2022 10:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/7] dt-bindings: phy: mediatek,tphy: add property to
 set pre-emphasis
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Eddie Hung <eddie.hung@mediatek.com>
References: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
 <20220829080830.5378-2-chunfeng.yun@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829080830.5378-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_012757_843800_D4C90681 
X-CRM114-Status: UNSURE (   9.44  )
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

On 29/08/2022 10:08, Chunfeng Yun wrote:
> Add a property to set usb2 phy's pre-emphasis, which used to widen eye
> opening and boost eye swing.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: Add more description suggested by Krzysztof
> ---
>  .../devicetree/bindings/phy/mediatek,tphy.yaml         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

