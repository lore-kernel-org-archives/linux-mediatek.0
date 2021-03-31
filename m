Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9086CC433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 10:20:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2646861985
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 10:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2646861985
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sV1Of8TP/9yEV99a+0FTH1XdKyjz/pzrLYq8f98yYyw=; b=JShGlVskqxcDWtBdgzF6lwC9/
	e3EBttWMpnVW+WXCT+gkf7YrikqYhYDEKao/jIirET5KdZFhc9xDS0mbrHgE0R8ChK6Vl8VopagGK
	vP+vYiP4rds5CwuigfUfOF+48thZnJyCgQl1dc3WQ98GVHj6+fDSlohjg14RHOZdDRDYXOVNjTcnc
	4LJVH/pKBcyHd7mwQUo15MkO7OaoJXpxHSG0eQ3r0KjKobGWn7A0xuz9nufNIzwIUIBiAqCc5GBwL
	tnwZGr7s/KVmH9pe8r05MDPB/+t1esLV++M1dxI9jhRDyI+ZNMeTLRDxXJEFmxwFnIzuv6bfd0kYw
	nkLd7tMxQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRXxM-006FCr-B9; Wed, 31 Mar 2021 10:20:12 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRXxJ-006FBq-E5; Wed, 31 Mar 2021 10:20:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id v4so19064650wrp.13;
 Wed, 31 Mar 2021 03:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3rXla0hHRtnVRfLF9YfnBTiK94WVn7aEJZMJWrzafGo=;
 b=BxYU+5fteJflK1TOZMykibmAPmMWBqlU6pyq6c3GYkZk+Zc7WDm3U2ZC4JA2TVtmMr
 c+/Zkf7+pMiJG45AOLog4xTM+rQx5jjRD6Y0oAK75WCV0BGt6kHQaCCeFsVPz43Ltfhm
 6aJbFXc+2aZgcGoQy1tAxDXJ7jLC31SdN9szJhmewx8z/8TNG3EAGriL+acp0oAGaB5U
 56drsyzCNjhoHdhJn63DRgqRiqk7WZJWrp6LWoPkEZ8qo9y+/HNUVy9o1bN71kF2Bznm
 jcKMVSTxjXN0TTIWxMD14X6MkUCJfoOSikA2dDFYqC/FOuFm/XbxroO9jJ4UP2dnYWyF
 Uw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3rXla0hHRtnVRfLF9YfnBTiK94WVn7aEJZMJWrzafGo=;
 b=EYanp1GjJ+BcYQkrBq/reyAofvgafe4FJQB6O5HG1eJ5Z5pd8MpjnaJoMlQlMYp3Rn
 6PO0pDoJudjtht2djOKeI0Mm7nGYhyz0mMVPGyuHhA4oc2TiulrRXolQspWPlfelfmOE
 jRBbblR7BnNdsK/z3NZYIaVEsJRu1oP1yuI/FT4tkMTG2qvrzyKOkQdtdGWH+D6qSAeb
 qSNOk9OV012f7fqbPVel8VYySlYWHGzdKTnlrmuAUcj1Oyu6Ggxe6mnUw6muD8cbptRA
 TC4h+JE4PgOjwOzQXfJ97LrOfFehfqxdki4ZxmH8+29SFwrszcV7VlWfRff3hSIN94iu
 SJzg==
X-Gm-Message-State: AOAM531UATzBxkGMeg4fE8PMPy2hfplUJpApSVhAgzOeR6eUi8ZgJpNv
 TMgKGLETOh46cBo9R1TgsGo=
X-Google-Smtp-Source: ABdhPJzN80ItuTRHrC4wh+zxjzi0b6qONHFSsilv18FRfi7CBNJJSZ574//AWCzfQl4jVKGUK3m9NQ==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr2765032wru.316.1617186008745; 
 Wed, 31 Mar 2021 03:20:08 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id n7sm3662246wrv.71.2021.03.31.03.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 03:20:08 -0700 (PDT)
Subject: Re: [PATCH 1/4] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-kakadu
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210331091327.1198529-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <28e5fe3c-aae5-9c48-74ca-f1c4964a6124@gmail.com>
Date: Wed, 31 Mar 2021 12:20:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210331091327.1198529-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_112009_631857_17BDA3B0 
X-CRM114-Status: GOOD (  14.68  )
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



On 31/03/2021 11:13, Hsin-Yi Wang wrote:
> Kakadu is also known as ASUS Chromebook Detachable CM3.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Whole series applied to v5.12-next/dts64

Thanks!

> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index cf24401edb85..9774f44b51d9 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -138,6 +138,13 @@ properties:
>            - const: google,juniper-sku16
>            - const: google,juniper
>            - const: mediatek,mt8183
> +      - description: Google Kakadu (ASUS Chromebook Detachable CM3)
> +        items:
> +          - const: google,kakadu-rev3
> +          - const: google,kakadu-rev2
> +          - const: google,kakadu
> +          - const: mediatek,mt8183
> +
>  
>  additionalProperties: true
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
