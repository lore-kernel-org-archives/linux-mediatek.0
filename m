Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A796FC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 19:30:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56823224DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 19:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56823224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AiWdKxadIXo4sQaLjMraGQYYV+GmAIp9htEsgizbW9s=; b=hi0Y9t93CF9vA05W9aqj51E6I
	PSXQ6dw1B0z3rI6YVTXWUMdgUjWhtkmlMcx5OaZYzKtMy32RNXQQ0zcG4pH96uCCgHUtvz5v8Nl4g
	3ZMNejJTGo+Jd6eCJb5iBFoeXelGfz1J27OKCgQZQktntJQfJc88GXFtEtzVmWd49z+cUGJREPsCF
	f1hRTyw1nkokB5fxNMDWlXfCFOwrVFTFcfFX7jIj1AG2Iu38bjDTOIF3ZaV7zVuFY57X6JR2R5sp6
	De3mPzh7MJo3iOEAuhGNu5v1ldEXzB2MVXrVM8ZNQx/SIsKSpgAJrialWY42YYzX0VWPl1XWvUVpB
	vsJXBKzvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l47YX-00037Y-3G; Mon, 25 Jan 2021 19:29:45 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l47Wu-0002RB-Jj; Mon, 25 Jan 2021 19:28:17 +0000
Received: by mail-oo1-f51.google.com with SMTP id n19so2161000ooj.11;
 Mon, 25 Jan 2021 11:28:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f1ql3qmKtKUBcfggl4PtEkcGo/McfdbzrD7ix9pM9ug=;
 b=ARlFeP1LPdU1QZExhJ3ubLtFoRM9T0DaWjcV8zl4eAETqauZwcyrItJctyvejzw7xr
 ynJrsIdpioQENGP1/l5LtNr+MLEN/GkLinACJf8oSZc1JQhrSmhhcgWmuweEG8RsX0JN
 R/iBND9oWrZvgMl2qzxNOcl1hbOK91TSIEEZ/pI3kG7pXGkbB39IV5L/66G+GLb5l+8C
 d+6BHdzd4PWIchUO7252tYhr0Kvby7s/qMRUDgJtXw7oT8FrqPZUEhdyAb80vzKFdloc
 jLfb3mqXEokKBalwPCWybGYFypVp4HJCSi4g0DBetwQqy/RpcErrufSIJdZG4qlH13jM
 otXA==
X-Gm-Message-State: AOAM530zKzg+50mciZFVvS2GueqAg6o106eyY4WT6H3A0HaAg9c/5jD1
 2/ChPTsqq0Zaoye6QbUsVw==
X-Google-Smtp-Source: ABdhPJykXn0r+tDnB/aHlhNQIwDwGzPDmNconZtOosNygiHPN68ntf/2aHOEGq2/Y9aFF+5Jofq2ww==
X-Received: by 2002:a4a:3150:: with SMTP id v16mr1455948oog.71.1611602882417; 
 Mon, 25 Jan 2021 11:28:02 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 66sm2761860otw.75.2021.01.25.11.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 11:28:01 -0800 (PST)
Received: (nullmailer pid 814724 invoked by uid 1000);
 Mon, 25 Jan 2021 19:28:00 -0000
Date: Mon, 25 Jan 2021 13:28:00 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: mt8183: Add krane-sku0 board.
Message-ID: <20210125192800.GA814682@robh.at.kernel.org>
References: <20210113062834.4043956-1-hsinyi@chromium.org>
 <20210113062834.4043956-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113062834.4043956-2-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_142804_735610_64A4017C 
X-CRM114-Status: GOOD (  12.26  )
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
 linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 13 Jan 2021 14:28:35 +0800, Hsin-Yi Wang wrote:
> Similar to krane-sku176 but using a different panel source.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> change:
> v3: fix yaml
> ---
>  .../devicetree/bindings/arm/mediatek.yaml     |  4 +++-
>  arch/arm64/boot/dts/mediatek/Makefile         |  1 +
>  .../dts/mediatek/mt8183-kukui-krane-sku0.dts  | 23 +++++++++++++++++++
>  3 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
