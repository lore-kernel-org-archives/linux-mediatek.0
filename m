Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064ADC49EA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 20:58:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD492610A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 20:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD492610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijKHR53tzyerB1MOtDyh05XpAnwPqVUMKijsDunVUYg=; b=4eYcp7x2aX081B
	egOajGIfIWa6W53IlAJgmI72cr+qy5ygaibxm0w6of6nGUe9ConaiBbQTsidhPha+owAZiudM0S54
	Nmad7t03RKpux4jXNgRxcqzVUHuVaRzxkbpZaOKXFjQs2Z6/liB0pfM6cCrNu6Q0DzYAgt4hLaNKm
	yu5uCH2l8Pf3nCfgx26LMw+6A+HCm7NM+MmnE2mK9SvrOE12akf06OWN8M4R6m24Otk7pYtj05cit
	WY+s7QmIuf8xfSX1EkRcCZc/ReW/nVTEHLkpRZ4crjo5XkWgdBnhNY2uGXkTbjmha4Q9o1CJ8ZFZT
	yPm8Mtta9scGIloF/gLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwWQ6-00GHdz-If; Thu, 24 Jun 2021 20:57:54 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwWPs-00GHbc-2d; Thu, 24 Jun 2021 20:57:41 +0000
Received: by mail-io1-f42.google.com with SMTP id r12so9973181ioa.7;
 Thu, 24 Jun 2021 13:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0G//iXfmLjHJhdeWozxCE+pBIDu3xsRQjXHcxBVgZT4=;
 b=iEp01lRk6619KyrER5r6FKL7hTl90AHYjGANJdTZDCznj/Fqd8IBupeOg4VwTQ2dr0
 Lfst/rrB2cjGg63HdjCYm9Zfek6fnKLBUq4Ofk2ekyARqwNNqFCE+hSrXY5b5uK7qY1b
 OU1w2uYDs/iQOA1E2T5lypK5x2sGd9A9foi3ikVfGpLgoToHqx9ii55K2zoemEJczIrm
 /GgBy5UJABPP/jWPL3dHzUi3BbFpqLpCzH6QE4pwHn7xuYbvX2tHnLb6SYmdWeHG7lKt
 +L746aBFTaOHsOg+P1tIZxptWM1kGGR5nftobBmqZAlxwwTKvvj+5gf2JJXG1S1cFJTS
 ojWQ==
X-Gm-Message-State: AOAM532FHPHA9RJHg/HTtyzwy79eT8GYm0AODGDsGYOydH2wRpu7MnKA
 F46AaHS3V2twL+fOpjk9Iw==
X-Google-Smtp-Source: ABdhPJw2ZAUafe7foiqb04xU050uSi3YrSk7ZfH4ImmNIn0Puw0JTpem16JMUE5HpUpQPQgQyLWxhA==
X-Received: by 2002:a6b:b74a:: with SMTP id h71mr4092370iof.58.1624568259321; 
 Thu, 24 Jun 2021 13:57:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id u14sm2404901iln.43.2021.06.24.13.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 13:57:38 -0700 (PDT)
Received: (nullmailer pid 1975209 invoked by uid 1000);
 Thu, 24 Jun 2021 20:57:35 -0000
Date: Thu, 24 Jun 2021 14:57:35 -0600
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 2/4] dt-bindings: power: Add MT8195 power domains
Message-ID: <20210624205735.GA1975175@robh.at.kernel.org>
References: <20210616000659.28347-1-chun-jie.chen@mediatek.com>
 <20210616000659.28347-3-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616000659.28347-3-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_135740_151179_98B70302 
X-CRM114-Status: UNSURE (   9.41  )
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

On Wed, 16 Jun 2021 08:06:56 +0800, Chun-Jie Chen wrote:
> Add power domains dt-bindings for MT8195.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  .../power/mediatek,power-controller.yaml      |  2 +
>  include/dt-bindings/power/mt8195-power.h      | 51 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt8195-power.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
