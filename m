Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A968C388F7
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 19:02:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7DA5206F4
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 19:02:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n+aco9Eh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7DA5206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g+EeioY9zAWYpnULsaFdgYuPQUVBLOd6bt2ALGJvdM4=; b=n+aco9EhexJGFaMp1bUNwfBLl
	QazMZAqo4aHXmGiNqsAcMSGrxfdir0Cn4bdTn251HaJgF/ZPvopn9vyGO7eFnwwNmmLdyp1hsrDyD
	sgtgX5oZFz1djb0gIDF3pxw+Lds3ffegB2j5nSEW1LG4aWIhAibQeFDmcerqsCczWGCSGYeqIVCXn
	bMGUJOywSvVSgxlVY2NvSfW0hmR4YlZ80ASjAPbujS/FRdXTT1Pg5sJWTCBc/WngFjne08wFx2VcC
	ndGHp8iwAoyHRtmSpCrm2KPgEL0LdmSVYo8X2IgOU0f9ozz8HamZpzagzvW+R74pDA4KSI3QHBmM6
	5+nu07iGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kakWt-0003kW-O3; Thu, 05 Nov 2020 19:02:39 +0000
Received: from mail-ej1-f67.google.com ([209.85.218.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kakWr-0003jp-6k; Thu, 05 Nov 2020 19:02:38 +0000
Received: by mail-ej1-f67.google.com with SMTP id k3so4124438ejj.10;
 Thu, 05 Nov 2020 11:02:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XFm1g1EiYzBluJLGmisV7ILMFqrL/YClqVXss+qbsWg=;
 b=N/owiJJAgeFzgIcG7nI9OKDesCtA1/w5LNQTOtwD7ZpZHiONCpY6Nmu0yNw0NfThzg
 2OoBicIpiG3sfH+jh4nEGzsPFrx4jF5LOyb0kO2e/EqdYqMF2cFY+M8NXP8tgILbx22c
 Qjrei2JRxJZryqVizZ8Ca8IA7U2vE8Jc0IZZ3g2/lR3y2sw88A+kHA7/HQ2tOleqMJpR
 ppsG/tdJpJc9HyItcz0hIh3UhwpDcYBu+hCiY3SFEj71V9NYHPzCW76UYKs0oDgmje71
 Hjy+25TiA/wb3LcoqJ2SiF5fggd2qGIDbwTVE6X1MPO7t1cHv+0uF0pdvy27hrqjVDPJ
 qA+A==
X-Gm-Message-State: AOAM530Ko1E58Mv4V02YyiRA5BVY3A/8Yp6QlRDt/dwD3Q/yR80n4yA5
 w4WmxCF8BDzt/ywGw/8VhjU=
X-Google-Smtp-Source: ABdhPJzaVwqw3472Feq75GhrSLPXU+RBfAY2Wt4c7vyClo62jBznXUBzGPV0Go9B4PQbXHib9moZbA==
X-Received: by 2002:a17:906:3a59:: with SMTP id
 a25mr3935249ejf.546.1604602955646; 
 Thu, 05 Nov 2020 11:02:35 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id d11sm1439614edu.2.2020.11.05.11.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 11:02:34 -0800 (PST)
Date: Thu, 5 Nov 2020 20:02:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: memory: mediatek: Convert SMI to DT
 schema
Message-ID: <20201105190232.GA217610@kozik-lap>
References: <20201103054200.21386-1-yong.wu@mediatek.com>
 <20201103054200.21386-2-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103054200.21386-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_140237_267070_CAE4812B 
X-CRM114-Status: GOOD (  12.42  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 03, 2020 at 01:41:58PM +0800, Yong Wu wrote:
> Convert MediaTek SMI to DT schema.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../mediatek,smi-common.txt                   |  50 -------
>  .../mediatek,smi-common.yaml                  | 140 ++++++++++++++++++
>  .../memory-controllers/mediatek,smi-larb.txt  |  50 -------
>  .../memory-controllers/mediatek,smi-larb.yaml | 130 ++++++++++++++++
>  4 files changed, 270 insertions(+), 100 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml

Thanks, applied with Rob's tag.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
