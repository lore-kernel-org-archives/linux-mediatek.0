Return-Path: <SRS0=2t6o=GD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EE5C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 15:39:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 416B5223DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 15:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 416B5223DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oZFq2G51AoUHa8Dsj6Ic2n4uH827Q69X5ZxoBVcS1s8=; b=oCuRwI1TyhOtFeLRHp0je9lEV
	jwNqvQ5O6krdpHbfrU8jwOqPTmnLb4Io4xkKEixSMI4Rsf7W0svz3b7LbAtVOV0yi02ccK+V2f75+
	WMhczlVPwuT6Bjr6RbaU1apBFSmXzGu/Q6YMj6t6zD9gGXZ6Nbq4qL5aEWfvqC5j6zGTDAcs4HnPM
	Ty3QtLcOdV1sHkIRDsbyVbgIjCQmqOgaKZnVvE5zhackFAVz+Bxja19dlUXbt3b9Y1OlC9JvUsMyl
	FQ1R13Nagd8FILdnzoRx+Ps9KuJzKughrqMH3n85CbtMtDkVB06k1f1+mYOZj52roNWZTKCVkeGo6
	yzPGq9jkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kv03A-0000pY-SD; Thu, 31 Dec 2020 15:39:40 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kv035-0000o8-To; Thu, 31 Dec 2020 15:39:36 +0000
Received: by mail-oo1-f52.google.com with SMTP id k9so4377854oop.6;
 Thu, 31 Dec 2020 07:39:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aqRUTrB98zq19oUfqeTfRGQXti0Kp3OgPKPcu5cHQTM=;
 b=j3Smx6QQ/JrhzImn38MaXdpDLzpq/KqrPD2V0X7Q4G66x52/0iljs+ucMNGEcBwGYy
 fZ1JN7xevKBIl3Dsfc/b9f2lczIoHDPnQjakKVLEOlX8xr/gc2W3OZ1PyzUDe1ey50CP
 aNfqwjM8iVcGiz9SsyxA0gt8S9QZDW9Hppr97rdE+9fKuarxWl/BUmrA28rw8fvMiV0Q
 XfSc/vx4u017jfGulSiFUCNoSlvF66evraYl9weXfXi7e3U1JEdsMAZNvMZ57v6LSH8i
 bRbE5872MsqvWuQfXhE/uDzoMK8HT3+BUF0ahDiUYLsbWMEIexNR0l/kBcqpGyof0YX1
 8Ggw==
X-Gm-Message-State: AOAM5315uAYDBG1N74nU3uTFI0oew57UW10U8NGzi3J7ltRxTZr8iP7l
 6U0nH0WoaHqMGENJAR5Tuw==
X-Google-Smtp-Source: ABdhPJx1uK9oxb1Sht+XTOoCn6qCnv276YFq7AbTWO1nihXVsG+83XjUs8P2ZFTe9vA3Jk0ICL3Vjg==
X-Received: by 2002:a4a:e1b5:: with SMTP id 21mr39831446ooy.64.1609429175023; 
 Thu, 31 Dec 2020 07:39:35 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id f201sm10955753oig.21.2020.12.31.07.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 07:39:33 -0800 (PST)
Received: (nullmailer pid 1836008 invoked by uid 1000);
 Thu, 31 Dec 2020 15:39:31 -0000
Date: Thu, 31 Dec 2020 08:39:31 -0700
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: spmi: modify the constraint
 'maxItems' to 'minItems'
Message-ID: <20201231153931.GA1833986@robh.at.kernel.org>
References: <1608691469-20919-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608691469-20919-2-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608691469-20919-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_103935_970819_325AF9A8 
X-CRM114-Status: GOOD (  16.78  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, Geert Uytterhoeven <geert+renesas@glider.be>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 23, 2020 at 10:44:26AM +0800, Hsin-Hsiung Wang wrote:
> The constraint of 'maxItem: 1' might be larger than 1, so we modify it
> to 'minItem: 0'.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/spmi/spmi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/spmi.yaml b/Documentation/devicetree/bindings/spmi/spmi.yaml
> index 173940930719..f1a26391ffde 100644
> --- a/Documentation/devicetree/bindings/spmi/spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/spmi.yaml
> @@ -25,7 +25,7 @@ properties:
>      pattern: "^spmi@.*"
>  
>    reg:
> -    maxItems: 1
> +    minItems: 0

0 is never right. That's 'reg' not present.

>  
>    "#address-cells":
>      const: 2
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
