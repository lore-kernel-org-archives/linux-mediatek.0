Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17DBC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 17:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kprlY1aiee/vhBS8xJYEYytOR292fjWwlCcy7hGks9s=; b=nBn9XeH304iO/G
	wdB3XwpwpGqksm/OFrczwQj8lsQHyMbb65rI8QVeFXBUefry8nmCaC6nR5bhW7oBWHMF6DaQnUIWw
	MytsWP/ngm/OBx5ZpeysYKyzsLKczJjqxONUwg3hPL0Jp0rOfxFCk3UKWUPrsXckoLqA+dQb9Qpko
	pZBGF3RBYChbyYw3Tq6aEWC2H3i0xNIAkOU4Yb0dqKCARrY3pulxL9iaGqyaWn+48zQKgsYaT3waY
	ByNVg1yQV5qXYMb23pYLYcP0Rd0CC/xV39lNRGcSLgHyKsmuzw6LwoXwNK0a1zbIjeWVoQi5ofi6I
	QTpvmwU4CsG4iLAtcVLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noTY4-003LVl-0f; Tue, 10 May 2022 17:21:24 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noTXk-003LFV-1q; Tue, 10 May 2022 17:21:05 +0000
Received: by mail-oi1-f173.google.com with SMTP id y63so19226235oia.7;
 Tue, 10 May 2022 10:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oMzOMHbyZL+xpBkMzkSynF3FtiNncyHat+FTsJFqJKY=;
 b=PFAeOJtWpKojco/GwXqdK++QJmlY7rjKg/5Dc9gZ2ag9A+nGM8g43oeQVvK0aW5XxM
 bHp7DsDoR54uSds82ip0ZvkOQ+h5OTavzhvS9W8DZjdnbtfLXFGtT4HB1HXF/T00p+W3
 yycsSwc2N6KV8e5tYJRSZy2rfrenKGka5h9v1UE8Ia3X47zwVGSsrCYdbwKIQFJ72P7n
 Sm9jF/U0D0Z2fx1quQBT338JfJ+qVI0sPk4OlMiBxVhM4cLI+v5L/ZZPH8UWkQUkUK6P
 qsy5RvQ7YvZUUVKp6LTS6sn+8PoaF5v+9BKKX+bsYlQ0czkJoM+P4OxEw44uf5HaZIzg
 SW6A==
X-Gm-Message-State: AOAM5305VBpHcJLhkMIduFrJhpvAxZDD/gatgeWXpSl5eZG5c7PzcYCg
 mAT7iHNzGMsIzQ+Pb+HGqNjPbvFQHg==
X-Google-Smtp-Source: ABdhPJznU/OK4X6N6Bam1z+KQxPFq1bK52J+cIR4GOgkdzKpqKmgFPS7YZjpDW22cMbMfK7vuKe6Lw==
X-Received: by 2002:aca:502:0:b0:2cd:c24:278f with SMTP id
 2-20020aca0502000000b002cd0c24278fmr539112oif.150.1652203262272; 
 Tue, 10 May 2022 10:21:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i9-20020a4aab09000000b0035eb4e5a6ccsm6343573oon.34.2022.05.10.10.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 10:21:01 -0700 (PDT)
Received: (nullmailer pid 2231680 invoked by uid 1000);
 Tue, 10 May 2022 17:21:01 -0000
Date: Tue, 10 May 2022 12:21:01 -0500
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: linux-kernel@vger.kernel.org, hsinyi@chromium.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v10 2/4] dt-bindings: arm: mediatek: Add mt8186 pericfg
 compatible
Message-ID: <Ynqe/d2+UT1V8Y+3@robh.at.kernel.org>
References: <20220510075233.5426-1-allen-kh.cheng@mediatek.com>
 <20220510075233.5426-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220510075233.5426-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_102104_138731_586A183B 
X-CRM114-Status: UNSURE (   9.29  )
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

On Tue, 10 May 2022 15:52:31 +0800, Allen-KH Cheng wrote:
> Add mt8186 pericfg compatible to binding document.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
