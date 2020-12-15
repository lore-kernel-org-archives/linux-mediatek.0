Return-Path: <SRS0=7Zfj=FT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1062C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 16:23:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6416B207E8
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 16:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6416B207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mjLRgnRnQU3RzpgGfRXjSVesxwI1HCq2xeGir9/id28=; b=WiRtTmpHjF3NjvbZCmVQBC9P4
	LO/5ynr8PS/Y2L9XhyHn8bMJoV2OmJukUm6QaJvmSEm9fZD43a+qMs/jhLubCIYkeLbnepme09h/j
	gvlPF9bjaY35YQKyYapW1N6KXdRw2xFaKTSh6OFDtpL/s7v04+T7+kPvuj4csnkBgfD3Q8EQ/JvDV
	LZgMCtN/DpqxVJEtCR6zPHsrZhRGVizxSjwulaGevv4uXzEDknvWtu9ySOT0lThsn5ixBENnpv3wE
	We930bz72EMrSRHQ9EhrVVhWPkC3m7FlQM79M4jD3KYb5s0AIeJUzGxxO93uatzq+jAVld3Kkj7sI
	B0o3vdaQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpD6T-0000v5-IO; Tue, 15 Dec 2020 16:23:09 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpD6P-0000tX-Bj; Tue, 15 Dec 2020 16:23:06 +0000
Received: by mail-ot1-f66.google.com with SMTP id b24so2414234otj.0;
 Tue, 15 Dec 2020 08:23:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zZISEQ6HaMntdpVz1WaDdYPo6C8kVf283YLFSzfriUM=;
 b=SB2t3DRqogaD/Qf17TSH29kkBb+AhYEShVuaZyCn8UFIB1hltEsA0Xi3vQuquWysau
 iSltu4qzwNqvhi/us3CGtj6KH+7Vue54XNnizYMii+XdQ++BQQjHzJ28ZVeVtzyWuDsP
 4kelCkJe0rMLpyTTkkcLJAbXV0KsEQYihs11+v47msTV23N4onbXhRu8AOpUFR2KmovH
 B2eM8DUE38obCX+XxB87f33b78BtZHV8KCDt3wmTI75epUoSSpmTVD6Ro1QBb6DGAVn3
 ayog6ao5RZ5/c1KDUz+W52HSh22riQG3qLjn+nCMpzATAV2p71rJJ5SqrPsVhlPzuT5T
 V47g==
X-Gm-Message-State: AOAM532cYH5hFt5EdppW+LnEySyf4UItYgk/0dctf9BCNy7vYTrF7Es7
 AMmODYeh0WvL7eNLgKh22UM2zFOaWw==
X-Google-Smtp-Source: ABdhPJycVMPcM/R+xT7/BKd+G6ZNUDi5ob1ruwngO2yqWJBZtYqftnv/DChHiD2lRHcGRL6DK+aT7g==
X-Received: by 2002:a05:6830:1501:: with SMTP id
 k1mr24289010otp.12.1608049384744; 
 Tue, 15 Dec 2020 08:23:04 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s23sm105865oot.0.2020.12.15.08.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:23:03 -0800 (PST)
Received: (nullmailer pid 3965708 invoked by uid 1000);
 Tue, 15 Dec 2020 16:23:02 -0000
Date: Tue, 15 Dec 2020 10:23:02 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v2, 03/17] dt-bindings: mediatek: add description for
 mt8192 display
Message-ID: <20201215162302.GA3965660@robh.at.kernel.org>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-4-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607746317-4696-4-git-send-email-yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_112305_416310_3CFFDB90 
X-CRM114-Status: GOOD (  12.37  )
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
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 12 Dec 2020 12:11:43 +0800, Yongqiang Niu wrote:
> add description for mt8192 display
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
