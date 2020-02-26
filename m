Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE8BC4BA13
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 15:19:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3584720838
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 15:19:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WGniBae3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3584720838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8NLFpGEaIuJFWWlslf9fA/+QFhvBIybT0+eVS7nj0U=; b=WGniBae3ZhTtIJ
	dV5+0KT6tE1L9Qg9ZSiGeeq/d6HXO96dz5UeVfqXOYgh7Wtgg/M8W9YIEX/+74sF88gkBOZEhVdNA
	s3q0OH/19xD2FktRfLuD+TJLIO4gNtiLjd4h7sFmCQLKEb0PrjCjANGU71tkUX94dKUbOtnyeISlk
	BE7y/AKbpaZRy3xQz2L+XAL1P1Bp+FnQ3+3xIaAy3r070fTsthuhe1xV0wKv9BWZ3xk+nyxl1ec8x
	GvTBicyvcv4rX4JVxQs3lVi3LpVasmldZZdtoqOgKrIDjOxZ40YlA4U5ZZDfD77vEt7P2m/vzLlPj
	VY85MjvBITNTR97mrkuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6ySm-0006rC-6Y; Wed, 26 Feb 2020 15:19:04 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6ySX-0006gW-EV; Wed, 26 Feb 2020 15:18:50 +0000
Received: by mail-ot1-f68.google.com with SMTP id i6so3254888otr.7;
 Wed, 26 Feb 2020 07:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/6qDOCrFaT70GMrXC62oODapAv06LXpjcPH50sFJvcw=;
 b=a3DP7H1mykUEdpdvJxry4lRhpfmwT0jrFKLJ6HfbG+QL3BN9LTvz4wdYOj3i94wZTm
 ad/95cDYX1YYRjAoYExsmgmPJTsNXhqQITyxZmetv02foDJtYOHusc3VZtG54Lj4KsMV
 +lOQGMmbtE0PHzpL2mFU8j780Vv61BbDcuDxgqnizkb87i7aFZxJ1gVSChdWNQ4+rXHn
 8qPO+5H5OvRGCcLRwUcPWb8So+0eIQz2YcUDcl5wFECM7nn10arTLR55163ioNVKlRV/
 CULvmy9bYxFQYvfbDvRYNcnWtba2OA6BN6IROJSUzPQjaYdjGiSnRJ/VMUBUVa0u0UUs
 V0Ng==
X-Gm-Message-State: APjAAAW8OKKqxV+JB3zDjLg0G+9mQmmjvYeDWMI0xykGYSAXlv6ZxvyI
 QTXp3WEQim8k77AQRmqxgQ==
X-Google-Smtp-Source: APXvYqxBufLVc2f4vqiKPF5cMNUCr0xqWnYB6+zcMOrJYU0lwVw8DbBaOxQKyHF5SXgHCNdsMk2NOg==
X-Received: by 2002:a9d:638a:: with SMTP id w10mr3650110otk.130.1582730328475; 
 Wed, 26 Feb 2020 07:18:48 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m68sm886194oig.50.2020.02.26.07.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 07:18:47 -0800 (PST)
Received: (nullmailer pid 22097 invoked by uid 1000);
 Wed, 26 Feb 2020 15:18:47 -0000
Date: Wed, 26 Feb 2020 09:18:47 -0600
From: Rob Herring <robh@kernel.org>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: Re: [PATCH v1 1/3] dt-binding: gce: remove atomic_exec in mboxes
 property
Message-ID: <20200226151847.GA22046@bogus>
References: <20200217090532.16019-1-bibby.hsieh@mediatek.com>
 <20200217090532.16019-2-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217090532.16019-2-bibby.hsieh@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_071849_482585_C17E0CF2 
X-CRM114-Status: UNSURE (   9.38  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, CK HU <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 17 Feb 2020 17:05:30 +0800, Bibby Hsieh wrote:
> There is not any client driver using this feature now,
> so remove it from binding.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
