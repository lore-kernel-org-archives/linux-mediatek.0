Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120E8C48BE8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 20:27:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6A206124C
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 20:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6A206124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0iU7iqbcw9MHZ7E6XKId823jU2hReSWKMU1IC3np7Q=; b=ZV04BWdBZJRz8U
	ieT1Wuv7aC4FsYPWDt3YabBVmUY9xxGcbzCY20AlziRyW6JVhkw19FlSAM0AgR9NVlgwqZIIi5oYZ
	sIVO317T/5XHibO9SDe6RmPl1NXl+xwiTsllNWzsroSwJrvcQ68cU/B0YJaYjKQgrSgvCTxU8rUoo
	u+11XNG4Y7pU5Rf8eVbW7D4J0gX+bJHDheAOWYRF2ZIOQJDU4NC/K2FMxuOyIwKcwdWs5Y7S5djej
	44GIWYISzS80KplT/LttGG5ta82oA1NWfj3MLP07teLyc1iKXjmQbd2FD/xdrX03xH6BgPzfeObp1
	X1kA/+A52nSMX+4YCe1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luL5Q-00FRai-Ut; Fri, 18 Jun 2021 20:27:32 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luL5E-00FRZq-My; Fri, 18 Jun 2021 20:27:21 +0000
Received: by mail-oi1-f182.google.com with SMTP id s17so3102939oij.11;
 Fri, 18 Jun 2021 13:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EGzlVaaWgDgImE2RiFVAxvE6ghgaevoPSA5LifmrdQ8=;
 b=O7/RPVoplRd4O9LzEu3/auzUtwEVE6F7KHgHXivHzp3jTjs1g/1IKUruuH1uuaAKOE
 640HSAmfNlT1zWmKo/7l+W7W3tYnpoM82iPKiBHEvguF8XZGbmugzCY4JmI34xmoS7EO
 Sg10LJHhYf28dGD7yTc0+KHf7Vmuui5IBn4zJzuBVwDtyd21oRd/rYtRN8a5b0TPOc3r
 NQ0NFS+jYw3Ha48tpiibowSBqMHK8HVH3gaf4gODnFAQEwGzFDCsUvde9GsxlsgyghPb
 PT+OoFWbDBlRz3ZeWLCzr+sBBoOWBR1UwA7WUEMB3Duu/VdIbFJMbe3iLW7yzUi0BA8/
 TcHw==
X-Gm-Message-State: AOAM530NnzjwNeZGwGquDcCUG42SiZIrKRVhnHjsCmErXxK+fjIZFKlo
 rVKQdK60EgXQETi4DBb1/g==
X-Google-Smtp-Source: ABdhPJyfAyyaLY4H7Vlj/t/qvvFUmjmcDszM8JUTlfrWdI26tW4mLJUlSuRgTbUEiX1igVmo87r5Kw==
X-Received: by 2002:a54:488d:: with SMTP id r13mr800504oic.152.1624048037301; 
 Fri, 18 Jun 2021 13:27:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id k7sm2091185otf.72.2021.06.18.13.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 13:27:16 -0700 (PDT)
Received: (nullmailer pid 2821948 invoked by uid 1000);
 Fri, 18 Jun 2021 20:27:14 -0000
Date: Fri, 18 Jun 2021 14:27:14 -0600
From: Rob Herring <robh@kernel.org>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: qii.wang@mediatek.com, qiangming.xia@mediatek.com, matthias.bgg@gmail.com,
 wsa@the-dreams.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, leilk.liu@mediatek.com,
 linux-mediatek@lists.infradead.org, robh+dt@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: update bindings for MT8195 SoC
Message-ID: <20210618202714.GA2821918@robh.at.kernel.org>
References: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
 <1623122200-1896-2-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623122200-1896-2-git-send-email-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_132720_801108_2BFC5E78 
X-CRM114-Status: UNSURE (   9.78  )
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

On Tue, 08 Jun 2021 11:16:38 +0800, Kewei Xu wrote:
> From: "Kewei.Xu" <kewei.xu@mediatek.com>
> 
> Add a DT binding documentation for the MT8195 soc.
> 
> Signed-off-by: Kewei.Xu <kewei.xu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
