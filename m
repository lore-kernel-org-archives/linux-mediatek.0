Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DE8C55184
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 15:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+vZ8FUC6EzJTLpIOuSsz/wpLgYkJ6eDVgEjXOFLrVc=; b=PnNOAIR7H4IEJGdFW6q0XC6cjE
	pLuUYdVkJPBimBt0Qy/pXShwIaJRoGAG0YfcWG1nZXoQ0MuqwJcpHYMBjO5+cHzcnhswV4eOjG28x
	cVugEtMULCFjBm4B+GIWMCQixkJUgjJi3zpCT0/+U5LaWxjP6mfekJ4NF+d/uzGr/9n84/1xA71LC
	FXdao1obdxM7Aas3tzkToZPUKQNeN91aeGbgXMQdflGH7hTVqhlm+5PkaeqESwnxPLVkGTqESyr5L
	i9ykrGGe0396q85HFP1pZzyqd2QSd9awdFkN7RWySbMxIeroHdbLBpf1T/8kxDWCWUzv0yG6UDPJj
	pFGzmhAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquW5-0000000HWLg-2WsG;
	Mon, 03 Aug 2026 15:23:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquW2-0000000HWKl-2iG4
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 15:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B+vZ8FUC6EzJTLpIOuSsz/wpLgYkJ6eDVgEjXOFLrVc=;
	b=UftY0Tc8pKsWLMe5hB5GJQWPGlSdhH5WfSmhRFXcG6hQIPfCe6PaoxV3Lwp2Qy0nl0NGHW
	prjtY5PCl7rHmqPM02m1qXlWv9h7cHheHMOuXRHVWWAcTf3goytE584EQCj24x6yDu0p/s
	s23Gk+NZVGDGyqOWitI2jfaPrG7CXKY=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-HOyIDe6sMdiOhXhQGcoEug-1; Mon, 03 Aug 2026 11:23:44 -0400
X-MC-Unique: HOyIDe6sMdiOhXhQGcoEug-1
X-Mimecast-MFC-AGG-ID: HOyIDe6sMdiOhXhQGcoEug_1785770624
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e6bb29581so127384777b3.2
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 08:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770624; x=1786375424;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+vZ8FUC6EzJTLpIOuSsz/wpLgYkJ6eDVgEjXOFLrVc=;
        b=HDxeRbQzWotKf9/L7/CtExgr9r8o1MlNT2/oFQr7RDDfxazJ9IxIS8WtUITY9npUWG
         86URSwI+Fi9BD4vdLYP47jhxbH78ECzWcod23tQP6wVgcl1Il/oDAUdYxfmQPBZNAq+R
         YRc2Kp3aSDZuacEAXYbCEGGI8vmxNiRyloa8ToKYEqKujnuWW2c+SoZe3psLEUSxd42g
         +BAw81TOtHIRPz4LjaPpSmQCZV67e3yX6VPYFc2ndCmKAc5M6PoboCT+BHSseHQw+8xy
         8sAkqzh/KKE7iGWMArkXJ+QWnzMpQxlahtY78EUSMr6Jal7apDXSST1i92usVzyZu8TY
         r14g==
X-Forwarded-Encrypted: i=1; AHgh+RrRgA9Upg41Xt00SLczBPuPXcJS/JCCe3fni5wJVhGAyOa2V8ME9RInMfWhMebtPORmaPmFmZU+EHXmyZK4kw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyM/Jc+BpEfBleUNBphXxDx+dCBXbIil75AzT2d35vEEfYgN1jT
	82J3jitktQxF+E72C54wDYltE0Higf/rYPS2rFtHQXfmTZPZdta4J7HXdk1XDPOSDq3DtWlS0+F
	Bd7krSv+iruHfwDiIRJoitb1Jlyr/ITMPVyXruSgtQgLG15t8G4/ZNGkO1QKakS8RllcsINqrGA
	==
X-Gm-Gg: AR+sD13VNOewovTV7hJ1QnnduDtYeBp8zbHNOO/4U966cELgEuOJvXlTJWaGbJr/O/A
	9sXA6h7qnP92PRZAmeldEAeD798CheNUTWLP33pmnAPV99XminEMBu2SY9KJvsoaZ1iWAzamWwW
	vdkADU9ZN+9WaYQSGDt+g9/VjbJKNlGmmEN1RtOSkuL3uIVw2GcBFvwpGVOmQpAG7HDaOORD6I0
	jKRcOw8BkMaupoLDjO8lKPwtx7O5q9njJEotIG+MGzyburlYo2Mq2nGDrSDwOVqQJkcKImWky87
	lQZVWK3eSUS+2nKF+gRDOacAm/JCV62MlKReSVBwOVO8Gw4b+GkXTkGoM1C7qiJ1mjm98do/3V5
	Eib1gYs2tu7CBVT92/V4WH83G93vo5+ewuak=
X-Received: by 2002:a05:690c:3709:b0:80c:72a1:fca3 with SMTP id 00721157ae682-81fd4a8e63dmr141736247b3.16.1785770623691;
        Mon, 03 Aug 2026 08:23:43 -0700 (PDT)
X-Received: by 2002:a05:690c:3709:b0:80c:72a1:fca3 with SMTP id 00721157ae682-81fd4a8e63dmr141735747b3.16.1785770623266;
        Mon, 03 Aug 2026 08:23:43 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d5ec2sm56111587b3.23.2026.08.03.08.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:23:42 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:23:40 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v5 00/25] MT8189: Add support for system and base clock
 controllers
Message-ID: <anCyfAxujzRS3wf2@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: at0KxAN2PpdOKJQ0Kd34d8TXN9ClAtkQC0H2scGqpbs_1785770624
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_082346_833598_C6824FA4 
X-CRM114-Status: GOOD (  14.13  )
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

On Sat, Aug 01, 2026 at 01:20:46PM +0200, Louis-Alexis Eyraud wrote:
>  .../bindings/clock/mediatek,mt8186-clock.yaml      |  128 ++-
>  .../bindings/clock/mediatek,mt8186-fhctl.yaml      |    1 +
>  .../bindings/clock/mediatek,mt8186-sys-clock.yaml  |   24 +-
>  .../bindings/clock/mediatek,mt8188-clock.yaml      |   93 --
>  .../bindings/clock/mediatek,mt8188-sys-clock.yaml  |   58 --
>  .../bindings/clock/mediatek,mt8192-clock.yaml      |  191 ----
>  .../bindings/clock/mediatek,mt8192-sys-clock.yaml  |   68 --
>  .../bindings/clock/mediatek,mt8195-clock.yaml      |  238 -----
>  .../bindings/clock/mediatek,mt8195-sys-clock.yaml  |   76 --
>  drivers/clk/mediatek/Kconfig                       |   79 ++
>  drivers/clk/mediatek/Makefile                      |    8 +
>  drivers/clk/mediatek/clk-mt8189-apmixedsys.c       |  203 ++++
>  drivers/clk/mediatek/clk-mt8189-bus.c              |  200 ++++
>  drivers/clk/mediatek/clk-mt8189-dbgao.c            |   98 ++
>  drivers/clk/mediatek/clk-mt8189-dvfsrc.c           |   58 ++
>  drivers/clk/mediatek/clk-mt8189-iic.c              |  122 +++
>  drivers/clk/mediatek/clk-mt8189-scp.c              |   77 ++
>  drivers/clk/mediatek/clk-mt8189-topckgen.c         | 1025 ++++++++++++++++++++
>  drivers/clk/mediatek/clk-mt8189-ufs.c              |  133 +++
>  drivers/clk/mediatek/clk-mt8189-vlpcfg.c           |  116 +++
>  drivers/clk/mediatek/clk-mt8189-vlpckgen.c         |  285 ++++++
>  drivers/clk/mediatek/clk-mt8196-apmixedsys.c       |    2 +-
>  drivers/clk/mediatek/clk-mt8196-vlpckgen.c         |    2 +-
>  drivers/clk/mediatek/clk-pll.c                     |  130 ++-
>  drivers/clk/mediatek/clk-pll.h                     |   13 +-
>  drivers/clk/mediatek/clk-pllfh.c                   |   15 +-
>  drivers/clk/mediatek/clk-pllfh.h                   |    3 +
>  include/dt-bindings/clock/mediatek,mt8189-clk.h    |  433 +++++++++
>  include/dt-bindings/reset/mediatek,mt8189-resets.h |   17 +
>  29 files changed, 3136 insertions(+), 760 deletions(-)

I went through the rest of the series and didn't see anything new in the
last half dozen or so patches beyond some deprecated headers.

Just for completeness: There's still the maintainer issue that I brought up
in v4 that needs to be addressed. I saw the message from Angelo about
responding to that in mid September.

Brian


