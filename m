Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94E9C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 23:15:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99F10221EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 23:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IVXEtTcP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99F10221EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/dkpsvakD2F1M4S7l1yOq7otDVcYXtGZtYVKNyBgwo8=; b=IVXEtTcPo0W5QVfpopHhDfikK
	t1Oce25cOSelWABfo4Yo0DhobSk6p08c/fCBYHu/QPhms2iWQJ2HrkiDfiAk6vlNQPNi1Ty/BUMSi
	S+xszA+6LrjzLwbZM6jV9SupGyGt4toxWJJbio/r/hWKuk5o+czaxt8q7QuTPzvcToKbW95W8NOTN
	zs7WGbZrRYUr2Ezaj1hexkEZxyxs7FYwK4D0tkB5UGnvf7HTBkgWYsZU8xwN9SouyqMeEE9HUI841
	+R7ZUKWp7ns6DBXlg7Hpb20YErm+y013ryYO1FEzfONk3WPhyyqbOyO0diN55w5wJ+pIJ1geIh8Ub
	zM+RmOb6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKrUz-00035D-02; Tue, 22 Sep 2020 23:15:01 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKrUs-000330-Qu; Tue, 22 Sep 2020 23:14:56 +0000
Received: by mail-il1-f194.google.com with SMTP id x18so16557652ila.7;
 Tue, 22 Sep 2020 16:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AOMIrv105VAQ5jLvYFtagW/T9+P98LUmqEIXqmLJvlI=;
 b=gUE46yCpItDdb350yNqSOAXuitCCxHVob/rAdarbwsSiTw8+FtQSO+QgK34TfDJ/r1
 ri1wJ0J+ko1GNXIpcZ9K8CwYf3ArBmVaLz89p4pU6N0p8x5cUCxXp52GeDhqsw0zfrPd
 bijoxVz6p5jDB2C/tu4UX8GX+tnyaFExOrh8Svta7uQU4JQMO9p+Z3q0ZLmHlwg46R53
 +RDA25lQz5O1X74Nt5LQFhqZrd66233zDDyQxWSQdmlFjB0lhKUo6hvXyzUrMXoXFKUp
 9CBO2UDc8uPsEdmxm+ML2x9hNBLqNhKsmpRknGy9o9UotoJf+fjMp9a5ZaHDe0IcGGlJ
 uYTw==
X-Gm-Message-State: AOAM530aECD9d5dP0+h2hAPiw05RGUdCz6CxMrDxbVJS4ans0ZsceU96
 V0w1uivZ6Ajd3c/70sFU5w==
X-Google-Smtp-Source: ABdhPJwfHoRB8beetX5qcoNEpJvmy4qrDYFw16WBeEUrgkDGw6+w4fvp+4aNkkYoNJBxhUGlAGxZnQ==
X-Received: by 2002:a92:cbcd:: with SMTP id s13mr5969567ilq.306.1600816492469; 
 Tue, 22 Sep 2020 16:14:52 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id s1sm9776540iln.22.2020.09.22.16.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 16:14:51 -0700 (PDT)
Received: (nullmailer pid 3446962 invoked by uid 1000);
 Tue, 22 Sep 2020 23:14:50 -0000
Date: Tue, 22 Sep 2020 17:14:50 -0600
From: Rob Herring <robh@kernel.org>
To: Henry Chen <henryc.chen@mediatek.com>
Subject: Re: [PATCH V5 01/17] dt-bindings: soc: Add dvfsrc driver bindings
Message-ID: <20200922231450.GA3433939@bogus>
References: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
 <1600052684-21198-2-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600052684-21198-2-git-send-email-henryc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_191454_897567_27C18082 
X-CRM114-Status: GOOD (  22.15  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Mike Turquette <mturquette@linaro.org>, James Liao <jamesjj.liao@mediatek.com>,
 Viresh Kumar <vireshk@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Ryan Case <ryandcase@chromium.org>,
 Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Georgi Djakov <georgi.djakov@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 14, 2020 at 11:04:28AM +0800, Henry Chen wrote:
> Document the binding for enabling dvfsrc on MediaTek SoC.
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

I did, but bindings are in DT schema format now. We had a grace 
period for some time, but please convert this to DT schema.

Rob

> ---
>  .../devicetree/bindings/soc/mediatek/dvfsrc.txt    | 25 ++++++++++++++++++++++
>  include/dt-bindings/soc/mtk,dvfsrc.h               | 14 ++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
>  create mode 100644 include/dt-bindings/soc/mtk,dvfsrc.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
> new file mode 100644
> index 0000000..d5a47d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
> @@ -0,0 +1,25 @@
> +MediaTek DVFSRC
> +
> +The Dynamic Voltage and Frequency Scaling Resource Collector (DVFSRC) is a
> +HW module which is used to collect all the requests from both software and
> +hardware and turn into the decision of minimum operating voltage and minimum
> +DRAM frequency to fulfill those requests.
> +
> +Required Properties:
> +- compatible: Should be one of the following
> +	- "mediatek,mt6873-dvfsrc": For MT6873 SoC
> +	- "mediatek,mt8183-dvfsrc": For MT8183 SoC
> +	- "mediatek,mt8192-dvfsrc": For MT8192 SoC
> +- reg: Address range of the DVFSRC unit
> +- clock-names: Must include the following entries:
> +	"dvfsrc": DVFSRC module clock
> +- clocks: Must contain an entry for each entry in clock-names.
> +
> +Example:
> +
> +	dvfsrc@10012000 {
> +		compatible = "mediatek,mt8183-dvfsrc";
> +		reg = <0 0x10012000 0 0x1000>;
> +		clocks = <&infracfg CLK_INFRA_DVFSRC>;
> +		clock-names = "dvfsrc";
> +	};
> diff --git a/include/dt-bindings/soc/mtk,dvfsrc.h b/include/dt-bindings/soc/mtk,dvfsrc.h
> new file mode 100644
> index 0000000..a522488
> --- /dev/null
> +++ b/include/dt-bindings/soc/mtk,dvfsrc.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (c) 2018 MediaTek Inc.
> + */
> +
> +#ifndef _DT_BINDINGS_POWER_MTK_DVFSRC_H
> +#define _DT_BINDINGS_POWER_MTK_DVFSRC_H
> +
> +#define MT8183_DVFSRC_LEVEL_1	1
> +#define MT8183_DVFSRC_LEVEL_2	2
> +#define MT8183_DVFSRC_LEVEL_3	3
> +#define MT8183_DVFSRC_LEVEL_4	4
> +
> +#endif /* _DT_BINDINGS_POWER_MTK_DVFSRC_H */
> -- 
> 1.9.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
