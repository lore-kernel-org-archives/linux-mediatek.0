Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EF2C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 20:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iogvmUnJd8dmsaSSNLjme6YVFLdDC5DcESiDlQNvEto=; b=WcQJp7Xndb9fltYTLkNyHxQXAR
	BvwZBzdGMyPLPHIMqK/TlUU0RiUOhj3pBKDwBtnTy+p4Es4Lr3RQGAYH/zOXdvna3EgtyWzmWnafq
	jheu5UQEUs0zkkHmxbB/2FeJBwiLFiiyClAeH7ux+lUmehTw8S8sJkYqTaFOyiNIo82AQmQKO6P6t
	bIpCL5EeOCRbMXOvV9DQe4renkaAPD6ZHxgpbCOpI4zR0Cu3hQ0bWXlx1u+V364i+BTCfVFT+P2S5
	fPrkfJLCWBkvgPVBRxqqoAlyqBsKZJ7rqavd4paemqqsNJkrZi0WI6GZwBaXzDOEtrt4qKq8HdzYg
	XvG4z+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zR0-0073iS-1B;
	Wed, 07 Jun 2023 20:07:10 +0000
Received: from mail-io1-f43.google.com ([209.85.166.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zQx-0073hU-0a;
	Wed, 07 Jun 2023 20:07:08 +0000
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-774867fd6f7so277550739f.1;
        Wed, 07 Jun 2023 13:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686168425; x=1688760425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iogvmUnJd8dmsaSSNLjme6YVFLdDC5DcESiDlQNvEto=;
        b=Z+ydpX4f32qPvleggjsffNT7i1iFvEhLb2tUa91Dg1SfvxczGamS5L7W4F0gLdVJ62
         Uc9vP6fg4TY8AQNREvq9HtG4Vu+dDFAWxjgw6SMz8V7OcxncxqSSUTM+j5/L2jWr0rE9
         Gn9BXRA7Ur6+nxvSY+VB5QGbOtdAN5KUSzVs9sWMB8dcgLzLiMAGVBONMeia9r+Sqa3M
         CT0epEAdZyiJh2nFxF6VOsNdGxelOkmiS7bE0HBqZQug15eIx9Xr/Jg0wtsmxED/7kw9
         cjzFjwg3amVvcJsuh/4bglcH4fA8bbSmDFlYsYXKkTnS+JZ4ytUQAX4Il4NFCk4tJrJY
         563A==
X-Gm-Message-State: AC+VfDyrGuIHfUbJARtSA7LE+La34qm8BIjPuvCf44uOpK7dvIFj6vhc
	veVVimJQ6qhvTh1FWXIIQw==
X-Google-Smtp-Source: ACHHUZ46JdCGj7zOlcTNqaPq40ycCIzsjr+132rAb0aIBqKMNfw1C0R9C7iRukbcfvmXUK7kyPj+eg==
X-Received: by 2002:a5e:834d:0:b0:778:82d1:39a3 with SMTP id y13-20020a5e834d000000b0077882d139a3mr7724530iom.13.1686168424958;
        Wed, 07 Jun 2023 13:07:04 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id y11-20020a6bd80b000000b00777b3bfc406sm2218699iob.49.2023.06.07.13.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 13:07:04 -0700 (PDT)
Received: (nullmailer pid 3936319 invoked by uid 1000);
	Wed, 07 Jun 2023 20:07:01 -0000
Date: Wed, 7 Jun 2023 14:07:01 -0600
From: Rob Herring <robh@kernel.org>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, mazziesaccount@gmail.com, linux-kernel@vger.kernel.org, mailingradian@gmail.com, j@jannau.net, geert+renesas@glider.be, conor.dooley@microchip.com, angelogioacchino.delregno@collabora.com, lpieralisi@kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, me@iskren.info, matthias.bgg@gmail.com
Subject: Re: [PATCH] dt-bindings: arm: Add Cortex-R52 to the list of enum
Message-ID: <168616842047.3936246.5750632673120649061.robh@kernel.org>
References: <20230518152730.82954-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518152730.82954-1-ayan.kumar.halder@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_130707_216628_32F25EBE 
X-CRM114-Status: GOOD (  10.31  )
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


On Thu, 18 May 2023 16:27:30 +0100, Ayan Kumar Halder wrote:
> As a pre-requisite for porting Xen on a Cortex-R52 based System-on-chip, we
> need to add "cortex-r52" to the list of enum.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


