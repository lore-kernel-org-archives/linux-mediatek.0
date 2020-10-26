Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652F8C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 14:49:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1642A22263
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 14:49:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BWDwPyN/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1642A22263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=khJZCrt8I+k1+bB41ias39quuY62bLCdxjracDuuQEo=; b=BWDwPyN/Gxh0WBItlqGp9grnp
	XVoytVxNmZXjv28I3c7GjQYo2gWhbUzJW7uw7hBaTy5nP+HkIc+G9pO0asaFhZdvbNglPp7kRvi/f
	AbFfcATgfyZlkLqC+mXflCcodvI3Y3LXMu4pGWsRgAhfVDrePMq4+WSDbKv+LK+ngshZLLxOHViio
	UGzLR5B/DJJV3iTA8+leTmF7AoNytZPSfzOW0vBIszK/6gRWjueFaRl6TDeE7deAu17eO3iCV7IqY
	DPumiyPipqzAQWB8Du5RhISBS1bnVvGWQDe1nxDlooxNg3J56HvhYO5F3+7Mj+AwDW5KfojqOW+as
	3F+kMF68A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX3oP-0005Gl-FE; Mon, 26 Oct 2020 14:49:29 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX3oL-0005FF-NV; Mon, 26 Oct 2020 14:49:26 +0000
Received: by mail-ot1-f68.google.com with SMTP id f37so8189212otf.12;
 Mon, 26 Oct 2020 07:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Nh7HRtiviidsm4a3WxEgJxaq5Xaotz77zJ4no9xGWg=;
 b=R6oA0/DKfrThfzFgKO6lafAiwdwfwU3214rAxBIVRjLlSVH0Umc8Xr/3EkGSGgoBxe
 CEUxE8W7CjDL9E46BLn14FxH7Icy5mvp24Sq4pEuKwK50w+u1rSZMEQ6HN8DrsP0gG39
 U5xw1E/II9uE+fbV6stJFSWyjHUmWKyEcnifXMgbBs8OwQsMnhYbvzY+EDVDOxCdZ46S
 /uda2YpSRDxpjI3w4ec/QGphGJTx62NV8gqOj3xcoJ9gqV7j5t4ntGQSJ1c5ugzbR3Oc
 xOTjBfER1YJINThFG6XB48ufwEe8OgbI5SO/6c4kI3ZVT8/X6dUkuQSlCD1nQ13hnis4
 +LdA==
X-Gm-Message-State: AOAM530JiWve60ziFgv94FWayw0NLmRcljzI6+/wNkOv3SJ1Wx+Gqekb
 MKhawwQb3i8IQQ1/w5H+DQ==
X-Google-Smtp-Source: ABdhPJwtO2IX81WQshcX9WVDYLyK4r3Zc8udhCmT9aQgFi0oZ7kQ03vjZ4UBiS98Nn2LOy+rPAQacQ==
X-Received: by 2002:a9d:1a5:: with SMTP id e34mr15087183ote.197.1603723765055; 
 Mon, 26 Oct 2020 07:49:25 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h32sm3651553oth.2.2020.10.26.07.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:49:24 -0700 (PDT)
Received: (nullmailer pid 138475 invoked by uid 1000);
 Mon, 26 Oct 2020 14:49:23 -0000
Date: Mon, 26 Oct 2020 09:49:23 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 2/3] dt-bindings: thermal: mediatek: add documentation
 for MT8516 SoC
Message-ID: <20201026144923.GA138429@bogus>
References: <20201021164231.3029956-1-fparent@baylibre.com>
 <20201021164231.3029956-2-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021164231.3029956-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_104925_798237_4AEEA35F 
X-CRM114-Status: GOOD (  11.90  )
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
Cc: devicetree@vger.kernel.org, amitk@kernel.org, linux-pm@vger.kernel.org,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 rui.zhang@intel.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 21 Oct 2020 18:42:30 +0200, Fabien Parent wrote:
> Add binding documentation for the MediaTek MT8516 SoC.
> The SoC thermal IP is similar to MT2701.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
