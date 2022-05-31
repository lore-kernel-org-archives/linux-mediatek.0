Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95585C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 15:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OyWukztwlO+VfJG1zEjwgV/IHRpfd7sjEp2hb85AekA=; b=4CDnaYVrmvWX8s
	917o8JIxBcUCNEGcF8JZFvJp1jO3TxhXw6T9s9R6sxJHfnH6m1rlL+TSYI3ccvybwHLFHhln958nh
	tPs5GjVS0t70AUTOI+bryEm9koWPLaj4yoZEIYbPxb72npFT5eidVLBSfqQbPgobaKsRFoXCgT7J5
	1PeCxPMBneKzf9djLNe+yM1QfatrSVgeBUJ+9kClXG3IgDKzVT92JR6EGgJkmGoV/cWFc9hhyJOxt
	YrRXjf5Iw4pefmHBkupuJAtG8i3PoDIDyPRlgvVl7zIzil2U58cP33Lk1618xyhWDG6tof8Un2UUV
	WXfSeWNnyIj41YDKT1gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw3fn-00BWlZ-Di; Tue, 31 May 2022 15:20:43 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw3fc-00BWgt-9Y; Tue, 31 May 2022 15:20:33 +0000
Received: by mail-oi1-f177.google.com with SMTP id m82so3866611oif.13;
        Tue, 31 May 2022 08:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5T9PqeW++1xR8KKb+9Iejw7mcxEUijjXojRIr46Glmk=;
        b=pOORHTg4daV0tbvA1dX8ZlyQWCTUY+g3UEdUxDqo7pXbxvqc/xM0DiXZf59eKlguYM
         hlhVoTvlSZp685nY+CEnENko2hIh6UKo+IwqRU/kepzPm6ppF8rn03gL4mxkQmIZyyed
         45J8NN296LSAHcs03m0OCz+mRQFlSUBSLoAVcNqpA5MnP6Z2PeWmZV+u9G+y1Ykc2FrC
         AFWgtZZnNWmGCwzp9wF8df5+mMC8XwpS1xzjaBWIcORjLogIfzOt20CACdEAQX3359Yz
         50XictdpriZ2q9C1S4HWQyrzIdte+AncHaDcRcbLKXxBwbamuPaxWmeQ495Q6F19LdPJ
         AuAQ==
X-Gm-Message-State: AOAM533xsWElJ5AozwYBEuDg63dmt9QJAljd73y2f/2vE0gYBREES30+
	YdtXkBzDz1MJLX1uFRo0UQ==
X-Google-Smtp-Source: ABdhPJxjR2JRyWzVqnm7ztIPcE+YpVknf54yXEDm7ZWqZcTjkkBQ/BU8e6ghx/26uMLfuoLOoS41AA==
X-Received: by 2002:aca:61c1:0:b0:2ec:d091:ff53 with SMTP id v184-20020aca61c1000000b002ecd091ff53mr12581172oib.235.1654010430172;
        Tue, 31 May 2022 08:20:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r19-20020a056820039300b00333220959b9sm6169928ooj.1.2022.05.31.08.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 08:20:29 -0700 (PDT)
Received: (nullmailer pid 1785018 invoked by uid 1000);
	Tue, 31 May 2022 15:20:28 -0000
Date: Tue, 31 May 2022 10:20:28 -0500
From: Rob Herring <robh@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Biao Huang <biao.huang@mediatek.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: net: Fix unevaluatedProperties warnings in
 examples
Message-ID: <20220531152028.GF1742958-robh@kernel.org>
References: <20220526014149.2872762-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220526014149.2872762-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_082032_391894_728FD0E5 
X-CRM114-Status: GOOD (  15.30  )
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

On Wed, May 25, 2022 at 08:41:48PM -0500, Rob Herring wrote:
> The 'unevaluatedProperties' schema checks is not fully working and doesn't
> catch some cases where there's a $ref to another schema. A fix is pending,
> but results in new warnings in examples. Fix the warnings by removing
> spurious properties or adding missing properties to the schema.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/cdns,macb.yaml           | 1 -
>  Documentation/devicetree/bindings/net/mediatek,net.yaml        | 3 +++
>  Documentation/devicetree/bindings/net/mediatek-dwmac.yaml      | 3 +++
>  .../devicetree/bindings/net/wireless/mediatek,mt76.yaml        | 2 +-
>  4 files changed, 7 insertions(+), 2 deletions(-)

Applied, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
