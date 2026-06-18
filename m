Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1239CD98ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 23:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uZEinBiEzubyVwK+mDqbuOj5jjsF/asva00uL4IEmk=; b=cgQdA+hd4f/4Xz2DdPZdRYbSjI
	aFP12aoVsO23tLr9ClQQNtWKrEgTnxXKJuEkihuZlTzIGlUr3lTs4GLqgaORSdWyA5tVVRMRr7cOV
	Uh6b2jJK7VsZtbvngqgxzRuuqI15skn5CV0hgcGQvtfpPOe1XbOpBL4ZrmPy6FqHDJ2Gs2doX3f2D
	qH8QMWswds+MfuUIr1V0SzTA5QmkgStni6x7U1TUvjrMMpebIddEs9kT/nvqiQZPo3+NF56rCbDgA
	J5Kc8ZYJjlvZhZsmutIdn9x3s14TcdbyXDx+O11RAcu4zNyTI48opXiuGgCY9Vxw2odtKgNUt9rnI
	bxh3Jafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waMWA-00000001sRv-2aza;
	Thu, 18 Jun 2026 23:51:30 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waMW6-00000001sR5-3t8h
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 23:51:28 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5ad49c55ce1so1328394e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 16:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781826685; x=1782431485; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8uZEinBiEzubyVwK+mDqbuOj5jjsF/asva00uL4IEmk=;
        b=DXgN9/fug1iGiVzrquFsRR4S6sXBHb6pT6EIsouleBeHjvSjoekUBRKI9wGO5cP5vb
         EjgABVfy0IDc0YNO4y5FQrigAcdQvG7qiuxnGhIgDAtt/yZBHrKiiIcQ3jLSUoMzEt65
         qPNE7Ks0ZCGcCTj1MDph39b4sblmh/TaTSl7RhYzKm8hfofmuyQygHUtiJI4M7bADo5p
         lrB0V7tt3+XHOePHUnepLQ1raw8r5BT6DIFN+fp0oFVWtNl/7wpffFZo38ylU6MQuA4A
         EHeVE6DywlQHjzg7gTZPRubKsEOU6Nho+lXFhN0koDNPnU4eQ1KI99xX+Sv8RUdrPqZU
         n6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781826685; x=1782431485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8uZEinBiEzubyVwK+mDqbuOj5jjsF/asva00uL4IEmk=;
        b=P6KLt5JTS1LQ5eCAzy7f38Ma5JF/7bFq6p0HfXJiP5uZXcKKtea3Za2W7X7ewBa+fb
         GzIvTiZJ5J/N3/p1hT846kq8aeWCFu/+x9GXsHzX7JwTzvuaOz1zsn5QJXO/PjBZbv5p
         LCby2kddeu29H3pbSpFX+xzvw+gjdXGATIA6Ek5xJLrwVdGIpeCJi5t4b/DPpbffPHvr
         L/HAdLEoh2HBaq/zZ8qjLUyACj+C0PAaw6lmfKvfZ3cn69+TCGdsLexXqo/i+onzF0il
         kc9OC2uhLuPr6j4Rbd1wwqCn/gb5PWq9l0htD4vO+ggDveJujyIvBUIySNWUebo2zLLv
         K/Fg==
X-Forwarded-Encrypted: i=1; AFNElJ8sS2tW8i9cml8VuNg23K716e97CzOYaS3wzLoubnESxA1Oi4OohzQ4+GqeqDo3vL3zs43zSN23+HpCbtHP8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuLrKzEaTMBrWH9wjM/CtO59Pb9alNT3QRyrH3RqPPdMolQMss
	Vr68QexFpapxvx7HEJEayr4Y2XkoH53FUGOQ2HFBTHT7OuaFb1+/kvpY
X-Gm-Gg: AfdE7cmitZZEcHL6OP1CDIGCaOWgacXbs2i5ZHNTto4y6OMYrpRtU6DtNQnLeN1AC4b
	mn4eHrHwgpumMYCl+BUvMHlkywZFYLX5RsnJdB0RxtAsVU31DKpMgNbePi+5aJmzC4taJwOQAWw
	WXh7VfCMNqdP5WNSze1UD69YVKukQgyrmSkYyks5BIV0F10JxP62U0Avmkj0WdCnLam085Pg2UJ
	0eU4TVFUe52eHMMdRC6ds2P3SCjWZ4kqDgyg073LInDTN4T2bAFYWo3hpG+zaGcBV96IAbokymD
	ifFC2j8UYLkKiPEQWXF3QntqnMwto/kndi3PGyZUoeZPb6au4Lk8U1l51M2mpppdR/R6eDKOlJn
	Y+aGbGfhUt0vAToDsdabPmaYNxvsPQnRpRLlcx+53mCy7ESd3UQfUyO8gs9knBfhS/LO1OrK806
	XdfYJlOmq/2FApXw==
X-Received: by 2002:ac2:44d4:0:b0:5aa:8823:aeba with SMTP id 2adb3069b0e04-5ad57720e67mr181855e87.47.1781826684481;
        Thu, 18 Jun 2026 16:51:24 -0700 (PDT)
Received: from localhost ([2001:678:a5c:1204:3d4f:47f9:ac7a:fb85])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad57245f5csm197309e87.28.2026.06.18.16.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 16:51:24 -0700 (PDT)
Date: Fri, 19 Jun 2026 01:51:23 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH wireless-next] wifi: mt76: fix of_get_mac_address error
 handling
Message-ID: <ajSDtsJCmYnMNJSD@parmesan.int.kasm.eu>
References: <20260427051746.954704-1-rosenp@gmail.com>
 <ajRmlyx_AEGybykL@soda.int.kasm.eu>
 <CAKxU2N-gfH8Tq29-j2MArogLZuO7JEqtN5LNPVygJzrAERa3cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N-gfH8Tq29-j2MArogLZuO7JEqtN5LNPVygJzrAERa3cg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_165126_987289_CE960E59 
X-CRM114-Status: GOOD (  32.66  )
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

On 2026-06-18 16:01:45 -0700, Rosen Penev wrote:
> On Thu, Jun 18, 2026 at 2:47 PM Klara Modin <klarasmodin@gmail.com> wrote:
> >
> > Hi,
> >
> > On 2026-04-26 22:17:46 -0700, Rosen Penev wrote:
> > > Check return value instead of is_valid_ether_addr. The latter is handled
> > > by the former.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> > > index 93d91264687f..0f6ccf6ed53d 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> > > @@ -93,7 +93,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
> > >       if (err == -EPROBE_DEFER)
> > >               return err;
> > >
> > > -     if (!is_valid_ether_addr(phy->macaddr)) {
> > > +     if (err) {
> > >               eth_random_addr(phy->macaddr);
> > >               dev_info(dev->dev,
> > >                        "Invalid MAC address, using random address %pM\n",
> > > --
> > > 2.54.0
> > >
> >
> > Recently I have started to see randomized MAC-addresses on my x86 laptop
> > with a MT7922 and the above message printed in the kernel log. I have
> > CONFIG_OF turned on, but since this is an ACPI system the device is not
> > described by any device tree and the earlier of_get_mac_address() likely
> > fails with -ENODEV. Looking at the !CONFIG_OF stub for
> > of_get_mac_address it always returns -ENODEV, meaning this will always
> > randomize the mac in that case too.

> IIRC, the normal device_get_mac_address supports nvmem now. Does that
> fix your use case?

I tried this:

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index b99d7452800f..243a8f2c7bda 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -174,10 +174,9 @@ int
 mt76_eeprom_override(struct mt76_phy *phy)
 {
 	struct mt76_dev *dev = phy->dev;
-	struct device_node *np = dev->dev->of_node;
 	int err;
 
-	err = of_get_mac_address(np, phy->macaddr);
+	err = device_get_mac_address(dev->dev, phy->macaddr);
 	if (err == -EPROBE_DEFER)
 		return err;
 

but I still get a random MAC.

> >
> > Reverting this patch fixes the issue and the correct MAC address is
> > used. I'm not sure if there is any case where of_get_mac_addres() could
> > fail in a way that results in a valid MAC address but it seems unlikely
> > to me.
> >
> > Regards,
> > Klara Modin

