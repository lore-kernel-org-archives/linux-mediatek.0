Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F29FC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:49:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE3FA6192F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE3FA6192F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ht2/VMgmUA9Ue86QNbhfN7IExDf0FsVNg7m6md4iIw=; b=YYnvvGYJEbEwxyuoOPzeAFvyxx
	0gd39AFJkBWLMflHWTkpSIDLdtKYjWJtyeNQlGrBH+KYcq98eGTEf/CYHh8vZibjG7QrR1CZQNOCz
	ka4P27dUSPwzwgqauE7m1+298VTc0rkT/knNrE0owYY/QyFex9IHeq1VYjpOX/4fzfXtDJS+hNYc0
	6qNg7EbWxnwxwbksHgXLdn7t9lcLvEC5ayScO7oV+MX+4Uk0hzNkuvCkQwWRRtCJR+nxIjYa830Em
	eO8mtwpgPYfK/b2eH02Plrd/sWlzTibqwel6OYqtrNLk42xXaQtk7pEepsQpw6ucUH9zhmPP2LDjE
	LoWVD2UQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxtC-001JTW-3i; Mon, 29 Mar 2021 19:49:30 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQrYq-000fLc-Ca; Mon, 29 Mar 2021 13:04:06 +0000
Received: by mail-oi1-f170.google.com with SMTP id x207so13013070oif.1;
 Mon, 29 Mar 2021 06:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Y1aIiE7SFwLQK579HkpbIqGKLeyiA5YPx8hVoVVgXFQ=;
 b=JhjwGOVsrPuZB56Ff01vVbjnPoN4m1cN5Yi1YRsHjfweUYS1eUf5fWAtSxyaW3/E1X
 yIN2f7K9XT4Fmc5PUuex4z043FbGshSfqWqR4IVIRCVTgjpH/Q4vBLd1QLDo8EL2vIVn
 7VrA5i6QXmtqgipqIvGhh8waI+IAnTeYJ7YxX98ncsTi729x/BTMWRqds58za3AWYEDc
 t3BNy/jfc2IIx+wONjLmlVdkWJXGayrJhZKWXrUyyXAOP1EHrAopbAlTNn76M5VfcK7D
 Vcg7hpG3jjCvB3e0R0zYxAWZ2/hEClwCkeLFaOSbpXzRwjOs+EnFLsKVCVf6WWQ/Afxx
 AQfg==
X-Gm-Message-State: AOAM533nCigb+y/5snh4fDpvCWtjHdENAEADIjgtMpeEwQAq4CB009hm
 Kt6yLTKVEN1JvN+24uK22w==
X-Google-Smtp-Source: ABdhPJxVuo/+GjIyZRUdPE+WRTKXBoClchzvVKeZT69JaPvZAiRQuZKQWu0b5ZjOPvHdZRAEBZmUjQ==
X-Received: by 2002:aca:6545:: with SMTP id j5mr18291241oiw.31.1617023038568; 
 Mon, 29 Mar 2021 06:03:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w12sm4346423oti.53.2021.03.29.06.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 06:03:57 -0700 (PDT)
Received: (nullmailer pid 2404780 invoked by uid 1000);
 Mon, 29 Mar 2021 13:03:52 -0000
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 hui.liu@mediatek.com, sean.wang@mediatek.com, erin.lo@mediatek.com,
 jg_poxu@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, biao.huang@mediatek.com, srv_heupstream@mediatek.com,
 matthias.bgg@gmail.com, linus.walleij@linaro.org, sean.wang@kernel.org,
 eddie.huang@mediatek.com, hongzhou.yang@mediatek.com, sj.huang@mediatek.com,
 seiya.wang@mediatek.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org
In-Reply-To: <20210329065047.8388-3-zhiyong.tao@mediatek.com>
References: <20210329065047.8388-1-zhiyong.tao@mediatek.com>
 <20210329065047.8388-3-zhiyong.tao@mediatek.com>
Subject: Re: [PATCH 2/6] dt-bindings: pinctrl: mt8195: add binding document
Date: Mon, 29 Mar 2021 08:03:52 -0500
Message-Id: <1617023032.510147.2404779.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_140404_530134_21605788 
X-CRM114-Status: GOOD (  12.27  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 29 Mar 2021 14:50:43 +0800, Zhiyong Tao wrote:
> The commit adds mt8195 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 152 ++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dts:19:18: fatal error: dt-bindings/pinctrl/mt8195-pinfunc.h: No such file or directory
   19 |         #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:349: Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1380: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1459436

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
