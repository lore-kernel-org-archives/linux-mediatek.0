Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969FEC43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 18:29:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0527E21974
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 18:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D+6NMs2I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0527E21974
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mspcw/WFYIOUgpHzW/2r0brxXd+57sxxcSk+Kmmc2x4=; b=D+6NMs2IcLUgJSXdRmTw6NSeG
	+BtQMvlqZkU7N/RzOlVEs0gn1Ic9Pl/1SNAkJfByreA2cAIcbgrd4KiMFyhSWIqvk+fihPLVCAP5k
	Q8duzp8vWEjliKOAVJew3AQaHWyrqqefgf+vXIFRtNeNRsWVnDfif3/uNw9RAfPzrJKazJkrOiHfX
	iRtgdB7eIyqXVBKinPPgS2QAfsTECmFFm40oB+7RY5Z9Mk0hYxSUidjAGKAyNfNtUX7yWUhd17zIe
	qVfVffjNczIEuojtVt8/S/wzuM//w+91hZeopfHfARBrKVcWCFTsakyWC9oZvAcDZebV+u8C68mZY
	8bW/1kqlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHtED-0004CN-Sx; Mon, 14 Sep 2020 18:29:25 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHtE9-00049D-5P; Mon, 14 Sep 2020 18:29:22 +0000
Received: by mail-il1-f193.google.com with SMTP id t13so499014ile.9;
 Mon, 14 Sep 2020 11:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ShVzvpvKuoiH3FPPRTmbA0lU+CM55rQc2Vy9tKyQjsA=;
 b=JU4swi+jRbPmq3K2CVoAAjNp4I96A1NuYbqdvVNabtx1qy03dI58h2SG5jg3TZh0Z3
 1/pmE5Ng0m2zB4Bym2/0QhP6KeZ3zNIt8DR6hn26Rt0ggdT3bmSAo969pevXB219h/Bg
 Y7XEWJQBxcB4OZSZr/74RKm1m8I2tQS3kzHSqUgnPre+4lVsVN0DwAfDlp8XraVtU6lK
 oXsQ7lUC0AxszP4SInahN+1+BElGXh3s9SxVqC4Tu0PDYBGPRYAvu1c/gz+a66VMneb5
 5HBEc3mFwUYp/1BeeBTLw8I1+km02Q1nj6xXWFuMq8E45TmsXpRKPbi5uLMUVt5jaHfZ
 CWFg==
X-Gm-Message-State: AOAM531x7sfpFaH7kzB2bIpiqFG0X9HUbR/lYU8rzLSmdih0oBtjHuZf
 rB57GgebgePMSG+XklewZg==
X-Google-Smtp-Source: ABdhPJy3jjcb0K3K5KjxGGEOIkC2lOncULnJ8ZLf2tGmO97sN6z9yio3OrGynPsv1mkXTwsvvOiOMg==
X-Received: by 2002:a92:91dc:: with SMTP id e89mr12279862ill.27.1600108160382; 
 Mon, 14 Sep 2020 11:29:20 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id e14sm6274979iow.16.2020.09.14.11.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 11:29:19 -0700 (PDT)
Received: (nullmailer pid 4193216 invoked by uid 1000);
 Mon, 14 Sep 2020 18:29:16 -0000
Date: Mon, 14 Sep 2020 12:29:16 -0600
From: Rob Herring <robh@kernel.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v5 2/2] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
Message-ID: <20200914182916.GA4193162@bogus>
References: <1598928042-22115-1-git-send-email-u0084500@gmail.com>
 <1598928042-22115-2-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598928042-22115-2-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_142921_250365_134748FD 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 01 Sep 2020 10:40:42 +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add a devicetree binding documentation for the MT6360 Type-C driver.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../bindings/usb/mediatek,mt6360-tcpc.yaml         | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
