Return-Path: <SRS0=oN25=F7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C41C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Dec 2020 16:56:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3AD322515
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Dec 2020 16:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3AD322515
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEPoW4rJbzHHBP8AAKvp2Oskqtp5AA/fL79SRlL6FbY=; b=QnFDWHVtFy1RK7Du9F1sQ02bK7
	1A3T9cIge5XFl7HlnXwlfPWoyXCC08XA8dXN82Rv+48qNcaclvI7JeoZ8mIA4yaItW8aBhRyr8o6X
	iUaP/9bzreO+A4GlWHVvXMC0ZydzQRSXuUw+fmjLPcz4ggqkY3EjUsJthGL394RpxUfXfqSTnx08Q
	lt2rNGap2SMDfKAgdbCuyzZ/Isafs+qRQi43Vpfwmzmqc/XhFJBXn8EYGOHVguiLA+xa8JFEnJKKu
	EvTm69slucertBaNnI2zUvsp4ONGK6x59GxsYhbjynFlcljNoUIAGsJeFEMrLaP+pR9P0MBlaCi4O
	wOANr+5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktZLa-0008CR-3v; Sun, 27 Dec 2020 16:56:46 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktZLX-0008Bs-86; Sun, 27 Dec 2020 16:56:44 +0000
Received: by mail-ot1-f50.google.com with SMTP id r9so7346073otk.11;
 Sun, 27 Dec 2020 08:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=TObSc2rN2u01if4JX76VdLUyjWOAUXL7fU5P8PBtpkM=;
 b=nVrP/RAFYDTUdlnEbUks/Is+EFscJdp6Cyqfgf11bvmiEV21sPf1u9C7qohLh4qDjf
 4zz/YYcg8aCd7V7pNGg7Y2JqPnTIh6xzLgSWY7AR+uXq0tdS/XJCLA3EZa5U3CBn4r0o
 FJVy+fGAWLg09t3xJFsFMIjYW0iUaSd/2ZMuRsWONVTLg7rJVjsV+jWvs+pAAfyYsH4q
 IB68eRYcMEBvQo48HGsOZMpMIPkLrRYLGsz6Z5UJS7H8X6xBFKtYtdVAcEfhLRMbmXZd
 KrI42+gcXxtskaDcMG2Jp8hc1TTXqzUmf43x0UQUawOoC0D6lX4Rg1oMXV9f884zULkE
 HMSA==
X-Gm-Message-State: AOAM532+q0gKBDlIQvfqag6AG+jIHYegM4ka4I5ux8DgFfPuhBkcVFW7
 fCXD5icpRlcmonpFsPN9+A==
X-Google-Smtp-Source: ABdhPJzI+JDdO/V+OlTYv1dpS5qIypw11v1uqG0HcyZZgUUJzAQL9TRwlx44+N9mra2kD+OYyuT5Vw==
X-Received: by 2002:a05:6830:214c:: with SMTP id
 r12mr30777477otd.208.1609088202417; 
 Sun, 27 Dec 2020 08:56:42 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id o135sm8531474ooo.38.2020.12.27.08.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Dec 2020 08:56:41 -0800 (PST)
Received: (nullmailer pid 1338176 invoked by uid 1000);
 Sun, 27 Dec 2020 16:56:21 -0000
From: Rob Herring <robh@kernel.org>
To: Roger Lu <roger.lu@mediatek.com>
In-Reply-To: <20201227105449.11452-2-roger.lu@mediatek.com>
References: <20201227105449.11452-1-roger.lu@mediatek.com>
 <20201227105449.11452-2-roger.lu@mediatek.com>
Subject: Re: [PATCH v10 1/7] [v10,
 1/7]: dt-bindings: soc: mediatek: add mtk svs dt-bindings
Date: Sun, 27 Dec 2020 09:56:21 -0700
Message-Id: <1609088181.501243.1338175.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201227_115643_327827_9B20B53F 
X-CRM114-Status: GOOD (  12.68  )
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
Cc: Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 Angus Lin <Angus.Lin@mediatek.com>, Kevin Hilman <khilman@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 YT Lee <yt.lee@mediatek.com>, Enric Balletbo Serra <eballetbo@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 HenryC Chen <HenryC.Chen@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@google.com>, Mark Rutland <mark.rutland@arm.com>,
 Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 27 Dec 2020 18:54:43 +0800, Roger Lu wrote:
> Document the binding for enabling mtk svs on MediaTek SoC.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  .../bindings/soc/mediatek/mtk-svs.yaml        | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.example.dt.yaml: example-0: svs@1100b000:reg:0: [0, 285257728, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml

See https://patchwork.ozlabs.org/patch/1420728

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
