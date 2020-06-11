Return-Path: <SRS0=zMKO=7Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC404C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 14:27:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EE692075F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 14:27:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rv0vqtPu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j2Zm8WTa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EE692075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MgYOjEIkLaiNJbtBxSpQUIjtgSDYtnxP0LYlR39Pv0=; b=rv0vqtPu/Bc0yB
	q1t+CZUKksYXUmGqKlfbFhV3JDp5PAl7wAg1PgbrmOQgiW1bnLrGGenqmPhGhHMktUp6X9Fa7k2Ax
	o4eTx06OQBmA1EjO4CyL6NyKk54ySP/KcIFqayHn+/zBoYS3OTVU7ck+eLII8euMLW8KVoQTxgiK3
	Cx1hcjlEdLQnMMZbYASuvjhy8p+LjhxRu5p5eTMu8xdE016+QmUycPrACuX31zJO8WCEGkl6uBqxC
	KHojTkwF5OM5UvVyhWUmGAPaRymkxzKMwtEqyrrd7DIWFuOFUm7W3xHWhSgk69D5TP5skYvvT7SL6
	RyHft+xvrrScGjNTCkZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjOB3-000698-MY; Thu, 11 Jun 2020 14:27:33 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjOB0-00067d-Ny
 for linux-mediatek@lists.infradead.org; Thu, 11 Jun 2020 14:27:31 +0000
Received: by mail-wm1-x342.google.com with SMTP id u26so7080299wmn.1
 for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2020 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6oNSKO/bfHkroY5E6w01GRrWanZd3YtLMnWhvnjnTpA=;
 b=j2Zm8WTakmUV2T5y/+dMnLN/v4wOdjhGJvK5fkIK2O+ryCylfrjDzedqOoet78T75o
 Ldpf9ZChG1Qa8baFLKfR/dMZfYDYfM/dHdjOp3Yx66MPkJNvGhfScPuLyNt4jF9UKrN9
 lHtbYaVmspsKGB1HNStwdkVEgJW9qsM01+RiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6oNSKO/bfHkroY5E6w01GRrWanZd3YtLMnWhvnjnTpA=;
 b=o7sgqFEWPbXYFStNzmHneuUbgwsfGWBaAUBRPvid0X/MnKAQKrDhleHrD/gbZy5DxZ
 aL4lRdeVQAfNoVYfBlLiYGodwW7wzvWeEQ0eh1zDlUHbBmTke1tf9rp3w8FqH4rPJVfF
 c2F8yz8oaTEkQNiEAGiM9z2NyawECicre0g0he1lgdhkEiXu/07Hq4ASkql1O0Dcl+Gy
 BYvBaxHqfUIzwPoQHLtCYoVn5kkjwdimC5rNDmX+JVTaWiRaV5GgSOcPsGubR/QLi+9M
 dnxCOPZizH+hCSaPqCT865yjeSP2Y5Mas9E6ufqSoW0mtBTbJ/QPHE9jFSu3x0n8hFF/
 5U0g==
X-Gm-Message-State: AOAM530UjFENKBF4Z5XwUiWHhoyQpBt6kfSkuS1NNq7grHDM9QGYIuTs
 PP9hvbnegP3ismCs6XpHvQILBA==
X-Google-Smtp-Source: ABdhPJwcHlML3GVU5KUrSHCPpOa1Dg4OCgzoWnC1F47mU912hVUwl1saC95zTHAPsWEKo1Yl3nrQ2g==
X-Received: by 2002:a7b:c40e:: with SMTP id k14mr8960381wmi.59.1591885649589; 
 Thu, 11 Jun 2020 07:27:29 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id g3sm5808646wrb.46.2020.06.11.07.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 07:27:29 -0700 (PDT)
Date: Thu, 11 Jun 2020 14:27:27 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH RESEND v9 09/18] media: platform: Delete zeroing the
 reserved fields
Message-ID: <20200611142727.GC158633@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-11-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604090553.10861-11-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_072730_778437_4B7D38A4 
X-CRM114-Status: UNSURE (   7.73  )
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
Cc: drinkcat@chromium.org, devicetree@vger.kernel.org, mojahsu@chromium.org,
 srv_heupstream@mediatek.com, Rick Chang <rick.chang@mediatek.com>,
 senozhatsky@chromium.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 sj.huang@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Xia,

On Thu, Jun 04, 2020 at 05:05:44PM +0800, Xia Jiang wrote:
> Delete zeroing the reserved fields because that the core already
> does it.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: new patch
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
