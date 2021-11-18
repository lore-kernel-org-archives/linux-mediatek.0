Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBA9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 23:58:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F17161179
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 23:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F17161179
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEGYw32baXTipy3S0omqqPFydJSWWM2d2DCIdGC2qz0=; b=acV1g1Z/qFHWWQ
	gSsCa5jcqLIUQyr4xZuobLUiRuThrbeZiIdeOsu0+/up/zHOkc/fG7GVRHxxIUvrYPMh1TjMF+UJC
	qQdrfYzLl09iOG3D4wIBDqlsAyuvIu1RsBHI8zNVZmns1CubLxQIDwpB7+7Ss9Hf+1j7hVZOkJmRg
	c/EbPVHGPQf+0Ut+Q27MfZ6Oc698LR+zGSHI4Biqf7xSxPJFnze+GvHmqWIoKlpb+8+YbwFyDrxyB
	tkdU14BbBCKvB8zZe0DvN/K2CxHAp0f3nYtgsCcx+bR8oU5yHqVYctiUgSJpGSN8jP1eZtSCVyU7n
	peadhVP2lgsluqzmaxiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnrI2-0093mo-E9; Thu, 18 Nov 2021 23:58:02 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnrHz-0093lj-IG; Thu, 18 Nov 2021 23:58:00 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 b5-20020a9d60c5000000b0055c6349ff22so13882043otk.13; 
 Thu, 18 Nov 2021 15:57:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qQyw+OaTCyqoQUmDfKtk9AzuInHEGGF+maVbryFDHIA=;
 b=jSGavUAOWtIALtT+xKY87/4qE4yh8yFlSNsFV8Tx2sQqCOJaYtVIAbweBvWxD3amHA
 B4utinoALT4pWVEjRSLu4IJJDn1EXl6lPknWlLEsOb/N0szXb3lMwce9qrhH72Xnfrwl
 +LCL/2+baQ/LB4C9KuAH6kveIZC0TM8YwtXdpB5JEkM3eWcSK//ZhHNHUNDlftur3kPp
 7kJbLAHF1u+fuPU/GW9gEL4SbHXkLykNaulgV6UR1fEXFCMCIaayg/K2jkBOzoIS4U5v
 6Lidz9Dz7JR2xvW4QqQH2XliaFI/kN53CJ+mJriV0kuPnCU8AUxE4UUwTkyWOhXoqZIN
 ErEA==
X-Gm-Message-State: AOAM5309sl73nA7XB9dZ7eZgduauEDWA2+IJX4Ega1I6H8Zi0ukZ031u
 qb7/MDcQBMgQs2thmpfY73vrAGblhg==
X-Google-Smtp-Source: ABdhPJwh+xGuBd+uVwlGIC3te+m2L839boD/FFHCle5bUHDD9E0Ar8ETMfzGYzg5H/s9IF895MwqhA==
X-Received: by 2002:a9d:7758:: with SMTP id t24mr1025364otl.264.1637279877876; 
 Thu, 18 Nov 2021 15:57:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k94sm253141otk.40.2021.11.18.15.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 15:57:57 -0800 (PST)
Received: (nullmailer pid 2028838 invoked by uid 1000);
 Thu, 18 Nov 2021 23:57:56 -0000
Date: Thu, 18 Nov 2021 17:57:56 -0600
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, bgolaszewski@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: mediatek: add mt8195 pericfg
 compatible
Message-ID: <YZbohHqctULU4Qu4@robh.at.kernel.org>
References: <20211112050811.21202-1-tinghan.shen@mediatek.com>
 <20211112050811.21202-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112050811.21202-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_155759_627160_FE6B787D 
X-CRM114-Status: UNSURE (   8.69  )
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

On Fri, 12 Nov 2021 13:08:10 +0800, Tinghan Shen wrote:
> add mt8195 pericfg compatible to binding document.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
