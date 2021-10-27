Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BC9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 20:32:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78CBA60FC0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 20:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 78CBA60FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jIJ7cF1MFOhrhJkwCNfiAe3im4gfqExWEmWKn7mTB1E=; b=jrN8x98qgYpQhH
	Bi9l7mfcuEAFHhQe2w92AT1A26wZ1/9+o52i/lI9aHTK7JuwcCHADhsq9egoI5gURlu65A+kDlWM6
	RrVh50o2rZgiWDCJRIPYj2V4ZrpqBNPTLH9Iyykk0ZAa9522Gw1LpLwDnLFmGgMGjGWQSUVD0ztFt
	sZ0/sP5qK3+WAmB15GBygTBI3prVKGT4VRoCXoFDsW34ZkjsEUlRCey+bLJA3epcMgIJXG70Wi2ZJ
	DuplxkMIZVgFpsytlKEUN1qejPrhqPtWXgACzymcbYR8pa356+DMKwO3mxJESweyZ+OnVAJV3vxvm
	6l4veXtKmr1WCmiQ+EkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfpb0-00647V-3o; Wed, 27 Oct 2021 20:32:26 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfpao-00645S-CY; Wed, 27 Oct 2021 20:32:15 +0000
Received: by mail-oo1-f47.google.com with SMTP id
 64-20020a4a0d43000000b002b866fa13eeso1364754oob.2; 
 Wed, 27 Oct 2021 13:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dCyobkqZQkzSalEez4Iq0YBADjfjqmPa1gmyY2RxB7Y=;
 b=8MRWymZXh5UT9hZ9MIqJ5s1iDtMBrjmoX7tU6luU5wb4UgVfrMxdjrc/MBxNaiA8M+
 t4rT1z5d9Da+PpwX9Oc/MzA4gxuKFUlwkZ4FZ9ZjXJ8glNAnXrEE1zXqeOxw30+cg3B8
 Bxn1bymYIkvItV/yvjfyYzsOzfijItmc5i8epjVoYV9lIPRk+aUIhCi8yFToR/vcufb9
 gKVC+yjipaOqFljEQnx1Jh7gQifapmX0xSXN//h3xGQG0Zds9zUcQhimHSG7oMLU5+sx
 +QbWDvMaMO0sX46/loNK/KNncozE8K14urUafw2522y1se1T2dsqWBOGBNN2KKZo8zul
 uZJA==
X-Gm-Message-State: AOAM531yHXOIxp/aghjXcggLQ0o9rChosrKr0dJ9L31p9klVGst/vNeo
 BmTBYAF/RQ6rWMFPSFptNaVHW1vIHQ==
X-Google-Smtp-Source: ABdhPJzr5mepQbrAdQc0r1ApS1sM4eCK0NSKmmtkdNXQ+AzNpWS64gF5Sod6uTlShQOc1t94rJ5iyQ==
X-Received: by 2002:a4a:de10:: with SMTP id y16mr23677617oot.4.1635366733450; 
 Wed, 27 Oct 2021 13:32:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d18sm364711ook.14.2021.10.27.13.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 13:32:12 -0700 (PDT)
Received: (nullmailer pid 2102331 invoked by uid 1000);
 Wed, 27 Oct 2021 20:32:11 -0000
Date: Wed, 27 Oct 2021 15:32:11 -0500
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-phy@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 1/7] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Message-ID: <YXm3S4u8KAWjJfXy@robh.at.kernel.org>
References: <20211021092707.3562523-1-msp@baylibre.com>
 <20211021092707.3562523-2-msp@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021092707.3562523-2-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_133214_449217_7DB50659 
X-CRM114-Status: GOOD (  13.64  )
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

On Thu, 21 Oct 2021 11:27:01 +0200, Markus Schneider-Pargmann wrote:
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes v4 -> v5:
>     - Newly created patch after realizing that the specific clocks for dpintf were
>       the same as engine and pixel clocks.
> 
>  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
