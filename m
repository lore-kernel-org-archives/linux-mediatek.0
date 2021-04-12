Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E6BC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 15:59:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0B806124C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 15:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0B806124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d3HVraWv0gHBdgV1dsKfbG5SJN+deWvVn5YxYS49DLY=; b=g/5A9Ozi7llQproDX6RjRz8he
	hWM2niYnQry8SZ73+rH1h+y7Wv/jmdoUo+iWdN0yTlc0YIVkFPEuz3FNRfpTrdq6YDs3hk1ZI5/R8
	K50eJF8NzqahQpdNsXb7Q5EcS2vOu42moDy0t8J4y3U5Qg1jBmoxchv3s+VIkfxW55VzDSWMlDQ75
	KhEBUoW7yhgLH/gA0pnhtzzHjIXY5zZf7yXdQ3VU+Z1L5A1Yc7bdD3O+ano7VbDReTZQf7lSz6Did
	+g8/Q/EzixxWF8qhnyzcs5Ba+6rlooMP+xe7ZJbtOsWpAR8ZUJPygDCXcWbhLkSdQnQf57NioVDzI
	0L2YIQpjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVyyL-007B0Q-BG; Mon, 12 Apr 2021 15:59:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVyy3-007AyY-Tp; Mon, 12 Apr 2021 15:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=D8mqQNMejN8r3XNzqzZUQEDV1TBSvz3m0F5gnKEmk2Q=; b=N0PLbasPsxmdok3zP5MQH3vPZW
 kbMwJ3kPc6AijlR3+OoVn+ctgnTNe0hd8SjzfG6bmvZ3JQtge1H/+ldLUk+TQv3qxXjRkLpc1Lsoy
 A+UEk1+GGEJ89vtyKpNgEjp0EsE60cYHcj853p0sq3a507C0sqqxp6QA5wVlwjog2CYPQLa2SUvXO
 Vb+YwJoWDRWvgZB6/fxmTux0sejeQI5DLz4475nv6aCWgZBV4abQO3GBEMj5bxzQftq3czTO3LMZL
 YNp1YILkm7T10jFmWD/zYjar8jwcEQMhmdeIT0DD4jE8egyOYdRi56v/Jm2sLw9IQQD2jR9mAp3v+
 ghuXx2uw==;
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVyy1-006MtP-Am; Mon, 12 Apr 2021 15:59:14 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so8138289otf.12; 
 Mon, 12 Apr 2021 08:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D8mqQNMejN8r3XNzqzZUQEDV1TBSvz3m0F5gnKEmk2Q=;
 b=fYLt0bpbXo8Rn/VNqIdWHUdRGZgEaqUf/hxm6mZDp5WCLd6gaFaiHx8Rhd+EGkWM0z
 m5oLAiOE9T281UpEgxU8Kf3135sk6IGreHQxBYHIgom8Nl0I1zCOpvmDEVZAxlB0bjN8
 uUu5AiEP0oWFYP4lim1gKVD+EUbejCrSAuNYByz8a2/QEsjk+aHcaYAT4mEfHszLPC6v
 FewvY/XrQOM0hgfv+umIhq6pbFw4tL64CufmzNON9IbymlWDa66yPsTVH4Z2furha+iV
 BO6bXFLfQ8Gg6b4aon4GycH4t0H3LUdUEfSpdEtkMKdIibcPJ5t9aXSXsnsiB8+UtTFK
 UkSg==
X-Gm-Message-State: AOAM532qJytbeg82atzPeSuxX4keC7vtIZRa23TEyX20h8u6KY7xXuXD
 1/yb5bnQMoL9+VOIQkrNrQ==
X-Google-Smtp-Source: ABdhPJwP31fm7+UhlgtmiR5A5n5kQN+n3htgVpyOrqH3ry24ejd5rjWkE9SZqRHNPzuYBXMKB0w44Q==
X-Received: by 2002:a05:6830:149:: with SMTP id
 j9mr24866361otp.66.1618243151906; 
 Mon, 12 Apr 2021 08:59:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m3sm1191222oiw.27.2021.04.12.08.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 08:59:11 -0700 (PDT)
Received: (nullmailer pid 3967470 invoked by uid 1000);
 Mon, 12 Apr 2021 15:59:10 -0000
Date: Mon, 12 Apr 2021 10:59:10 -0500
From: Rob Herring <robh@kernel.org>
To: Nina Wu <nina-cm.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Zhen Lei <thunder.leizhen@huawei.com>, Neal Liu <neal.liu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Jackson-kt.Chang@mediatek.com
Subject: Re: [PATCH v3 1/7] dt-bindings: devapc: Add 'vio-idx-num' field to
 support mt8192
Message-ID: <20210412155910.GA3966290@robh.at.kernel.org>
References: <1617956377-4075-1-git-send-email-nina-cm.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617956377-4075-1-git-send-email-nina-cm.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_085913_391383_B8949B48 
X-CRM114-Status: GOOD (  19.60  )
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

On Fri, Apr 09, 2021 at 04:19:31PM +0800, Nina Wu wrote:
> From: Nina Wu <Nina-CM.Wu@mediatek.com>
> 
> For new ICs, there are multiple devapc HWs for different subsys.
> We add a field 'vio-idx-num' in DT to indicate the number of
> devices controlled by each devapc.
> To be backward compatible with old ICs which have only one devapc
> HW, this field is not required. The 'vio-idx-num' info will be set
> in compatible data instead.
> 
> Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/devapc.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> index 31e4d3c..909e524 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> @@ -20,11 +20,17 @@ properties:
>    compatible:
>      enum:
>        - mediatek,mt6779-devapc
> +      - mediatek,mt8192-devapc
>  
>    reg:
>      description: The base address of devapc register bank
>      maxItems: 1
>  
> +  mediatek,vio-idx-num:
> +    description: The number of the devices controlled by devapc
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1

A uint32 is always 1 item, so drop. With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
>    interrupts:
>      description: A single interrupt specifier
>      maxItems: 1
> -- 
> 2.6.4
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
