Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78881C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 19:30:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AD1622513
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 19:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AD1622513
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VhHXCrpa09kY/g39qDPhllC0mULRf2XDUwvoU3dJ2hw=; b=Fcw8TNykP+AechWLxG8cfJl+v
	H/73v5XMoSdgXkR52bSMhwJemsefLC1xzwIGa6r+f/vT6N/oofzYVVZF0tKS90FbBZxYt2eSysi/C
	8tMFGNhjURz4vKdpWjKafgobrvPBaNe54X0unHb5IhIbfasM8yUBA2MUFOoi7sOoSHDopkWq32n2m
	pp/k59szPtYW7Kx1So8+Nxs577x5PY2e4lLYCXD5EZKdJRxe3JRR6RPH6Ej372xozgk69hDQjTLoY
	mzkfUNTFyksZcfFB/+xK3ZnyREESnQ+0qE3z4c/Xu5UuKAx6GpheP3pIxv8BqxivtdbHsvm5K/qBW
	Y9qG99ttQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l47YO-00032s-Bb; Mon, 25 Jan 2021 19:29:36 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l47W4-000278-Qj; Mon, 25 Jan 2021 19:27:25 +0000
Received: by mail-oi1-f177.google.com with SMTP id w124so15990647oia.6;
 Mon, 25 Jan 2021 11:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4pMzj4F5sGyiw0Npjv+oCcMmAv4Qz6Br4C1Wz04rzwo=;
 b=ZhQWLJuL6HxdHfFY3jpme84CTJqqFcEOjYSRk7vD03/vz1IAYnTF31wXilAm9yH9kY
 rTEetyagImbZTPi2yOIffTGoJgAeSS34myTaykEUazWYDx0cqljexCmPOqA6cqawZQJr
 X7cATyNSnqCktx+ZbRkE8eSmpm4FI3Tnubl6Ugk6ggKJ7kOQdRfb6bUJAp/anoYhK5yV
 z0bV7KIQbjLMSthgmpKjVdJzDK0O9G+CXWHI0mbsrEYBHlnLuUWBnV3ZvsBtujatzlBA
 edgyVsdrxk7sbREgo8BigdpT94xDFUVnqlvNqn8c524USyKtst0AAjNKgC+AHVnM5l6l
 SZ2A==
X-Gm-Message-State: AOAM5327vcuOCVwY4cKvmUJCpazdwingJW6UM/aEWbOytXiemAqHkmBy
 czI651V/HJJUVWjKM9H88A==
X-Google-Smtp-Source: ABdhPJxAzJx2x6+i0A4uT7fsLRy+H8EdaY+p15TtbYRd+1pf2Vnetwij66uSg6hpWaWh7MJzjj8eTw==
X-Received: by 2002:a05:6808:213:: with SMTP id
 l19mr1038857oie.83.1611602830875; 
 Mon, 25 Jan 2021 11:27:10 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t12sm1177551ooi.45.2021.01.25.11.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 11:27:09 -0800 (PST)
Received: (nullmailer pid 813043 invoked by uid 1000);
 Mon, 25 Jan 2021 19:27:07 -0000
Date: Mon, 25 Jan 2021 13:27:07 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v10 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek
 MT8183
Message-ID: <20210125192707.GA813009@robh.at.kernel.org>
References: <20210113060703.3122661-1-drinkcat@chromium.org>
 <20210113140546.v10.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113140546.v10.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_142712_975427_5788DD64 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>, hsinyi@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 boris.brezillon@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 13 Jan 2021 14:07:00 +0800, Nicolas Boichat wrote:
> Define a compatible string for the Mali Bifrost GPU found in
> Mediatek's MT8183 SoCs.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> 
> Changes in v10:
>  - Fix the binding to make sure sram-supply property can be provided.
> 
> Changes in v6:
>  - Rebased, actually tested with recent mesa driver.
>  - No change
> 
> Changes in v5:
>  - Rename "2d" power domain to "core2"
> 
> Changes in v4:
>  - Add power-domain-names description
>    (kept Alyssa's reviewed-by as the change is minor)
> 
> Changes in v3:
>  - No change
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
