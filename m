Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E53C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 19:27:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 267FE20810
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 19:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bpSYIO+M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 267FE20810
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1r+/0etarKeYkSyMxFNdomKZp3SADt1LtmdpoLkeaI=; b=bpSYIO+M3tl5qh
	yU/pPTK6GchqmTy7Fr1U4bJLre80lWTs2+dWvyVn5zG55cskW954dnqGMpzyfwx+BNPB85/BmYZEp
	rzSlmI4xYD7O6tgN1sjHDGv0wnT7LKsWALX+9dtRYkx9KzdJ2UTCyKFoUAsB/18oIElFul+QTyhZ+
	IWe8pbm3MxXAcIYBrt0pt/PBabwHTW0mrzLhJ+X1ZYNKc79AJFUjv7SFndgUI0TdrgDVZ3u9LGDiw
	hlquulIvZJ+ElrDb36mYmwerWp8RtAAOI+iD7ofPaOksrj69535RCcgqYGVhsJHnk4FJTwLjuL9sd
	M6pTfi8pW3Ij8rJFTs4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jekfC-0002KZ-1k; Fri, 29 May 2020 19:27:30 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jekf0-00023o-Mu; Fri, 29 May 2020 19:27:19 +0000
Received: by mail-io1-f68.google.com with SMTP id j8so507062iog.13;
 Fri, 29 May 2020 12:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/aw5rjkKZ1aNLtzNBPRgdXUzA/GNRGygjmxINK2X5fA=;
 b=K8j4Xapt7DOs4R9rFNd9Ggz3gGUtggw7WkryoXu0SNUX8NPj4hmLRkFNF+mkpNDZaE
 2U0/BoX6N8OAocjAuvnMDFrvR8SxpyYOG43wKzwznE+AN1kX5Py2q3kyyKj/hljMe+yA
 zNfcUrMtuYB75ghGfrJvRjX4GhTDw1fngoI4rys313sJlN2p/N5RUeMDch5kvIjJCl6c
 hhUC+dd4BG1eKx7oODgQ3tW6zXNM+g7pFFRlBbYxuhmTV5SeYCNucOWtp20s4TC3q8yU
 nE2cGcv7G1LijlDQP6lKUg6p+25p9vvICOPqWP4lWAp94IgoPkOsDem8+DJFKKcoQE6B
 AuQA==
X-Gm-Message-State: AOAM533093rOBCXrmx4oiZt/wnF6qsF2Lo2n1c/8ZiWghvwPSabzjsMK
 XR9UwhRnhMiY80zNBD4lXQ==
X-Google-Smtp-Source: ABdhPJzI+XOVZoeOXsD31yjOKfbl4d6VkVa2jbPtpd2RLN5CANUU/Kj27igKjwRkwCJ3YG/2Z4DjRQ==
X-Received: by 2002:a02:90cd:: with SMTP id c13mr8587847jag.83.1590780437502; 
 Fri, 29 May 2020 12:27:17 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id v76sm5436198ill.73.2020.05.29.12.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 12:27:16 -0700 (PDT)
Received: (nullmailer pid 2799831 invoked by uid 1000);
 Fri, 29 May 2020 19:27:15 -0000
Date: Fri, 29 May 2020 13:27:15 -0600
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH net-next v2] dt-bindings: net: rename the bindings
 document for MediaTek STAR EMAC
Message-ID: <20200529192715.GA2799386@bogus>
References: <20200528135902.14041-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528135902.14041-1-brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_122718_746155_1B16FD9B 
X-CRM114-Status: UNSURE (   9.99  )
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
Cc: devicetree@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Pedro Tsai <pedro.tsai@mediatek.com>,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 28 May 2020 15:59:02 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The driver itself was renamed before getting merged into mainline, but
> the binding document kept the old name. This makes both names consistent.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> v1 -> v2:
> - update the id field as well
> 
>  .../net/{mediatek,eth-mac.yaml => mediatek,star-emac.yaml}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/net/{mediatek,eth-mac.yaml => mediatek,star-emac.yaml} (96%)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
