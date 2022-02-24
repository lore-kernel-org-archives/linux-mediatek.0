Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437A7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 20:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGgTHuhn2UjzD/o+7ZlibcvvHeOTWIDEZ8+m5hil+mw=; b=n6s/h1BwLP3KqP
	zOG1u4CEZzGfU4RLsZ0yTSBWUSLzgFPT0NXiTH66Oo62ej6w4AkPSCfh9fsRNZQRuYwbhCUH6GpDv
	RlUI4krOam9fXCunCrHGlvADJJrhz7fXN6YAm/hjPBEEVQlk3EzhtRxoYu/xhmVThnzGkj401sRCa
	EvMX5u+93yWIb1YutcBjCgR3GWxb92MA3LogynpDJnu44k9rN8FfB0R2S09FXOBWSsrpQbMApN3Qr
	e0hK0btAv7hyht9Z8siFR12ki027KVEsVVfjq8i8xOLq2RPacSntQ0B5w8iC63VAceiJHTkzmc8pi
	raAbR0fsiW46dWm6TNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNL0c-002MeC-Iw; Thu, 24 Feb 2022 20:46:42 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNL0Q-002McO-Dj; Thu, 24 Feb 2022 20:46:31 +0000
Received: by mail-oi1-f174.google.com with SMTP id a6so4871081oid.9;
 Thu, 24 Feb 2022 12:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Js4DjQg4+/Js5ZDt0/DtZ6DBXYws/A9V85XipwiunGk=;
 b=Prj+EbandTyHZ6tjUWBGvU4APb6hXCgjVeF2YTyB4kSo9oCyiRj/cqPRybg0MVbpbM
 eydgN2iITc9k8YRlNEgyiw4TQf1ViXxWKo6EnrPqcFQzAzLcMP3H49C8S73KMiDl7bNt
 5sn3bN+jrg0JD+L3U0sFaKn5TPPDpbdjoTXxuNdj4VuWOLWjGs3pySjcm3578FEPR+js
 9Ip8b4kKzrmOsRQ09C0tkljEAXz5N7K4fiCji+gHrj/KtNz0UmtceMkeeB+zmurMoIDG
 M79RDYhvYN/nkiYRQf0OOb4FetVKETs/ekN7Eh3TW6+Xjju8eaFVHZsliiAtb1HB62I4
 a46w==
X-Gm-Message-State: AOAM530YbkUbzhQPfwLxPMH6r5llH2T9Kh9zq1ax771mpgn5wxGwlyPQ
 tIfyZJyi18jcIqwl7i5+HQ==
X-Google-Smtp-Source: ABdhPJxoxsHF7p455z10lgDwbJoBMEGDdTQlM9j3VSp6Aw6sFwosLejXmLbbVWJSen+7ni2GsJrq4A==
X-Received: by 2002:a05:6808:13cd:b0:2d3:a60a:1456 with SMTP id
 d13-20020a05680813cd00b002d3a60a1456mr2455365oiw.39.1645735589105; 
 Thu, 24 Feb 2022 12:46:29 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 n23-20020a9d7417000000b005afc3371166sm171240otk.81.2022.02.24.12.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 12:46:28 -0800 (PST)
Received: (nullmailer pid 3556414 invoked by uid 1000);
 Thu, 24 Feb 2022 20:46:27 -0000
Date: Thu, 24 Feb 2022 14:46:27 -0600
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, srv_heupstream@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Enric Balletbo Serra <eballetbo@gmail.com>, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org
Subject: Re: [v2 1/2] dt-bindings: power: Add MT8186 power domains
Message-ID: <Yhfuo0vpb+G1AoIM@robh.at.kernel.org>
References: <20220215104917.5726-1-chun-jie.chen@mediatek.com>
 <20220215104917.5726-2-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220215104917.5726-2-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_124630_485707_5E3F8C84 
X-CRM114-Status: UNSURE (   8.98  )
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

On Tue, 15 Feb 2022 18:49:16 +0800, Chun-Jie Chen wrote:
> Add power domains dt-bindings for MT8186.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  .../power/mediatek,power-controller.yaml      |  1 +
>  include/dt-bindings/power/mt8186-power.h      | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt8186-power.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
