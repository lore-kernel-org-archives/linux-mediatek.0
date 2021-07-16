Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB06C12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 17:56:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDFC7613F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 17:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDFC7613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfohXWzkFUkKQUrZfdz186ZHbVjIxZQiAMBqSmGABYI=; b=TpWxPNRf1a7vp1
	gpb+F5S/ULmUGnVjKuNTy6sGdKYQzyMN7h16454LHpFpw2QXz1nEFhKxJr/C5yKrHjB+b/XMrrWSk
	vLh2oTkPLmACSm7xTODeX7RkQC4dWG51xWtRdi8eSkv2GfmuesUejVnMGiYb5O+CsQRRLYqLbZ+jW
	hw2tbVURMRD9319swrKCzmXU7KHPfvZnaVu/eRoV4WQSLDL0vP4YbrnYn5ra7ytbmClS43VWcTTDN
	uUhdR7WP+UgfK1vLXnKDVMYgfmPNWM916z5GsDqMqcdkKnqDnyrdaZH2YZ/GkmexB2mZdKmD9MO2i
	ayaIiOami9WitjdtuEvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4S49-0050QL-EY; Fri, 16 Jul 2021 17:56:01 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4S3w-0050Nk-Ex; Fri, 16 Jul 2021 17:55:49 +0000
Received: by mail-io1-f53.google.com with SMTP id g22so11596192iom.1;
 Fri, 16 Jul 2021 10:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tFOHzg/8OboexPm/0pSsjz82hnih9yZe/xW9+Qml0Fo=;
 b=TjTsRocGRInp4w9PB0+d5VLoXMZBdbr9tlV1vZ35OVpNbfle932FwnZxvV+ti5gz4k
 lX2WeOPNt2UwTJPKcUx3vCIuI9K0zj6s8xgvr6CNhH7NIlzZWcvyqwQxpBNQosVD6fLU
 ttTs+qQfvxZ+Ld9oKhJw2ShBeMMpLVlYWy8Z3BFnnUt0q3h33OY6tPOaSxa0aR1/O3XT
 lNN9vQRg/xRVQV3pEhuy1e7R9M/cplTDgzPo05EKDVu9yCI72N5GW2UcWbopkWMp3Kit
 c2KtFOY03lz8RHnXkoYV0oc1+XvHe4in+m/LUbokYQfc874LJutIu+4SDff55TLYqxWy
 cpqg==
X-Gm-Message-State: AOAM5323/U/beLPP8A0LakLMwIDjFK3T+sbbO8lKQNcVirf7qjulDQlp
 +2IZxcV9b5gTJMG+NIY2WA==
X-Google-Smtp-Source: ABdhPJyB1gQr5+xRZl+gIVic1+l9kv06PAA28WzTGwCgfyv07tnL8aVGaFiMGmLDAVDhxYYSy9tskA==
X-Received: by 2002:a02:bb12:: with SMTP id y18mr9776068jan.66.1626458142771; 
 Fri, 16 Jul 2021 10:55:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id m26sm5481404ioo.23.2021.07.16.10.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 10:55:41 -0700 (PDT)
Received: (nullmailer pid 3675453 invoked by uid 1000);
 Fri, 16 Jul 2021 17:55:38 -0000
Date: Fri, 16 Jul 2021 11:55:38 -0600
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, chunkuang.hu@kernel.org,
 devicetree@vger.kernel.org, kernel@collabora.com, drinkcat@chromium.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, hsinyi@chromium.org,
 linux-kernel@vger.kernel.org, eizan@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 3/7] dt-bindings: display: mediatek: add dsi reset
 optional property
Message-ID: <20210716175538.GA3675419@robh.at.kernel.org>
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.3.Ifec72a83f224b62f24cfc967edfe78c5d276b2e3@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714121116.v2.3.Ifec72a83f224b62f24cfc967edfe78c5d276b2e3@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_105548_551731_E269645C 
X-CRM114-Status: GOOD (  12.34  )
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

On Wed, 14 Jul 2021 12:11:37 +0200, Enric Balletbo i Serra wrote:
> Update device tree binding documentation for the dsi to add the optional
> property to reset the dsi controller.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v2:
> - Added a new patch to describe the dsi reset optional property.
> 
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
