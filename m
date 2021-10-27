Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49728C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 21:14:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15703610C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 21:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15703610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhYUm2Df8nwRi9LVlIULHSxLMdN/LOWHOwGESc0drNQ=; b=bp9JYmEySQXSUL
	zfdOJvwPjNjSE8HfyKJ4nmjGcmHf++JhugZGJeP/a+eze7cyxYAIRfYSPp2dVHcm5ImjrFeyRkApq
	x3dymyMAcupvCtxI/e9nDtwLhIUpNc3VFsr0qswCHpTVKBsDRi63gGS4qZ7iB5ZbKVM7aL8lns6+4
	iZoOrIiddY+gjcBXPFMSkyLc7KIvupqULEjjek+ZWHuwG5kh0whnl0xw6NvnVaKtxqxMVpHtv6WuW
	ZeURTqT2f2Qy1kErIbjFF1vIz8I+ztBo2BMS7Eo1dmA/0qrv57MpVsvXXZk9jbOL4/GFKIZ+v+3O5
	UFI/Tthi0MqBjQZ79jVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqFu-0069jY-DD; Wed, 27 Oct 2021 21:14:42 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqFh-0069gi-LW; Wed, 27 Oct 2021 21:14:30 +0000
Received: by mail-oo1-f50.google.com with SMTP id
 x135-20020a4a418d000000b002b961605657so711548ooa.10; 
 Wed, 27 Oct 2021 14:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CJSIZaeEBhe5YMBx9tmH/R7HcOfMOJ6hwZcBR6+Xj2g=;
 b=fAleqQ5kMppuJXZSReUn5rXPL1wzAa3/opuZap4Jq1JOnGrJAgMTlGidZreuw/V1zC
 uKFT1gtFQpUCOVC/NIeiuTDlsDHuDbdWBVEQLINDGEbLMnbQghlKytBIhXhdq0ZhsjHW
 A2ncMbbX50TJHx5nxobPB8ZitjQMA8P2QyMDFTYE9alHmFFLHsvwvi8QX29JYWNUu11U
 TMxdPIhcKIM6FgZv+SjLoCRh5Te45woAUKFSxXyermhSapbH9IIJlTEm+TPc/CaDN8UB
 Eddjo8e6J0o2O/GSsR0NhWfiGK7buX5Isk0KyZ1lO5N4UNKi7VYzcgHGLF9sSUvP6F/F
 s7fw==
X-Gm-Message-State: AOAM532YDALgYDL2I7mR/HX4hjH8erD5SKJMGYghB8pTsUC5qW1nc9l2
 iuyxcNabwZm0shbZWd2p3Yicx7EKSA==
X-Google-Smtp-Source: ABdhPJwxt86SP+IAUjo+Patg6hI1/tUjFFwhYzxbtIQW22LLv8M06Hz8oOwlh8gsDUvnimO4DGP2Eg==
X-Received: by 2002:a4a:b307:: with SMTP id m7mr57837ooo.83.1635369268810;
 Wed, 27 Oct 2021 14:14:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h17sm372432otm.69.2021.10.27.14.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:14:28 -0700 (PDT)
Received: (nullmailer pid 2173293 invoked by uid 1000);
 Wed, 27 Oct 2021 21:14:27 -0000
Date: Wed, 27 Oct 2021 16:14:27 -0500
From: Rob Herring <robh@kernel.org>
To: Flora Fu <flora.fu@mediatek.com>
Cc: Ikjoon Jang <ikjn@chromium.org>, devicetree@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: soc: mediatek: apusys: Add new
 document for APU power domain
Message-ID: <YXnBM0XaTU2iPChN@robh.at.kernel.org>
References: <20211023101334.27686-1-flora.fu@mediatek.com>
 <20211023101334.27686-5-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211023101334.27686-5-flora.fu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141429_722628_8F1C0DB0 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

On Sat, 23 Oct 2021 18:13:31 +0800, Flora Fu wrote:
> Document the bindings for APU power domain on MediaTek SoC.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
>  .../soc/mediatek/mediatek,apu-pm.yaml         | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
