Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25DBC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 13:46:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F6F220721
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 13:46:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="epyAp6ti";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z/tzAhAz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F6F220721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7F3uV0/T4VQaph0eeHa2XhtmSBJGNrZt7ro5Mzlx90=; b=epyAp6tirj6LFJ
	X8xwwEJTPug1eLlutBczXYTVLAX3EG1mvNOKFgTFoBYKP6Fy0b76uM4Yh5EkJDIobcNssF83LMqc5
	IzP32yMz0SPUNng549RQAErgdblkTtQ7HwjZN2zp/tw9k5Hb9ox1fDGbDZ0vmdaAAKNIyn8yPMmXp
	+wc+wtPmHloRoxpeC7m/a56FHcjzU3Nu1aXJWMU901xzpD24oVQSZYYfydxnLbWAbvvb9O05Rjq86
	ixbQDENS+7NLN0Du9vkgsWJngS6St1A/cqbkWEa1h+uISpovhFAiqj9uUodbRIDrnbkzXDaUPn8X5
	IyPw9gNt+rFzsNBczw5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jblWx-0005vq-SA; Thu, 21 May 2020 13:46:39 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jblWu-0005uM-W9
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 13:46:38 +0000
Received: by mail-wr1-x443.google.com with SMTP id e16so6703126wra.7
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 06:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ioC6Q3HVvwh9td7JcekYBXwgG6Rm0JWudJ5rZTXChDU=;
 b=Z/tzAhAz8W/eG2mYxcKFp8KKWJhs36XabdHfyuvXnPY8DOreXETPs/WweazwIgydiJ
 jpbDx3OyuHOM1EtBdf1/4JLco99/fbJ06XTQ32t3r8hNyvFhLtEUM/0lGWROiBSNYLTc
 ExFC7STIDBPFVHvsLzXEMa9T35z6/KZzKV7Uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ioC6Q3HVvwh9td7JcekYBXwgG6Rm0JWudJ5rZTXChDU=;
 b=IJj2IjW5+/6Y2OiJQslysYyd/bxQG8wixLOYxz+XKHJnNW/crP5yoD4TJvCHd9k85B
 k2MGX3k9zyR1xLSq1iQO0PkoAm9M7pZ20IzBPvMSDp/gI5EBfyU8qo4SSgcdQsoY9Uyi
 a0GHLzDKiBQYlZbln+1QAoQvXfZV2Ymc7f537sTocEt9aRjflKGpevGfxQcbjcoTbRzP
 3NNnXX8fvjL6kGzIXjhwS19cCYDyoiOHAw5E8fdau7ZwRkUdLfhnupbFVYo58b8RdKzd
 Wn+Jlx4xkoYPtCN/uHOcRUp0CJQpLysgPiO8aFuH6MUruBoaY+YudSmQ2IYia/BpSXt5
 mj2g==
X-Gm-Message-State: AOAM532AV81QM1G3Jgq3Zlv+te+iX95zY7z8gAMeej8li7eOkz8DW36s
 h2uvk51f3rM/OEx9m2JcrTGePQ==
X-Google-Smtp-Source: ABdhPJw4SaKtpUrlRa8kqBZdL7Myt7YbEIE8Xk1YTd7NT9wAik061SrpazfKJ0RlkFO65Y19ocCOGA==
X-Received: by 2002:adf:9507:: with SMTP id 7mr4462650wrs.63.1590068795524;
 Thu, 21 May 2020 06:46:35 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id g69sm1720399wmg.15.2020.05.21.06.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 06:46:35 -0700 (PDT)
Date: Thu, 21 May 2020 13:46:33 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH v8 02/14] media: platform: Improve queue set up flow for
 bug fixing
Message-ID: <20200521134633.GB209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-3-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-3-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_064637_031223_9F9E30AD 
X-CRM114-Status: UNSURE (   8.53  )
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

On Fri, Apr 03, 2020 at 05:40:21PM +0800, Xia Jiang wrote:
> Add checking created buffer size follow in mtk_jpeg_queue_setup().
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v8: no changes
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
