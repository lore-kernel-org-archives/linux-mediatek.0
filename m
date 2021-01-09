Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53813C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 03:30:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F46239D1
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 03:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2F46239D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uktqoY107J1mcSIIfTb/7b9u5JEtJjpEKBbuoZaADyI=; b=kQ8lcujz0Jxj8PCZiFrYV7Q8/b
	DCP4hbopkyByF6pyIa3hxgsfNSh9ClfjbOutud5Zt/EaBUny+1RjVIRhJokjGTkFw0ag8dcbi/1d9
	ZRkuWZ/vhJgSBzbW8ZdLgsPCyuxaSucrZ4VeMlKWpzP/5FXE26CnQxM7PGViZqYCLPu1fHShxzibN
	ArdLjItQ2KcNH1pBLpNfQkgKTFzrwLTU/HwOcKyy/uKaKaqYt4Ik3GD+ef0X/fIIRxYHVzo1PMfpF
	KcBdva1MMNLFcsKldJX9iIeEXrKhb7uHguDM3O+XojVd9i61FeMJfsPMFmBMy1BGMzgalpksFh3aP
	lLcbvmPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ky4xT-0006yw-4E; Sat, 09 Jan 2021 03:30:31 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ky4xQ-0006yP-7Y; Sat, 09 Jan 2021 03:30:29 +0000
Received: by mail-io1-f45.google.com with SMTP id o6so11877480iob.10;
 Fri, 08 Jan 2021 19:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=+H9IDqbsovueL7letf+rLIIMkhg3UJszYGBQf9zPSuw=;
 b=s7uvyJiWyXiut91G8EpxKSgW+aiAjen0HWhvqSChRAeaJ4OIuLnJ83r35/hl3k46w/
 J7UiT6yU3OUd9po6zGhJBNmVEPobPUEVXLxR2XJZVRyTXzq/djirpZQ7s4ZbHxMY1BLB
 Kp/6OiAtK97HHxX556epvw5yvjB5JlvreCacRf04gJfTv1VGO6M9jrlHb3KPaa66Hnky
 XsJWsRMCe89N2Saa8K93fsw1p3/cLbP50YfdJa+Hr16k5PdDDEcXLHxgQQucMrdrq42b
 7XbN+IokPEQ/AoMoGhNhbEWwLpv0RPrSioFRrxUGGvJ6OTjkke04T3KFodUrtNk4Ni2n
 loag==
X-Gm-Message-State: AOAM530fg12OGfBThEr7Ge/sntQEka4aWzvdBSoVhbmFgWASvspQrCLe
 10eG5NEXETBvUnMvmHnUVA==
X-Google-Smtp-Source: ABdhPJzHiKwMJh0PaWVNXYntY88PZcUJt9OHYgJ2VMnnb/yu1svmesnqnx+wFRaZo7igVW9Tfy+cvQ==
X-Received: by 2002:a5d:970c:: with SMTP id h12mr7705459iol.103.1610163025502; 
 Fri, 08 Jan 2021 19:30:25 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id z4sm6482374ioh.32.2021.01.08.19.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 19:30:24 -0800 (PST)
Received: (nullmailer pid 3762038 invoked by uid 1000);
 Sat, 09 Jan 2021 03:30:19 -0000
From: Rob Herring <robh@kernel.org>
To: Henry Chen <henryc.chen@mediatek.com>
In-Reply-To: <1610092095-5113-2-git-send-email-henryc.chen@mediatek.com>
References: <1610092095-5113-1-git-send-email-henryc.chen@mediatek.com>
 <1610092095-5113-2-git-send-email-henryc.chen@mediatek.com>
Subject: Re: [PATCH V7 01/13] dt-bindings: soc: Add dvfsrc driver bindings
Date: Fri, 08 Jan 2021 20:30:19 -0700
Message-Id: <1610163019.789930.3762037.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_223028_291448_A8101589 
X-CRM114-Status: GOOD (  12.89  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, James Liao <jamesjj.liao@mediatek.com>,
 Nicolas Boichat <drinkcat@google.com>, linux-pm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryan Case <ryandcase@chromium.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 08 Jan 2021 15:48:03 +0800, Henry Chen wrote:
> Document the binding for enabling dvfsrc on MediaTek SoC.
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/dvfsrc.yaml   | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/mediatek/dvfsrc.example.dts:19:18: fatal error: dt-bindings/interconnect/mtk,mt8183-emi.h: No such file or directory
   19 |         #include <dt-bindings/interconnect/mtk,mt8183-emi.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/soc/mediatek/dvfsrc.example.dt.yaml] Error 1
make: *** [Makefile:1370: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1423679

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
