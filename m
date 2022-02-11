Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747EAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 12:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pX+riui7RZ1jF3bQ0LXdRq4AJylyAtLJaez3SfK0qEc=; b=3APFWKlK0EB8+X
	6SfgnTrL3QYXxSL48tezjdY6yLhlbqd7zbz5NHSBADXEptl77zxasyVzLpHRfnph+YGxEuzbhENcr
	/anA6oPLYQ/PaopR8I2WuSUeLUELjEefcZ+b/eJcGqyz2Bk3CzVW2sWwAVVaARVtfRazJULpH2yo4
	iNvDKD0rczg1n6rlooanW341di2INAFrsP5xtnwCbrpUNrDdcPnk+rqPEFfvmkXAtixQrUjoz7QY1
	e+aN9w39J6cKZbonCek2DF4cF3GNmGvIB40ozBp0eDEpFjufdaZ5qNDc4zt/LNLC8pEQjG7q2sUVq
	lKIrObl8HChg5q3VFK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIUnT-0073Qt-86; Fri, 11 Feb 2022 12:13:07 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIUnQ-0073Pg-PL; Fri, 11 Feb 2022 12:13:06 +0000
Received: by mail-oi1-f176.google.com with SMTP id i5so9345907oih.1;
 Fri, 11 Feb 2022 04:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=cuBlIjJY4vaAWQT/4C6Ak9m1WRcqNbkYIsxGyvkT4rk=;
 b=iu6MVEJHctWuNfiqEO7fLkq7QHJwztv6QQmB1JhlFLNvf9oqE9rEdlJ40PvqVKK+ER
 R/P+I0fjIZzpfby+B8SO6RkHxzb/YsJfx1dWz20020m9k/oToS25gnmPpmxlj5LQvhGJ
 fzzrtwNjBuk0rrBdF5NUYO3nqk/cSpUgmI6ESvqso2kWbWgoqYF8lfWnJBTwBhhO7pRk
 loFZvc8dmrs7JqlfPeQigUKSQeN836i7zjfwYKtSTqO2pJ3emjQ02P/yPBepNOXJf8SA
 CDpk1rw14FbLsgs7V4/bI2Z+Cx2MIm1oT9L+GYf5Rl6nAIXNI7eOz/P8yz0CPoFuG3ei
 oVBA==
X-Gm-Message-State: AOAM5328K7nmC8J+JI8vzo/7mqg08VPkm/IWSt3Hi6jp8Uqn360x1io6
 HlqF02fYMlV6DnzjobJ/Hg==
X-Google-Smtp-Source: ABdhPJwC68NbqlKCoT6iGNdOcPryVMllb8uhD4nbb/rVM94vLoxVJPFWGXcXeY9hjrenDtePrHtmxQ==
X-Received: by 2002:a05:6808:2026:: with SMTP id
 q38mr16779oiw.243.1644581582414; 
 Fri, 11 Feb 2022 04:13:02 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d4:10b7:69a2:33cd:1782:fb47])
 by smtp.gmail.com with ESMTPSA id
 bx41sm6384628oib.7.2022.02.11.04.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:13:01 -0800 (PST)
Received: (nullmailer pid 141879 invoked by uid 1000);
 Fri, 11 Feb 2022 12:12:43 -0000
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, trevor.wu@mediatek.com,
 tzungbi@google.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 linux-mediatek@lists.infradead.org, geert+renesas@glider.be,
 linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
 zhangqilong3@huawei.com, perex@perex.cz, tiwai@suse.com
In-Reply-To: <20220211103818.8266-12-jiaxin.yu@mediatek.com>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-12-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 11/15] dt-bindings: mediatek: mt8186: add audio afe
 document
Date: Fri, 11 Feb 2022 06:12:43 -0600
Message-Id: <1644581563.497957.141878.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_041304_839953_E23B3FDE 
X-CRM114-Status: GOOD (  11.33  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 11 Feb 2022 18:38:14 +0800, Jiaxin Yu wrote:
> This patch adds mt8186 audio afe document.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../bindings/sound/mt8186-afe-pcm.yaml        | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml:10:4: [warning] wrong indentation: expected 2 but found 3 (indentation)
./Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml:14:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1591561

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
