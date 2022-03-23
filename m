Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5105CC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 18:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBKpoEgm07qY6eehzwuwhVD8Hlh0GWZnosekok8gXps=; b=AMuVIx3v8KfPv7
	opiLdWdjCALZVu4nu5waPq6ZllcepmEa4W0ib/aRcSnxKIUT6XjPDkD8q7lW+GzE7BfETdcG9DDce
	jz+PwnPKjb+WAbePlRuK5h+G2NOV5SuZePQGxxyxk8qs8hW5yru4V30WOLvUQ+q3ahBJOd3+f+FH5
	+dCe0Oz8dh1ofDeSN475ZZwBLNpq1SdkCJtnVncD4DivFk3MG6FPgdBhwWwfi1jaxanzaV4+cy5L8
	YbkGyN//xKE7PwF+FkEHQ2zKEeQrkjOnxqWoJCwQGkSbf90df7Rgs2YbG6tM7CCHdZY9hW47itFXe
	TOZEbcX2Xst6Emr5pBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX67W-00EdqJ-Q8; Wed, 23 Mar 2022 18:54:10 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX67J-00Edlp-Lw; Wed, 23 Mar 2022 18:53:58 +0000
Received: by mail-oi1-f173.google.com with SMTP id b188so2556723oia.13;
 Wed, 23 Mar 2022 11:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=B4V11ArPsY0ZWyGU1/ks8Bjgl91EV/yBP3SM7+CsE7s=;
 b=SojgWed28299I0cRwGt5SsR5V8Y57pyV7Ua602WakkIfYqW4I8ss6GyayB8eGyfZcV
 Om379h5S6upIIy6M6U/wB4aw+1Md5fcJR3cajGmVkSbpsHqLDh694E1oL6BmproonL3/
 LKQ21NLopVzhePObahcEZaNes9HIDaF1X+MsRGl3yyf+GNU7gsPmuPx0yQvtr7QAvC4J
 u9dmZtOQlhsmp+huV+YkqnaV2FkJ5CAqUAEm/cONAe0s1Duvyyojyz0hZp5eniwPrVV9
 NUJVPRhfN14LABHOeu7ISnGQasxAT9ANyt0WQuj11AACw3KNep4N2WFWSc9GkM36rQIe
 4wqQ==
X-Gm-Message-State: AOAM532gIYBxzrKGZIh5CUSskEeZR9jvcMyK1Svkn+Pzjo3zkkqSGg/p
 3OsnCFc4ehiJNwBnNGcRTA==
X-Google-Smtp-Source: ABdhPJwjNndSTRij/JUQZ8o87qWbf5Cqh1rl38niEfGmp+g4CJRSm+R39jvT+Au1cNer8GT/oHXfkA==
X-Received: by 2002:a05:6808:1b12:b0:2da:28e1:39f7 with SMTP id
 bx18-20020a0568081b1200b002da28e139f7mr782701oib.289.1648061636800; 
 Wed, 23 Mar 2022 11:53:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p18-20020a056830131200b005ccf8ac6207sm307608otq.80.2022.03.23.11.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 11:53:55 -0700 (PDT)
Received: (nullmailer pid 251847 invoked by uid 1000);
 Wed, 23 Mar 2022 18:53:54 -0000
Date: Wed, 23 Mar 2022 13:53:54 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Sean Wang <sean.wang@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 3/4] dt-bindings: pinctrl: mt8192: Add
 mediatek,pull-up-adv property
Message-ID: <Yjtswk8gU1n1eVW2@robh.at.kernel.org>
References: <20220315211936.442708-1-nfraprado@collabora.com>
 <20220315211936.442708-4-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220315211936.442708-4-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_115357_740623_B2A9EAB4 
X-CRM114-Status: GOOD (  10.40  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 15 Mar 2022 17:19:35 -0400, N=EDcolas F. R. A. Prado wrote:
> Add the mediatek,pull-up-adv property to the pinctrl-mt8192 dt-binding
> to allow configuring pull-up resistors on the pins of MT8192. It is the
> same as in mt8183-pinctrl.
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> =

>  .../devicetree/bindings/pinctrl/pinctrl-mt8192.yaml   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> =


Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
