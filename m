Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30941C433E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 16:58:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F289220771
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 16:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lWccCvFb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F289220771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tDp2hdaMnEt/2mgnN4A2skT5MDP8CVEYGshytDjOicU=; b=lWccCvFbtqqypcvVfYUVdLZsa
	/w0W70lxb9vcMYi9UAdyoXHUuG/356zS1+QhD1gXmLzEBdKwFA8GYPUEgUv+LxRiw3o4Aj9hsEcam
	NtNWYgGheevEqJqOWbmf9VlYZN+4E77b/Imt20IEiXeyf+Tf8RxlLY6gOG2uhXc6GcAd/didP1k/J
	E91O075snXZEt7Eg/I4SRLOArjxJ6JiDek9l9ZPVnAEidMMvhIwRH03DylbAFgg2fWlams5KI1rA6
	KS5heD5C50Eqm7nfXiZMxzfsmqlPMb1LZXXrplpRdurMPd+a4XB2kUCX8hOHxITk7bgxyhWd+lW/W
	Vc+BD+B+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyeXo-0000sw-Ic; Thu, 23 Jul 2020 16:58:08 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyeXj-0000r0-0r; Thu, 23 Jul 2020 16:58:03 +0000
Received: by mail-il1-f193.google.com with SMTP id k6so4920502ili.6;
 Thu, 23 Jul 2020 09:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0LnwlI1S5EQWUCFb6m87YysKGHLu9NoBXK/tn34ZRrc=;
 b=lRNYM2KjKIZzvagg5esBcQ2ottsr/NO18gu1Sn7nlAeM2UGEbvwQZvmRaKtjGyBihF
 BdaWrxbtJ4kGiSRuXuMQ7/Bxd78vVz+GBXaVXOIh7kywk/p2lZTDyxULPPFDZePs7CBI
 Do1/26047b0ndl/saqBenvSaSxzIOwW3D67e85vFPR4NSYyKzDOA5bOoKjCEPt357LLS
 cQWMiHKnd3FoGEcIVxjwRtKLU7M2DxXXHCSIBwpaQSnLl2SShKaadLaegarbfKGF5i6+
 1hzwBGWRdnZlxjPARu7WH1w+l/qJzV2y1MwJ1TMMMEadrmKLaKGulGDOaJpmxVhsdgwX
 o3bA==
X-Gm-Message-State: AOAM531VQNh3MhLeupwaRe9+HeptTn9bqLRH4e1JqaF0oO2d8Aqa7j7h
 5R9AnW27Jm8NK/aL74G+JA==
X-Google-Smtp-Source: ABdhPJwQCiVULLsxm4VGGqM8O9N7yWxVLbkgy3IfVHRROofBGtaoCFRjZH3xwx9PT3bCh81k8FzNUA==
X-Received: by 2002:a92:cd48:: with SMTP id v8mr6202422ilq.114.1595523482443; 
 Thu, 23 Jul 2020 09:58:02 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id d18sm1710697ils.34.2020.07.23.09.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 09:58:01 -0700 (PDT)
Received: (nullmailer pid 529139 invoked by uid 1000);
 Thu, 23 Jul 2020 16:58:00 -0000
Date: Thu, 23 Jul 2020 10:58:00 -0600
From: Rob Herring <robh@kernel.org>
To: Hanks Chen <hanks.chen@mediatek.com>
Subject: Re: [PATCH v9 1/7] pinctrl: mediatek: update pinmux definitions for
 mt6779
Message-ID: <20200723165800.GA529090@bogus>
References: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
 <1595503197-15246-2-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595503197-15246-2-git-send-email-hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_125803_096745_70F66C4A 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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
 Rob Herring <robh+dt@kernel.org>, Mars Cheng <mars.cheng@mediatek.com>,
 mtk01761 <wendell.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 23 Jul 2020 19:19:51 +0800, Hanks Chen wrote:
> Add devicetree bindings for Mediatek mt6779 SoC Pin Controller.
> 
> Acked-by: Sean Wang <sean.wang@kernel.org>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>  include/dt-bindings/pinctrl/mt6779-pinfunc.h | 1242 ++++++++++++++++++
>  1 file changed, 1242 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/mt6779-pinfunc.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
