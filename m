Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6C0C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 13:09:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E88DB619BD
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 13:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E88DB619BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlczjtiU3DwrahLVzPUK3R2yz5gep3fJtwWL1ID8Vwo=; b=XQURPusRzqa1e4kIWmnp2amfX2
	ExjDVyfA9uOsle/LhDfh0J401S/nI35QtfLNaBH2W/c+nnLBcYiL2jGkArCBEIn5gbV6JY6AOG7b8
	/WkDf39rmN4RuEM0xbdmlbBPk+pStRpbN3nnsi68ka2k87NYHp94eV1T6RHgxAM36NuifDIKpr6H3
	KThTNEiAy++crY+ZQp4D3GArXfN5yNMz9a5Abj+EaIzs7c/trNq/8lcd1TV3eUiZj+1B0hrQm23Ak
	vzNH+FaWWdBVWBtqjP0P+yhZJYlsB/D9GXH74x12ViweG/bECMXPh/oSo6eCCKpczblOJoPzaMI9u
	er+KL6kQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRE7E-003miw-Jw; Tue, 30 Mar 2021 13:09:04 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRE70-003mgH-Ud; Tue, 30 Mar 2021 13:08:53 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 m21-20020a9d7ad50000b02901b83efc84a0so15470279otn.10; 
 Tue, 30 Mar 2021 06:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=d0esxVlzEhb3JH+b3fgvU+zO38K7IQvBZ8HUtZrPwqE=;
 b=po9sMfRnTC9fAc18xGJhK+TVAWFPEnt/5Qb5AEwVm6Tum/FTZ3P2uElgizIll4EsTW
 etlyX2/C48xiclZKlEPwL1igjQ2+MF+bTmFl9LKJjhs6bx/6/SYxYVp4wscW+FGwE55T
 Tq4THN1a3VuLKq9bnDuNlE4LUb4qRxW7WDmoe8XhkUReF5CMA0Boi+qmCl3fEd48ArWd
 X8Svo8oQEXBw/WsNevl3sJLSujH0CVWT3CvINjMgly7IzInCJQo86nVhOQHwWoJ7Ozw8
 w+N0pMKc5bdI6W9dxJSvekOM4yYNsADTb5fBzdKtxw1hWkT1ZLSDT5tyPUtNdoI+rPKJ
 KlLQ==
X-Gm-Message-State: AOAM530pifp2HzJAgmOhb/ZTy+gAZKi6HpkmeWFxrZ4Utxd5V9mBDvB4
 IEehl/5OBOJ451ddi3CRgt4y/T7yyQ==
X-Google-Smtp-Source: ABdhPJwxcg8UuZxNUy96UlZZyR7nZyaAJx7lXDRmu+lHPciAUFsa1hvxowVArjRKxWpIKB0EMpcBtQ==
X-Received: by 2002:a9d:37b4:: with SMTP id x49mr27206389otb.237.1617109728396; 
 Tue, 30 Mar 2021 06:08:48 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d206sm4119179oib.56.2021.03.30.06.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 06:08:46 -0700 (PDT)
Received: (nullmailer pid 173737 invoked by uid 1000);
 Tue, 30 Mar 2021 13:08:43 -0000
From: Rob Herring <robh@kernel.org>
To: Po-Kai Chi <pk.chi@mediatek.com>
Cc: wsd_upstream@mediatek.com, CC Hwang <cc.hwang@mediatek.com>,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Loda Chou <loda.chou@mediatek.com>
In-Reply-To: <1617081731-7408-2-git-send-email-pk.chi@mediatek.com>
References: <1617081731-7408-1-git-send-email-pk.chi@mediatek.com>
 <1617081731-7408-2-git-send-email-pk.chi@mediatek.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: memory: Add binding for MediaTek
 Common DRAM Controller
Date: Tue, 30 Mar 2021 08:08:43 -0500
Message-Id: <1617109723.726939.173736.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_140851_071436_786DB9C1 
X-CRM114-Status: GOOD (  12.33  )
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

On Tue, 30 Mar 2021 13:22:08 +0800, Po-Kai Chi wrote:
> This patch adds the documentation of the device-tree binding for
> MediaTek Common DRAM Controller.
> 
> Signed-off-by: Po-Kai Chi <pk.chi@mediatek.com>
> ---
>  .../memory-controllers/mediatek,dramc.yaml         |  155 ++++++++++++++++++++
>  1 file changed, 155 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.example.dts:43.3-44.1 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:377: Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1414: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1459879

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
