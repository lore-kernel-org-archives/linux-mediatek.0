Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A70C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 16:35:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 387E360F12
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 16:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 387E360F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNO2oSfXkeXscESWNPf9R9kdAny0RZ5akaSloVo+bNQ=; b=bVlak3vfVhqIXk
	e/+1/PXPIRlpSKHoFXlGgDztYCGaU5J9yhx/rhj9mwAQ76T+IovfJI5CPLafikgDiKacpVVKqTjFp
	/k5J+hISQXGtjwR5E1UPEPUGLsP1/o9tPQDGeYCtVtk0fx5oJUZcjjFLQ6Yyl0TgVIwLnriU09M7j
	5Wk/p5MV/RthyAo62NqbhFz3eKWk8vSYg3FhBWke8WmOvPhmdQibOuG3QqxpgVR6NcZanJfdgcbrZ
	IIswGI+hYqI5kGLSeKM54kEKAIJHJada7mT5MwINpsE0BFLCwZygEaIW160D7eLKHXjYP8MFR4+I5
	UHBj90KSiDfqqeNWP6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMC9m-00CQ5B-TK; Fri, 03 Sep 2021 16:35:10 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMC9k-00CQ4X-Kf; Fri, 03 Sep 2021 16:35:09 +0000
Received: by mail-oo1-f50.google.com with SMTP id
 t2-20020a4ae9a2000000b0028c7144f106so1674029ood.6; 
 Fri, 03 Sep 2021 09:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cBS95estuzxVp3cHtxmKL4O9j2jB1kuG56GjGOq66Kk=;
 b=MHWUdB9fe6cVPltzT1RioYHkq6BozSXMOciqxByzC6YV3yzESxzzwNyaNWvc+szHsq
 f3TjMvq74y74skKubQ4PL7UAtskS8SpxcLWB8dXCf1o62ftUMEs+FGTlRlgE/zB9CWbi
 3DgEA/dBMmS7VF3++ccaVcBItvNOhAAscc/D0603Qw5TVMxX2L/+t0bSPKlQr/3OqSYS
 bAKUyzey/r+UhM9PM8sasbGhNH0myXkUo6IzkFE/UXh3lqz3kjsMwDxbnMrZXBxzweY6
 E1dCDYw7rqFWELyBAi02najg0d56hRW5r2ut+WZHTiSuKkioSBToaQNhTx5/GpD05Y5B
 d1vg==
X-Gm-Message-State: AOAM530W2JxdlMouc5Sgr5gxBurZR8zoN4dhiCpvgxUD+oBlTw660Syh
 kUgdfERkz6jWKZawnDaSKg==
X-Google-Smtp-Source: ABdhPJwI1jhvQ61a8n7xvPWLvaY2h+cxGEEbZ1SfD8vUTYtw4ZvN3JSQhqmUmb6Zwdf1b+L03ugECg==
X-Received: by 2002:a05:6820:121:: with SMTP id
 i1mr3713699ood.57.1630686907756; 
 Fri, 03 Sep 2021 09:35:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k23sm1133582ood.12.2021.09.03.09.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:35:06 -0700 (PDT)
Received: (nullmailer pid 3061917 invoked by uid 1000);
 Fri, 03 Sep 2021 16:35:05 -0000
Date: Fri, 3 Sep 2021 11:35:05 -0500
From: Rob Herring <robh@kernel.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Cc: wsd_upstream@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 1/3] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Message-ID: <YTJOuVr0SkwClJbw@robh.at.kernel.org>
References: <1630658364-6192-1-git-send-email-hector.yuan@mediatek.com>
 <1630658364-6192-2-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1630658364-6192-2-git-send-email-hector.yuan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_093508_720468_B81EEC67 
X-CRM114-Status: GOOD (  10.39  )
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

On Fri, 03 Sep 2021 16:39:22 +0800, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add devicetree bindings for MediaTek HW driver.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |   70 ++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
