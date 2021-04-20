Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5127AC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 16:25:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0208613D2
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 16:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0208613D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vG0t0I6WbF7B+TqsHRqXyKxNf6vpcZXXZDEtvyaSiBU=; b=HGwZB393ygldBv9FTuS8Bbm1H
	8wwUYMesZ4OGSS+IvhQBLV76DiQW1QUyKxD1+aqQ5ypbFufYEYHabpXS57/HFLkbuKIeBSln4VivS
	uGLdTMrgdLe8XmeqAZNVWATjCd18qwfSVUrkVEPehOR7WALPEHIwveXDYgPR0aI0BvH0mS8/MZ05O
	qxdvLVFfZ9KJN4G5sGZrRPhNkVDCicNbRMrJNr9aAr7dxDKs3K7TNw8W7AGdAi8Y6kMpKocpBePos
	qscgGtcOCn7/1R5ZG2/yOhISUtpKpeaCPXdHB9/VXZkTBzPFHIoFdD7kiRgHr+vWfAEjcLy/U3GeZ
	xIg1vx/Bg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYtBZ-00CZLt-Pm; Tue, 20 Apr 2021 16:25:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYtBO-00CZKg-A7; Tue, 20 Apr 2021 16:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=A8dVyfjRQex2uU+PHTE48uLGNVgNmujkBe81Of/rrYw=; b=wmBssqNXXqW5x3zFUg5sXVxuxL
 yDCZ/uk4CWIIilC89N8WHqvRucGcIKkxhR4y38Fo8yXL/UCcN+Iwlo6cXQ40c5zXFHY+NMpIQyNGa
 T0sV4KsZ1p30ckveiNRZzwqJyOPRMG3kSvhz3UPci4B8lgK3mgWNZIpO14ao5LUmup4U5f+gKL67H
 YncMuULgm6s6AQOFfsp4UbuDq9XgjnFrq2sIHXuT1cxlGy3uIPnZm8iSnRDK03StiwNg7FNGdqiyI
 JfpTNtsIMvEN3Eixzqoa9bhtR4Bn7Xo+4sIfqUAHs1uXoW+wx/wtrgpXwai8uTewq2zFL3fkBSMxM
 YgWv/HVQ==;
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYtBL-00CGtI-Il; Tue, 20 Apr 2021 16:25:00 +0000
Received: by mail-oi1-f177.google.com with SMTP id i81so39509890oif.6;
 Tue, 20 Apr 2021 09:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A8dVyfjRQex2uU+PHTE48uLGNVgNmujkBe81Of/rrYw=;
 b=OnSSxdk+lS55jpa/8OZUPhcYFq0k0kllDRflW3mPLBk0+EfWyvQkzN+NOCA9n1ecWT
 ECweuZJHx/uI/+JQBDvkuHjM60dngiSq9sjVEtDHCfCzM2jOnOs9NxbDOLYLsT8hZCwJ
 8YJlHeTI7tNRicr89lJzv1rqVSkhjpNiG8UfzyP/JKwcO55CA2bmB3Uv5IlCPW7rea+/
 bEqvbDI4OMBwR1m5Z+Idk9UhvhMCOZcWKXQW6ypctqWXesUryuclga7FOF3fsc7NSoAT
 M7srJB5Qv0qfpGFDM3Wx2sCuZN+J8yuWSKZgJq8d1zHPmcfMitgwvkqBTRk5qWJlW8/C
 0zpA==
X-Gm-Message-State: AOAM531eD1ozeSQNYIF/OkJs8u+gCFAOlcE/Burt48M8l5rfN80/twot
 dLE+N+4hrX4O3sU8M5poZA==
X-Google-Smtp-Source: ABdhPJzwYqxFN2+jlPlIrVKF+pkBftc8P1b64ffzN6SRSJxNtkEw2eWPlANKkhIUOyrz343BVhv/gQ==
X-Received: by 2002:aca:b387:: with SMTP id c129mr3598986oif.30.1618935898028; 
 Tue, 20 Apr 2021 09:24:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i25sm4370603otf.37.2021.04.20.09.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 09:24:57 -0700 (PDT)
Received: (nullmailer pid 3431205 invoked by uid 1000);
 Tue, 20 Apr 2021 16:24:55 -0000
Date: Tue, 20 Apr 2021 11:24:55 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, chunkuang.hu@kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: display: mediatek, hdmi: Convert to
 use graph schema
Message-ID: <20210420162455.GA3431175@robh.at.kernel.org>
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
 <20210419073244.2678688-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419073244.2678688-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_092459_642863_C6BA4805 
X-CRM114-Status: GOOD (  10.02  )
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

On Mon, 19 Apr 2021 09:32:40 +0200, Neil Armstrong wrote:
> Update the mediatek,dpi binding to use the graph schema.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../display/mediatek/mediatek,cec.yaml        |  51 +++++++
>  .../display/mediatek/mediatek,hdmi-ddc.yaml   |  57 ++++++++
>  .../display/mediatek/mediatek,hdmi.txt        | 136 ------------------
>  .../display/mediatek/mediatek,hdmi.yaml       | 132 +++++++++++++++++
>  4 files changed, 240 insertions(+), 136 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
