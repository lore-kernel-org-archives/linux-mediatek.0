Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C86C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 06:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qn2BrYKRf8RsTbdx5et/44IvxrHEG9o/QMPMgi17rAI=; b=wuls/732I5x7PU
	9j5EjCjn4A+9VIvk6GnVGwUhYNSkp2LV8r/XU0SW1oYAndngJP0vL17D2TfCOTPe/p/jmnD31jB3p
	KwkfVMMuVj5cGO/NftVVD5qy8nrJ9LtBtG4ejf+vF5ugAQ1QmRzTx6wykEi/O4r4i9MKDf0DWLM/M
	RH8zNndckSI5FPEVHVp7yV9EBW+fP37NZ401MH01ANPNn1WI53MwFTzJ2iAkQEvQ3k5qs3ZOK01/N
	yabUhvr/eBvEpE5syoXmlSp0wxiosSJSs8/c3q6QirmWryDxD84JgRjMNwAL5Vri5ZhDtW5L+MkfE
	PvPs4e4BEx+U4nXffhAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh4AP-007dKq-2J; Wed, 20 Apr 2022 06:50:21 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh4AB-007dGO-NV
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 06:50:09 +0000
Received: by mail-ej1-x635.google.com with SMTP id u15so1446229ejf.11
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 23:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+tvOwcHK/pMvEVLplx6yrJ6qPflwR4OLhSkd6EKCLRI=;
 b=ABab4LEiP42hY9yp+atAuEZipBVfsAjqtuxekTR3fyYxLj2YI8sVmtq72lPxbrYdFh
 qYZRhzptItVJ5QRJjLXt8AP+2Af94KpGv6oWML5uxYh3VcPzvduL9jlmM7bIK9kijXKK
 qBG85CFH7lrPzFZ9DSXZUQ2PlOrn0TObElxD/kLZv7u/iv965hXXC81CmDTmWtVaj40q
 Un2PbZS1alXWSTITFNdAMrWzLECVm8PcPuus8FAdtnS8mlRN6yvvZKiUX3uTvR/rg5aq
 +wlWIwdNivWJg1mBg8G7OeIc3+T81h5UOwYAy1J2A14LtouiZ1AI2szTphNG2tPFDVjk
 M6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+tvOwcHK/pMvEVLplx6yrJ6qPflwR4OLhSkd6EKCLRI=;
 b=hW2pmpWb2r9mVlh8VLcOsV9N4WfgFBbJ+xgc5ZdQACOhNOP5hCth+WDX+Q4sE03Fvz
 bb0VOpYLT3QHR4uKZW+L4NiNS1RjBNYMwn8/gOp/1Q/PBwIPU+wrNK3cAeqQF8cUh2tN
 kay97aR7KTDQwedlwWCGWAexWMTTJiHmqCcwWFhdPhP/IMj+9wjbU8dkuI8MKuuoakvf
 QjPCvbPOu2RHuSW0H4TP16FOJzXY/XnD9SMZGxlEHURhMoZSfaX6BskhqIhRzruxMV/Y
 ndOzf+9jJXevgcgEqkzro+oSJF87LWjAYe3sVb9rtnkr4fDjfCHnei3Mhn4FUw+49r9f
 Mzlg==
X-Gm-Message-State: AOAM530MmGRnr31bd0o9vJ+PgmD5+6SrNxGTUBqAzP82RzuE+ltwOuv6
 93Rdmmp4EkFYJ1JWwFyAiuUEGQ==
X-Google-Smtp-Source: ABdhPJyyliRjehv6sbtfEh1xJToY/HkD/2LEVWUqQLsW+zcHi7QShLPq/HedquMqPHFjG/+my/ZNhg==
X-Received: by 2002:a17:906:4c93:b0:6f0:2de:f42d with SMTP id
 q19-20020a1709064c9300b006f002def42dmr1296745eju.648.1650437404769; 
 Tue, 19 Apr 2022 23:50:04 -0700 (PDT)
Received: from [192.168.0.222] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 mp8-20020a1709071b0800b006efc915e1ccsm2144513ejc.118.2022.04.19.23.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 23:50:04 -0700 (PDT)
Message-ID: <958e076f-4567-3941-69cb-69d819de2470@linaro.org>
Date: Wed, 20 Apr 2022 08:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] dt-bindings: arm: mediatek: apmixedsys: Convert to DT
 schema
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ryder Lee <ryder.lee@kernel.org>, Yassine Oudjana
 <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220419180938.19397-1-y.oudjana@protonmail.com>
 <20220419180938.19397-3-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220419180938.19397-3-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_235007_831621_910DF396 
X-CRM114-Status: UNSURE (   8.87  )
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

On 19/04/2022 20:09, Yassine Oudjana wrote:

Thank you for your patch. There is something to discuss/improve.

> +
> +title: MediaTek AP Mixedsys Controller
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description:
> +  The Mediatek apmixedsys controller provides PLLs to the system.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:

Same comments as patch 1 - no need for items here, just enum. Please
also put the new binding in clock subsystem.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
