Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44DCC4741F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 18:39:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BFEB2078E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 18:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="18nhjDNb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BFEB2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m3QjDuaMyDh3QzzJlp6DlpxFG03JmK5MwGrQ7K/+8vA=; b=18nhjDNbDW8JVwN/uaG1rUyKs
	78RSR+4kmM8Q+G/tevgPzE1hEqIyBsaEx8fkSQj6CjxtyTnj9iDGZlMPwREzSOvqyFO/Z785WfX6s
	y+rNeXwJQSlH4YR7RHb4Izc5Y3c0/ztV4mxelRuS2FStBy+J3VLIaez/9ZuOo4Ac/4RvIEyuGDIrK
	ITZQnltUAh1N8w5lo0IReBSOQHnk5Z4fxaAoqgiNOeLbKWW1KP4mumqS1xfw8/LYQ5/pty1Ba/bh2
	4Yz5WbMVzgPuWQldv0t+RXSaP/1bl0bfLG1f4LQbCDF1ARz7zECWBq/1vlTIcKzTpaKaXYH3T/WrV
	vFv6L8CGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kakAT-0000dH-Qv; Thu, 05 Nov 2020 18:39:30 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kakAP-0000cP-9z; Thu, 05 Nov 2020 18:39:26 +0000
Received: by mail-ot1-f65.google.com with SMTP id 79so2358355otc.7;
 Thu, 05 Nov 2020 10:39:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oPwP/MMeCFhUmSj7N3WE3Z62TN2tMAgfxgbJBwkddp4=;
 b=AplO89tlFR60jo5mesGjaslKYdjV3l28UvvPtfVoHBIDbsCfiroY9+Y1fcHvhoyrlF
 cxordxhxvqlpA1bLMv5y+Ot2WVJxurFYzhuui7x8aHXdAWbfuyezZNyE6kN++PrOzCiq
 GE9f15mH0c2KaZ0E0aJPUGppLQvxCIe1a2LW3ITKQfzjoE7r5qFfAzzVAHEkCs0lCBfS
 moMZ6mym4R9AwmyeqhxEwM17hDD+T+F4lD91U4bESZfbSxl90ZpaylKBee+rM1kz+owq
 GoX4yPWxHUPlQlII0IPhZEryvfQLlVfKif38YpskQQdlgwaBSDQfiGuXsc4b3If1TASe
 0pYg==
X-Gm-Message-State: AOAM530NcIdP53xtrVNSIZMeNNVr7tlsw4GeCg9fRFFOtu0Oixnoq3ei
 8KgVC4Kyd6ib+iDkeqHo/g==
X-Google-Smtp-Source: ABdhPJzRBgP5+/f3MDZQcsFSgW1dFGhtocXexNDBCjlPVJJSHJJGb717wfAecWqYjVCmXRQb6VMRYA==
X-Received: by 2002:a05:6830:1dab:: with SMTP id
 z11mr2479004oti.247.1604601562347; 
 Thu, 05 Nov 2020 10:39:22 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j3sm556796oij.9.2020.11.05.10.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 10:39:21 -0800 (PST)
Received: (nullmailer pid 1607749 invoked by uid 1000);
 Thu, 05 Nov 2020 18:39:20 -0000
Date: Thu, 5 Nov 2020 12:39:20 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: memory: mediatek: Convert SMI to DT
 schema
Message-ID: <20201105183920.GA1607689@bogus>
References: <20201103054200.21386-1-yong.wu@mediatek.com>
 <20201103054200.21386-2-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103054200.21386-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_133925_376009_3E9DD5E3 
X-CRM114-Status: GOOD (  11.86  )
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
 anan.sun@mediatek.com, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 03 Nov 2020 13:41:58 +0800, Yong Wu wrote:
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
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
