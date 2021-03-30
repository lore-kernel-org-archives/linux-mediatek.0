Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A04C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:01:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88B44619A7
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88B44619A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zLoyh5x+lcBiSHed7nfCTRSjnvhQMPJWGZy6oV+1IrY=; b=m/Cgq31jNUaunSwtbSSNJcxZm
	0MZWiaLVhgq1R+Scvb8lJ+G+Z22Kt/cwd0+2mkrfjRYeHLqIGP/1Hr9xM8BJHXnq436XfpA33RVPH
	frJ18ja+dOmq4rzuHFYhSXTkchkt70ttNfyTVrf8C8sV4XG46dwW89/iiqVFOZtjBS95WL/pMy5dP
	OKGrb8c1ea5JqN/eIv4f1KNXSxHHxdBAGF3ixia6z57ECjz6HlB4BEPUXlm2HAuLZzGLaxIXCAHE9
	tTDv6NXTMH9z1G31ORbT797UKflnAQaz/oxtgkvYyvm7zH8sSVq30BMij30+NgEuMSD4gvVuqILL/
	emxAVNT3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRBBB-003KWa-CP; Tue, 30 Mar 2021 10:00:57 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRBB8-003KUx-06; Tue, 30 Mar 2021 10:00:56 +0000
Received: by mail-wr1-x434.google.com with SMTP id k8so15628635wrc.3;
 Tue, 30 Mar 2021 03:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/OWdtssKXgIS/+aSy2WIqZQ6CLWvQMHzZY5qZ+tnkf0=;
 b=JO27lLB7x9tZrvIhOSdWQz+73oSPwtJusWq99CFR+AkWrMEa3itDADmvNzED8cGBGf
 eI6V9iyS1Qesg+IF9Jb+ZDqgtUF85MWgDvQw07uQB6OUdG3opquFEa4wHCRY/MeJoSHq
 qhRXUj24/KNO7hTjAlXB9WLbeK5Lpr59mTWJ/l5S8SOT9m9YP74ATWtf863aCB6u74f1
 DZf5NsikuLk5iV4O6SWfSw5D5kMR1izrqC/uPfdVCIGn2Dq0SRxsWeLaa2478kpega7x
 PQCbjsX1r/AXbx+hqI8CQ9d5zfjTSPg7ygul5k7MuH0axKXeDNPjX2AgXarujvpzbskp
 ZzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/OWdtssKXgIS/+aSy2WIqZQ6CLWvQMHzZY5qZ+tnkf0=;
 b=aNsubCN9gk1rDBG5bimHHJRv4avumuisFGULK7JfJFyiZNbkwdGuJAgrDSYkwG/o+8
 ulfzU1+e4n1Xxr5kUmvNJLPV+qKF5dlp+mSgGS3oMkIOfmvEpLT2bJkOTSu0Dg8+BD/y
 LSC8flaIzzNawlZsq+EEL10+jexp4XJQe+gKxK+YjTjc2bH3ZUpE6sCjwCLkHLRZPoxm
 WCOeTCsdV9iKo+aY22rZGOkMrcWzzZ9W1G3Y2/TF8LpP6cQBOjYwULWToCabTy0RnZWV
 IiiKAmCASv/2pZ08gPv0eW7R7M+LoQYqijdGitS47fIzypuP8COjbsz4g5pg7VkskpO/
 i2/g==
X-Gm-Message-State: AOAM5321pUs0QK9cvFFMS7MvFGUkIs1ZG+8nNgcYmolzVpii+XiY8Aai
 fPq8S3GurJGA5Z2Ue/qgVHjtF2mBYCY6hcAr
X-Google-Smtp-Source: ABdhPJy6+7wu9rLrhuijj+YjhwYpn19FhS7/B87uWaI8puF70viFHrqgpl92ju2nKTHiGQ69LNZ84A==
X-Received: by 2002:adf:ce8a:: with SMTP id r10mr33005493wrn.17.1617098453573; 
 Tue, 30 Mar 2021 03:00:53 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id g9sm33159038wrp.14.2021.03.30.03.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 03:00:53 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: arm64: dts: mediatek: Add mt8516-pumpkin
 board
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>
Cc: mkorpershoek@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20210223223613.2085827-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <56a1fbe6-2c87-e01d-768d-b956237c9f3f@gmail.com>
Date: Tue, 30 Mar 2021 12:00:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210223223613.2085827-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_110054_180174_5E5D5648 
X-CRM114-Status: GOOD (  14.89  )
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



On 23/02/2021 23:36, Fabien Parent wrote:
> Add binding documentation for the MT8516 Pumpkin board.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---

Applied to v5.12-next/dts64

Thanks!

>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 93b3bdf6eaeb..366a753f64ba 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -125,6 +125,10 @@ properties:
>                - google,krane-sku176
>            - const: google,krane
>            - const: mediatek,mt8183
> +      - items:
> +          - enum:
> +              - mediatek,mt8516-pumpkin
> +          - const: mediatek,mt8516
>  
>  additionalProperties: true
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
