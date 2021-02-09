Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F247AC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:41:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AD3A64E6F
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AD3A64E6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zoo8FXxQP0PSRIz6prlrytLRWEJ+5r2gdHWPXb5SXgo=; b=BZ/90gLRM83IKvxVTnlPBP8rX
	PjQLRkHpqoDy8equjvIv+N0QaOT7N/Yqk5sDOTXGneAE6s9e/0dbKawdgT+zsQURbp6m3NSHSzb9U
	wiLEMTE0jaP5VtbHpVEapIupATSo7MTPJCKLnOJD6YRIk1OZdvY6fZ9GdlGK5EmgHw/iFkUC77jqW
	kIFn/aVdglIIQFJ9M1r8nMsFj8ZkTMJF9R5ZeYCPCWdZvrKLmFFyQqDcwT5m/qDFJLfoPeLGwzqnd
	VEYtt9lC+7HGqZlNQzWF3v+co5QEiVPTawST5s76T2mA2NXw5cxz8gQscrixDD8hXQHYJXnrJezb9
	VW41vh+hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9ZpO-0004gg-5q; Tue, 09 Feb 2021 20:41:42 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9ZpL-0004fj-Fm
 for linux-mediatek@lists.infradead.org; Tue, 09 Feb 2021 20:41:40 +0000
Received: by mail-oi1-f170.google.com with SMTP id m7so20852001oiw.12
 for <linux-mediatek@lists.infradead.org>; Tue, 09 Feb 2021 12:41:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s+u3vz6e9KCuVkOaGOVf97bYpuYJLb9GDgnFze0FbFo=;
 b=cCjCJXv+k+HPBFgdN+Fvgt4n7Zl3EoSj2w9UjEFtd9E/ThLXFQUtrN19MjA/uoGFR0
 kyPdz+1N6dmd5skBVEf9VnjfOTIgNHh29hQD5T91VqPCwYNAG02dgkSGMEN4Q3lVnr8t
 CzXsWtjv2dl0gX85TmkJEhGvhJQ74K/wKYbQ9qzoPA/x9WY3oxUmWIHNI1z3larJOOaS
 ktHPC/qZV1eVW7mRHqmlhUzJIFDaEt2YJEQKSAhNcfw57vVZrWRrGMu6l+bJF6USEByj
 x09di0BnLs3c0OhmNuFO1jm4CfarsHYzO1ggNtUGyuZgJOG3RwbpA930yB6eiXS2RkOj
 Jnzg==
X-Gm-Message-State: AOAM531bfqJHOJgFkq9uTfeW/50yywoNHZbmvwMnMrPtYb2pZXEUurs3
 43Om6FPHHbwSENYYymNO+Q==
X-Google-Smtp-Source: ABdhPJyAk84Z8pz9qQ8lkrDwHztnBDDvhCtnoOD99hW+BNnArmdOX0zcB04Down2wini/oEjkxgXOA==
X-Received: by 2002:aca:fdd0:: with SMTP id b199mr3634977oii.10.1612903298729; 
 Tue, 09 Feb 2021 12:41:38 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a63sm4590099otc.75.2021.02.09.12.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:41:37 -0800 (PST)
Received: (nullmailer pid 138393 invoked by uid 1000);
 Tue, 09 Feb 2021 20:41:36 -0000
Date: Tue, 9 Feb 2021 14:41:36 -0600
From: Rob Herring <robh@kernel.org>
To: Boris Lysov <arzamas-16@mail.ee>
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: mediatek: add support for
 mt6577 SoC
Message-ID: <20210209204136.GA138342@robh.at.kernel.org>
References: <20210131234425.9773-1-arzamas-16@mail.ee>
 <20210131234425.9773-2-arzamas-16@mail.ee>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210131234425.9773-2-arzamas-16@mail.ee>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_154139_555657_B0C1A9C2 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 01 Feb 2021 02:44:23 +0300, Boris Lysov wrote:
> Add support for Mediatek mt6577 SoC to device tree binding
> documentation.
> 
> Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
