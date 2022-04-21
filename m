Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7786DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 21:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9zNqlkn9dtbyTjQ47AQxoN0iAni6v1hFXAz7JxiIXQ=; b=U8fgYfAbofHnxK
	VTLigKH7NieSVPt6fHaQ2clpWNK/bocd/HpBrIdwn3468kwZPrfFsDklxWv+Itgts8t2s7LrX0/8R
	qWGgvRcoscYRalVP21N7TGFqkPD6IqC+B5cFXPM4fgu366HHGK8L30zjZImh5Wwp26EtCevxU0giP
	3/Rb+kFGafOJIGQdyOEkogaLz9FXS4O4lODgJthkJ7rUCpVVCQlnOl7F7rOxWaJtbXslUU6a62+mR
	Sv93YZnXCzjJ+3eDjNNupT2XYh5L/liRf2oNQyYf1yyoDLTMPMyaqTrvRavCf85rUqMsyk+7HSwk2
	yqLIkEwBlQOWj3bbnuEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nheF8-00F1NU-3K; Thu, 21 Apr 2022 21:21:38 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nheEw-00F1Jr-C9; Thu, 21 Apr 2022 21:21:27 +0000
Received: by mail-oi1-f177.google.com with SMTP id z2so6972674oic.6;
 Thu, 21 Apr 2022 14:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kCJdiFVySz3ZBRZQEgE+lVkDnd9MX7+W0ULxHOPXzMU=;
 b=f5u4bcsHCeUiOZ2RHzax2N1PV6PYmbE7zkOprqrx/KbLb0oj/upW5K/+hXgMwZ4sUp
 ZG5RERJbPGvaQc8cn80uYYpuXS7vOYPssGFSgPqzFjc2+8N+4fP1xh9thUNXObcyKcm4
 cpr0wMw2cH6wTS02ORJx3GiE8l4qMYL1xsWI65zi5ZgXsxCAuxdasoKqZGKu09zYY0uD
 BSkLem9j4hFHndQgmXE9/9T0g2eVnKVDxMww7StqkTyi6O0GWc5QpfZAT6/G9U1tUyAh
 iBMpeU6IOiLZLC+HCaHM8u2IFW77o+yjIKvBw2BY7qF//oq7+ZtgqXzeSHCvn8DBLh88
 bDpw==
X-Gm-Message-State: AOAM53063xImT5d73YKWzx2ORvQyQTWt16V2o9jDUjVLRH09nz19+Ton
 j6vvcynWeABHE+bTFUWSQg==
X-Google-Smtp-Source: ABdhPJwhfeGFzzUge0j3Sk5rX41y12JDOFWnU6XMEigRK/9G2DBGOowqlmfresqtc9kB3YLSYXGyaA==
X-Received: by 2002:a05:6808:1189:b0:322:3293:4b30 with SMTP id
 j9-20020a056808118900b0032232934b30mr728919oil.277.1650576084612; 
 Thu, 21 Apr 2022 14:21:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 oq12-20020a0568707d8c00b000e2deaf9a65sm22415oab.40.2022.04.21.14.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 14:21:24 -0700 (PDT)
Received: (nullmailer pid 127292 invoked by uid 1000);
 Thu, 21 Apr 2022 21:21:23 -0000
Date: Thu, 21 Apr 2022 16:21:23 -0500
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: matthias.bgg@gmail.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com, benjamin.chao@mediatek.com
Subject: Re: [PATCH resend] dt-bindings: mfd: mediatek: Add bindings for
 MT6360 PMIC
Message-ID: <YmHK02g1pC19Oyh6@robh.at.kernel.org>
References: <1608779989-9641-1-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608779989-9641-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_142126_431124_28509F47 
X-CRM114-Status: GOOD (  10.40  )
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

On Thu, Dec 24, 2020 at 11:19:49AM +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings for MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6360.yaml | 69 +++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mt6360.yaml

Applying this old patch as "mediatek,mt6360" is used, but not documented 
(causing warnings). Please send a follow-up patch adding the child 
nodes as promised.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
