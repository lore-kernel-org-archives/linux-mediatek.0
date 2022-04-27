Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A12C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 18:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJ+qNZtNN7+3XAHor3xISOr7K8pHPGoxHDDXwO/0sDQ=; b=qaV21DP2J1mRd7
	WjMvEFtFGVGI0fDYSZDNn2NUwoW5vXQfBax5X613MRGiTk26i2dDB8e64qdyQ8Sk6OSZlMl1IPL8h
	dexgkPSdQD6Y/0JiBERB01TT8P9SzQVOTUTXBH1engQckeRMEaVqESC5fL4hVr1Hk51Eo7t3w9VOg
	nBe/mbbw+QA881UFgLK1oUcFV7OVeGgv+YvonHrITI6ztkUsuiHWLRzCMyRiZtJPw9TeEPWr1axbV
	Q6MzpLhkVwP47YcPv6Tst5st3MMDA1JIHlhE8DwQoZVcNnc8M7UHstT61NqRvfOmJSK4RXWeOwCcX
	/WMjZkssQCaiWtlrilZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njmQs-0031ra-Rw; Wed, 27 Apr 2022 18:30:34 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njmQ3-0031Uf-QJ; Wed, 27 Apr 2022 18:29:45 +0000
Received: by mail-oi1-f172.google.com with SMTP id 12so2860263oix.12;
 Wed, 27 Apr 2022 11:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vjPJA+HsT3O8e7pT007nOpwyAA0Fc4ItG808mQNfBcI=;
 b=Era6dAEZZZAkuTip45dmokXE5H9wLmEIs+tNdzKBLxDetLQ1nNwBl/bIP1OAXxBT/2
 hJPorugSDPKNcvCYniXpEq7ng3QP9LtmmPsDrqKgFM3UQfaRhNOGbui1S6NTaVp1jxot
 E+9VTrfZui1VQ/KRJqZmsylrKG5uCmWsJKZAurvkgUWJE1F3+RlmRr9P3VMx0CxifTq2
 iB9w9TvYQPoST34A2VtXBAZQvw0sEO4KiPeyefHMhUM8kjwibdqMBGlV6NkQ8/QfR1tN
 uesF7tTJaDfKzY3HQuRZZ52VHa3JiqJDkpfXycPkLyjfCXFC96iS3hpkC8pzBrkc/Z2c
 ZY3Q==
X-Gm-Message-State: AOAM532QMEhZfBy4JaSX2dWad98AgIkJLVGMB9BROCSFLuwB8APqNwBj
 MpuPpg6Z4ydHdMLi781Yhg==
X-Google-Smtp-Source: ABdhPJxZ3SeCvrv8dS2qxIX+0bcfLBlYMQ95fdA79/7DvoLxrCcOHN1VHc6+L5T34OAY+/zprWp1dg==
X-Received: by 2002:a05:6808:11c9:b0:2f9:b01b:17f0 with SMTP id
 p9-20020a05680811c900b002f9b01b17f0mr13800053oiv.233.1651084182549; 
 Wed, 27 Apr 2022 11:29:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e4-20020a0568301e4400b006054dca5442sm6229280otj.28.2022.04.27.11.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 11:29:41 -0700 (PDT)
Received: (nullmailer pid 414596 invoked by uid 1000);
 Wed, 27 Apr 2022 18:29:41 -0000
Date: Wed, 27 Apr 2022 13:29:41 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Gene Chen <gene_chen@richtek.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: leds-mt6360: Drop redundant
 'unevaluateProperties'
Message-ID: <YmmLldJcJ2tOOCO7@robh.at.kernel.org>
References: <20220426133508.1849580-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220426133508.1849580-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_112943_915236_D0519A13 
X-CRM114-Status: GOOD (  10.27  )
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

On Tue, 26 Apr 2022 08:35:08 -0500, Rob Herring wrote:
> The binding has both 'unevaluateProperties: false' and
> 'additionalProperties: false' which is redundant. 'additionalProperties'
> is the stricter of the two, so drop 'unevaluateProperties'.
> 
> Fixes: e05cab34e417 ("dt-bindings: leds: Add bindings for MT6360 LED")
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/leds/leds-mt6360.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
