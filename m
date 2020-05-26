Return-Path: <SRS0=I26f=7I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D40C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 May 2020 18:03:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18C3020721
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 May 2020 18:03:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BuuMzkYC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18C3020721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EqyNs6fTsIYlQzbzSZTuLpSScViugD8aY3t3XDPFgEw=; b=BuuMzkYCwMtqLN
	ilRrAeMRCVAtHMfy8a39oMb8m2NRxwieUl1mZV7vyeJ1K8aKFDZw1HFrSV80MqbWEiCTvyOhUhpOW
	Yzlqz5OMTo5Iq4+lXTAjC9wI6Cs/YgwurT6ehkBJ7T6Tc4FvKxcbafqNwKvqN0r76fSwcN8DyXLQb
	IbcP93g9oH5S10AnY4CHV0vQTbgt4Ac1Q1r3pQjL9rpaiBgXhLiSZPqiL3MZiasrc1Ss2st3/RF1P
	o1e+cw9/7FNfGdpkjMmEFBpm5kuwMwzcDfC7KU7W5z/9T0LkB2g5C25gMQfy2G2xM/F3Vw/keCpFU
	2f3xlhuiQ3t+kvHF5Shw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jddvD-0001t9-7w; Tue, 26 May 2020 18:03:27 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jddvA-0001sW-2G; Tue, 26 May 2020 18:03:25 +0000
Received: by mail-il1-f195.google.com with SMTP id 18so21451353iln.9;
 Tue, 26 May 2020 11:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=udyKIAgzUuMLjrt7p/tKMSuE96YEp3YyGPeKVs0pC30=;
 b=IvIe5A3k4WfzsVb6xYpBZAT0WRCC6OTdYOXYS96gzTCAJKcVqB03O2FZeXJRN/Ec5Z
 88SyHOl24lW1L/5sAYXbWuJnRk+HwB5KUELISjk9j8mIIf/reurTYsK1wPmrQE632BmS
 Pm2cFpUpjwZGjvhLAw1r98Srv4ofbiG9OshydxoszKFUFwd6M70XlZQN/paaL8hGZBpj
 kLFloYpM2lyMONDEnn2J5WLpaEqwaorjxrglBw4sVr4fm136bKw21RdGhxelBcZVzSWy
 s/wH2XE0hEtE+/uHj2lhZUTOQCq58lCuO4kBx6o7gFXvZxO+H5XRKJUM8FXX/FoNki9p
 UmlQ==
X-Gm-Message-State: AOAM531uOagWpogKlVpYteu2Njhe0IxlvQ2zvRC0F4SYVm4e4btLLqhx
 agr2r5CAC1+NO9L4FNuJag==
X-Google-Smtp-Source: ABdhPJz49fxHgfKUlXk9bT+7PEkcHyxo07cWGJ72t5O8q64FjmH/+SLrhIzcouiT9jARc7MEOifDQA==
X-Received: by 2002:a92:3d8b:: with SMTP id k11mr785485ilf.122.1590516203049; 
 Tue, 26 May 2020 11:03:23 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id 4sm337307ilc.34.2020.05.26.11.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 11:03:22 -0700 (PDT)
Received: (nullmailer pid 77730 invoked by uid 1000);
 Tue, 26 May 2020 18:03:21 -0000
Date: Tue, 26 May 2020 12:03:21 -0600
From: Rob Herring <robh@kernel.org>
To: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v15 02/11] dt-bindings: soc: Add MT8183 power dt-bindings
Message-ID: <20200526180321.GA77691@bogus>
References: <1590051985-29149-1-git-send-email-weiyi.lu@mediatek.com>
 <1590051985-29149-3-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590051985-29149-3-git-send-email-weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_110324_099490_E797E191 
X-CRM114-Status: GOOD (  10.05  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, James Liao <jamesjj.liao@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, linux-kernel@vger.kernel.org,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 21 May 2020 17:06:15 +0800, Weiyi Lu wrote:
> Add power dt-bindings of MT8183 and introduces "BASIC" and
> "SUBSYS" clock types in binding document.
> The "BASIC" type is compatible to the original power control with
> clock name [a-z]+[0-9]*, e.g. mm, vpu1.
> The "SUBSYS" type is used for bus protection control with clock
> name [a-z]+-[0-9]+, e.g. isp-0, cam-1.
> And add an optional "mediatek,smi" property for phandle to smi-common
> node.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/scpsys.txt    | 21 ++++++++++++++---
>  include/dt-bindings/power/mt8183-power.h           | 26 ++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/power/mt8183-power.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
