Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B643CA0EF8
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Aug 2025 22:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y70NAvFqmHqQ/QHVWzEdqMxMN+9/pnnsuJyiP3UY3H8=; b=b0bokXiUjHQ1MM0IsIIsnG5KgO
	SaTekpsXfzn5OiM+xwm3TNdOPrvAlrLBewoQbWd9aTgRJg04QgBUvISV/EMKSWOuupgwGlP5cFSSn
	z7wkKWAcRKYzxMWwKgiibvQXfSadTK48SOsxNQtxqmVcNWluxLWvL389Tj+8xaT05zkuTQPpyG4G9
	Ed8LRGC/AOUggDz5hZUCV6E/EjFN+Wf33ck1PVYGxvv/I4wR5WSm8YvTPhY4ZnVrup87uQgOnyktb
	a9ta6bNRRPYczj/ydiP6znfSYzcYVRNhsd4pO9fAgDZOsIlG5r0mum/O+uUJhPeuuEmrqIgEXNtLy
	7g83NJ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqs8-0000000F34H-0rRp;
	Wed, 20 Aug 2025 22:01:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uombD-0000000EXpB-2HFG
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Aug 2025 17:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755710865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y70NAvFqmHqQ/QHVWzEdqMxMN+9/pnnsuJyiP3UY3H8=;
	b=NnnIpB5MmTS3tqpycWSJCuGseWo3+Gcub3FH2jnfa1QNHKOCurrk1RXuazAXV6Z2pZUqsl
	9Ner46RDyckJA5MWLoRbuF3OQlApzEZZIjc31Jy//c0NFQaK2HlVs8A+xhc96q5bGCe1wP
	SBwJ4Oyjea9lxu7x03MzpfJwUgRf+gg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-VghfsIetOs2oD9Ic5CnpMA-1; Wed, 20 Aug 2025 13:27:44 -0400
X-MC-Unique: VghfsIetOs2oD9Ic5CnpMA-1
X-Mimecast-MFC-AGG-ID: VghfsIetOs2oD9Ic5CnpMA_1755710863
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d7c7e9709so4554866d6.3
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Aug 2025 10:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710863; x=1756315663;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y70NAvFqmHqQ/QHVWzEdqMxMN+9/pnnsuJyiP3UY3H8=;
        b=C/6ic6sU/0u1ISZ+T7WimW1sw7DHME36HRHIZIC+knVz9/kEdyZYnK/yFhdk4Kuj0g
         UlRqg3SwTpj5vc3RVS4+USVXG9ZYcTj2TmwDiI9rFw6sbsTYl+pFcuAdusUixP1d50Yl
         SRoFIRclNtvcxlLE1GrLQGCkde4lNetQ6fFP/k16xX4hs4wyYM5X87EYfVl7QdOD6Ef3
         2fgsgf5F6OIaZJwWs4uELhmxRZbQHqjgK+hifCaTkkklvTavB42tVdxchu8cidvCBEWJ
         hge/I2J7dicw9GbZjOiZBIxctVaSA2SK9cam5fVgixvR0doeqHvChdQ0luVc3jSjygXY
         PxCA==
X-Forwarded-Encrypted: i=1; AJvYcCV6AcEnxx5vPvG8j/ft4Tw/YqNtE/W0uO/v6ONSmWGVPWa84kFxNM7ZNxV0EgDjJSZS/xVtKk+UxpunnkJvGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaIBtRSUDVns7m5ECJL1c3KYH7purOSSsBTkiHVea6EiyLifmX
	bXIlwXqRjZgSac4aoWMKgmWB6N/816cwDvjmIqji3ma0yobMHc7WG9TQjCkUENq54M5OTiCL/DG
	x3aWGYOowpat+LMVoyokwhzFkEkZ/ijP4BgmThoEkzqhmM7kmHVtBpoN7JvPykp81kJM0E9igFQ
	==
X-Gm-Gg: ASbGncuWdqZcdovbpkrwlNdG0/f+oMNWLG2F0NlKxLjjuLcZdPZnX/VoSBQG9IVmkWM
	i6a0Y5IqN28oXizj3CeTKhtIv1ynxR5XLKNTguiPCbu8jY8iZRAaMZlzLIKEAOETvN4ilAXfwA5
	RiSJP7AJUgiPT8T9V/WHv8/1a77jaYKl+t0HH0XT9kXtCbQTI48e680dyZz1tsoRRzfg8sbOW/E
	Qb12TKgs2RX4GHpruraHMHyKlvw2zFlqxS4IheB+vIqiBlirn7aZUWy1rBmYSyzVbsG5sQMWoVu
	5OiLPKBte1JHTm+uZ/oZKIAAxm5eEIBLtp3yEFcw8t7XA65MCCOFLyFLhOMfJxA=
X-Received: by 2002:ac8:5dc6:0:b0:4b2:9ac2:6857 with SMTP id d75a77b69052e-4b29ac27162mr22632691cf.78.1755710863364;
        Wed, 20 Aug 2025 10:27:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBHjmp0EQimLUiSVjKdx79ljrj20Q8jlRYnemWAhO0v2X5MfDUxphjoE81Tq8MZ5J1pPp2Eg==
X-Received: by 2002:ac8:5dc6:0:b0:4b2:9ac2:6857 with SMTP id d75a77b69052e-4b29ac27162mr22632391cf.78.1755710862940;
        Wed, 20 Aug 2025 10:27:42 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11dc5aeaasm87927511cf.19.2025.08.20.10.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:27:41 -0700 (PDT)
Date: Wed, 20 Aug 2025 13:27:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from
 round_rate() to determine_rate()
Message-ID: <aKYFh5YI9j-MHKH4@x1>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
 <20250810-phy-clk-round-rate-v2-2-9162470bb9f2@redhat.com>
 <aKX35U4jX55W3W61@vaman>
MIME-Version: 1.0
In-Reply-To: <aKX35U4jX55W3W61@vaman>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: erS196gvmr8FKNUUj8DSfZhrYmwqS3dIXSLFOXAoYlw_1755710863
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_102747_689149_E1710519 
X-CRM114-Status: GOOD (  24.33  )
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

Hi Vinod,

On Wed, Aug 20, 2025 at 09:59:25PM +0530, Vinod Koul wrote:
> On 10-08-25, 18:45, Brian Masney wrote:
> > The round_rate() clk ops is deprecated, so migrate this driver from
> > round_rate() to determine_rate() using the Coccinelle semantic patch
> > on the cover letter of this series.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> >  drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> > index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
> > --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> > +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> > @@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
> >  	usleep_range(80, 100);
> >  }
> >  
> > -static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > -				    unsigned long *parent_rate)
> > +static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
> > +				       struct clk_rate_request *req)
> >  {
> > -	return rate;
> > +	return 0;
> 
> This does not sound correct to me? should this not check the requested
> rate?

I can't speak as to whether or not this specific driver should have a
rate check here. I've seen in some other drivers where the specific
frequencies are managed in firmware, and Linux just passes on the rate
request as is.

Some other phy drivers (most notably drivers/gpu/drm/msm/dsi/phy/) only
makes sure that the requested rate is within a min/max range. Assuming
I read this driver's set_rate() correctly, it looks like the min/max
range may be 64-192 MHz. I'm not sure to be honest.

This change keeps the existing behavior of the driver as it is today,
and just migrates off an old API.

Brian


