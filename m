Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2DEC4453A
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 09:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzPYGGCsB/JnvYbiM7iDCIZYRT+Lm8x4cI/RrcLbCt0=; b=O1592veVCveOxwlHQrDjzizU0I
	HtgkNAfe1XUCVrpVReJ+LWGGyTAdYnBWEYATwE8m7aROkW2ZT9w3/6pLKf8aqtVfc0Lr7ePhgv/mr
	B2/75rS55BJlM/3CQRgvOw2q6ZE/E4TwIq3KmgbjfGJ9gDa5KwxkbDMiMpjIe7m6S8x54AaeVUHPQ
	kcNILaW6fJiEBaklU/GNGt31zV3faiCpRkj3RHU66B2fsTJA0x4b/fttIYjYYZrWpMi20LdvrsAz+
	K7SjG6NXLabHJfP9tXJQ9/kApt0R+p6g06sSFr6AhOjaJaOZiggZkxH9acASD5cH3cmAbr1KQrPRn
	Ilah1E5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT8b-0000000BO8o-0EhP;
	Wed, 22 Jul 2026 09:21:13 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT8X-0000000BO7W-44wd
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jul 2026 09:21:11 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so9328295e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Jul 2026 02:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784712068; x=1785316868; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TzPYGGCsB/JnvYbiM7iDCIZYRT+Lm8x4cI/RrcLbCt0=;
        b=sLRL+f+KSUmTAWcO3isLU54cnhE947COIwzVZdKATCFhKgA4PIwEIMUZ0gEZVLkbyk
         vo1m+2A4vHT0LsNaAuIywzwyvhYiAHHbYe+YQ7KSbylun5k+GGx7tHpABAAMvCg3k6eq
         Zc3IftuyC0G7dYU5ogCTvXlNM5x+8lnXcO01HYXKz5ozPf5AYLXrkrnqAI4SE4c29tYh
         urM+PXDVc3z4WbG8Q4MLdxyoYhDtroHt5zw8UXkThk+/W4T1VPvWX8MsSgTK95wPqKMB
         X5pm+Gorcc4iJ0u5Ely2U+R+Ksk+Ja/oE6vQq3EHjMrNrsqVPD85Z3FPcau+eiG0ZmVq
         a16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712068; x=1785316868;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzPYGGCsB/JnvYbiM7iDCIZYRT+Lm8x4cI/RrcLbCt0=;
        b=a5UiEJKH5W6+ae82690DhEbaCZFq/ltDPV9bUFbrp7/OKzDZwJoi/hTfTjfPBPSyeZ
         WNGUNRu6TGVg5VLMRklFsMBXCNdmXc8my1z4WxjcSP/nAvlT4JdjG5HM/VKThDSApD+v
         P/hR62mrPMV8KEpnwj2UZGhzcE0+X00jd0v2HpslOT/xwMtsfhSFfBSrV3xxeFcPZh2Y
         tU1rtMbn5Lj9RnrYdjYajwF5wn7plmIFRY4b0rSS+pbU10VqRxNT5iPualP0m1FoOpx2
         lZhKapeBzyf+PCKbBAFQqamwJzEwoG3+vq+i+YpCyYh5Afmnj2ICF6U9bU23t7aY6UdL
         faYg==
X-Forwarded-Encrypted: i=1; AHgh+Rpic175r5Wkl2HclU2XPioUu5HVNaKiHfuA/pUKhGIKtbysQD23x1NScRTUd0k2zFxMyCrP2OjxCUxIe2OvQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfVPGV3iijlgAf51Z/pJnYOhUS3qH+urQs4GCN4CotvhSl8kgN
	jNFlCcGAKE8A83o+lI0UZPPuD2idP4maukYOPS2RZOeafL3mLbQGtcKF
X-Gm-Gg: AR+sD12uAjgeONVERGAa+uxsyT2RG186kpVmoueQrqiAMPzzGa/v1I1GtTbnIho6gBl
	qNQHjiuurYEhxN9tXnGUQHWfqGfHx1FDMVRRpOBlr+3BCpXfxFpFTnEVTYGAuVKoRQPX6wWN4jk
	evrSzPUjosMhXsjlqXBVyy9VzJIvne1YjjBsOXvbiKgaztE8yCeI9RpHEopyygdA0LS6dUsvqoo
	OytKtNECPMdJn8AE9OtdU95fhcWVuwhACfKaSY1plWqO7x9JI7pEZsDPZeRQB5QB3/JVvDSrcaP
	EDa6Jw0+2JBkMhoZvVdAjJEEiaEa+5SNMWdlatVoZi9vNqt8rjhCraJ1Yp9XVIBdN42qUYUgyPJ
	EmwitYnA4ggmRs14UfLUxrjO6qUBfNEsH7E/6gJauaXyGh0mFZDqjZWf+Ak+hqeNVfAnRjDKNeP
	5SBfxQ2cKGrNAmBojQ
X-Received: by 2002:a05:6512:708:b0:5b0:1b0f:7a60 with SMTP id 2adb3069b0e04-5b28f9ba3e3mr2907126e87.32.1784712067687;
        Wed, 22 Jul 2026 02:21:07 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d303dfsm380919e87.47.2026.07.22.02.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:21:07 -0700 (PDT)
Date: Wed, 22 Jul 2026 11:21:06 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCHv2 wireless] wifi: mt76: fix MAC address for non OF pcie
 cards
Message-ID: <amCLcgSap5ShOiUT@soda.int.kasm.eu>
References: <20260706232857.807044-1-rosenp@gmail.com>
 <al_SAwiLmgT6D_tS@soda.int.kasm.eu>
 <a0c1178f-86e5-4193-9d9c-767abbdee076@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0c1178f-86e5-4193-9d9c-767abbdee076@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_022110_028703_E41D571A 
X-CRM114-Status: GOOD (  22.28  )
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

On 2026-07-22 08:40:56 +0200, Felix Fietkau wrote:
> Hi,
> 
> On 21.07.26 22:22, Klara Modin wrote:
> > On 2026-07-06 16:28:57 -0700, Rosen Penev wrote:
> > > If seems the check for err is wrong as the proper macaddr gets written
> > > to from the EEPROM itself. Meaning checking err from of_get_mac_address is
> > > wrong as the proper macaddr has been written by this point.
> > > 
> > > Reported-by: Klara Modin <klarasmodin@gmail.com>
> > > Closes: https://lore.kernel.org/all/ajRmlyx_AEGybykL@soda.int.kasm.eu/
> > > Reported-by: Tobias Klausmann <klausman@schwarzvogel.de>
> > > Closes:
> > > https://lore.kernel.org/linux-wireless/30a90714-02d8-45f2-a7f1-4cfe0627d50b@skade.local/
> > > Fixes: 31ee1582717e ("wifi: mt76: fix of_get_mac_address error handling")
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > Tested-by: Tobias Klausmann <klausman@schwarzvogel.de>
> > > Tested-by: Klara Modin <klarasmodin@gmail.com>
> > > ---
> > >  v2: add extra tags and target wireless
> > >  drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> > > index b99d7452800f..afdb73661866 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> > > @@ -181,7 +181,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
> > >  	if (err == -EPROBE_DEFER)
> > >  		return err;
> > > -	if (err) {
> > > +	if (!is_valid_ether_addr(phy->macaddr)) {
> > >  		eth_random_addr(phy->macaddr);
> > >  		dev_info(dev->dev,
> > >  			 "Invalid MAC address, using random address %pM\n",
> > > -- 
> > > 2.55.0
> > > 
> > 
> > Ping. No one seems to have picked this up yet, but I suppose it is
> > holiday season.
> It's in the mt76-fixes pull request that I just sent.
> 
> - Felix

Thanks!

