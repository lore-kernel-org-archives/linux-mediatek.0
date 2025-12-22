Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D91E67803
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Dec 2025 18:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXo0XmPhzaeXOxCnEx9hH+u3QjRF1RyUWpvNBcumJRc=; b=NwwqB3Tm1hLcATW2uPHaNs4nrq
	vTE0ZCKjx0DdZ7WjjGy5QjH1gZa5riceKezExCVQaAyRK0Gp9EN7kopFA9cnQAY74WxuGJEb56WRR
	0JenGLEvh+vO0Y8t3HUlsBy4Cn+C7y98bOE2+2+y9RBlDOnIXW4oGfv8EDme513zM9veRq/1Ug4Hz
	iSvWetkSgFVxZbvzj7uirpi6+BUDM3s2V7DjaY9GJF3GWuATEa1Jmcxc+W8lqUiih2Nw0WQgepWmG
	q925JBWDXHOCcbwCJvhFiWCUMpI/MCbOs8PMk5odkni3XN54RUDagavva4gU+7Ar0tWtNIAJ+4Kq2
	mkt1pnNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkDC-0000000E2X6-07bV;
	Mon, 22 Dec 2025 18:00:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkD6-0000000E2WL-3lIw
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Dec 2025 18:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766426443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dXo0XmPhzaeXOxCnEx9hH+u3QjRF1RyUWpvNBcumJRc=;
	b=Ry6vyLnWOpv6vdCtcaxjD6ub2uDlsXaj2G/lFujiZUG/YLehECkr8BAT5TM/MSGW/Jo9Wo
	T5z6dK8KIELK0NDltbV2MLsSjJ4ei+6LcNShzLA8d2uWfh6n/oi510EAgmgdjg4vUszIvM
	kuSaGpoK51c5pvPCPBEUl4xfGXNGH0U=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-yMIDnjVUOAedDrzgLY48Eg-1; Mon, 22 Dec 2025 13:00:41 -0500
X-MC-Unique: yMIDnjVUOAedDrzgLY48Eg-1
X-Mimecast-MFC-AGG-ID: yMIDnjVUOAedDrzgLY48Eg_1766426441
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8887c0d3074so113712926d6.2
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Dec 2025 10:00:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766426441; x=1767031241;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dXo0XmPhzaeXOxCnEx9hH+u3QjRF1RyUWpvNBcumJRc=;
        b=asGhNkZxcc7JW+/TowxRym3BzlhpwlcP3cvk/vzYL2AYKSTFKCXgKdjZl78jTDfm+x
         DMUXuin89JYhLEb+lSnYE0fSycvn3fhmuMy4FS1W1WlQdRiKrJ9UDtW2zEj/WPxJ1x3p
         aAeP6AFBDxmWbZaKGNpAPEcIKHILgYaLzaKUG3MVVvHdCj9ZKTnhpmFuzO4hlgTpezpv
         FvWbFMo3W34wuXD5G1IBYI1Gtt3hdDDCKUu6cEe/Jh75O3lKQ6DGD7FlWP/46qaZt1kn
         XiZKQv/RoQswHysujXb0OzHXBN4gD60m700vnqneKyhtB18nrWDWCvd1omwgxpGuqSYi
         hpNA==
X-Forwarded-Encrypted: i=1; AJvYcCVx7OFkICh3wKfCBhc3YdidvBfZ8xf3ZWemYyoNwyral9QeEXXu/EfNh3r23dhTM/Ea2VEyE2KOvQSlrWidoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUEnYaQFB7Z8AhTlQgRAhRftlqw31D6IiRH0AXjl9rNW18v5nX
	noBfII9ATZBXfe9F6sLHAQu/3OHJjH8iVX8NPjBzLCTTjMHP7ZaJPdf3krjewxN5ugQH1jK9LVm
	yhg+tQ8wTRDjoFNRKnt3E7wJLds8vsRNlp9IHOXBOnXGnwvbNMi9tSUpZ5SaKuGoILaEntYtiDw
	==
X-Gm-Gg: AY/fxX7aoNqpU6EoP0vagbqxDkQq1C8zGvpa8m1DyaJ8hQrroiJmVCeU/BDKzS+jQO2
	9IH6TZfv8dopDEFQffQ8xwBqLuWQ2fsfRmgNrwAtG7qIxRp8xueeUI9H7StY+1K9l8lJmLwXoWR
	JdoyXB2IgpsFOZaUPBJEiMTaaXVnpKSsAIZNOMo3xdLSoozliKrL8l3JrkE3oy6dU5VQLsNW4dy
	LfQ9NV6LVHrGGPhWJYHsr9XeLuv5sWllg5qfqaWZEGTy8CMpeL/HoruBZXKKYKwzN/beCerO1/+
	nNk96h96lpf6JL46RCq+ldHE3ipp8Rfn495IWiw+FHkrRtSJNOwR5Dvqa30yRu0GzXB3MApHVLw
	Iu5b690QUOOets+u+RA21F6JW146lHqZlSCT2cpUt9MmW
X-Received: by 2002:a05:6214:27c6:b0:88a:306b:820b with SMTP id 6a1803df08f44-88d83d670e7mr209995336d6.57.1766426440649;
        Mon, 22 Dec 2025 10:00:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFShBd6/ILCtyh9OhdnIzWfY3dp9JmiO74dGqZBOXDUCJ4lowAybkSiEsS44d+2GsPo84wwMA==
X-Received: by 2002:a05:6214:27c6:b0:88a:306b:820b with SMTP id 6a1803df08f44-88d83d670e7mr209994116d6.57.1766426440046;
        Mon, 22 Dec 2025 10:00:40 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a63e296sm86625536d6.52.2025.12.22.10.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 10:00:39 -0800 (PST)
Date: Mon, 22 Dec 2025 13:00:36 -0500
From: Brian Masney <bmasney@redhat.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Qiqi Wang <qiqi.wang@mediatek.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	netdev@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com,
	jh.hsu@mediatek.com
Subject: Re: [PATCH v4 04/21] clk: mediatek: Add MT8189 apmixedsys clock
 support
Message-ID: <aUmHRCXNy45PrVLG@redhat.com>
References: <20251215034944.2973003-1-irving-ch.lin@mediatek.com>
 <20251215034944.2973003-5-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20251215034944.2973003-5-irving-ch.lin@mediatek.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XlB1_lgfI9zqAV8Em5-qq7DaTrZi7UuydKYI85I8KXE_1766426441
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_100045_040302_77E2585A 
X-CRM114-Status: GOOD (  12.89  )
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

On Mon, Dec 15, 2025 at 11:49:13AM +0800, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add support for the MT8189 apmixedsys clock controller, which provides
> PLLs generated from SoC 26m.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig                 |  13 ++
>  drivers/clk/mediatek/Makefile                |   1 +
>  drivers/clk/mediatek/clk-mt8189-apmixedsys.c | 192 +++++++++++++++++++
                        ^^^^^^^^^^^^^^^^^^^^^^^

This file, along with others in this series, is not listed in
MAINTAINERS. This is the current entry:

MEDIATEK MT6735 CLOCK & RESET DRIVERS
M:      Yassine Oudjana <y.oudjana@protonmail.com>
L:      linux-clk@vger.kernel.org
L:      linux-mediatek@lists.infradead.org (moderated for non-subscribers)
S:      Maintained
F:      drivers/clk/mediatek/clk-mt6735-apmixedsys.c
F:      drivers/clk/mediatek/clk-mt6735-imgsys.c
F:      drivers/clk/mediatek/clk-mt6735-infracfg.c
F:      drivers/clk/mediatek/clk-mt6735-mfgcfg.c
F:      drivers/clk/mediatek/clk-mt6735-pericfg.c
F:      drivers/clk/mediatek/clk-mt6735-topckgen.c
F:      drivers/clk/mediatek/clk-mt6735-vdecsys.c
F:      drivers/clk/mediatek/clk-mt6735-vencsys.c
F:      include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
F:      include/dt-bindings/clock/mediatek,mt6735-imgsys.h
F:      include/dt-bindings/clock/mediatek,mt6735-infracfg.h
F:      include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
F:      include/dt-bindings/clock/mediatek,mt6735-pericfg.h
F:      include/dt-bindings/clock/mediatek,mt6735-topckgen.h
F:      include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
F:      include/dt-bindings/clock/mediatek,mt6735-vencsys.h
F:      include/dt-bindings/reset/mediatek,mt6735-infracfg.h
F:      include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
F:      include/dt-bindings/reset/mediatek,mt6735-pericfg.h
F:      include/dt-bindings/reset/mediatek,mt6735-vdecsys.h

Should the entries to MAINTAINERS be simplified to the following?

F:      drivers/clk/mediatek/
F:      include/dt-bindings/clock/mediatek,*

Brian


