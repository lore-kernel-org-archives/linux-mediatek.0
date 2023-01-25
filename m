Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536BEC54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 20:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moiufMQUU7UGAHvlsv+XSSPZUsPQZkEoM/OgPbzoeHs=; b=hgzOnFS8YXtS8Hz4GHX45ctBKN
	jHDacmgapxiqx18dk+DQ/RE3O1dBIKZ66hCRJqd6rzjwLl8fLVRhataFnkjFySwxT6aKgoYQTTKnm
	mlhUx7gEGb7LcmSruMma/VRAzgGyMcWeLHh6diFUrgPiQzUzZkN49GJczknXghdZ+/nS64hlh2T7q
	YHmUy7mIPNMgRhKG7lbpN3qWxnZFoIc4S5MZv3dEpmYg7rzWvGx5qjgwA/2JeCKCeJPikg03r1MFN
	bpMI0KYlI3FWnX3apB/m0rc0fhdEK9gDggeIdr1gaqSbFYlMp43PtIdqzc+NQjOpW/nIYqS706WXL
	WjZk1lNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmUh-008jFe-1I; Wed, 25 Jan 2023 20:35:43 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmUV-008jAr-AY; Wed, 25 Jan 2023 20:35:32 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-15f64f2791dso16128fac.7;
        Wed, 25 Jan 2023 12:35:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moiufMQUU7UGAHvlsv+XSSPZUsPQZkEoM/OgPbzoeHs=;
        b=0ITP1xz5lBI15k7GbVlFNNIYApCXJ+tH2eZ223oaWgNgVRtgiZQB8CmMIOlC3KIKQ6
         8Y+o2LIwYA4QUGgI4rGnUsD3xmn9BJLLEuNsxL5tCxnGtdiRWTrom46ViZWYl+oIJbDW
         1lFOhQZtFGjVJPcpoheZIKMEbQclV130elttG4OZ6uZ5EgTGBjBGorhrMCB+LnsWiF7I
         XXg/eM3OqCNyoDt5FxysXkbnyeXn6BmU9W9HpfMmJHm6R7MZPwTwtKOuNtRt/MaESpnE
         9hdD5uZKKEPk0HX0p4vJOwDLrBd16kXLz5SvtmjGSvjOVJu0drE3hF8NrPDG/H8f8bw2
         YhmA==
X-Gm-Message-State: AO0yUKVAp3QxYyhnUJmazsBg9Jsyg+OSWyPGnfU5QnVJb1sRIWSCjpSh
	XwRY+YaBtcC7brATouKXnw==
X-Google-Smtp-Source: AK7set82Sv2tPnfS0f7sY7zxfI3PJ9ekb8UIP02XBGQpey5HlRn/W8pcSJHjnTffo1P4rZJeTA4N6Q==
X-Received: by 2002:a05:6870:b694:b0:160:34a0:546 with SMTP id cy20-20020a056870b69400b0016034a00546mr4741222oab.40.1674678930451;
        Wed, 25 Jan 2023 12:35:30 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ls11-20020a0568704b4b00b0014c8b5d54b2sm2338315oab.20.2023.01.25.12.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:35:29 -0800 (PST)
Received: (nullmailer pid 2861351 invoked by uid 1000);
	Wed, 25 Jan 2023 20:35:28 -0000
Date: Wed, 25 Jan 2023 14:35:28 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: bchihi@baylibre.com, angelogioacchino.delregno@collabora.com, rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com, krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Subject: Re: [PATCH v11 2/6] dt-bindings/thermal/mediatek: Add LVTS thermal
 controllers dt-binding definition
Message-ID: <20230125203528.GB2855708-robh@kernel.org>
References: <20230124131717.128660-1-bchihi@baylibre.com>
 <20230124131717.128660-3-bchihi@baylibre.com>
 <2471a5de-b7a6-fea7-152f-4fe25063abf9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2471a5de-b7a6-fea7-152f-4fe25063abf9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_123531_374020_FAABABA7 
X-CRM114-Status: GOOD (  11.04  )
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

On Wed, Jan 25, 2023 at 12:14:17PM +0100, Daniel Lezcano wrote:
> On 24/01/2023 14:17, bchihi@baylibre.com wrote:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> > 
> > Add LVTS thermal controllers dt-binding definition for mt8195.
> > 
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> 
> Krzysztof, Rob,
> 
> are you ok with these changes ?

It says v11, but I sure don't recall the 10 other versions...

Rob

