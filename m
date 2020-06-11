Return-Path: <SRS0=zMKO=7Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D21CC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 12:00:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50271206C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 12:00:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ja0cvAgg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jwiYu/7L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50271206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xx2ma4T4sbmO0uihbwjD0IHNsocK8zWBe30s65p8EmI=; b=Ja0cvAggKElnlz
	aHO4ZlTBN/Xsi/2jUBSGNreNnviIIWvGMua1Va8j4lzVMXfaY8BSrqIZIDt3talYNJki4aSknY9Ji
	EI1cQaoLHlcgMFJR9BScD1CYQya0hoHssxRB45CtGFYKEi5Af9AsJk4dcvqUWPKk4nT9a6o9KzFA+
	QoxCXn7JEBGX/P1Tw+3bVLgHhvyPFI5hPweYwEhbA9msjXXZYNmjtXcgVvVeY6Bs4bUE10eVzLao2
	j9WdLXXPgbAxo/qLlUhC2mKe0w3KvmVUFLqooFVg5idpTqaCad8DmjH+vLB7xZW1d0r2cNBNBeb1Z
	GAq0/NXxY9a2Coj3MJyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjLsQ-0008D7-AD; Thu, 11 Jun 2020 12:00:10 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjLsD-00081L-QY
 for linux-mediatek@lists.infradead.org; Thu, 11 Jun 2020 11:59:59 +0000
Received: by mail-wr1-x442.google.com with SMTP id x6so5828488wrm.13
 for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2020 04:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aQJ2/OQ0INtUqdOhCi+aNYRvOxWn9KeZfAUmUQdqgWM=;
 b=jwiYu/7L6j2sAYGVwtKRrycnxxCH9y03CsnXRJ8z3ly0et9m6tC9Gde+Yz+sPiMXXD
 QdTydr/V9aBC/hz/4sWIycY/BZDsNBVmWxLuaaTgoH+Bi7fsDz+VoIekGDOKRW/xZEG2
 GUVQPJN0MVSzz7sivc/AnoR9ZlIepkjQqaSPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aQJ2/OQ0INtUqdOhCi+aNYRvOxWn9KeZfAUmUQdqgWM=;
 b=EnPd2SXtwgeFa201R+825BwhkcUukDogq2jxD9kZ/BYNtW5/oso3d/wfGIT0CRbgSS
 V+pRC3Ev0/mRSNyFyjjSkOkgnq7BQghqcmh4TZebUt1L9+patwDJ0gBX4TRo52OYSe3p
 u+RxLmmnURyNnQFl2gzW6466pmLERIrBCVyzJTLPzsPkVuyW/Sg9MLJSuO80OdBxMg8B
 s+1YoDl5+CXj+fCsNnm5hnU922ssuRjJNr56TJt8LLXqSMlVS1KJCky8oJaI1cbrNUqi
 GPOTt8BbMqqwgvzxIqe0SM+n163XBw0Kz2yuuyHycZxivOt2wuKy51PjPnK5wMZrFeqn
 do3g==
X-Gm-Message-State: AOAM533xIMUFRLzfbTsEY6XzXHUpGUdFM/SSJAigfj2TJFNhEy6rBrXs
 TYt1I0H+xzbk2zkQeqDVyQdhkw==
X-Google-Smtp-Source: ABdhPJxvbPyTd8RhVR3eBjnPhFunZ9jzxWDwTxaX1ZFBKznlJyB1xYBlLPEro/H0Z6e06/M4GOnLDg==
X-Received: by 2002:adf:ed01:: with SMTP id a1mr9859784wro.271.1591876796211; 
 Thu, 11 Jun 2020 04:59:56 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id j16sm5307254wre.21.2020.06.11.04.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 04:59:55 -0700 (PDT)
Date: Thu, 11 Jun 2020 11:59:54 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH RESEND v9 06/18] media: platform: Delete the resetting
 hardware flow in the system PM ops
Message-ID: <20200611115954.GB135826@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-8-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604090553.10861-8-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_045957_861656_CA05B98D 
X-CRM114-Status: UNSURE (   8.59  )
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

On Thu, Jun 04, 2020 at 05:05:41PM +0800, Xia Jiang wrote:
> Delete the resetting hardware flow in suspend and resume function
> because that resetting operation will be done in device_run().
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: new patch
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
