Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57490C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:51:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 029F264E6F
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 029F264E6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B3TXmpyFClk6QLgm5uM4YIpgRJtXtCj4fqS67pEXQ0M=; b=mVSeGZrgQrhMOwMrVo75PqZNx
	diBagU1BRnu0K81BazJExzjqCbZxJAEJ3U4jGygF0gEOo83j1SomiSvbjvcerbTZZfOqM4W0nK5N1
	qTX3hUn6hLDe0vYvNvQsF6a68yV/9+8/JIFDfebID5iujwY39wEvfJ+FZ/Mfdpm7CQDy5Nku/KT70
	LyDWrp69PpAeC9GV8fh5ZhRb5sqrvHdK0eTzb/sskgO60wpPwBDhh3OkUS9R/ZbS7eGoIDrwJfiuG
	tUo78ix5ocduhgcxELkD2bS5Hdq1r+kPF1z1oP4Hsfo7+k5+sj4DL93a7Iz5qEyzOPu1dAv5WJWf0
	6vvuYY02Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9ZyO-0006KW-K6; Tue, 09 Feb 2021 20:51:00 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9ZyG-0006Hy-QP; Tue, 09 Feb 2021 20:50:53 +0000
Received: by mail-oi1-f177.google.com with SMTP id g84so7120774oib.0;
 Tue, 09 Feb 2021 12:50:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fyA+qCsazc52oAKumArtDLQD8XEJcIjUgmnOrxxcUf0=;
 b=FdkAcJteLR+euA7zzWUg3O7upLR8ecB1f0VZHUMn4hwSCvJQ8OTiTEjrowL32t+lPa
 9PTXhCLNO/GfeU8nKyNllZQBcXoA7eoxHXwDxbOgJhPe8tZZvt777B18HT0hxlQIdRuz
 P04CIhB7iXjEjSA4EIcsRrJ+Ews2aINgp+HLtpnvfTIVJYfLX2KF5MuliMzvY+QIhbP9
 qeZgb3l8T7WE5X7llfwdZIq5KOvFDe+3v/uQKAbJHCFdKmv7inYKJn2WjIUQUJLu4pGy
 JRYWY90h58Rtlf1k/sxmJWJbFB17QoKluZPYldHuP6qD6mQ9SQQGmsFC0nwlo9X7om1D
 mH9w==
X-Gm-Message-State: AOAM530SG9i+4fYXBM4Mw/2NMWNXWiCFYAZgxiBo6d9we1qacnka72x9
 roSFabtJYHww+qlNf6/6vg==
X-Google-Smtp-Source: ABdhPJz8eyLdumE+mXi76VfQL1/mw3L+CaM/2X4xAHMFrRU3hUywv3Ksqi6nGj8PUvySAv+/J0Ydfg==
X-Received: by 2002:aca:f044:: with SMTP id o65mr3668527oih.142.1612903851765; 
 Tue, 09 Feb 2021 12:50:51 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w13sm115063otp.51.2021.02.09.12.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:50:49 -0800 (PST)
Received: (nullmailer pid 155548 invoked by uid 1000);
 Tue, 09 Feb 2021 20:50:48 -0000
Date: Tue, 9 Feb 2021 14:50:48 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH next v3 07/16] dt-bindings: usb: mtk-xhci: add compatible
 for mt2701 and mt7623
Message-ID: <20210209205048.GA155491@robh.at.kernel.org>
References: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
 <20210201070016.41721-7-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201070016.41721-7-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_155052_894302_6366D749 
X-CRM114-Status: GOOD (  13.05  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 01 Feb 2021 15:00:07 +0800, Chunfeng Yun wrote:
> Add two compatible for mt2701 and mt7623;
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3: no changes
> v2: new patch separated from [6/15]
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
