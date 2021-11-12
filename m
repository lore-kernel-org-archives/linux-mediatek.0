Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EF2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 22:44:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0551D60F4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 22:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0551D60F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szWvn1VNQKXRG266AHtqMWiFl2gZNJ24t9lyMd5ZfSU=; b=ABGB1YLJlUty46
	XVj9xoYwqpi4kBfrZRm5gV0ryU623D3gbfnCq+bYAZA6czJ452Z083KGCWzWiLwP/TrgNdk/WRSuH
	RF000dF/3FJos93y4mHj+vLbs9yDmq1a5EkU6bpZCKGjXA4IY8tpWQRg2zJlQD1imXO4cD/1LbRQI
	XdcvPb8Sz4cPF3BBajxlc4r10H2NkGjK8pEmOLithIDShY36lHf439Id7T4NBUTLoQ42bryS4r45O
	clL/5tYu4PknO5v8yogb2cYtgxATopLxn1mbaRd7LLQxd2XJS9Z2l/o0qWuQIV5rQRKEWmCyOcBT9
	j+f/ZZi00OWEUhAd/6Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlfH0-00Bmso-C0; Fri, 12 Nov 2021 22:43:54 +0000
Received: from mail-oo1-f45.google.com ([209.85.161.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlfFC-00Bm9f-MH; Fri, 12 Nov 2021 22:42:03 +0000
Received: by mail-oo1-f45.google.com with SMTP id
 p2-20020a4adfc2000000b002c2676904fdso3392085ood.13; 
 Fri, 12 Nov 2021 14:42:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5bCqd7sIMFGA5KFCBzhnXm+TAVQSLDZFleUsssSJUQs=;
 b=2ZIlWjZEiyrOdgj3sd+5T71VHuBf0eMnjpffzN52fNYcxrZC0WiA3DCyZtxz3/H/0L
 nVUfHuNcLr5Pjh4N4FgLmgcDnGizSWgAci3Cp6Cre+Nlm90RuzbFN42BeYihG7Ep6vZE
 SLI8b7Jgd8GV/Z4igRHgEk1U3WBPOXQh8LmrTXKPkeTW9W6v51k0MpDQOQjKnIejeiUS
 ex1qbgOD3Uh6ZbH64T7UUItxJBC9VtRukJogKDHpqt4Qp/cHaS5yrqDJRYKc/BSzgP3v
 pjMoxmg6DtkKEQRsbs4t2q+vrkQSEaEqtFSzq6I/PY9eMlvQY+fLZCjeh2eXUTa4kO0I
 mf8Q==
X-Gm-Message-State: AOAM5320wiRuGgtXtcqxTWyaVNcIJniITdeKmdEywOriuzW7x4gBZ0aC
 wry6YJGHiHWcmxFML3gmXg==
X-Google-Smtp-Source: ABdhPJwj7xNclVwnawiBK0OBO6kEdrva2JPF0+s/zDJlVUjRW9F1boBX09kJBKF/3ZTGyPW4h0MVEA==
X-Received: by 2002:a4a:6342:: with SMTP id r2mr10458399oof.54.1636756921106; 
 Fri, 12 Nov 2021 14:42:01 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a13sm1591533oiy.9.2021.11.12.14.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 14:42:00 -0800 (PST)
Received: (nullmailer pid 3509395 invoked by uid 1000);
 Fri, 12 Nov 2021 22:41:59 -0000
Date: Fri, 12 Nov 2021 16:41:59 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Yz Wu <yz.wu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 Eddie Hung <eddie.hung@mediatek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Subject: Re: [PATCH 2/6] dt-bindings: nvmem: mediatek: add support for mt8195
Message-ID: <YY7tt9k/pnTuqno9@robh.at.kernel.org>
References: <20211107075646.4366-1-chunfeng.yun@mediatek.com>
 <20211107075646.4366-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211107075646.4366-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_144202_773145_D79C1F12 
X-CRM114-Status: UNSURE (   9.55  )
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

On Sun, 07 Nov 2021 15:56:42 +0800, Chunfeng Yun wrote:
> Add compatible for mt8195
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
