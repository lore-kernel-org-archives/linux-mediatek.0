Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C41DC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 18:27:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 150A022B43
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 18:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AJzMur5q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 150A022B43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DfS8dM8H3kQXF/i0dDZoJUDGHpgUwkFGzarlnjpu6PM=; b=AJzMur5qWOP4XGQo06e7gnp6k
	ukUtytEjpyFR2L5jvvDpaPMh0CqwIaa32u+5oOLve91HsNgnQwplg6WX+tpOg5gTcu95He8XZRGrI
	DACfjLEQ1Mm6oi/sPqq8+baLPS0FHO6KRgxTDE5IA1+o9EbIatF5lX953HynO1mMrRwAUCPVgS3Kn
	eHKmID7Y5CuQFuP3zDJqm+hDreXg1xdvQqKlo46chjvS1RGpM7HHaIzj2HWOKQBWPovlvAMEeJqfz
	fXJa6HKlT9fXTDPCLGhNBZqGUTJ4cQSn0Z8s22RLzFblsGRiCn8lxIWnMNJEgzdrZtgzK1B3lZOxL
	saM5PdwPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1Zk8-0003Kg-Ty; Fri, 31 Jul 2020 18:26:57 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Zk6-0003Jt-5u; Fri, 31 Jul 2020 18:26:54 +0000
Received: by mail-io1-f65.google.com with SMTP id l1so32551122ioh.5;
 Fri, 31 Jul 2020 11:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KuRbjLAdk2qF/sclDpIueUjPnM2F0YR1YcWElNzgbpU=;
 b=IYTZCXaGYBvhKk5GPehQ0a7KK8Ewy1RU4LfcHBR8yEXQzbNbbNmq1Tjxbd8Fz+BpMQ
 e1VZFlt3575KJ+HuUax6o4Sw6LghzNv+hYCHRWNYXtOcuIV3hXit5whAE9Y8yooInLRC
 pIZTipZFozMFWdH25ofHJWQSKKqOba6+hrvDsoAJySHLRFKsK3IZFtBLduzYzOG6HZGa
 yNneA6YD1BXJgM08wZOO/G/orA5w1olA3xbMGl7zeBStmjFbxUQM/O8IKFalyMhgmOsk
 NDA8NCc/sKns+eLMjNGH25u7H4y9gTYYDqwQDtZHTxK5+weI+DlFxG4PqOFoy5WKLxZn
 OXEA==
X-Gm-Message-State: AOAM531juYgrye+7Db2ZCFtXs8eQ1oj2Vje3G2v8sZYIibd8TqMmw+iK
 nzHVNbNXRbhf8LA/0OmDlg==
X-Google-Smtp-Source: ABdhPJyQ+8uvOFgjmwMbjdzK/nhCeKXR4ECMzLtnQXdzQAe67dqY7s5ndxY9dXDf+RshQZN4g44q9A==
X-Received: by 2002:a05:6602:150:: with SMTP id
 v16mr4742498iot.80.1596220012124; 
 Fri, 31 Jul 2020 11:26:52 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id t17sm2378512ilq.69.2020.07.31.11.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 11:26:51 -0700 (PDT)
Received: (nullmailer pid 531147 invoked by uid 1000);
 Fri, 31 Jul 2020 18:26:50 -0000
Date: Fri, 31 Jul 2020 12:26:50 -0600
From: Rob Herring <robh@kernel.org>
To: Hanks Chen <hanks.chen@mediatek.com>
Subject: Re: [PATCH v10 1/3] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
Message-ID: <20200731182650.GA531094@bogus>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
 <1596115816-11758-2-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596115816-11758-2-git-send-email-hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_142654_253916_BDF455F6 
X-CRM114-Status: GOOD (  12.59  )
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
 Stephen Boyd <sboyd@kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Andy Teng <andy.teng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 mtk01761 <wendell.lin@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 30 Jul 2020 21:30:14 +0800, Hanks Chen wrote:
> From: Andy Teng <andy.teng@mediatek.com>
> 
> Add devicetree bindings for MediaTek MT6779 pinctrl driver.
> 
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 202 ++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
