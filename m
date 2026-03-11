Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14BD1125876
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoMDbJU2xDFYUQd1hXlmSs8yylpms2iEAMhOVCgJXGI=; b=DPBocUzwjp9IFuKnvHHOmp9mRE
	v6GsvGRznBhOZ1PN/bdaRqUsaDBS/8S18jGy/Y6+KXo/uKd6KWhvf2vpJJNwgLteibixCneGSoCIB
	WwA8fsKeNGPGMeUS8IVIf6ZIRwxiPnUhEo8b5DWym+vXqX6HdpqS9ZX8iaRsDQqKv/FO9fqyp8qqy
	k2CiODNBToTzYOTbCtRLK4Saor0/ZMhJxFtybB54JZjnOoMzREGCimrjQv3fxj9P87yuqZBV8dBt2
	2Uo0VLiX4ay79s+cHYLw4L8hgMYYAr++ExvvaFdoiATaKsv/f1/U8aKdaImR+2ZiM9JFFspm7YdFM
	RghrpyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PUP-0000000CO99-0TXZ;
	Wed, 11 Mar 2026 19:45:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PUK-0000000CO66-3BlZ
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 19:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773258299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GoMDbJU2xDFYUQd1hXlmSs8yylpms2iEAMhOVCgJXGI=;
	b=fB4ugZKSpwUpx45R1na9WzcJG03r/q3fzjvtYxP4Xp7BMFKrqYOYcfWZN1igzbhOeFmoHz
	A3f2gTaZXOzk7xP0hR+dmy9WvhluRUQb15h2l+qrpYXXnEPgaCm2QoHgMZo3YIbilmFX6x
	erD4uiXW1jvC5lWswjUr9ktZqH9sCQU=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-mp_oyg8-N4ij8iX6XXbLGA-1; Wed, 11 Mar 2026 15:44:56 -0400
X-MC-Unique: mp_oyg8-N4ij8iX6XXbLGA-1
X-Mimecast-MFC-AGG-ID: mp_oyg8-N4ij8iX6XXbLGA_1773258295
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-67bcaf99fdcso3985296eaf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 12:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773258295; x=1773863095;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoMDbJU2xDFYUQd1hXlmSs8yylpms2iEAMhOVCgJXGI=;
        b=YKq9TJk9cufDaSku1u5HW+RLjAz9ICjplk7pqwRvVH+F7tlSDE71VY89BmSdg1lmP/
         izNqk6XKT2poRqlJfyq/ZMYIIhV83nPUC6g5jhTNosTLInoDmg6wb3fZhxpzv+qNXYGr
         g/EW4cmvpjuiMKBE+kLduAoeIfwS+hOFKGEb0Jcp2npnOeI2mMAGxVgLRs5qb4j0F1x+
         D0UH5lYWvkot+99CFPgZY7Q7HR0Vi/cPxVl5UBgYDTqIoRg0qw8QrbzDvQhvU3+/CSEE
         89JCZOOUCMWy0X6/ysBydExr3QrwX0qdrJmiAiSUIqrgD7hMOX+h/TkAp+AE8k781Hsp
         /paw==
X-Forwarded-Encrypted: i=1; AJvYcCW2pPxsRsVmGMi1V77+5AT3Lx5RewhbWemdSGmS/mNiItfMY8q5pqziIdqVpwFxX7XSK30VNFA1LYKRZzJY5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE1U1LCQtRgrXls7T+ZWGhKGNbkSB5rCW/37YlYzoiE2SQB8JK
	G47+zikjrvlHZdFVBZsciTmuMlACgLDk19PxwxsRgBeb8V54MawEYs4YN0GD/msOipu6WTfJqwA
	dN02Kvb1h5aAA5toMvOftARDU1G/DmDgxlbj3gWO0trq0sCv76I3vf5IZ0dMdrOiEabsVkLoxsg
	==
X-Gm-Gg: ATEYQzxp4eZkdTa8eU4V3hvzLSsyjZeFDXc6WgJiod1yFe0v80TBtV0zjTxVU0c1iW9
	qNx6r+5FV60MKSIKvv4Oo5d6MeJIrip9vfbGTz1AHXOEeFTsJDUUrS9GbRuObMv9B9sbzhMFgLv
	ZY2zI/7U6jxyiahTB9Tv+H3CJZDvpuUUd9OrjEkXm7S1BwAt93EIJ1OfCSTAy/p9Y0uqw/foTm3
	rkGh5XpV3yg3BhDlUgr26+/eAPgXu/eShFUQgvUggPB8QJ760Kg1uH6SFtfajf7kZeMBLyji5UU
	87Wsy9vf+S1s2+5kHFkD0hOqC+gtUJoywW932XaCaKIEffoQqLUIMRIHLqmzBzn9SkmyRVVdWOx
	rYOTOv8jX5V6OOwe0DgMs
X-Received: by 2002:a05:6820:468b:b0:67a:47b:5a1a with SMTP id 006d021491bc7-67bc8a92d45mr2060506eaf.65.1773258295382;
        Wed, 11 Mar 2026 12:44:55 -0700 (PDT)
X-Received: by 2002:a05:6820:468b:b0:67a:47b:5a1a with SMTP id 006d021491bc7-67bc8a92d45mr2060493eaf.65.1773258294899;
        Wed, 11 Mar 2026 12:44:54 -0700 (PDT)
Received: from redhat.com ([2600:382:7704:370d:c6a3:6b0f:aa31:6ca2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bc8efb85esm1894481eaf.1.2026.03.11.12.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:44:54 -0700 (PDT)
Date: Wed, 11 Mar 2026 15:44:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, vkoul@kernel.org, neil.armstrong@linaro.org,
	p.zabel@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, nbd@nbd.name,
	ansuelsmth@gmail.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/8] clk: airoha: Add econet EN751221 clock/reset
 support to en7523-scu
Message-ID: <abHGMgGCyPh1G5jC@redhat.com>
References: <20260309131818.74467-1-cjd@cjdns.fr>
 <20260309131818.74467-3-cjd@cjdns.fr>
 <abF-qFC1Oa4dz-fh@redhat.com>
 <de6e8440-99a1-4be7-80aa-3645fdb0bdb9@cjdns.fr>
MIME-Version: 1.0
In-Reply-To: <de6e8440-99a1-4be7-80aa-3645fdb0bdb9@cjdns.fr>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TvLuZI_au_ySWolH-_HG5Ho_MkS_-6NhC1o0RT9Tl_0_1773258295
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_124500_871624_9BEE2291 
X-CRM114-Status: GOOD (  33.39  )
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

On Wed, Mar 11, 2026 at 06:12:59PM +0100, Caleb James DeLisle wrote:
> Hello Brian,
> 
> Thank you for taking the time!
> 
> 
> On 11/03/2026 15:39, Brian Masney wrote:
> > Hi Caleb,
> > 
> > On Mon, Mar 09, 2026 at 01:18:12PM +0000, Caleb James DeLisle wrote:
> > > EcoNet EN751221 clock/reset driver is significantly similar to the
> > > EN7523 / EN7581, however the EN751221 does not have a neat batch of clock
> > > divider registers so there are fewer known clocks, and the frequency of
> > > each clock is derived differently. This clock driver will probably work
> > > correctly on EN751627, EN7528, and EN7580.
> > > 
> > > Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> > > ---
> > >   static u32 en7523_get_base_rate(const struct en_clk_desc *desc, u32 val)
> > >   {
> > > @@ -604,7 +703,8 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
> > >   	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
> > >   	return en7581_reset_register(&pdev->dev, np_base, en7523_rst_map,
> > > -				     ARRAY_SIZE(en7523_rst_map));
> > > +				     ARRAY_SIZE(en7523_rst_map),
> > > +				     en7581_rst_ofs);
> > I assume the mix of en7523 and en7581 is ok here?
> 
> 
> Correct, en7581 came first, then when en7523 was added they reused the
> function. I'm only changing the offsets to be passed in because en751221 has
> more reset registers so different offset table than the others.

Sounds good. I just wanted to confirm.

> > > +	else
> > > +		clk_data->hws[key] = hw;
> > Should the error code be returned here? I know the function has try in
> > it's name, however if this fails, then it still registers it.
> 
> 
> This function follows the general pattern of en7581_register_clocks(). If a
> clock can't be registered, leave clk_data->hws[key] as NULL, log, and
> continue. There's only two possible reasons for failing, if
> clk_hw_register_fixed_rate() fails then it's not registered because it
> failed. If key >= EN751221_MAX_CLKS, it does register but I'll fix this so
> it's checking that before clk_hw_register_fixed_rate().

I see that Stephen picked up this driver in 2022 with that behavior. I'm
fine with it if he is.

> > > +	/* BUS */
> > > +	rate = FIELD_GET(EN751221_REG_BUS_MASK,
> > > +			 readl(np_base + EN751221_REG_BUS));
> > > +	rate *= 1000000;
> > > +	en751221_try_register_clk(dev, EN751221_CLK_BUS, clk_data, "bus",
> > > +				  rate);
> > > +
> > > +	/* CPU */
> > > +	en751221_try_register_clk(dev, EN751221_CLK_CPU, clk_data, "cpu",
> > > +				  rate * 4);
> > > +
> > > +	/* HPT */
> > > +	switch (hid) {
> > > +	case HIR_EN751221:
> > > +	case HIR_EN751627:
> > > +	case HIR_EN7526C:
> > > +	case HIR_EN7580:
> > > +	case HIR_EN7528:
> > > +		rate = 200000000;
> > > +		break;
> > > +	case HIR_MT7505:
> > > +		rate = 100000000;
> > > +		break;
> > > +	case HIR_MT751020:
> > > +		rate = 800000000 / 3;
> > > +		break;
> > > +	default:
> > > +		rate = 250000000;
> > Should a warning be logged here or in get_hw_id() above? hid can be set
> > to HIR_UNKNOWN here.
> 
> Now that I'm looking at this again, I'm starting to think it might be better
> to just remove it and use a fixed-clock in the DT. I wrote it aiming for
> completeness, but this particular clock has so much code supporting it, I'm
> feeling like it just doesn't make any sense.
> 
> Let me know if you have a feeling on this because I'm swaying in the
> direction of just re-sending with it removed.

That makes sense to me.

Brian


