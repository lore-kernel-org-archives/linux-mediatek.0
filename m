Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FDFC433F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 15:52:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 288862071A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 15:52:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZMSpgcPc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 288862071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8T1QV0OS51cbKYpSb5K3Vs5UV3S3lmMg/A4/NhIS98A=; b=ZMSpgcPcNOkCqI8DgieYAU+3V
	eL0ed2Fvc+1l+wdQIn6HPggpICyuXI/MS7FZ6utFXiBPnQuXhYXw6BsiptSLGpquXF5fEkAk0M2ac
	/YGdlvvJm3mPopgHhdIf9r6+uA6LRYtQ3ccKCt4aQmnm4dzro9mkO1xDv7/7Z/EC+PGeZkJoGo/7K
	F4pNbhW+MsPiR41sereBDqUsjziea5OHb272obzSxSBJx+uGmw2dPQ6BzuUDkUOqmcSxFEJgkCMUN
	wIwV6qEjZ4QuC6R2BFwwvFd14lufKX4LEqYu3BnM6PKwfrZXenbugN5KrJeJTUwy83R3DGPwpqhpS
	X7xkndnfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jydVu-0006gb-VI; Thu, 23 Jul 2020 15:52:07 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jydVr-0006f6-VA; Thu, 23 Jul 2020 15:52:05 +0000
Received: by mail-io1-f68.google.com with SMTP id a12so6713397ion.13;
 Thu, 23 Jul 2020 08:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QY9kXtA33cXH0+WLfNZ9onY7TD+FXlnMCD83KHcN4Qs=;
 b=Vz8Eii5dwNmI1Q4/1aER6k23faHHjYMrY4W94VwIftEmtrusyJKObTfOiHaVl9I1Bv
 IMUBelqPlLPZxtb4WKMGQkhysTW8JPQTWPOjAAEsoS6QBJjFeCmTvTS/ukGoAlAstP7z
 gRINzxB8FlZRFrdn/UpDwX/At7hw64eodWkRN3eBRKesJXuh+JdLfc1CH28Uhal723N9
 V/OjL0CwuGGkf2ZCKw16cmmpe+hIDKVORfZFqYtCQMagQlHaQRZxMREdRzGKeu7qUK9A
 +GmM2YjnWY359ai+0az0nY5y1d0wX1PMDUQBZDUENwykZiwkoSdGYxWV5E1S2xTzyzKd
 O/MQ==
X-Gm-Message-State: AOAM532GbaLm9yR7YF6e+fkg73UstH0nD+k0R5fU6PA7XBiV+fohod27
 YljqpQdzdM7UhLWGF0jwog==
X-Google-Smtp-Source: ABdhPJzB7/A+V1wRpSWO9D+GvJjuQx16r7g+IJe1Jh2draWFxJPpCwENrGDTtSYu4PAi0I2uf+GxjQ==
X-Received: by 2002:a6b:c815:: with SMTP id y21mr5472143iof.83.1595519523112; 
 Thu, 23 Jul 2020 08:52:03 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id l5sm1642553ios.3.2020.07.23.08.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 08:52:02 -0700 (PDT)
Received: (nullmailer pid 437545 invoked by uid 1000);
 Thu, 23 Jul 2020 15:51:59 -0000
Date: Thu, 23 Jul 2020 09:51:59 -0600
From: Rob Herring <robh@kernel.org>
To: Hanks Chen <hanks.chen@mediatek.com>
Subject: Re: [PATCH v9 2/7] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
Message-ID: <20200723155159.GB436360@bogus>
References: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
 <1595503197-15246-3-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595503197-15246-3-git-send-email-hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_115204_062591_46DE2EA2 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 23 Jul 2020 19:19:52 +0800, Hanks Chen wrote:
> From: Andy Teng <andy.teng@mediatek.com>
> 
> Add devicetree bindings for MediaTek MT6779 pinctrl driver.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 197 ++++++++++++++++++
>  1 file changed, 197 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml: example-0: pinctrl@10005000:reg:0: [0, 268455936, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml: example-0: pinctrl@10005000:reg:1: [0, 297926656, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml: example-0: pinctrl@10005000:reg:2: [0, 298909696, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml: example-0: pinctrl@10005000:reg:3: [0, 300023808, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml: example-0: pinctrl@10005000:reg:4: [0, 300351488, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml: example-0: pinctrl@10005000:reg:5: [0, 300548096, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml: example-0: pinctrl@10005000:reg:6: [0, 301072384, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml: example-0: pinctrl@10005000:reg:7: [0, 301137920, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml: example-0: pinctrl@10005000:reg:8: [0, 268480512, 0, 4096] is too long


See https://patchwork.ozlabs.org/patch/1334743

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
