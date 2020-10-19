Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E067C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 21:16:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B934022246
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 21:16:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uWcNwVIr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B934022246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=01TcOea8pCowHCSAaCKpQ3kgsSEz2NWOp/bB+u/uNmw=; b=uWcNwVIrSxkup+6ZkVMB00eN8
	yVXv85m0RLKo2r42Tnv5SKVu3nUb6i6C+0UYWwn5bK6VVpcpXPnJLMWnIOGjsv8gd7HwK+qf/+SBQ
	4sv6CRtZVc8+iiIB14jFAmAJp41drmJdeGVnfKUhhgZQ6r1nXE3qES5rY0gNXU5bZ+zFz5L1IwQwY
	Hl+mkPCcCLbJp2MuQZmElxLmVG+KZ866ZIU6isOBTkLHaYbhkJUlKFzR/SHHhTq9Y3WUCSjJ+mXLy
	ugxhUrbSJU5HwRgJ4ye5uzsh6JuSDXhROx3wVqKgCLJiV5+PP4rvHZW02CftFSnnas1UDCBZaeODr
	d0kX/cOpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUcWH-00088g-AR; Mon, 19 Oct 2020 21:16:41 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUcWC-00086y-Hd; Mon, 19 Oct 2020 21:16:37 +0000
Received: by mail-ot1-f68.google.com with SMTP id n11so1197767ota.2;
 Mon, 19 Oct 2020 14:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HWzvbmQLQZlZz3G7wVvGYG1+VCIyxQzsV3S2HQwzxnI=;
 b=ltNFmjSyR5Tek7YnyGSdmWytWTGMer50TD6xTMSoNjhhg9ib1u3JSjCjJXxhvE0B0P
 EurN3EVx2afhdXgYren5iVmuUxigHQIHtlQQ29/kWTx8WDoD4Ubj+9BsI9Fq2p8fEF3Z
 1LsUyyr4K5XLwkwSJZH34sqCZUEKDiN0SHo6K2vloPkMZdzD5EoW9R3br7L47aR+0RNJ
 nj6J9suDXfJFE2o1dqXyajGnnL+AFCXe1LM+OOakZCmO4QjTr0oVo2gdSBKYJ2PRi+h1
 jtKYRvRhCUVal4/7FrhlpThAIC61zlP/K/D1HKaPUOZcfVNlSRG72BaEsjHoVqFC7m7/
 hnGg==
X-Gm-Message-State: AOAM531VU1qrQ5HB3UlmN6oko0PthrTzrrZ3dLdYy3ciQ0bduN6I1Bur
 Q1dPgHS48XKJE5k/ItsM4Q==
X-Google-Smtp-Source: ABdhPJz1uyiV14WVdrs/T1Q1Jk9VF8uhqAX11UbC1/A/1NkpNrq1GI1Z6fIynsSqQAzfN35X5AsRWg==
X-Received: by 2002:a9d:7c96:: with SMTP id q22mr1293742otn.118.1603142195742; 
 Mon, 19 Oct 2020 14:16:35 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t65sm259100oib.50.2020.10.19.14.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 14:16:35 -0700 (PDT)
Received: (nullmailer pid 3616177 invoked by uid 1000);
 Mon, 19 Oct 2020 21:16:34 -0000
Date: Mon, 19 Oct 2020 16:16:34 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: dma: mtk-apdma: add bindings for MT8516
 SOC
Message-ID: <20201019211634.GA3616126@bogus>
References: <20201015123315.334919-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015123315.334919-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_171636_590451_763CE0C2 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: devicetree@vger.kernel.org, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 15 Oct 2020 14:33:14 +0200, Fabien Parent wrote:
> Add bindings to APDMA for MT8516 SoC. MT8516 is compatible with MT6577.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
