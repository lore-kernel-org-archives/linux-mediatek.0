Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC26FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 18:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXxFWit2i0X14ivvopjggSCLZIyqjXitDgOrqwiAyGA=; b=cd1lmSGkIStfzh
	P7rgdtL6FaKFl2+hbVYtu4XrYe+keODjUHLrCz2uudkuFuEF2E8lMG1p/DtzcojxdC6WKpHxk/IvA
	yUdFEI1MJnY3opvnI/YbbJ9hYcPZN0T4PLl+ftXgh11m+v/tev1UVpOQPb0olUa8XBoaY+zpRQ7+K
	ZN3xeE1EzpEX8RMDs5MAHTY2emJQDCcQEzkYkBOwTwAl8ojpynTbYbQIpZ3rgYDSOqYlgnJlmMB9a
	s+od0+wm1pr35iv5CTbsLkpaaaO/QuKKVlS7HANatzU5UKJDILA5D8VTgW/7ris9EqlgaUS184Q9y
	+I5C817NpwCz+04GguKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njQEW-00Fpgl-DM; Tue, 26 Apr 2022 18:48:20 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njQET-00FpeO-Eo; Tue, 26 Apr 2022 18:48:18 +0000
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so7638711fac.12; 
 Tue, 26 Apr 2022 11:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ttz5iN0TvNdjWEd4hEUb+jVX0qC+pWXJcgQnjnfIYWw=;
 b=hloEKsVXUvibtCo5jQqg9nIog/ff+w92M7+o2E4LedqzQPdAPX/PK3u+HJ+0o+tGdt
 RFDckR/4Cb0s5er9Hcc7MOTaa3RaoFMY725AlJQm3mPQ9hORhGIWRJhjU0SKU6eDx2d9
 AqyJsJgJI+lavteA9vJWydAKOO9we464YSJ0n/FQJ0M9Gq+gYyspIgbSK2eJLizcU+lG
 HZT14j/w6i5h/PYABYLjT8aPHIHtfFqhflZz6CamChlh6AjaME2n51kJHrO1ukD9fmdT
 52zg7CY42tLcO3D+6mi301RhOctsxEoYYsFA1hsTpIx443fxGD+VsO+eL8ep/uUdcXxc
 zp/g==
X-Gm-Message-State: AOAM531mqYvO3nYx2E2lhtT6KBnyG6LJQ9dDZUU2ub9Ci2Q7VblooWPt
 TBztckMFNZVYoirq1Rv/Ww==
X-Google-Smtp-Source: ABdhPJypHAPkwkyLPzMGSjlzD5vSYoYbqKCnWoCG0SmPVI7ccWto1ocJxBrpGkYFYFA5bRk8hXvL7w==
X-Received: by 2002:a05:6870:c5aa:b0:e5:8e03:d40f with SMTP id
 ba42-20020a056870c5aa00b000e58e03d40fmr10251405oab.264.1650998893902; 
 Tue, 26 Apr 2022 11:48:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e18-20020a9d7312000000b006054dfa7eb6sm5128438otk.78.2022.04.26.11.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:48:13 -0700 (PDT)
Received: (nullmailer pid 2340564 invoked by uid 1000);
 Tue, 26 Apr 2022 18:48:12 -0000
Date: Tue, 26 Apr 2022 13:48:12 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Yassine Oudjana <y.oudjana@protonmail.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Ryder Lee <ryder.lee@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: arm: mediatek: infracfg: Convert to
 DT schema
Message-ID: <Ymg+bOwe3g2ngUHq@robh.at.kernel.org>
References: <20220424084647.76577-1-y.oudjana@protonmail.com>
 <20220424084647.76577-4-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220424084647.76577-4-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_114817_535199_119B9AF5 
X-CRM114-Status: GOOD (  12.81  )
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

On Sun, 24 Apr 2022 12:46:47 +0400, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Convert infracfg bindings to DT schema format. Not all drivers
> currently implement resets, so #reset-cells is made a required
> property only for those that do. Using power-controller in the
> example node name makes #power-domain-cells required causing
> a dt_binding_check error. To solve this, the node is renamed to
> syscon@10001000.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../arm/mediatek/mediatek,infracfg.txt        | 42 ----------
>  .../arm/mediatek/mediatek,infracfg.yaml       | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
