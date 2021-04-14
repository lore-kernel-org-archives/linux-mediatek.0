Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAF7C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 22:20:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A8C06115C
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 22:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A8C06115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3zyMsk93G/DZcgCSCMEbmJZu4MQOlBpMmUD/c+YYgZU=; b=UI87kbrC0j98IiGF64C/QBrYG
	78sAq7CSymkymbVs/b/icR8TJf8lIOp6DSeybpofi+IrGHi8iUSXH74iOo/m3Hlu2urtSzXbrlzcg
	ZYd/AW6l2TQHIDrjz+EGd7dlmaREtB9bzQXR+3CizlEMoiU1Epseng7qt2o4RS6lqU248UTW8D5Ri
	xIingcDRTbfxRsu65/skM+GJrxEE1+WHIniMaV22OaC6zTcCG37ydtsemFXBXpo+3tWwQgtxWRQxE
	GiRisEupS505Yk5B9WQVlPiAweJEDDdshZ1IvqyvQCWgQw8PCszGwE3vMpjvPUUJIFW+xri+3CWTL
	1r+RcGzrw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWnrP-00Dzmw-Uu; Wed, 14 Apr 2021 22:19:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWnr9-00DzlJ-GN; Wed, 14 Apr 2021 22:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=shhxLQuTrS6CU0G16xzkxHsbk3trBrwF7tum2COVf1Q=; b=NR737AQDIei8dKBV0sla76qyMN
 82qZB2q9QPTIYi/+NNMj8nlIVSmHTpifBRIXYFf/vEI1Uk6G7/q/kaA9wMCfKnD5IejXrnysZU1cO
 tofHcMMPjZ4OsBYuma1RyPQZWCNEaAFnDoC1d4tVixe9kW+6T8hIzedelgkRl16t9kLvCAvL0U3vd
 fNPxBnIYNczQeC7SqiRcHy3DkG3cPBHPxSQ4PgC2MUyJ8SaWhFoHTGM6FaQnNYXHtwnHJCNHNSWvt
 JGbUF5x1TN8M6i6tZp4Xz4RKxd4Jrt198ClMO3BXDUlu8NKOkHdhFpNfV04NeTJzpbeXdnjVPTzvh
 h8wu+WFQ==;
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWnr7-0088fq-1M; Wed, 14 Apr 2021 22:19:30 +0000
Received: by mail-oi1-f169.google.com with SMTP id b3so7458327oie.5;
 Wed, 14 Apr 2021 15:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=shhxLQuTrS6CU0G16xzkxHsbk3trBrwF7tum2COVf1Q=;
 b=R+XWYKNq9wv8PIUFIu/XJA6FTzjQC7DqM2JoMd0POveQ6rLShv9E10yhqCodG2X2JF
 gDVQHx/xwS2VMSnSZOnI4oTOEikX7NzVCHMVkxxJZxNXJmuXITAL7RY1LGP8KmOlesOQ
 83OE9WNJfuC+u/v0eKmtu0wfM5d8nM0q6MXyQStbLJGSFJfimIs+K6S3w5dmfoLxGYLR
 kpRFu41K0k2oB5Xe1xvW10P8dicaf6n5smEH6fJi60Myds/nFdUv4uHIy2/wSjNkakuc
 tpTTWap1IT2bAydruQKiNJzYOKoVLWSLQk8/xJO0chKxXnlLRnUfQbk7CoIYJiIfOHGL
 JJjQ==
X-Gm-Message-State: AOAM532Qcxp1KUI4/xVIhltur/yE4fDBlT2Yi9IzKDMXZ0sp7/HxWLcv
 wDsLIEJQrVW2SvFFuucusA==
X-Google-Smtp-Source: ABdhPJx6GppsvAcMfhCc/TcWFOcFYEwW+XxDXo6r8z6IJFxygHtL17xNAfoh1RHqI7F2eLpl2oyvAw==
X-Received: by 2002:aca:b787:: with SMTP id h129mr372861oif.58.1618438768152; 
 Wed, 14 Apr 2021 15:19:28 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i4sm195366oik.21.2021.04.14.15.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 15:19:27 -0700 (PDT)
Received: (nullmailer pid 69085 invoked by uid 1000);
 Wed, 14 Apr 2021 22:19:26 -0000
Date: Wed, 14 Apr 2021 17:19:26 -0500
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 intel-gfx@lists.freedesktop.org, devicetree@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Qii Wang <qii.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v19 2/6] dt-binding: i2c: mt65xx: add
 vbus-supply property
Message-ID: <20210414221926.GA69036@robh.at.kernel.org>
References: <20210414172916.2689361-1-hsinyi@chromium.org>
 <20210414172916.2689361-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414172916.2689361-3-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_151929_097804_53A49F25 
X-CRM114-Status: GOOD (  10.98  )
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

On Thu, 15 Apr 2021 01:29:12 +0800, Hsin-Yi Wang wrote:
> Add vbus-supply property for mt65xx. The regulator can be passed into
> core and turned off during suspend/sleep to reduce power consumption.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
