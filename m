Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6ACC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 18:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUvU6OEfSgOgV90lNE3OyREzRIMADu+N0DuF09M2GsU=; b=LhoalvmLCIGuWCx/F1jrx+93T1
	A5HMDykqk03APV1z3KoleH8HLQKw+pe4lVsrpiZwjhHYqvOkgCqXLIcIRDuUz/PGfgQSevDubfrqR
	MlWWsWxAuh+EihQhj9yVkcS/G/gifMP0YsJlL91JcR7sV5UhWyoEZ6t92N/pzcO26UNuZKtD/+D3M
	zBlXlKUXMBeCBMIL3OV0W1/OfuwMEkmxCnxPytBUngAiEXa5gO8l95/romlPW+w6VFtLN4sjmcsuw
	etMbRukuekp+vX6hsGo/TrZLW4Hz33KsT/XEW0CIdHQo6YR6eX8PDAt5fo7IM8YATCXwBneKct7yP
	C8anmGCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxBPH-00Go2S-CT; Mon, 21 Nov 2022 18:20:35 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxBPD-00Go0B-BB
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 18:20:33 +0000
Received: by mail-pl1-x636.google.com with SMTP id p21so11329634plr.7
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 10:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUvU6OEfSgOgV90lNE3OyREzRIMADu+N0DuF09M2GsU=;
        b=SgPkuMF1IJePZ4kDlRVVEA1//qeMWY6/d1jeHFNWADKG121aZfE1BFujlvCNdfZWdk
         06Cfk5rcY9ULQhTkMePwP0Z4gfB4qbW3D9idqcBiCRnELk48IrE6ZBoINn94+a3GPCgC
         NVYeLbw6jUuhACSDWLCr3+Ql7HE8uhV3uDLHsPRNuvL6zSxUo9BJiDIc/W/KcCugBPx5
         L0+xh175q906enpGR71opBGd6OMaubX1WzZfGPSIlgKInbRbKoVCVLfQKQTZFi2hITza
         NIpZB3ZkKH574Y6OQpmTmJ3ZFsiVUD7PFfPowhfS/U1Y6figkt/vtTIe05NMNvVGtt8f
         5UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUvU6OEfSgOgV90lNE3OyREzRIMADu+N0DuF09M2GsU=;
        b=eUnJWFCW+wj/TwG/vR/qF1+FZxtnonZbZ6rrMGO1GyczNsUJvipcPRhBISSwi9SLfK
         oW7kToeFmgGmpsDkELtLamxBQ3Bpt90TBVmpwj29aE2YJNexuUlDQWwAy2xeVsskvEen
         tqdtZmMdoYgz1dkgkfoOwjoZgfXj29jZPpQXKFrSUt0VnpzyAo6uxzBsLKuu6MDl5YYZ
         7Uvlpy/jr4XxeoA+9JuexIizXv75uz9zVm57e85rPhqygn9OUbvlfPZQsKmt80EHYDmy
         4kWG/BJHCo3Hr6WPPDOx1Wmhr/cZgJqKKkJ1UBOmcLHaB+7MKk1nsR00wvELYzYxNHlR
         hpAA==
X-Gm-Message-State: ANoB5pk/QKFTbD7ZiyafD/2leUMwrArPRYyvB7DsOZA7Ftu/Woj8qMKs
	iDYOeqTI65Z32z98V4365X6aRw==
X-Google-Smtp-Source: AA0mqf7yyP1/YcozCO+5/Ps6F02tyWRvSUU8z+Ribfe8dzDyGQaPbidQBPZAtOYeirhiKku32is/WA==
X-Received: by 2002:a17:90a:7e87:b0:212:f810:a846 with SMTP id j7-20020a17090a7e8700b00212f810a846mr28500649pjl.71.1669054829597;
        Mon, 21 Nov 2022 10:20:29 -0800 (PST)
Received: from localhost ([75.172.139.56])
        by smtp.gmail.com with ESMTPSA id d125-20020a623683000000b0056da8c41bbasm8956905pfa.161.2022.11.21.10.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 10:20:28 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 matthias.bgg@gmail.com
Subject: Re: [PATCH 1/9] pinctrl: mediatek: common: Remove check for
 pins-are-numbered
In-Reply-To: <20221121015451.2471196-2-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-2-bero@baylibre.com>
Date: Mon, 21 Nov 2022 10:20:28 -0800
Message-ID: <7hv8n88903.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_102031_623997_FC1ED03F 
X-CRM114-Status: UNSURE (   4.46  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com> writes:

> Remove the check for the unnecessary pins-are-numbered Devicetree propert=
y.
>
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

