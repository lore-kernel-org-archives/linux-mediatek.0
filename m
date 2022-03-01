Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68032C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 08:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0psbjQWxZq+aCnXgs1KI1EJe6HgogFuuyYTQtR4PrAE=; b=0NxMY4KL3lAIu2
	GtNBg/f15YWaa0TZyjPK+qg34XioIi/WAvVWhrqJFeYURT+2n6TpCxLia08iow87OFxs7rJRreuW+
	uCY7ilqCKj8aojmIh5LNUcbYHtfhEWZctDL9J+YarLpkwq7j64zhAr6VgqMkDMa00CxZSbJg1IGJt
	5W621qAr5Plr5sCQijpeGpvWEV1B9DQmYPrx+MtsIgKhTolqQzmBM3N4E2KfRKP4g5GjPWigBnovz
	5NkBGL4VNuN6587jzLWTHyh3on79VeCy4Kr2jZeFFliD3saMTblZ+4b9xxy3A9RaM2Fd7l1fYpjaP
	xhBl45xNRvhcUbKFoGow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxkw-00FZGs-K2; Tue, 01 Mar 2022 08:21:14 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxki-00FZBC-1b; Tue, 01 Mar 2022 08:21:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 a13-20020a05600c348d00b0038188b8bbf6so682532wmq.0; 
 Tue, 01 Mar 2022 00:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WRV1hdzmbVPmI+jsxWeBooUP3dqnp9gF+cD+vHx37cg=;
 b=lEGyrOVqShVwDCrP9OwQ1wqH3cNhSwBY/RA3nyTHSWosd9CKRn65WtXZkGQIxXOoV2
 3tKXfWL+tYQeBRGzTUeyTWlNqgQsYWUO5hM/p15NNlT7RHT5fJEZfw1k0R7squ4rzMLq
 oLGc7DkzAZ9e1MGlYGb5lkZMcrBTF3ggW7O4mMeZk2FoLk8CVkGWPQ8e8bgUFghAfwYc
 x0LucXz0ANCrW27dz0uKocFaL8UAd0CMQ78/kutKJz9cRPz6Xvq+9XHA2WWiOfYNh0v1
 58rCuFQmNC6WpBqMFTXBPXKPnow9bFSGJ6lRb465rGuqL5lS3Jqd++IYHGNeOQ3t3Bw3
 fELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WRV1hdzmbVPmI+jsxWeBooUP3dqnp9gF+cD+vHx37cg=;
 b=7OWm+R8M95cRt9DBz2k5n0MSqDBDwvsgpbHWzZh7OdIMwwJBXmHmG6stf9CbHX1c0T
 WHR98LsvmKnpLtML1Yamu9jm/OtlkZrFGQkFizUupHssCNcesB43PtmhskgzN00foO80
 2qT8NUH/IzcWKIk3S9SIcA/GAcdN18PbcJ8FB/iRoNM4Y/j1g8rAlyeN0LOJTlrZl5Fl
 dM3qyvZUW3Oi0vCAQdhFqybpY0Se+vULn54VYZUUPFE2cgGxE7V9MR2qceA4QHuULiwY
 Xs/vTrv01SHlg6NzpCs8d5f3322VY6jdOTLgRzOHlAILwLlcchAj1J74qZJxox0Xt6kk
 w7qg==
X-Gm-Message-State: AOAM5322D+JfQC0Jmc4mQszOMHQMEUkLKyQy0onNjAyzfQsXObQo0s27
 AfHzvrHrazTyWdLT+SKReK94PYnzYp6nNg==
X-Google-Smtp-Source: ABdhPJyCpmc78vN+pezWK67t1FYNLGkgoN6qM29kWj+87E3PvpdqVAibBMsy8mhmLh6JcdkxKJsYfA==
X-Received: by 2002:a05:600c:1c1c:b0:381:45b4:3f69 with SMTP id
 j28-20020a05600c1c1c00b0038145b43f69mr11293245wms.86.1646122858205; 
 Tue, 01 Mar 2022 00:20:58 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a056000100800b001e30ef6f9basm18395498wrx.18.2022.03.01.00.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 00:20:57 -0800 (PST)
Message-ID: <ea9ce41d-df1e-bec9-1c1d-e132698684ec@gmail.com>
Date: Tue, 1 Mar 2022 09:20:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V5 1/6] dt-bindings: arm: mediatek: mmsys: add support for
 MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 jassisinghbrar@gmail.com, fparent@baylibre.com, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220301080105.31323-1-rex-bc.chen@mediatek.com>
 <20220301080105.31323-2-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220301080105.31323-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_002100_126696_71D54279 
X-CRM114-Status: GOOD (  12.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 01/03/2022 09:01, Rex-BC Chen wrote:
> Add "mediatek,mt8186-mmsys" to binding document.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied, thanks!

> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 763c62323a74..b31d90dc9eb4 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -29,6 +29,7 @@ properties:
>                 - mediatek,mt8167-mmsys
>                 - mediatek,mt8173-mmsys
>                 - mediatek,mt8183-mmsys
> +              - mediatek,mt8186-mmsys
>                 - mediatek,mt8192-mmsys
>                 - mediatek,mt8365-mmsys
>             - const: syscon

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
