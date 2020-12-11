Return-Path: <SRS0=zFd5=FP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F94C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 03:41:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6441423C16
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 03:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6441423C16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4kuGUNBgtlyymY4pprUJXfl5HWOg5kXcj+RlRL0sYpc=; b=qeDfxA6X/29UtK5Qrh8giyPMZ
	ju99S5uJOtaCxFdLn5LEyaqhHNgp5RVi/4XdNfj+R6DyqY8FDkbsNWUMSEF80ltZ7aQDIswwWCiUM
	jIDIATC07Zj+E2Bv2JW5jI1lNLvgNh5C2bo0+M7CP+arPCCIkh2lbuDDRd3EV8u9i1j7aASso6g4K
	SwRWK4Ofz0KIfBI7N5XzxjbW0SDQ1PrvhjrFPlH8iyn5RXEBewYkPcbFsvY1EIP/PBNIx3mziWYwd
	ONuN7JP+H/lNnpq+UDCC1th+YimlmqynclvkHYYAl3v9427WTMcZkEjdk73C+fw2YCvyNVo+r13ns
	8IdMVDoTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knZJ7-0007Id-Dh; Fri, 11 Dec 2020 03:41:25 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knZIz-0007FI-UW; Fri, 11 Dec 2020 03:41:18 +0000
Received: by mail-oi1-f196.google.com with SMTP id d27so8394274oic.0;
 Thu, 10 Dec 2020 19:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JF6a5cRyN74JfPIki4yBoZHOtyP3dbYKgJjhXEIt/Qc=;
 b=MyqEGfJcXJ5bypK6KA3Cvr0EkrGZPDd4zxjqNLS5/zg1+yFtUPaxDpQQjXj0cY0QRy
 n2wGZqiCnrp54DC8riYwpe9se5sC9yIdBod4wEsPmAmUQqJ367JfAG8Lt2B5sXXm0YJX
 Trl4SO6UnRVKVrBNZGD2Kt+8Zj3pCFds90ioEs2FfXfWtXM2v430KEnd8yWOTxI44z52
 Bq6kCoRTBgwB5w9rLRfZW8EzxiBfywf24EWaC2cfgAvEHMYXbVzAFHcingRf0Vf6A8PS
 X58gVU6Z4sXkvah0+pnrlQ0mEscelDyN4kJkn96HAsAncW5bvM6jKYyyxqKPUKhcdofl
 p2CQ==
X-Gm-Message-State: AOAM530+pDXQabq9KM51Sa+PDc/hESDjZk7XAN0Y1ju6eeioOeCMQFHR
 lteH089fxy99SjTfZ7yGSVT/IzChnQ==
X-Google-Smtp-Source: ABdhPJyGbPgGdT7RVO4BHsUzlDrKOpsEQoXFt7a+VKXfIktLizdH955feW9AS7/DqIpm7zeXrKy01g==
X-Received: by 2002:aca:ddd6:: with SMTP id u205mr3560158oig.121.1607658077127; 
 Thu, 10 Dec 2020 19:41:17 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 43sm1572383otf.28.2020.12.10.19.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:41:16 -0800 (PST)
Received: (nullmailer pid 3595522 invoked by uid 1000);
 Fri, 11 Dec 2020 03:41:15 -0000
Date: Thu, 10 Dec 2020 21:41:15 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v8, 2/6] dt-bindings: mediatek: add description for
 mt8183 display
Message-ID: <20201211034115.GA3595491@robh.at.kernel.org>
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-3-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607591262-21736-3-git-send-email-yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_224118_028282_E8ACB08B 
X-CRM114-Status: GOOD (  12.54  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 10 Dec 2020 17:07:38 +0800, Yongqiang Niu wrote:
> add description for mt8183 display
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
