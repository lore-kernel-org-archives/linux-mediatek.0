Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE42CA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 13:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jepfeoNOxEjzjxCx4a1HfCNQ7Fn9JfA8nF0tCrt92S8=; b=aHdP1a/YplsJQKEPhiOT6h8CBI
	zF+BnoHYBe03ordyZhKtuVBsTQu+WDonwBDtowKHUJtHHuEUMke3lQsSZotIGGW0tN6r+svjv86gt
	xwrV5XBgKF7v9tYZvFjYkNDtEkqYsl9ZNfeRMVN8LLTnJuAtuh6HXvc/YLyGA6BqkV5LL67xfagAG
	ywvkJ5+pBTTSMNkM1o3HCsJ0f/FV18WUeXUXbwGK00rQoRI75rL5QUDyuPz9pqSJWQIwFpO7ldCMz
	uS29U6khtN+qn1B8PyUFJ9h/4lf1oDoreU+lDMGpEVo8XLU74WLCn9pS0pZ4WHAVJmXkqMLNLQ7U0
	vQOCh4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg3il-003TED-2I;
	Tue, 12 Sep 2023 13:46:27 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg3ii-003TD1-1V
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 13:46:26 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9936b3d0286so743067266b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 06:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694526379; x=1695131179; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jepfeoNOxEjzjxCx4a1HfCNQ7Fn9JfA8nF0tCrt92S8=;
        b=v/bJU01GZjB42cKz+MxkWlYHDzNzeqfyuedvaq5MDQGsZ2xBl089yfKFQoP6MdoqLZ
         pQXSYygAgCRUgrgWY2A6feWkfKg66nGt85t+Lv0VoJCymJGBFEH7NO68QogInckOzvus
         kx2iGlekWBpzwljvWjCRwpoN13Qx2YTf1VsOazw7BDzrEkwtIzYDIPqP9OQ5zi6zsbCH
         tkqpGOYDS/aZ6bmkgH4/6IIHrmHa4oLsSoaivtdlTKZzyB4ptGzSKJOtJFyh0Whxzg3A
         aY285lpwe5aCTakIPOeP4yhO4z+RTF0lNeSnF71hn3i+1/mHaogbfdqIjJlPjD79SBik
         OPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526379; x=1695131179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jepfeoNOxEjzjxCx4a1HfCNQ7Fn9JfA8nF0tCrt92S8=;
        b=bB2Ur8uCTyFKxXEBCI7jSN7O2bJl4K/AxrBlhFT6OUI5DerNAvKY5oHvF6lHaxNtVU
         R7iNX4HufZe37gEno0FruF6IUhVYuzmE29BXHxpO5/VOQ1UejVxlQg2jtYUmjGn76iE6
         BPYxapOa4jc/wVD+ZRPrRzFC0Vo6qcJqjeo8Vj1Bp+Ac48nJ0kGGB7pbW+7RUyepKyKU
         9yREpvtaliCr24zV6xiBA85dP/UZlvoz1BdIoiM+qViVvJwF/MDuBDeV393eGthNWV5q
         4AM3YCVAZI6lXCKgWQVW+u01HCDKFx+6ct+FuTymYMq7QzkfSeJ3Lsm0vKfCO330e80T
         JJ3Q==
X-Gm-Message-State: AOJu0YxRE3A40nKTeM6v5wqKlF89NfSnCYxO1JPvNtFDmavKWC91WWcU
	1PtwMjmhvSHH7QQqrZUZ5FWuxA==
X-Google-Smtp-Source: AGHT+IGaw/MFk//2QGkYQG2/NKydmCFKZT0TrVz2+njlEajzVppplZmYjOHO+YlLC5nAZSzsAD+1YA==
X-Received: by 2002:a17:907:762d:b0:9a1:ec3d:9004 with SMTP id jy13-20020a170907762d00b009a1ec3d9004mr11419584ejc.9.1694526379364;
        Tue, 12 Sep 2023 06:46:19 -0700 (PDT)
Received: from blmsp ([2001:4091:a246:82a0:6611:d59a:8ba3:9a66])
        by smtp.gmail.com with ESMTPSA id n12-20020a170906118c00b009a5f1d15642sm6868756eja.158.2023.09.12.06.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:46:18 -0700 (PDT)
Date: Tue, 12 Sep 2023 15:46:17 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: regression with 33140e668b10 thermal/drivers/mediatek: Control
 buffer enablement tweaks
Message-ID: <20230912134617.jwonuolt56nofifz@blmsp>
References: <trinity-6713557b-fe0a-4dae-84aa-1aa86f7619fa-1693473911557@3c-app-gmx-bs12>
 <trinity-f3e7d8e0-2e93-4e84-a489-3993c819d2c3-1693488871086@3c-app-gmx-bs12>
 <07a569b9-e691-64ea-dd65-3b49842af33d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <07a569b9-e691-64ea-dd65-3b49842af33d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_064624_503714_D1A9D75D 
X-CRM114-Status: GOOD (  23.44  )
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
Cc: Alex Riabchenko <d3adme4t@gmail.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Frank and Daniel,

On Tue, Sep 12, 2023 at 02:57:45PM +0200, Daniel Lezcano wrote:
> 
> Hi Frank,
> 
> thanks for reporting and investigating the issue.
> 
> 
> On 31/08/2023 15:34, Frank Wunderlich wrote:
> > Hi,
> > 
> > looked a bit deeper into it and it looks like i only need to add the fields in the mtk_thermal_data struct
> > 
> > --- a/drivers/thermal/mediatek/auxadc_thermal.c
> > +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> > @@ -690,6 +690,9 @@ static const struct mtk_thermal_data mt7986_thermal_data = {
> >          .adcpnp = mt7986_adcpnp,
> >          .sensor_mux_values = mt7986_mux_values,
> >          .version = MTK_THERMAL_V3,
> > +       .apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
> > +       .apmixed_buffer_ctl_mask = GENMASK(31, 6) | BIT(3),
> > +       .apmixed_buffer_ctl_set = BIT(0),
> >   };
> > 
> > in my quick test the temprature can be read again and i'm near room temperature...i though it was a bit higher before, but as far as i understand the code, the values were fixed before and only made it configurable.
> > 
> > if someone can confirm that i'm right, i can send official patch.

Sorry for the delay, this was in my inbox but somehow not on my todo
list.

The patch looks correct. I think I simply missed adding the fields for
MTK_THERMAL_V3 chips. Sorry!

> 
> At the first glance, it seems the proposed change is correct and could be
> proposed as a hot fix.
> 
> However, the conditions with the version and the apmixed_buffer_ctl_reg
> looks a bit fuzzy.
> 
> Markus, can you revisit this part of code and consolidate the configurable
> approach ?

Yes, it indeed looks like I broke another condition there. I will give
it another close look and send a fix.

Best,
Markus

