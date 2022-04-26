Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58BBC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 18:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3ZmdSlsUX4RkSFHdS+lAjsETFQlL29f+csjaIvHpwg=; b=gwzi/uBrmZyz0i
	lt+ECv5A/w9SQKcR84K8biWQUqZGYpqa8B531A6s9Bo7Ulc+5azkkI8C2fS+EGZDFTZBhmKXo8HF0
	xWh66FXAuTMPxqZgcbq4dtgFD+W0eR/PZwDp29ek0yHnP572CuVRPjAy5jpo/5wbTP6benZy8W18V
	nzRCAxWi6EZ3YX2h/ua44Nh3agUom9aMv4Cr+5vNn4ZKkLw3hNW+fKigei/GGohNNOEtV9lQ2qSj/
	0LhW59WEYy9KY6pDA3CM5v2d5pXzFbj5Egio5c00h+M6wTi10v3ib1cBetgxxy66K0TlytHFh8nb7
	wtDXIfhq5NT95pBWsPKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njQ40-00FlwJ-Im; Tue, 26 Apr 2022 18:37:28 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njPrb-00FgsG-JK; Tue, 26 Apr 2022 18:24:40 +0000
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-e922e68b0fso9174555fac.1; 
 Tue, 26 Apr 2022 11:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CvMUDbRmBMULaPrSvy29y8lkb941E3y96qWPYQTdY/Q=;
 b=s5WTRRpq2geAECiAfRCEB57FNjlIx6ksoLIICKPWzK5nqRDrBQ3mEvuWqCgVB5m1xY
 fOwAfQ9qvRfM0e7ARAJHUgnI6fjVCszsNLrQzlRxh0IKQpFk9952w1rTjlyLC3bmmS1D
 HnZTrkChEwFZhyp4dL0kKCxh5Xkp/8z0kgr3CQCVzymrOSRkkuPkXBR2VkKSV9RCe09N
 Cs4KmhCx+EMfuOA+AB1IbeO7jBiQ2kWm1zfrQjsTnaPdhGKI9yXXeMYGDHSraqx+5t/U
 WXZziFNCQX8ExtYBlDS8WwUPAvlySaLlpTIEzvfRZEFJoV9TJiiNGBCi+FTHZEBGTL71
 YEmA==
X-Gm-Message-State: AOAM530UO+p4rRYaMS6HZTFT7qDgwNoL08OWM1mQ6as3fmIUabxlD1Mz
 hcb6GdLt9Yf5nFCDb3IyGQ==
X-Google-Smtp-Source: ABdhPJzKDpE4dIDRP2/fyRgrEUEF3RYpW6ouwQg5y1NvFIfAwEReF5gm9xUP3qw/cFdBm6ItJeP73w==
X-Received: by 2002:a05:6870:51cc:b0:e1:e6ee:448f with SMTP id
 b12-20020a05687051cc00b000e1e6ee448fmr9706297oaj.136.1650997478038; 
 Tue, 26 Apr 2022 11:24:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d10-20020a9d51ca000000b00605522f0739sm5225378oth.41.2022.04.26.11.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:24:37 -0700 (PDT)
Received: (nullmailer pid 2303384 invoked by uid 1000);
 Tue, 26 Apr 2022 18:24:36 -0000
Date: Tue, 26 Apr 2022 13:24:36 -0500
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: hsinyi@chromium.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Ryder Lee <ryder.lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: Add compatible for Mediatek
 MT8186
Message-ID: <Ymg45G1QkKY9KkqQ@robh.at.kernel.org>
References: <20220426125046.17311-1-allen-kh.cheng@mediatek.com>
 <20220426125046.17311-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220426125046.17311-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_112439_664045_15C46408 
X-CRM114-Status: GOOD (  10.49  )
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

On Tue, 26 Apr 2022 20:50:45 +0800, Allen-KH Cheng wrote:
> This commit adds dt-binding documentation for the Mediatek MT8186
> reference board.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
