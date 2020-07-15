Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FE8C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 19:07:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DDAC2076C
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 19:07:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q1O3XLG3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DDAC2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jyHyc5XDLj2ZoOGY6FN5xZXXworSiJ6fa+DKOyBM6FY=; b=Q1O3XLG3a82PNJ6AQA4fih5fy
	KLS6knbpZx6+b0/dQGA67/CmOaM40zAbeHWKQ7Wsngyhxt7s+1J1K/i8BB3lhFIKVd9S3TVlycEqG
	ArwtBuiJMgiCw2m6Ya4nKjjY1hPwvlimUUio4H4PE6Mu3QGOOdSGs0WH53UkewsyJiN/9lI+v2mPn
	uVkKOdbibrwuxwt3XOC/sXM9cEA1SvbDXfto7jNzv0CyxE0m5PPLKaCb8eAH6oS/I8908Hc7X2O+Y
	cgFwdfyX3Fsszjlq86QKKtnBBffWhh1mdexELnLk5Hyn+I78o+tc3txIpaqbSYk94W3ceceWkSqOG
	/ru+vQ4DA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvmkE-0000pi-VC; Wed, 15 Jul 2020 19:07:06 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvmk7-0000oG-0U; Wed, 15 Jul 2020 19:07:00 +0000
Received: by mail-io1-f65.google.com with SMTP id c16so3393071ioi.9;
 Wed, 15 Jul 2020 12:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jno93+SekzksiRMw8XaCQpKWQNtPwJXK6kxizzByIZA=;
 b=qRwmHX4akRvhbNKqLdVU1CQ7O4eBubA4RalMZWDOjQQW8aSlGLoy/kvWvk3yxssND3
 VTg2h5XIig1nuYxdM+WCIdU2wZPs7W3CgI1gdTY3fA97iBwMTt6aRmtz4qoaKdFX2u2U
 PEEKnwfflUazZfFnLer7rifGt8q3o0lFN5P1rqs1QxsjkbWs/0IIw8VnYromAsIAv23S
 hZLDLBfL2p/c0iXFGym14YE+R/CtuJmrYGvwnf7Dn4uSGQk50emv7RA2XWUqCwGFSQTZ
 4qOaIoSWilIKL4qLHeN1OGat8Xf9wSL+EGFHPqrG1DAFW6h5G93Pkeu4q3DItBy7VCjl
 tEyQ==
X-Gm-Message-State: AOAM531H9YlOGFilLgqQNCgpLGjrcs2pye2ezgCYu/4vZgPToLAcI+fd
 Uu9WR8V/6V/39yMJDGLx+Q==
X-Google-Smtp-Source: ABdhPJxaI60mevvS3ihbp2eUo+tIkZk2660IIqqpr0Dc8tHcZTbING24Cchf10COIM6sdj0TWrcbWg==
X-Received: by 2002:a02:a909:: with SMTP id n9mr952808jam.70.1594840018185;
 Wed, 15 Jul 2020 12:06:58 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id g1sm1477197ilk.51.2020.07.15.12.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 12:06:57 -0700 (PDT)
Received: (nullmailer pid 649392 invoked by uid 1000);
 Wed, 15 Jul 2020 19:06:56 -0000
Date: Wed, 15 Jul 2020 13:06:56 -0600
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: Add bindings for the Mediatek MT6360
 PMIC
Message-ID: <20200715190656.GA647195@bogus>
References: <1592306876-3504-1-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592306876-3504-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_150659_582717_293AD336 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, Wilma.Wu@mediatek.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 16, 2020 at 07:27:56PM +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add devicetree binding document support Mediatek MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6360.txt | 53 ++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mt6360.txt

Bindings are in DT schema format now.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
