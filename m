Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDC1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 19:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrCGS8CLuCvs15F5yiLa0rhnQ/Ov7hu4zJBAq2Sm8NU=; b=XAlwQdElGJBh1L
	Jxqu9k6NAn4uVovEvE+jzhX0AYGVrOa7rTYx65erPbzmreNfQObvaSx00OAbt0OJNcd6PDZCE53Hs
	11gIt7rn8iSkEwTQYM6AbBP27xSdxB8xYOHWMsJzrDB8KJb2vZzGtRcCWZJrfpbPvoiSw0sf+B8+F
	f2waiqP8RWysxAK/osdRoCrhNkVg9EM4mkHIPccL5NHUH8ew1vxtcxZhctoDFyacv/lSTRp/LaJ0V
	ZluWyKs5xQ/JQ3eagXfnx94i1wyPH+oOE9dDo50NizwIJ5QrPYHnrHg/GWY6nZZfXxAkb52vWczNL
	h8IJ4mcOF+fgJG6oB8gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNgF4-006n8k-Fc; Fri, 25 Feb 2022 19:27:02 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNgF2-006n7i-C5; Fri, 25 Feb 2022 19:27:01 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 k9-20020a056830242900b005ad25f8ebfdso4305724ots.7; 
 Fri, 25 Feb 2022 11:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d4ZYSRW1dAUfXWRROJzyzdU8p+UwgSZW2avfzTgdLkg=;
 b=BGRH70BLBX9ALXN/LzDguWhBBzVg5Mg7XVjSfxt8c32F6BqEWf7NjRjw/qAjtn1mYm
 R1r/POeGAH37YkIPmXd7y7v0FwFP4eYYKxYmjF6f94DVZUatTQtDYeAegEGm+ttSkFmG
 5KeHdLHkWGsdlXUe4qldgLDIk8dUu3PHVPIOn88ehj7M8Y1TcucLYQKMfgKE2f6DVMPp
 04ehANi9vqy14W/2biuhsB8+3a4xdesWUmjFj8dNd94hS3DYe9ySMmhSLpwSVRk56r14
 iANJXGZm4U0ZZg3k8y5jY5x/M3X3ldYBgGw085kBgrWmKVak8dWsb3DmlkR+bXO9PfWZ
 yf4Q==
X-Gm-Message-State: AOAM530xOKGi5gKlgwQTDa7umds2drXUYEQtJUGG1bp6jLL3XiocseGd
 0xufb5zzMQZL09xMYPyuHQ==
X-Google-Smtp-Source: ABdhPJyOvYxoHLRFxKgWDc1DweI/wNLPky/0k/5i7fDXZ+qQxiY2uSCuUbWDlvOvGLxWpeCxGE7TKA==
X-Received: by 2002:a9d:6c8e:0:b0:5af:5113:1bd9 with SMTP id
 c14-20020a9d6c8e000000b005af51131bd9mr3493550otr.86.1645817218931; 
 Fri, 25 Feb 2022 11:26:58 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 x3-20020a056808144300b002d4dedfc1ebsm1887396oiv.20.2022.02.25.11.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 11:26:58 -0800 (PST)
Received: (nullmailer pid 1289030 invoked by uid 1000);
 Fri, 25 Feb 2022 19:26:57 -0000
Date: Fri, 25 Feb 2022 13:26:57 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Yaniv Gardi <ygardi@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Avri Altman <avri.altman@wdc.com>, Andy Gross <agross@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org,
 Li Wei <liwei213@huawei.com>, Nishanth Menon <nm@ti.com>,
 Stanley Chu <stanley.chu@mediatek.com>, Jan Kotas <jank@cadence.com>,
 linux-scsi@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v2 02/15] dt-bindings: ufs: samsung,exynos-ufs: use
 common bindings
Message-ID: <Yhktgf/IKHIPjr56@robh.at.kernel.org>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222145854.358646-3-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_112700_436196_60AAD39B 
X-CRM114-Status: GOOD (  10.04  )
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

On Tue, 22 Feb 2022 15:58:41 +0100, Krzysztof Kozlowski wrote:
> Use common UFS bindings in Samsung Exynos UFS to cover generic/common
> properties in DTS.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
