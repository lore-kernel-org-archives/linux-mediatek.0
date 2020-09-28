Return-Path: <SRS0=uRRy=DF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F6BC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 18:27:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E709206C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 18:27:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qqWaPMTx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E709206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kng3Wnk+uTolN3es6iqz8UydZKySEPnw+YbY72q6FIw=; b=qqWaPMTxvYs56DF9XrUVWh9B9
	m0YsfaKSYLVAltxfvgX3ZqhiMlwaX6NvhgbYlrRn89y4E232hhk7JOeM3KxS8iVQ01zlotv+9caHV
	vZxtVF17bwCFsbVkXQNVq6xVfYX+srGHzvk7KyEcmEquPrGpFk/7WQhqPw7Ualf9FWFEiciSf+7ne
	IGGuHpZL4JAskU3EiB+MrCrjDIIR8TnCzsuc+wGIhkurfUWa/8xvVMKX6qTgmRnKEfAZB5EGLlWjg
	G0rYQwVjSbgLnk3szshMUBsxwglnN+V4b1AqGDq/4NJJ24DY72HYzvsSPcFjJ/9I7CfhPJMjq3vg8
	IU8dLb8AQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMxs4-0006qk-Td; Mon, 28 Sep 2020 18:27:32 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMxs3-0006pi-5m; Mon, 28 Sep 2020 18:27:31 +0000
Received: by mail-ot1-f68.google.com with SMTP id y5so1912618otg.5;
 Mon, 28 Sep 2020 11:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gntewucXGAZEXsmTkYpsZuCb5osJ4WHC8uBmXkRio9g=;
 b=tVznT10EAgmEm8Vtn7PeUwI6HlQC9MjmYlSA0Pu3xwbLuCQj29CgYAT5zf7LklE8Vx
 pQjUk2md69FlXiL+PoXXngSosuihUvkOFpJYR6br+2b/9LzW/ZTJK0UiBSZ0rdIaEBqc
 /jBbqWm7mBhUlo9vrbt33PC8+f68RvacSt0tKTOUu13fsQjdhjnlpRUidUNkz1cEC+VL
 Heve/PzkO3p84UxNK0SON2xKb91+z7dI6Z7KrV19f3fOUdoD7apkSHWF39BOvqocuaQR
 4IAU3IhAo97zQbgIpwTO3hG2PF1xGZFntn3rH+E76rvWBDuWSPvy5S+tb312Yc4YqCPC
 eJEA==
X-Gm-Message-State: AOAM530B0FY7f/rtMnFcaNMNDYvy5opLQu5XgFH/sxc3hCh8i932U01g
 W4T6DPecR/GY6yXQfddaXA==
X-Google-Smtp-Source: ABdhPJynurwsMeyeH9KSDU10nJtgTWqyaJKqKSZEA8jpQUXzumTWDGrLO2HajskY1S2NhK4hbo3OTQ==
X-Received: by 2002:a05:6830:10d9:: with SMTP id
 z25mr205514oto.136.1601317650306; 
 Mon, 28 Sep 2020 11:27:30 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 17sm402857oth.70.2020.09.28.11.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 11:27:29 -0700 (PDT)
Received: (nullmailer pid 3036808 invoked by uid 1000);
 Mon, 28 Sep 2020 18:27:28 -0000
Date: Mon, 28 Sep 2020 13:27:28 -0500
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: iio: adc: add bindings doc for
 MT6360 ADC
Message-ID: <20200928182728.GA3036774@bogus>
References: <1600687442-23658-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600687442-23658-2-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600687442-23658-2-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_142731_258005_F24CE665 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, jic23@kernel.org, pmeerw@pmeerw.net,
 knaack.h@gmx.de, matthias.bgg@gmail.com, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 21 Sep 2020 19:24:00 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> This change adds the binding doc for the MT6360 ADC.
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../bindings/iio/adc/mediatek,mt6360-adc.yaml      | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6360-adc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
