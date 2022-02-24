Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CB2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 17:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbkpxW67fymtByvCgLOredTNbYiE2snqMHdto95tYu0=; b=kT8XbpEfUQRDCQ
	ZgfGlFKwbd1R5l0jyK7ZJrGFLnfmBWiZMIh4qKb4553+163lrOynt1i5lf6LMg+eJi1B63Zo5DQf3
	omgVv5E36nQScAeELkrpW8BbZabKTtMSy7cD+gt+DAkoLg33/OAjmTsoGg81TrP4b9HuJgt4CNSYV
	d4xw2+pUBDTA8RChloIdC6ovRv6eErLXQM47XogS7YEdgWRPr8cihZ3tGekxmlSfkKr4q/jE2hrcl
	OpOlwV6okHNKekYR8MK5IH0nbNYE/SGqnE9Br0AwXENGKoQuqpRppSCXMCgFbRhphe2UEPA7pSWuu
	G64QissjN8kRs3gogzsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNHdC-001iXx-OO; Thu, 24 Feb 2022 17:10:18 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNHd9-001iVs-Mv; Thu, 24 Feb 2022 17:10:17 +0000
Received: by mail-oi1-f173.google.com with SMTP id x193so3599547oix.0;
 Thu, 24 Feb 2022 09:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fgEt++oBYASgr9TfRFFi+SD8GpomMen+OR/8J8QIuRk=;
 b=KIt3NJCFY8EGcn/Vp8Z79opL+RFkooaSKr0JesbN/ioWZhmItrvtFefxWlTK+U7+en
 Kp5On7/au70kIu18AgFB7v+fpXDsOnwzP7oIMyj+s6uk/3YXt/PyQzwuraQXi8F7SpQa
 UMru9zKRNOBG0qpNek1vUw3Ia6uo5ZRQ1EXG1iz3Bsms88FCGoO5VN/SBiVumQ2Duztl
 JuvcILvtiCeoByYV+tqRIYBSgdeAm1cimuExQd3ZtpvgU9G+hhiA4XNuQO1eKIWMP6KC
 l7jwq3DtkXmokzyRgcYcqMgYsDLUk9FAFQ6D7P1NFVSvm080TkGaPlR9tXs6F7zSopt0
 ZIEg==
X-Gm-Message-State: AOAM530HtJtawoJh+SduL7we/qjSET3YB2YtR8BbWveFQnc5kwbsGDq3
 tMgScg1ODfOWnURw7a8giA==
X-Google-Smtp-Source: ABdhPJyRCb0IydycIC22RD0Zq8josaATMxmz1k/6Q12W3pmTQheLOuZTOB6+D1STwrh453Q5f2LV5w==
X-Received: by 2002:a05:6870:670e:b0:ce:c0c9:65e with SMTP id
 gb14-20020a056870670e00b000cec0c9065emr6854697oab.176.1645722614234; 
 Thu, 24 Feb 2022 09:10:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 g3-20020a056870e1c300b000d0f502781esm65345oab.22.2022.02.24.09.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 09:10:12 -0800 (PST)
Received: (nullmailer pid 3252581 invoked by uid 1000);
 Thu, 24 Feb 2022 17:10:11 -0000
Date: Thu, 24 Feb 2022 11:10:11 -0600
From: Rob Herring <robh@kernel.org>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: pinctrl: mt8186: add pinctrl file
 and binding document
Message-ID: <Yhe7876iV+P+z5JM@robh.at.kernel.org>
References: <20220216032124.28067-1-guodong.liu@mediatek.com>
 <20220216032124.28067-2-guodong.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216032124.28067-2-guodong.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_091015_795992_9A193ABF 
X-CRM114-Status: GOOD (  10.83  )
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

On Wed, 16 Feb 2022 11:21:22 +0800, Guodong Liu wrote:
> 1. This patch adds pinctrl file for mt8186.
> 2. This patch adds mt8186 compatible node in binding document.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8186.yaml      |  297 +++++
>  include/dt-bindings/pinctrl/mt8186-pinfunc.h  | 1174 +++++++++++++++++
>  2 files changed, 1471 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mt8186-pinfunc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
