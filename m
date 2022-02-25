Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818B1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 19:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzs6rhdqNM5t3+EkRhiaiTZeJwtz3vV9Em2U4hj4czw=; b=RKyKXMwMYFNrLv
	kbquS1UpkneTJtQfF4I7Xl1S9q4ffBOYZVLvzQfTTZX/eGmdrjH82Vzg5ql0dsfrNKOnd0Bilu15p
	K80DjOpNrUEGV3GI1LyQDlFOtfDTAjz0qPFUFbSLwgl61QA4MgPbw99PkqfqB5XWe/L1hmOWE1OGa
	WcCS3G8591wkk6greem3jWCUMFICila4l/ZtPonp2JnDjI6WhIx3dmYBP1zMHkjY2xR20L+iPgzPw
	YcVludW5yRngJgch0oErWXZmApy+1fuHD7/1cEJYbW7u2mR4R6crascLHvLRKghI0P5P4aPF37PbP
	T5gAYfdsj2fX7Ks3pBDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNgNG-006piI-CL; Fri, 25 Feb 2022 19:35:30 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNgMf-006pPM-1f; Fri, 25 Feb 2022 19:34:54 +0000
Received: by mail-oi1-f179.google.com with SMTP id k2so8396081oia.2;
 Fri, 25 Feb 2022 11:34:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k9v5qtATzrOvXz3YN1ZWcwAzzG9N2l4CYH652u8TC4g=;
 b=XQCj5qKTmhTrXUNPA8llP4fXyToA6rb7RWYHtPz3AfuUwtN6pGbLc5Idcnu3Lp73lE
 1f4FjRz6hrOolNgznnbvpMw/Mv7cDhV5jaoQljxaBXJMhXWdc1ETNmZ6xIzaD6/eUqvm
 xeBlWe7js8sp3kocioK95+1oIZvhj7qcbT3Y+JT0NZC9jmEqkgWT3lPYFjoXiluSfjDj
 7qsqKrKFxuWDFMt6DccWKd3BSDTl8DR6VnUpWFVqffxrzQ30K8Prom9voZ6w687omEkv
 NTrA1pbj9M1WFWKLJ9dsHW0RHt4pMDVl3N5KxidV6wLUH1JtOiPr5/8dJTun3n0zR0zF
 QD3w==
X-Gm-Message-State: AOAM532EG2JccI0JXEv7JlZ4kWqEhw26p6bzT6kqlK92OF3MwAW2yM4j
 YjxXdEKfXqmhCwT/Ywuixg==
X-Google-Smtp-Source: ABdhPJybpWDzjQJF9jGKPuCSK7Y0n1/VK66YoKWH8RCWHvU/F08Ob/+b5HLss7dQ80Wqhgfq0p9WxA==
X-Received: by 2002:a05:6808:1983:b0:2d7:7fc:9e9b with SMTP id
 bj3-20020a056808198300b002d707fc9e9bmr630387oib.133.1645817691671; 
 Fri, 25 Feb 2022 11:34:51 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 k22-20020a056870959600b000d277c48d18sm1862982oao.3.2022.02.25.11.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 11:34:51 -0800 (PST)
Received: (nullmailer pid 1300868 invoked by uid 1000);
 Fri, 25 Feb 2022 19:34:49 -0000
Date: Fri, 25 Feb 2022 13:34:49 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Avri Altman <avri.altman@wdc.com>, Nishanth Menon <nm@ti.com>,
 linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mediatek@lists.infradead.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Li Wei <liwei213@huawei.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Tero Kristo <kristo@kernel.org>,
 linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>,
 Wei Xu <xuwei5@hisilicon.com>, Yaniv Gardi <ygardi@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org
Subject: Re: [PATCH v2 07/15] dt-bindings: ufs: mediatek,ufs: convert to
 dtschema
Message-ID: <YhkvWWMq5X3/gqzF@robh.at.kernel.org>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-8-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222145854.358646-8-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_113453_125622_FA950B89 
X-CRM114-Status: GOOD (  10.35  )
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

On Tue, 22 Feb 2022 15:58:46 +0100, Krzysztof Kozlowski wrote:
> Convert the Mediatek Universal Flash Storage (UFS) Controller to DT
> schema format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/ufs/mediatek,ufs.yaml | 67 +++++++++++++++++++
>  .../devicetree/bindings/ufs/ufs-mediatek.txt  | 45 -------------
>  2 files changed, 67 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
>  delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
