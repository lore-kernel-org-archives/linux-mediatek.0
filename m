Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3ACC433E9
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 16:14:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 361DC20716
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 16:14:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TNiZsOXK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 361DC20716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oTNdOrU2+DUJGmedIe37aYVHGcMtOKfNGha0n2neg7o=; b=TNiZsOXKziKEoVNfzI7gfFEUk
	sysH+wpknXxGK8QQZQ6Nb3QUltWR6qykucfMt5splywEZLxK3eGuYPr/y/XocOrNb+zocGPXBVviE
	irLC6sAOdYUSndV3aeVEOrolNJqZMcBOjIx0o5b13Bdcs9n63F1iunlz1l1hneMT7Rot+x/cjQ7Xz
	j+ikERqksAFGpLQsahmAvx20dLiaCwx1gdQH8EjOTvUR+tJ0zx8XItTPOphbNqSLD/Xuv2QXugaES
	mhSrRfMAqmpt2cfW8XjZnhRphkQVF4MfgyTnW6ruEYO8kKu6Mj/CeG/7IPdg1aWhwK5IuqqXjHzFK
	MCkzP64kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDrrz-0005ZF-PG; Thu, 03 Sep 2020 16:13:51 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDrrx-0005YV-Dp; Thu, 03 Sep 2020 16:13:50 +0000
Received: by mail-il1-f196.google.com with SMTP id b17so3163615ilh.4;
 Thu, 03 Sep 2020 09:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KSaYDFKB9d3Xzaft2AwH2tdylPesgPoWd1Kd8HYa4NA=;
 b=Xu1gy+7dZbSQGV9Ba6uvxFLZuPT73uiVNCVlZ6bfcge5HnSFuq1hNFhPo3HTb8qN2k
 /s6JGiUg+TiUsQW8UFNi8SHnlvy7UcZm+GM6i5cy95QHLzANEn7/ihx1ucJ8Ao4vj3Cu
 Fvcvm9EYi4fAWjhocZrlBfLcekK0SQhIvE/X0zMaMs3SUHlFjse/4tBzhvjsfj4DvQ/z
 nTeeHVTF/2ajBsxNpGWLt6vyB9Z+DFMpnTRS2GKvN+qdSgHyhSrNsrY9LStp2fmTwuSL
 7Qb0o2K2fFQ7kyWV6g6x3lNZ0M+er4AfykrabtyB+LUoHAFTu4mPWVL/5tyiG0Am6dZI
 D6eg==
X-Gm-Message-State: AOAM5322DjHa/+N6L5GY57EBZr2Ujh+PUbcqNyTOKC9CxmDxQ22zbuum
 2OrUCyzXIbFZOZGaVCwPIA==
X-Google-Smtp-Source: ABdhPJxQkdynaDRsdchZHJFTnnExJD9kk3HJ8bWg1hLyJkv+YGejuGak1vz9fxVYkxnuwvJJECe9SA==
X-Received: by 2002:a05:6e02:e07:: with SMTP id
 a7mr3556940ilk.277.1599149628555; 
 Thu, 03 Sep 2020 09:13:48 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id 137sm1554980ioc.20.2020.09.03.09.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 09:13:48 -0700 (PDT)
Received: (nullmailer pid 2875634 invoked by uid 1000);
 Thu, 03 Sep 2020 16:13:46 -0000
Date: Thu, 3 Sep 2020 10:13:46 -0600
From: Rob Herring <robh@kernel.org>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH v14 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200903161346.GA2875415@bogus>
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
 <20200902120122.24456-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200902120122.24456-2-dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_121349_485369_68DB7786 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org,
 srv_heupstream@mediatek.com, mchehab@kernel.org, shengnan.wang@mediatek.com,
 tfiga@chromium.org, louis.kuo@mediatek.com, sj.huang@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 02 Sep 2020 20:01:21 +0800, Dongchun Zhu wrote:
> Add YAML device tree binding for OV02A10 CMOS image sensor,
> and the relevant MAINTAINERS entries.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 161 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 168 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.example.dts:28.45-46 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1355723

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
