Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1A1C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jun 2022 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DdFVjFAzevebzNmpa+4AFJzArD2HmWEjU4HDwPDCiE0=; b=BPCR97Fx4mZvCW
	fg/HMBCLygM6o+ol2nNuBuI3UdDdt0L00ifF74VRo6En3/uTBcuN4diEDrQlG4BYqJ3cWrLaNF4T/
	6bL9fzPe80LchXgasmJM1AYMsVkM+3PskfNwlrA3d0SglbDo/lSsOGrDMfFeRufkaS/vMshPRSIyz
	IsBvnRlD+OrCrCuk+XTvsie4nQTphOEC+1A1o95QDlt0l6PcPrquC7HXDXO5ITwjk8gWxHE/EQwFn
	SB/9T6Pna2V46IuUtAIN6e7HWfbwb5dIOpzW9MfUy7mcZBfTI7npv1pFhDJ3MOkMdE3hiWUJbhi7B
	+5bJ9orl8DOSgTbgrWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxrth-00Eiek-AT; Sun, 05 Jun 2022 15:10:33 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxrte-00EieH-Ha; Sun, 05 Jun 2022 15:10:31 +0000
Received: by mail-ot1-f49.google.com with SMTP id r14-20020a056830418e00b0060b8da9ff75so9075706otu.11;
        Sun, 05 Jun 2022 08:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vsn+wMa185J0sI9/4wU0hnhDayhYBgTjtmFx6XMmTGo=;
        b=jXbYWENwgNaUFd7B0Cjzn7B+9ugomcQpR+X3DBPnT1q3TDHB+evwl0eKeQCg8oPtao
         pZd9UPUoJlUztUQKgvrCTozbbumU9ZdlfpXM8D6zGCaIKs+fmc9JlCQFnr8+Co9O4PBf
         7usYDk12MxHZe/QmAPHRiG8CDLNlHY9OGBieRNgHNOaNel4bH2UUNUD70Z13JnVA0CmY
         /+U8tGlvGAY2eHJ7yWIMG6Cf24XsiaZPuSOUmHYfiwruQABNMsw6OLwC4x6ec0yLL5mL
         YvnMD7Ya7ImokyETQnYVmAEoQ7ecvn7zZ8+Wu6K5n222kmoLL1A7cxDIH99CTy+gumM0
         Qe1g==
X-Gm-Message-State: AOAM532LIOF3544khtmCyIKZQnR+rakYgw94iw3fqPykp6oAXrmfExf8
	P8+JAyPfjyqZo1rFdkyEQQ==
X-Google-Smtp-Source: ABdhPJxYqNhMxphrMk+sow3mAaQ2pLF6E6WRmyaiLajOWNQA35Xnlo+V/ILcQ6sN1GBYhzpUNIGoiw==
X-Received: by 2002:a9d:711c:0:b0:60b:92aa:ff85 with SMTP id n28-20020a9d711c000000b0060b92aaff85mr8265811otj.137.1654441829840;
        Sun, 05 Jun 2022 08:10:29 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:20d2:7c7e:bed3:ffa4:df1c:4ad2])
        by smtp.gmail.com with ESMTPSA id gz9-20020a056870280900b000e686d1386dsm5647542oab.7.2022.06.05.08.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 08:10:29 -0700 (PDT)
Received: (nullmailer pid 3511759 invoked by uid 1000);
	Sun, 05 Jun 2022 15:10:28 -0000
Date: Sun, 5 Jun 2022 10:10:28 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: add MT8365 SoC
 bindings
Message-ID: <20220605151028.GA3511707-robh@kernel.org>
References: <20220530135522.762560-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220530135522.762560-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_081030_620810_98D068DE 
X-CRM114-Status: UNSURE (   9.30  )
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

On Mon, 30 May 2022 15:55:20 +0200, Fabien Parent wrote:
> Add pwrap binding documentation for
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
