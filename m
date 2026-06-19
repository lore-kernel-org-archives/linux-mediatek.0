Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2A5CD98F0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2026 01:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrtOo2Dm8vwbUCXe5Oa40jPMn4I218rLCkoAsNCnLeg=; b=kJOBJ+J4ZrDZ38MBPRmODQCpSR
	M0o9Udpma6toYe2FpGuQCLBj5qSfiulof+hADyvKodJeacjMCg6eiuxdkSilWg4GSuiXVqKybQc6j
	pxE6hykULXGKmWfm7Hy1GrRgkHn10YNfB8wDimF048ZNmFVotI2dVQ+wMgN295gUxCOgUMYadeX7x
	I4ijKPKbI5hqTVV/AdMccmkfyq8MAawo/bml5vOgGA2KOE+KbzZOhuBwXkI0+Svz/9ccwrZggeVoQ
	LPFadKRRA2fF0JLh3gB35ZD4P1Xo6GDroLgDQkSlVfOa4+Dhud3ZUex5jotooMkQWGsZGqKl7LCLB
	FmOvmV0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waONB-00000001vV0-1p0Z;
	Fri, 19 Jun 2026 01:50:21 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waON8-00000001vUK-2Ji2
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jun 2026 01:50:19 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-37c8e7c8137so829440a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 18:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781833818; x=1782438618; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrtOo2Dm8vwbUCXe5Oa40jPMn4I218rLCkoAsNCnLeg=;
        b=BR60PnrSj4XHNkIVKdCGXTliC3j5XbW6PCQuAX0ZrCIKezpWJpUmvnTLrntdWa8qcc
         ESs2d4AoiRY9atc5TKJu3Z+GoTfGAr85h9VBX8EdmIWbtXvPhY9CUUiW9iVV+lLX/aY1
         QV/l2rtT+H4r+1HBrAkHrwmRo8Hs9IAvw0J4IxsLnERWgPEq3V9OASJnAXWrlv+oEhMw
         lkSeQp6i1sUrLqOJqG8dRWv/p7QiAE4fBcJBX9OBK7LBZVeUIv4XEjSqD60uhsn6o94R
         WmxbmYodzbgPV99XlWfmPYK6YWzvr8S6A9m4qeWOqpEMuF3nGvX0og9PRye4PwngiQ/F
         SThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781833818; x=1782438618;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GrtOo2Dm8vwbUCXe5Oa40jPMn4I218rLCkoAsNCnLeg=;
        b=duh96q40U+hqjPQ64OkoEfVW4K6kZy5v2xwFG7hzMsyMtoWCWOTGQTz+T9R4TUoNhb
         CQpxjIxeS7jVn5GOSJ9oJNTefIFp9bGjBM5gD9KeZkV9sIdfZJJtLdSLNXrNdmCKX9K1
         t1Bavijg7euKjnznV+EwUFZJZO5w/P/vQ8Oc7eUhckb/badvrEeDQruI9N7kb/pYrHIk
         Qt1B6NtuoZ2T5eLw+P6HmrpwVsrq3vB1yqXmDfvyKILJH6tu7OIzs+VFZU3ASJnpQhzY
         NCIrFE0NqCiDsgIP3ncY/AcCCYdQddHZu4C/kj+vItGEZXljGsf5f3+pcQGSbGPIr3lR
         PKdg==
X-Forwarded-Encrypted: i=1; AFNElJ81JgEsKYMrZzJByGUhT0ZKslPL1knOipOZJfPaXzfxLc71N/Eqn+NUGHKwuuM6AsNCjw5nLnoBArJlZMsmpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrDFi0LWbDDmeeiuYzhtYoBQ5ANR44EAxawFQGqovaodRPj9k4
	D33t0CgOL4ibGEExSENm8nQ6ZEAk0GWLHWhcgyLqoHKc3SWGAbbyCLDdrcFBzg==
X-Gm-Gg: AfdE7cns0SFkiO4YMOzLDEYHj/LxlgzFk0zFsk+um7mktVpjxchgJad9BEHeHxqabuu
	Xj/d2alnrCnK4Ce/ITTzxIcDCdVlsH3LLmTjHhfV19E1igMucP5eAZy8wH0SS2LXYkgDoJOAaKp
	ThGOKm36rM+kFtl8003g3veD71EvyhLbqa8iSWdok+y2tEkMd3xaVGVjBi7UOq9IoDqTq00CxGO
	Yg3AMen2kx381ZOHpibnQXo8CHYJ7+2pb+TkbdlktlRgnKQUulnWMkJ1wWePxiE3qSdlFlvVUDU
	ymzttvkTg6VcvfKaijWiRLpq62e2uQKIkgCzlh36Ugc9J6U+ACnhDx0n3upPD10nuWRmjPRtHsu
	Vj4nLISaE8pLuhMAEHg7Bjikry6T/+yrP1mf/igmbL9xq1fFLK+EEwSQ2bKXdXpnnD4jSG9f/eZ
	I7uPnFPL5xZUneek3HpqyqsSfwxeth1Ox5dpC0DsT9j3omyOjTdK5uD4rbRBdi71qr1tHcLYK5r
	gYYLjGMLhTg+286hXL47wQ5KzIw4Q==
X-Received: by 2002:a17:902:cec1:b0:2c6:b3dc:b82a with SMTP id d9443c01a7336-2c725d33bccmr5323065ad.24.1781833817630;
        Thu, 18 Jun 2026 18:50:17 -0700 (PDT)
Received: from localhost ([2601:644:8000:5b5d:3804:5798:1282:ed9e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7208e2e66sm4690245ad.34.2026.06.18.18.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 18:50:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jun 2026 18:50:15 -0700
Message-Id: <DJCNDEE8JMPL.1DL49X1EUDFCE@gmail.com>
To: "Klara Modin" <klarasmodin@gmail.com>, "Rosen Penev" <rosenp@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, "Felix Fietkau" <nbd@nbd.name>,
 "Lorenzo Bianconi" <lorenzo@kernel.org>, "Ryder Lee"
 <ryder.lee@mediatek.com>, "Shayne Chen" <shayne.chen@mediatek.com>, "Sean
 Wang" <sean.wang@mediatek.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "open list:ARM/Mediatek SoC
 support" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH wireless-next] wifi: mt76: fix of_get_mac_address error
 handling
From: "Rosen Penev" <rosenp@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260427051746.954704-1-rosenp@gmail.com>
 <ajRmlyx_AEGybykL@soda.int.kasm.eu>
 <CAKxU2N-gfH8Tq29-j2MArogLZuO7JEqtN5LNPVygJzrAERa3cg@mail.gmail.com>
 <ajSDtsJCmYnMNJSD@parmesan.int.kasm.eu>
In-Reply-To: <ajSDtsJCmYnMNJSD@parmesan.int.kasm.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_185018_619711_607E320F 
X-CRM114-Status: GOOD (  29.18  )
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

On Thu Jun 18, 2026 at 4:51 PM PDT, Klara Modin wrote:
> On 2026-06-18 16:01:45 -0700, Rosen Penev wrote:
>> On Thu, Jun 18, 2026 at 2:47=E2=80=AFPM Klara Modin <klarasmodin@gmail.c=
om> wrote:
>> >
>> > Hi,
>> >
>> > On 2026-04-26 22:17:46 -0700, Rosen Penev wrote:
>> > > Check return value instead of is_valid_ether_addr. The latter is han=
dled
>> > > by the former.
>> > >
>> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> > > ---
>> > >  drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
>> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > >
>> > > diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/n=
et/wireless/mediatek/mt76/eeprom.c
>> > > index 93d91264687f..0f6ccf6ed53d 100644
>> > > --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
>> > > +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
>> > > @@ -93,7 +93,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
>> > >       if (err =3D=3D -EPROBE_DEFER)
>> > >               return err;
>> > >
>> > > -     if (!is_valid_ether_addr(phy->macaddr)) {
>> > > +     if (err) {
>> > >               eth_random_addr(phy->macaddr);
>> > >               dev_info(dev->dev,
>> > >                        "Invalid MAC address, using random address %p=
M\n",
>> > > --
>> > > 2.54.0
>> > >
>> >
>> > Recently I have started to see randomized MAC-addresses on my x86 lapt=
op
>> > with a MT7922 and the above message printed in the kernel log. I have
>> > CONFIG_OF turned on, but since this is an ACPI system the device is no=
t
>> > described by any device tree and the earlier of_get_mac_address() like=
ly
>> > fails with -ENODEV. Looking at the !CONFIG_OF stub for
>> > of_get_mac_address it always returns -ENODEV, meaning this will always
>> > randomize the mac in that case too.
>
>> IIRC, the normal device_get_mac_address supports nvmem now. Does that
>> fix your use case?
>
> I tried this:
>
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wi=
reless/mediatek/mt76/eeprom.c
> index b99d7452800f..243a8f2c7bda 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -174,10 +174,9 @@ int
>  mt76_eeprom_override(struct mt76_phy *phy)
>  {
>  	struct mt76_dev *dev =3D phy->dev;
> -	struct device_node *np =3D dev->dev->of_node;
>  	int err;
>
> -	err =3D of_get_mac_address(np, phy->macaddr);
> +	err =3D device_get_mac_address(dev->dev, phy->macaddr);
>  	if (err =3D=3D -EPROBE_DEFER)
>  		return err;
>
>
> but I still get a random MAC.
Then the original patch should be reverted. Unfortunate that it doesn't
workq
>
>> >
>> > Reverting this patch fixes the issue and the correct MAC address is
>> > used. I'm not sure if there is any case where of_get_mac_addres() coul=
d
>> > fail in a way that results in a valid MAC address but it seems unlikel=
y
>> > to me.
>> >
>> > Regards,
>> > Klara Modin


