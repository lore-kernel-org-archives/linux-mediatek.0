Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36EDC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 17:48:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84D4F2067C
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 17:48:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T/s+n8Ys"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84D4F2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6nw8Z1Ab2tAK2jytmV/AO4SHq8BFZcv217TxOGPemfs=; b=T/s+n8Ysb55t3CZ/QinUuLFpo
	uPT1Y6Zuitv8rEJ/ZI0GtSMyodGdHieFs7+8j8QYtgDoSqjSv5ltQWJpJXPkXzrsIkMiNjbF5iMVb
	mCQRu0tEaF/IrJrOzwgmqcYwR4Fdh9rkE/LJqyBEj7N4zVgOgxAxzCftaqtlGDHmi2QjKxFdHIy2k
	2rXgrT+KscQuCqj+RQgPJM1wVpwJogYF8DRuQfcsDj41z4pikmd9KqkddvQwSb0RE71s8EpnGVCZP
	P3hZjF4vWM4/F3CTXhfvSX2C26e1txhRIcKzN1aU2dQXeRK1xgz85or+AiLxQlUEjrzzqD+aMHaGe
	raRdv0OoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8SC6-0002nT-EB; Wed, 19 Aug 2020 17:48:14 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8SC2-0002mi-B7; Wed, 19 Aug 2020 17:48:11 +0000
Received: by mail-ed1-f65.google.com with SMTP id w17so18794464edt.8;
 Wed, 19 Aug 2020 10:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zX9jwCX/Eaov1Rw6oFqsIG12piAHTYmOUPZHGAVnJAM=;
 b=rqNdCHkqLoeMbiqd4KGUXRLLgxqI6aZLi9pTP4y76GbYBvMBVqcVGyE7MCtF95kdOH
 wpFRxI6+ibtTYumGtcfWmmOwQhvrfLV4OqydwlXU5IHD7RTNx8/vMu9H/Jk7yzIPm+v3
 23vmR/AaxHJF2zHFr336/unfwCkLp8F+TZK3gh60/ITDATTZEQEvdIwjYj1yKG10F2KF
 cn4i2vB3kHWUWrnnulC7KtQ/bO4+OSJSalpR6eztDnKCnP5OqEVfIDb5GJvbYkGu2MBa
 CkTNiP3B+vFBF4w0W1Q+36xb4nop6iIPDtc5RFRTD/ZQZjBxHtYpeZC0KWhjFgLMHNq0
 rE3Q==
X-Gm-Message-State: AOAM5308CYEASgC9tFkuH7hElK3lDFeaUCjJ/Zgc9iFhaQxLWx4Yq5Jc
 ov/AIeGO9X2n3HMnCBxav6Q=
X-Google-Smtp-Source: ABdhPJy7a8YQ6srCJ1yH086NTSH3EFod8CrU7Hoeaw8blgh1KR6D2HT1o1RXpPDLZA9IO0ZezxtWUg==
X-Received: by 2002:aa7:d8d7:: with SMTP id k23mr26744142eds.54.1597859289105; 
 Wed, 19 Aug 2020 10:48:09 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id i9sm19116548ejb.48.2020.08.19.10.48.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Aug 2020 10:48:08 -0700 (PDT)
Date: Wed, 19 Aug 2020 19:48:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] soc: mediatek: mtk-infracfg: Fix kerneldoc
Message-ID: <20200819174805.GA394@kozik-lap>
References: <20200729074415.28393-1-krzk@kernel.org>
 <92ac7165-765e-da75-4c0b-3b232521b5e9@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92ac7165-765e-da75-4c0b-3b232521b5e9@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_134810_488478_1673214E 
X-CRM114-Status: GOOD (  11.77  )
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 29, 2020 at 09:53:59AM +0200, Matthias Brugger wrote:
> 
> 
> On 29/07/2020 09:44, Krzysztof Kozlowski wrote:
> > Fix W=1 compile warnings (invalid kerneldoc):
> > 
> >      drivers/soc/mediatek/mtk-infracfg.c:34: warning: Function parameter or member 'infracfg' not described in 'mtk_infracfg_set_bus_protection'
> >      drivers/soc/mediatek/mtk-infracfg.c:34: warning: Excess function parameter 'regmap' description in 'mtk_infracfg_set_bus_protection'
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Queued for v5.9-next/soc

Hi,

It looks like this missed the merge window. Do you plan to keep it for
v5.10?

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
