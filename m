Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C3FC88E70
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 13:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wErMsFym7CzSTi2r09E/qapmW2jeznE/5reFNjfhCM=; b=p4C6VZZYvV+1GKA/PKUifQG9iy
	6ZdnjXJRvY3lUOmL6K00UKfaHURarKJ6dTspa/NpKvVGmsao3HBTBmf4kxq5/bmKpAxtTSn+qy6cA
	m32RgQ9+ao+M7maSiVdd/rlJoWCn0ImMzEVxTlIriXnlSYtUDt/U5Qb+nvS1FPCAh6zK0CnEhwYOQ
	NjzX0NEPrdRUoz3e788NmTyjR0LhCCDhLMzvj+fFDJNxiqlwF0cwuUbXvVqITNkIsqGWQk9zctODX
	CHSNml/p8AKkD2CuOKvGXLa/7IDJGRKwgQbc1TROHtyJe7iq05eh8T/OfqCNxdEjJd7kKCxgVSOTm
	0a1pMLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66z2-00000003pTL-1EKa;
	Mon, 14 Sep 2026 13:44:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66yz-00000003pRu-3LzP
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 13:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789393467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0wErMsFym7CzSTi2r09E/qapmW2jeznE/5reFNjfhCM=;
	b=J9kkwdfBEJlTC4N/deyDkg/G6X57HIVH0BNYZwuHU8qgx+q4gydEatFoaUuSHk/7uv5bA1
	W4Qyvgl+DDRy+qKPCcslhiq3LuqlPO3BUl3lTkPqTp9qL3w0vnU7DsKuQ9qv0dNyvNR5Xi
	p9o05gFnxonWDqLyvOaP66cEt/PY0NE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-gnNwFEIIPAK28FE2RjgnFw-1; Mon, 14 Sep 2026 09:44:26 -0400
X-MC-Unique: gnNwFEIIPAK28FE2RjgnFw-1
X-Mimecast-MFC-AGG-ID: gnNwFEIIPAK28FE2RjgnFw_1789393466
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530f968ccb3so24068421cf.2
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 06:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393466; x=1789998266;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wErMsFym7CzSTi2r09E/qapmW2jeznE/5reFNjfhCM=;
        b=hdVpEFHbD5LnDLOxatm7p0fUMJsGELJ2H2dRfQcetiFw5gNFJvrhnlwEuYn9fwFmCU
         fNGDnJRzg+bpwF2inPSyzhmknV5LP96bqN96CoMZYHPiq/FuxtXJRKKuXjes7MtfyYJd
         8ZqGlpXxR/OH9UllcDwdIoX97eqO2BLH0Q4zo5i6/aUVnR+u5UznOd+Ce0pqG2HViJpV
         3EkOSs+/BwQgbIEQggyyx0HOvQhhNNYXDbYh/KHfQXLgFKI0PMvhd6hbqp+bTFDw5B9G
         uag1j9CsNFDNWOwVr/PnzfNK/YSKRoCCpBCTWblMfMbIgtKjMm7rydaFA4Cta6RV+p2F
         5GzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQQUor8+DB1eTOuH/Jx/YqxK46v402KjHQgYwtEjDEdeTJm3t9VPCZaakAZvpig5tpoPvtKjqpS35skVLZ+w==@lists.infradead.org
X-Gm-Message-State: AFuF++lW2/nUjl/eJ6kpAFQAW0gzguKSu9jWr7+hamYJAQQXcuB+bb7H
	aGOFI7DasDwrUOxK8fD0rjBTnhhWRsaHEIbj8Xo94EFZpYouykJXTiVYnFxeaQjFN2MLRF12FfG
	YRMsHQoWwS2NHCXCGe4yqbj65TWHXvHxTWUI/Dk4wmGH5QBmzm4DXbAKy/BKC0zvziVGS2TI9Rg
	==
X-Gm-Gg: AYBFou2DHqMKwdOUe5ovGC9q8HYO2kgM6N5UBgY4u3Cck3l/1ZKB6bmvmhMzko0jxe/
	2KiyA/M8KM77TmBDvdGzWnTWujaW+imFnAlIAA9SG2KPztaXBI6QlvDn266zC26XG9aY28csaa2
	qs8dcXMXqv6ssJZqHyNAixzDKZUCKEpjuIcbpVsaPbGTxL39+s59SnpB5b8kDx/MSdiEN9yGQTk
	50f/l0Ld0GVtJnEzihA9f80rRxlc/7j4sG3pzvuUJt4Ahgoj8ll6TkC6NU4l/YSRsp94CUkACKt
	CXLFfHgd61NM+Q5ldaNqSrTt2a5PQccrTruZQpgvCYFbg0qsEDuhMnU/mzeqLC3UQAAKLpRN1xt
	vvcbTUz5dqJyVy+Tb1V1slPX6idA82NxSqgA=
X-Received: by 2002:a05:622a:1905:b0:530:b2e4:d59d with SMTP id d75a77b69052e-5310d071f0cmr35836381cf.56.1789393464258;
        Mon, 14 Sep 2026 06:44:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1905:b0:530:b2e4:d59d with SMTP id d75a77b69052e-5310d071f0cmr35835751cf.56.1789393463669;
        Mon, 14 Sep 2026 06:44:23 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca309989sm100594471cf.4.2026.09.14.06.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:44:22 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:44:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
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
Subject: Re: [PATCH v4 00/24] MT8189: Add support for system and base clock
 controllers
Message-ID: <aqf6NH-xrMtCQppv@redhat.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <amuWdRD-TBQtFT_4@redhat.com>
 <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
MIME-Version: 1.0
In-Reply-To: <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HnRAv2fY7ujN_jDCT-gd7pHWDZ7ZQaFySVS0aLRqs4Q_1789393466
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_064429_920085_C399B433 
X-CRM114-Status: GOOD (  15.34  )
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

Hi Angelo,

On Fri, Jul 31, 2026 at 12:04:49PM +0200, AngeloGioacchino Del Regno wrote:
> On 7/30/26 20:22, Brian Masney wrote:
> > Should there be a new MAINTAINERS entry added? There's currently 221
> > files under drivers/clk/mediatek/ and there's currently only one
> > mediatek maintainer entry:
> > 
> >      MEDIATEK MT6735 CLOCK & RESET DRIVERS.
> > 
> > Is there anyone from mediatek (or elsewhere) that could act as a clk
> > subsystem maintainer similar to what the other SoC vendors do? Help with
> > reviews, send in pulls, etc?
> > 
> 
> I may be able to step in, but I have to check if it's feasible, time-wise, on
> my side.
> 
> Though, that won't happen until mid-September... because, well, I'm about to go
> on holiday (in a few days from now).

I'm checking in to see if you would be willing to be clk submaintainer
for the MediaTek clk drivers?

Brian


