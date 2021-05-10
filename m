Return-Path: <SRS0=zzne=KF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC90C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 16:17:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C71561165
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 16:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C71561165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aiKJ/0yUFQdO3E41D/lzrxOf9fQddYj7h+YoqXKWKtw=; b=AbUVMQlCg8BN60XIZw/ObpAtx
	+iHsXuWh3bzQ3Ij1ag1uq3EoSUirjvlN+lGCQ/B2/u3kIHODqwVn4g+vwJgW3/Nt07pEneRWzXdx5
	c1ufSoaDnb2dKrfAZFXagisMPdvNx0qYj4Q/mYh61LYQSLm1mDYaJRcAUICaMONncGVWLXeFFsfSo
	bCm432lnA674phO9Qe/k4KelFeQF+xINq0Cb2wcofpFEyJnhji0NnlSayfnsGk9BNGV9L0Am1RuBM
	d9DtFZWDUO0WsGalCZcILK+rquiT0IvngMe8mhDxgOsSm3OYTSaY4995igTIQ7t/qrL+TPoQeOTgc
	moMQ6Epxw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg8ai-00EvYu-Ta; Mon, 10 May 2021 16:17:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg8ag-00EvYM-V7
 for linux-mediatek@desiato.infradead.org; Mon, 10 May 2021 16:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Uam9btn5tZOj5tkn77Er0osenh0IBm6f94dzcquByW8=; b=B68tJuQdoePUxUXaYpJ02SSIFX
 c1Cf2NcoHAmHTak/ENoyNbqCflE7ceMQ0ATWkMviIbKT9PHPZp37q2EFxxyXYFXZrb2F81KUg1Hvg
 A/rbeYCcYn9s2uq+62s1BfqA89st05rmOcmRJsKPAUVinTo33qbvvtZTPLpa9iz5N2JwSU3PMaBoS
 83TIYloEsf87e1UQXiRvy1QMnt3P9tCG+h2zIKGocj9YAmX83ch0Ge0YEW8EezEWXzRWMhKZn3+EA
 1X7bEpnFcdNT7T09WpmnqzLck4wFu2psRvjIl/x6Q/tFILzdyNUQeOB4ctKkrH1xZ7SsUgkOxsOw9
 bA2mtyvg==;
Received: from mail-oo1-f54.google.com ([209.85.161.54])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg8ae-008uZA-I5
 for linux-mediatek@lists.infradead.org; Mon, 10 May 2021 16:17:05 +0000
Received: by mail-oo1-f54.google.com with SMTP id
 t17-20020a4a3e110000b02901fab2f46a48so3582281oot.6
 for <linux-mediatek@lists.infradead.org>; Mon, 10 May 2021 09:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Uam9btn5tZOj5tkn77Er0osenh0IBm6f94dzcquByW8=;
 b=Hf3r2TlviFzpq4OfcZc32oL53xoSjJSu2jVRnBNi3KJsK4JjktBxyn5PAc0cs0KW+z
 iTbbSkjlgHGKMnuxClLn7snspcjSX9sRPtOinrexImoQTgWbCk2MA6YBPFgH2Z2c152A
 KarRbWJiQwBOVnX+DeiuTyjVyH5XbJo/ogj8tyahiX6UEDLUqYLZ4kbZ1AN4r0jWB1G2
 P9MRjgA6/zaXiw1iD+gZGmw4EgQOqnkXKN1s/gIppRc2gEv6pWQVVCCqXWbaaaycZyGM
 y5y/ICwzr5z12VSXBl1eL3a5gRefzhPHAeAhpYeauGmFkLjH5EQ4C91B2RCFjx5Lj1J5
 +dxA==
X-Gm-Message-State: AOAM531cnZDmt+UfiaFDzWskLx80i2+/ce/JpcVNQ41WSmYIrOC8jqb5
 mM+/m6tWqGkH1AiUjolsQg==
X-Google-Smtp-Source: ABdhPJxXrT5PnQP2mZCxqxZLE0tuvtYnZa05Pj3zWMIWHA/2/47vNZm3stXQMdBMFrQnRQy4XgxuZQ==
X-Received: by 2002:a4a:4304:: with SMTP id k4mr19686135ooj.42.1620663423170; 
 Mon, 10 May 2021 09:17:03 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 34sm3179363otf.38.2021.05.10.09.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 09:17:02 -0700 (PDT)
Received: (nullmailer pid 223097 invoked by uid 1000);
 Mon, 10 May 2021 16:17:01 -0000
Date: Mon, 10 May 2021 11:17:01 -0500
From: Rob Herring <robh@kernel.org>
To: Boris Lysov <arzamas-16@mail.ee>
Cc: linux@roeck-us.net, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, matthias.bgg@gmail.com
Subject: Re: [PATCH v2 2/3] dt-bindings: watchdog: mediatek: add support for
 mt6577 SoC
Message-ID: <20210510161701.GA223042@robh.at.kernel.org>
References: <20210131234425.9773-1-arzamas-16@mail.ee>
 <20210509211702.549-1-arzamas-16@mail.ee>
 <20210509211702.549-3-arzamas-16@mail.ee>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210509211702.549-3-arzamas-16@mail.ee>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_091704_616137_3964C7B1 
X-CRM114-Status: UNSURE (   9.74  )
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

On Mon, 10 May 2021 00:17:01 +0300, Boris Lysov wrote:
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
