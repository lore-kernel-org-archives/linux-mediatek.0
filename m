Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4B5CD98ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 23:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrgAfG22KAorY853iHAUHzDmNBQcwguhA1ZSTcHUX7k=; b=AuY+PRCnoVN+EbFUCG6QBBbhHo
	xi93MgxUqmXO0tGURR9Uy7J/VKVeXk4Mv7Q7YAmcjqitRc2JCtBHsarO7M1t25EMFE7El4lha7ZS2
	NCzb4RxVoPbeNzyhr07RTt/Ytu62rHddh8SIC5lDdWVOBdIUms++f5V7gOTfzQu/BVyqev4n0CaSF
	qJ8ej2X5V5cz/jVDHo91UKwRA+TVwlWK/zineXEZ81mSNdLisqPqOWZEGVfhb413UEJv4dm0J34a1
	9egCtjStD/l6sk/3icsE3w1OmDgVPVNn9nwdj7rBzP192o1AOsEV4Ux2XsQlSFYQXoCy9e4QZ/73h
	7UvQ0NcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waLkJ-00000001qz5-1HZs;
	Thu, 18 Jun 2026 23:02:03 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waLkF-00000001qyI-27yA
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 23:02:01 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so2567136a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 16:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781823717; cv=none;
        d=google.com; s=arc-20240605;
        b=TV1habBz+2Z57B3LSE6EgJeFglUQxVpg1j5+vekdRyBlZnpPa78A8yhDU3RGSaCQ3z
         nRkm4QlYj9CcXjgAFQYEVmieGmWHzafy+L48DYn4M//7+BxJ/JogyY+PifK36VUtEh50
         r7WYPUllIx7r/9VdBq86i9NMEfpe08n5KHU5BYgdDnpzHGEssMI2BM5TViRt6pjYXguP
         fI6guDhYi9YNMFbfeawoSFj+Hm3Swk5MAjKK4up0RIcNHb4pJIl/NNghRKG7c4hNfG7M
         JZPSiGRHsm+CcBzwCJ6WosFogn19iqd/cTSS+8soEg/CBADA+FDSbUWC5lXdZ5MphWmB
         uWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LrgAfG22KAorY853iHAUHzDmNBQcwguhA1ZSTcHUX7k=;
        fh=OpNLkjqjq3BtbZigXiXcHfcBeqxu4X2vS3smjv3SrVI=;
        b=GyEzYfQvKYWO9m5GOXMVMOZfGR43x0EvVBwbZ3LuaqWl+ivHfidw0bGv6NEgN/T+g0
         TMqIPT4O84gNX0qA1rgSB9qBtS/2Rf2VmRlJtX/vyyDiOkiQcV8Lwg8UeA6QOcuAQXqL
         evgLQi/dG+I7fnDb8bnAwzjJwNLlxsmNMsigE8Q4+gD36AjsoSdOguzoF2R5s2Yw1yIE
         ZJkv4KpODh2vJ4ummyGipFXcEbsV/3RBj3XDJ5cTkAT3zkXVUbLZ0tKL4Si/d9PaQV/f
         I5wdOkBC9jPp613eZvQ/ad30wNQGzQomHt0cLjjj2SaviIuGnDfGY4RJPKtD5kdgdagL
         MLeQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781823717; x=1782428517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrgAfG22KAorY853iHAUHzDmNBQcwguhA1ZSTcHUX7k=;
        b=WF6CAr9XxUuMOdzwGVikwh2f2IbzNn438leuIKQaDxHMSk4uusEIEf4F3shMSEuiI4
         LMLWDfMsbkCOjMgke2PyqLvsQf2OycG9P6hHVUmDuPRc0zk9+RZaxQyJhqwLSSIVFoFM
         1RdrwZff5wG+HJ60QE+dV7jQxqbUJU9MjuJp9bAuMRpIV4vVEwAU8THmUA3y6DB7Ml2h
         4rgkO4FMpno2I2gLC0WEQLiF6pD5xw34Lk32vDvqle9UgEidTDeCbvQ3uPdNAOY4lacX
         5ImRc5E3ly3QMKIavlmiQOrvKVsasLtYb3KeqpDBt1xOiNeEvXIqqKY833EUsmLETvqD
         BiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781823717; x=1782428517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LrgAfG22KAorY853iHAUHzDmNBQcwguhA1ZSTcHUX7k=;
        b=GkfQ4WUMPbfDXWzqMjdxmuQJucXhLvoUOKmDHUiZe0qP8BQpd2B9CugoRTuZDEtz7F
         m4iBm+EEmdm9nuwDyH88l/WZ4zsHsESvCoVDF+XAyX3WGyKCsgLAFWgctR1mdERMAtcl
         7ajtyu3pUFkqUIvB1kvsdft0fdtpHuUPPwaYtFzdHeUDFfXqV1iSVKDcNvO7hJ6cBvtz
         GaLFmfUyESUmQWVnqyhATLaMmxABYyX42oClfyoz2rtgo9nqeXmqw2hiXsTPvhLsU/5r
         3KQNJpFcKQO3DmOisaRXdvG7AHdXBGBTVhyvk+zj8GmDdUUB138ulDrHtMw9+COxnSSA
         dChQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dcqVk1IHaRaGC2RDM5V87pxfIN3L64UonMMcVFKDohUu/6NC7PxNlAKQQHhoFIScCk3CDmER6mbd1djWqfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8KY3MkcYouz5f4daggNPQyhCFUKHobQWJJ6wemSB5P31hxFqf
	4d0FLBNAhavtCqEKwPRz5p1LmmXwjEefnFH/nAVFzVgW80q4hcWuIjXh3DOZszHPzjXcOryhaIl
	ZAu3w0Z/+G6uCMxGRlw3l9i2EpK4x7Ng=
X-Gm-Gg: AfdE7cnRDn1nR9sPXnBVD1/JypwNH+3sArqzR+N5yKdvRIWhip2c69IIGtom3z7vu3k
	PXrQow06+4bdnxKsCJBjGjl3L7x0fkxl4vzovaXY4KyRf2oZ7ZJdXsGMooKJtd2AwoSHJAizJ8Z
	m8re0o/G69AD/EFVD7bArwhJVzMA8pAT2YRU8ibRtzjxQ1W0JmMk4AJksQK1KA3IHVkREPn0C5K
	VfbFn0LC15FlKbzLSQ/Hskm4oofQGFzyMXLh7nkBZ6Rqbh0zjrORpsPCi2GWHdNTAZrjRlKHRYH
	kpLJNQ3VZHEZvA5O9ccjSR6FeIymjh2mdpG9xLyyDgV6saGDNld/rPV8SCNGG/EIrs9bZiEhXeu
	xe9FclY3kEAuRogDu9n/gF2CAr8istmwH3PQuHwSMS2tmBUAd154YJpuSbQ==
X-Received: by 2002:a50:ed15:0:b0:695:dcb2:7438 with SMTP id
 4fb4d7f45d1cf-696e52647bdmr431695a12.28.1781823716380; Thu, 18 Jun 2026
 16:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260427051746.954704-1-rosenp@gmail.com> <ajRmlyx_AEGybykL@soda.int.kasm.eu>
In-Reply-To: <ajRmlyx_AEGybykL@soda.int.kasm.eu>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 18 Jun 2026 16:01:45 -0700
X-Gm-Features: AVVi8Cd8pKJV8TDSQqNM8KIOqfYt7FlEl94-2dFF7xSm3zDLY3ekIKFMu3kD-wY
Message-ID: <CAKxU2N-gfH8Tq29-j2MArogLZuO7JEqtN5LNPVygJzrAERa3cg@mail.gmail.com>
Subject: Re: [PATCH wireless-next] wifi: mt76: fix of_get_mac_address error handling
To: Klara Modin <klarasmodin@gmail.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_160159_576261_1C26EF41 
X-CRM114-Status: GOOD (  27.22  )
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

On Thu, Jun 18, 2026 at 2:47=E2=80=AFPM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> Hi,
>
> On 2026-04-26 22:17:46 -0700, Rosen Penev wrote:
> > Check return value instead of is_valid_ether_addr. The latter is handle=
d
> > by the former.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/=
wireless/mediatek/mt76/eeprom.c
> > index 93d91264687f..0f6ccf6ed53d 100644
> > --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> > +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> > @@ -93,7 +93,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
> >       if (err =3D=3D -EPROBE_DEFER)
> >               return err;
> >
> > -     if (!is_valid_ether_addr(phy->macaddr)) {
> > +     if (err) {
> >               eth_random_addr(phy->macaddr);
> >               dev_info(dev->dev,
> >                        "Invalid MAC address, using random address %pM\n=
",
> > --
> > 2.54.0
> >
>
> Recently I have started to see randomized MAC-addresses on my x86 laptop
> with a MT7922 and the above message printed in the kernel log. I have
> CONFIG_OF turned on, but since this is an ACPI system the device is not
> described by any device tree and the earlier of_get_mac_address() likely
> fails with -ENODEV. Looking at the !CONFIG_OF stub for
> of_get_mac_address it always returns -ENODEV, meaning this will always
> randomize the mac in that case too.
IIRC, the normal device_get_mac_address supports nvmem now. Does that
fix your use case?
>
> Reverting this patch fixes the issue and the correct MAC address is
> used. I'm not sure if there is any case where of_get_mac_addres() could
> fail in a way that results in a valid MAC address but it seems unlikely
> to me.
>
> Regards,
> Klara Modin

