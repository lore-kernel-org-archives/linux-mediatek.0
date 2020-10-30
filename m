Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8571FC00A89
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 19:03:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 054AE20797
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 19:03:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VoT3/sXj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 054AE20797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ekcFTzzWGlsPFqUPyTTVKAj7Yitg3szBbahsa6sv6NY=; b=VoT3/sXj0d/grQLhTdmpvC5R1
	DLKB7Kp8OVnwj06RVNGaqhsLej7qv19RPnmXStybRQ9J7XhRpSvCfAl90WFEvy4hmd4qikm6vM7+P
	Q27wXKV4hrOSQdsq0jkbbdqiph1LKU1hSIabvyDeqRE3JZyHidtaHwIhxpglZkb8voIcRGpSRxxvL
	e6I/WmfuwteLd85Lyh6BTGLHU3Q9Cn3kH/TETge+jZFiJPhlavxqWArmMbpsCesfhag9lAq1vr0Y3
	v6jbwZbWBm3Btg1EwuYYvSMnPLYAe/C0aS7nSokcYOhb6u/d/7diCzilurOpB0iozNRY56dnna45n
	Dg0yco1cQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYZgT-0000Ei-2T; Fri, 30 Oct 2020 19:03:33 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYZgQ-0000Df-QF; Fri, 30 Oct 2020 19:03:31 +0000
Received: by mail-ot1-f66.google.com with SMTP id k3so6519946otp.1;
 Fri, 30 Oct 2020 12:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tp6jGd10k28/5TtEQRd3SeWAiPCRXH/hj9Pu2EBBOJE=;
 b=MB/rLWdgqvpUY886p2Osok3WpbH4d6ze0nn0eFgUNr4VIsz1b3P+ASCPK7mvYZbTLa
 vqMGW1YH97b93tLzeFYyc3G/BkiRAYcElDqrTKYCeIZXlR4lxmq6ZwwpjzaZF+YKb0Mz
 OpAhdP8nJcIktM1v/hPddF9LpK2YudKSMor2tmAbhdDXbolSspcu0wVqcR+paAXBj5aq
 6HmcM4ZNOq8BC4QSLlI4aMwVA1Jix9SplWZPd7mSzVgm/VLT/kWGPdz3ZR4g5h32ClU9
 5yI5kIhQdA1iNInEGbq3lGpo+FzAtg5bnZ82tc0qaKA/zjQ5kJBrfamV9QMS5PtIiTsj
 CkZg==
X-Gm-Message-State: AOAM533YArgihJAjhAR5LW2/UEPYyTLATaHJdEbzPcXqGATU/IWt4qv9
 8jMLrUVSKzysywq2YnKKng==
X-Google-Smtp-Source: ABdhPJwXOSuERod/HGVCj/MVbdhkwEnNU0wrCAT1ORY0lprndKvuitse6DaiDe+gwDXmO8FKSawGPg==
X-Received: by 2002:a9d:2487:: with SMTP id z7mr2622733ota.133.1604084610161; 
 Fri, 30 Oct 2020 12:03:30 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d17sm1491747ote.47.2020.10.30.12.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 12:03:29 -0700 (PDT)
Received: (nullmailer pid 4153325 invoked by uid 1000);
 Fri, 30 Oct 2020 19:03:28 -0000
Date: Fri, 30 Oct 2020 14:03:28 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: power: Add MT8167 power domains
Message-ID: <20201030190328.GA4153272@bogus>
References: <20201027131122.374046-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027131122.374046-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_150330_861102_32D56336 
X-CRM114-Status: GOOD (  12.94  )
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, enric.balletbo@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 27 Oct 2020 14:11:20 +0100, Fabien Parent wrote:
> Add power domains dt-bindings for MT8167.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> This patch depends on the SCPSYS PM domains driver [0].
> 
> v2:
> 	* Implement on top of new SCPSYS PM domains driver [0]
> 
> [0] https://patchwork.kernel.org/project/linux-mediatek/list/?series=370737
> 
>  .../power/mediatek,power-controller.yaml       |  2 ++
>  include/dt-bindings/power/mt8167-power.h       | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt8167-power.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
