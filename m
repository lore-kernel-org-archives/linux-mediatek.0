Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1515C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 19:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2BwVwp3y6R4NhvoPG6JCY/runjOvJkpL6qZ1EMg5yA=; b=jDLvQa0IQ5l7HS
	92UDtfLT5E/twLVUIt2Wg7mFXPbcntM6PCty++SnegNX/xFt+A+yYGLgw59pKDE34Jhm5iiQHoLsu
	BuPd8utNimoVvwL1YtyCNI2Ko7Irx9lm3ojfX9LBVHYouPDrkPMaOMAS88iHDQciALxR4O3cBWHKJ
	xxJhpyhlbKzAK9edPJaSxtzYaGpgQJzUQe7NLh2sdr+pPB6aZ6BiNI27NPnp0+21Q0RjOjtwQzUIK
	q7oazITKASfri2eW/wTCHxo/0TXUAWiCcvW0fd9hblYG6UKi/Y9JOjSptUYyKeZ/CE1WsNGXzIgCW
	r2VPz6RSMOGYZ/9cvWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNgKK-006oO2-Cj; Fri, 25 Feb 2022 19:32:28 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNgK6-006oKa-2o; Fri, 25 Feb 2022 19:32:15 +0000
Received: by mail-oo1-f41.google.com with SMTP id
 189-20020a4a03c6000000b003179d7b30d8so7708437ooi.2; 
 Fri, 25 Feb 2022 11:32:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kRILqCarovlsZz7thgDDibtWJZEbIzmqyc2ox6LuLpY=;
 b=t/wAEjKcFgVB+SR0NIm1rb6TY1I/FZTZGZ5HWZz5hhKnjHZ4qFS5FLrmLEP6buAoN3
 ky74Ss3BhtZiQX0HPdbThPqlzQTuVINgMHzHwi3mIN9omI6U52lgFrHWo1B8t+SHUfRv
 iMM5Z5qjV1qBv5yQKhkDPxzPX+XD3891GVGUC6s7N3rc9fxsLXxvLGvo0RptgV3RbZYr
 31QMyD4FJO77AyLvLzb/UvfHg8bM9FElcBl7/6nt+uz162dAeNoMFURB91mS7DguBpvd
 1SzLVpxFmnUU6iqyjq/hgsXChBvTPp21yMLqTaeERhIJI+HZULzwQ0t1Ua4wTXB42tbr
 Jvxw==
X-Gm-Message-State: AOAM530hErTz9ATaIeHNwzskcv78p4MVUad102dhEs7Ba2GN9+xqGg5b
 gVoEYIef4b5KYG6DXGUCXQ==
X-Google-Smtp-Source: ABdhPJzwAL+432KfYz3I8h/Kv7X9CZCjqxcsRfm56jxdkR8gD0rIcbp3XoQRwtlfUGG0WF8u8xo2dg==
X-Received: by 2002:a05:6870:9a85:b0:d6:fb74:eef9 with SMTP id
 hp5-20020a0568709a8500b000d6fb74eef9mr685677oab.50.1645817533317; 
 Fri, 25 Feb 2022 11:32:13 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 a10-20020a05687073ca00b000d128dfeebfsm1652359oan.2.2022.02.25.11.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 11:32:12 -0800 (PST)
Received: (nullmailer pid 1296393 invoked by uid 1000);
 Fri, 25 Feb 2022 19:32:11 -0000
Date: Fri, 25 Feb 2022 13:32:11 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Yaniv Gardi <ygardi@codeaurora.org>, Nishanth Menon <nm@ti.com>,
 Avri Altman <avri.altman@wdc.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-kernel@vger.kernel.org, Li Wei <liwei213@huawei.com>,
 devicetree@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Stanley Chu <stanley.chu@mediatek.com>,
 linux-samsung-soc@vger.kernel.org, Jan Kotas <jank@cadence.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH v2 04/15] dt-bindings: ufs: drop unused/old ufs-qcom PHY
 bindings
Message-ID: <Yhkuu/cMDl0fMx/8@robh.at.kernel.org>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222145854.358646-5-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_113214_145134_B127F615 
X-CRM114-Status: GOOD (  11.22  )
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

On Tue, 22 Feb 2022 15:58:43 +0100, Krzysztof Kozlowski wrote:
> The Qualcomm UFS PHY bindings are documented in
> bindings/phy/qcom,qmp-phy.yaml and the compatibles from separate file
> bindings/ufs/ufs-qcom.txt are not used at all.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/ufs/ufs-qcom.txt      | 63 -------------------
>  1 file changed, 63 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-qcom.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
