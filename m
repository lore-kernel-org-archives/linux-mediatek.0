Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AADBC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 19:36:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10FDF22513
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 19:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10FDF22513
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F7eVeIOAK334gRpMrhuQBW1Fi84b7xTkeUTNzsYn1mA=; b=H2qhJRjf1OQXpOoBTz1GKbMYr
	gqXT/w6C/7qEvK4JwfjO0U2TEZ6f8atpT0vJNKt7McWQPunAEcUV2nStAF1W42hQLxUwYOAHqQAjx
	zkIDSIZiIVN6Wm5XUf4ZHkIXtIHsNSWteYbEh7NuTykNN5LKRT8wJEgywJMJze0p0YryNUIt56grV
	cS/RoyYRXyUPFWzhrJpQZY9p4lEb5jYZBIQPM8nRkr/6wIUFgNqmkrpTevT8NS+o+WkjS5uVp75MT
	hcRDMF3vvy1+CSKsXwl1ydU44cKWFLKFSsHPpSiZQEZQrU+z0bdEsZ/evKBjxLVQKfQmLuzGC0v03
	bB05XBc0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l47fB-0004nb-DP; Mon, 25 Jan 2021 19:36:37 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l47f9-0004mv-Ox; Mon, 25 Jan 2021 19:36:36 +0000
Received: by mail-ot1-f49.google.com with SMTP id n42so13906294ota.12;
 Mon, 25 Jan 2021 11:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BqRRksk+3G/r1SIptHOITJUnap9kkWd8tCAejk57+/w=;
 b=qP7eobvAxT0r5/75jOomvR4BTh20S0xmHByGPqJDj/yyrEc9PP1ElUurohGr3wuZgD
 YNvFu3x+xl5IAZB3Ia95q4bi8XZMAiO5rEYuOaSGv6nHXdmepyD4VeZTXpQjXcp5zuHT
 6uK8x+VU6GloIdNkEi/4tis8m0LmvwfygU1kZLgbzgSC6C7/qut4h5Zgo94E8t8NxNie
 2fqwAsQBAJjxCfEH+sjhgPG5FloAlwALFYQsggz1zKYDLIo018VRtH2RhCfOfsHYrvfx
 j1YSFHhJAO5UuPXkxrhelvKskz/iEkCcjz1kYSTtHAzIaMBnV4NpEbYSWMHXUIPL73xt
 p0rw==
X-Gm-Message-State: AOAM530CrpVW7gIvCSD9J0nrLWt908HJ96TeExYbAVzLfZgi1JZdOKGW
 +gpDyzKiEKflMgXu/OnaAg==
X-Google-Smtp-Source: ABdhPJzlEW0dIRUFPrRvLWdmFeuR1WWHyjf3aQ+xypxGsQfZC/kKhBP3Saz9yuCGB7AFW3Nx6YZPOg==
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr1527569otq.157.1611603394687; 
 Mon, 25 Jan 2021 11:36:34 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l110sm2623884otc.25.2021.01.25.11.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 11:36:33 -0800 (PST)
Received: (nullmailer pid 830912 invoked by uid 1000);
 Mon, 25 Jan 2021 19:36:32 -0000
Date: Mon, 25 Jan 2021 13:36:32 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v4 3/3] dt-bindings: arm64: dts: mediatek: Add krane sku0
Message-ID: <20210125193632.GA830825@robh.at.kernel.org>
References: <20210113110400.616319-1-hsinyi@chromium.org>
 <20210113110400.616319-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113110400.616319-3-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_143635_833569_9790DE2D 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 13 Jan 2021 19:04:03 +0800, Hsin-Yi Wang wrote:
> Krane-sku0 is similar to krane-sku176 but using a different panel
> source.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
