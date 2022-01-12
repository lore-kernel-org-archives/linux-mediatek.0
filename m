Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE91C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 01:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3f25oady5QacC7rh9sUOcrl+4HtFwtcgZOK+tVcqWU=; b=Mujn2iRgrYNpeF
	cjlOB6ZQaZqZ9RquLVcqkFIuXvQnXcr/qyXbmZBLq5KjEgtQbIh+bBU31SR1uiNKgqgNVg9lbri/Z
	me7F7z75gYKcJ9Gy9nEUr3zWDdnA9tar2wZlgm3jIDvYN4mbi+1f/4d2TP3Nwb/rELH3Yq5TjqS+j
	tevYjzu3ikvhDutXIazdCcUcnyCs6ZP3cT2WHSt1/qDN//u4SUHjI2WStPW74RxZ4/nyUnZyimjlL
	JNPVtOkdORXkTzFLza2pDRD+haTTZ3P7LTh+AIxoiLUm/nyXECYT2lP3tgcRhiMJ6EqXsms3e18d/
	QYbv1NDp3i9HcaVWNYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Sgq-000fOY-24; Wed, 12 Jan 2022 01:44:40 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Sgn-000fN6-5s; Wed, 12 Jan 2022 01:44:38 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 c3-20020a9d6c83000000b00590b9c8819aso896819otr.6; 
 Tue, 11 Jan 2022 17:44:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8FJYBnTRh9rd8jwZmCF0yeW+9K4P/KfA/YEfvfZuWPU=;
 b=uVB0EXabNkI05/ZDwiJwFGu7YdsZZm0Mg/4cr+lYH7/hdJW1iQnXnHkfakJMHcXGYg
 DfIAriIXwwG/ZY4XbntKk1Ek8z/p/d1/Z7BPytsx1pPnh2KiOYL3UHASh8JixiX5UWrC
 mUKbesyUlKw6L3PSXgnGBrkQcEHe9N5W6tEF4W0h2xesquIf/4lepVjIxQIh9k3Re45M
 Zp93MAe9gpDerP/IusSyzRXWk8ELh0IAK9CaMAb6iumarquqI0GVra4mi1S5OJq1vncu
 yc6jLYLluTJQ/nwr1ir+1Fzj9cUKpZzI5uf2f3hO/kYTRXBIkX1CaaPRCwB7bEK43s6q
 GMyg==
X-Gm-Message-State: AOAM532Mrd2GAqtD8PE12K0dTuQbz6fgYQo51HA2OCxiPX5vMlssakv9
 VqvFapqQV0GQvfRXQLBZ6g==
X-Google-Smtp-Source: ABdhPJyJdqYCZBTnyRZAAQSUb2Fy0wPfx3w1meJoDKPyViA5DIUnR5fzgQIssWX4qg5Urx6Twwq+Sg==
X-Received: by 2002:a05:6830:2706:: with SMTP id
 j6mr5193697otu.24.1641951876052; 
 Tue, 11 Jan 2022 17:44:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bn17sm665232oib.7.2022.01.11.17.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:44:35 -0800 (PST)
Received: (nullmailer pid 3889527 invoked by uid 1000);
 Wed, 12 Jan 2022 01:44:34 -0000
Date: Tue, 11 Jan 2022 19:44:34 -0600
From: Rob Herring <robh@kernel.org>
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, lee.jones@linaro.org,
 broonie@kernel.org, robh+dt@kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] dt-bindings: mfd: Add compatible for the MediaTek
 MT6366 PMIC
Message-ID: <Yd4ygpoi7KrzU012@robh.at.kernel.org>
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
 <20220106065407.16036-4-johnson.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106065407.16036-4-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_174437_242925_D384E5AF 
X-CRM114-Status: GOOD (  10.99  )
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

On Thu, 06 Jan 2022 14:54:06 +0800, Johnson Wang wrote:
> This adds compatible for the MediaTek MT6366 PMIC.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
