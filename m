Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC664C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 18:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaemP1XrXXg6smvlpbj+/HGqR51jspSSkIvsRr/7Mok=; b=J78W4BNaEeH8Bu5rmIZjDFunrJ
	hpBaSoujDBCBY+E94IMxgeGmQscK/xXG1vXHxr9t7fJ769H8OCUwkLHJvJBVPk3OdVmel6YBP1HmK
	voZxxBlAhZ6jD7pxUdF70MtKf6goCJJysZsLtpQIKu7OLH9ocElNKoTRlzIRsjJ9R2Q5go94G4c9H
	pFnw80NcD/J7FOyz4x4265p4HZkH6mmZxzjMN0+pw6tq1gU04WCnWnJYPjrk7mF4l/eTd2vxVkFS1
	ATYjec45Si63vKU/yctNXkI7p+G0z+5VurgvBCeqktRDuAFIWkTY3UOYSTI56HzofOy57aB9WpjrF
	xOjMS5Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohx7s-001k8T-DM; Mon, 10 Oct 2022 18:03:40 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohx7p-001k7Y-1e; Mon, 10 Oct 2022 18:03:38 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 70so10418095pjo.4;
        Mon, 10 Oct 2022 11:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RaemP1XrXXg6smvlpbj+/HGqR51jspSSkIvsRr/7Mok=;
        b=UXz1IztGv0MJRf/rNTh2fpKfswkqZf2u2PfLFPmQI2KD0qi6IYKkdPs2gj8sCJwsta
         oqMQ2NZm6ZLCaMSei270ANMuwiCQH4mYhMKUY2e5F1AdeX3ZvnxFP/oxrnAvpc9wypQ5
         +31Iz3e09rAmjtOFEbrSgcAJViWRMD60lfzJVHaEOOL3qPYH0vau15r/YbtuIYlWGdm3
         RzTD7bVE6gh3p/+kbbBFYVygGy+yL1Dd3ewfHB7SNynYghMSjfOw3GWp6atXRdc2MvdX
         4DxeE6nQJRxOXTtgeZ8YdM/KQ07dAUqX2leMyxRRqVEHkdeu6v874tl/4VBPJt6VFFuR
         Yp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaemP1XrXXg6smvlpbj+/HGqR51jspSSkIvsRr/7Mok=;
        b=wDOKs9ZJPaKopD4abQUQn/TI2G+t2ftf2OJeSVkLZTHS+AgTZSWa/N8c5GfoFf82v1
         ish2xpNPvqFL2Y7tk+a561RP5eqEY5deaqOoCQtJ2qlSEAWCTAZqJB8Fu+hC0W7bnQhI
         dJTbn6hyDxVhyvwkvqdysfWdxPrGAXsRW7kAP4MjprXKZowD5Vb2MGz2MwTeluWKX6OB
         aiI+qwb7tnZ0ow3n5lwwxRIPdLPYbCJcZFM+0LCdv23sxFTOyQ9r/4BlavORazEC+hz5
         /uXnjFC33Diw55Jdp0z//DFlU1D6ZTFXkTHhEgvB/kw2nqOI9A2OJ5kuTswhYjkzsz/H
         c/CQ==
X-Gm-Message-State: ACrzQf28hJEMbLh/HkOEdNp7FrafOWfTNOy/3fowCF1FVQ4r+h+qk/zs
	5KXhqShPV7D3tLP1Ck5AmNY=
X-Google-Smtp-Source: AMsMyM5EqKg0p76lXgbaT9WekyGmD9TCKMXS1H1yWX1MAOjXpyUCSUkDV0/qx9p5b5T8vQJYAtSZWQ==
X-Received: by 2002:a17:90b:388e:b0:20d:4a1f:d5ae with SMTP id mu14-20020a17090b388e00b0020d4a1fd5aemr5658239pjb.51.1665425014041;
        Mon, 10 Oct 2022 11:03:34 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:bff:9bd3:c2da:5f42])
        by smtp.gmail.com with ESMTPSA id 24-20020a631558000000b0045feab454f6sm4639268pgv.51.2022.10.10.11.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 11:03:33 -0700 (PDT)
Date: Mon, 10 Oct 2022 11:03:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: input: mtk-pmic-keys: add binding
 for MT6357 PMIC
Message-ID: <Y0RecjEx9Eyhe0i0@google.com>
References: <20221005-mt6357-support-v2-0-f17ba2d2d0a9@baylibre.com>
 <20221005-mt6357-support-v2-2-f17ba2d2d0a9@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005-mt6357-support-v2-2-f17ba2d2d0a9@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_110337_104552_7CC900BC 
X-CRM114-Status: GOOD (  17.07  )
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

On Wed, Oct 05, 2022 at 04:57:22PM +0200, Alexandre Mergnat wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding documentation for the PMIC keys on MT6357.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please merge through MFD with the rest of the patches.

> ---
>  Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> index 2f72ec418415..037c3ae9f1c3 100644
> --- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> @@ -26,6 +26,7 @@ properties:
>      enum:
>        - mediatek,mt6323-keys
>        - mediatek,mt6331-keys
> +      - mediatek,mt6357-keys
>        - mediatek,mt6358-keys
>        - mediatek,mt6397-keys
>  
> 
> -- 
> b4 0.10.1

Thanks.

-- 
Dmitry

