Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B32CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 18:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ggv2N6wGpkeY0hPi+hFSQeRJf/IVjqQhfZHFIQAlWk=; b=xJyuHBYkZepvX9
	bvBwi7YAYPG057wIs6V69KalfunhlaMDd1bHTs7PQU6AeEXsPtlmrn0BOfHSJighH0j8kDaQjmauu
	FN3Q0ZcAD3xSnAr9h0jqCahJQcYMOvCaz8sjVafE3uHj8HKCB3LOObpxFqAYPn+2TfakNFyp4eQYb
	/VlJlE7zGg4G/U+RorXcXSuTS+tXw1rlIuy84w4OiXjfNNXbVxYaamt+vfWa6Qe3dtGOJOlOyKDXw
	wLeKeY1g8zslgAtRpeRIUrL2ZckGgld6EsQBuiLXwv86dIYtPl0UZtzcPpFbM7Sh/7fGTtWKh0woF
	tA3dhcYXj2sFGtR2+4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPTMI-003jY8-DO; Wed, 02 Mar 2022 18:05:54 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPTDI-003gWL-99; Wed, 02 Mar 2022 17:56:37 +0000
Received: by mail-oi1-f173.google.com with SMTP id p15so2443919oip.3;
 Wed, 02 Mar 2022 09:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E3aLsuOfCBsmhkChGf2s5GrLLwWKZp2uk4wG0Gade0U=;
 b=yrGwK4NL/j+wTgRSpln6nGe2odTqMffOTVleUDReK84018NOtczLKfOP9pHSZdoHdS
 VTRlkpT3IAF1mZhy1f7cXE+JuMercJ3MgxFS4Tei8PYKHttFM5bGzHJiBpe5EeZqYHFh
 cJoAWJnUHIlFHKziINZV1AZQclXYEKdAY0qfl95ZSkhWm/GF5u60ZizyGone+Sme+tJ7
 rIUXM2dzi0MzWBZX1dgozYH3XnSI5jYqQ3gQXB0aNcccR4K38kySbegndci5XIzhBCvS
 4ZfrBxMjmGXnx3nLEroxyxHTBGqcFOo43FnarCKUWz/5orlp81qSWVHmADVo9JvdyFTg
 Ba1Q==
X-Gm-Message-State: AOAM530RGKbJ5E4yXw9ATBNK8/GJWumGg1hwCr6xH/gM65/4ktskJGoJ
 vMrk0RHKZRWjCouVkVOKbA==
X-Google-Smtp-Source: ABdhPJx5jKaOBRFjXcTFqtVUu1dRgqLuIVrt3JNSatECmDWjNWPB+YHoXUcLyUWMPIRIFGq2lqn0UA==
X-Received: by 2002:a05:6808:179d:b0:2d9:38a3:2eb1 with SMTP id
 bg29-20020a056808179d00b002d938a32eb1mr952293oib.25.1646243794834; 
 Wed, 02 Mar 2022 09:56:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 i2-20020a056870c1c200b000d7355852b3sm3753152oad.19.2022.03.02.09.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 09:56:34 -0800 (PST)
Received: (nullmailer pid 3962631 invoked by uid 1000);
 Wed, 02 Mar 2022 17:56:33 -0000
Date: Wed, 2 Mar 2022 11:56:33 -0600
From: Rob Herring <robh@kernel.org>
To: xinlei.lee@mediatek.com
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 lee.jones@linaro.org, matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com,
 allen-kh.cheng@mediatek.com, rex-bc.chen@mediatek.com
Subject: Re: [PATCH v3,3/6] dt-bindings: pwm: Add compatible for MediaTek
 MT8183
Message-ID: <Yh+v0UaXqdYWLcm3@robh.at.kernel.org>
References: <1646199106-26879-1-git-send-email-xinlei.lee@mediatek.com>
 <1646199106-26879-4-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1646199106-26879-4-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_095636_378397_04800D23 
X-CRM114-Status: UNSURE (   9.74  )
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

On Wed, Mar 02, 2022 at 01:31:43PM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of pwm for MediaTek MT8183 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
