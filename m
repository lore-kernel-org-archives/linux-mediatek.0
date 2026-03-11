Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6B81125862
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cNiHFT+wY3afaQYyIxR6Q/+q0rxmvPgYN7lz3CIl1c=; b=tsmyrxsjYW84/2y1E1V3m7Wz5P
	dCmZ7V9XDSzyHbnhjB0ZM6myAn4evOOn4dQImwvdUCgU42fp7Ot7Y4sM2CdknmZtEAOuRV7rrhKNi
	5kyT5XKyupZRXaGOmQ8p5epfVtzgN+UdNilWECQ2UPfPpFHv7dfyBrJnpOwIPGGHl7gBLkVXx4sIP
	Ez0AU0AtgJnf00u+CMnIWwqbE7+POBdsP+czQU5er97e0LostoqiR7rxvQ2WfvKR6zRy3IVWx7tp1
	sdZIH7KBUGf97IZGBVPibty6FWrLkLTAhfUCC6Tc4LbFfXM7qoza3bTMAzWk6Ah2z0q71ZN0KnJJk
	HCvYl4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0O5x-0000000C8yd-3PDF;
	Wed, 11 Mar 2026 18:15:45 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0O5u-0000000C8xp-1HG5
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 18:15:43 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-64ca4dfdd88so255989d50.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 11:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773252941; cv=none;
        d=google.com; s=arc-20240605;
        b=RKuKCPX7PaUGoDP0H5Q/slu9d9Rp47NYEYzcmUzbjMRDQY0ueq5T2i7a6uG95Qe/h6
         QN4y3RfXobuQ6keGWThPU1/4ntKYOj9lbTudDCWspOINVwKyrchGCpwdiF0oT3wCXhJd
         t/IZJgiQ3jhPC+wZcyhjwQJo6T+t2coDEpUdUxzjeRicdYHfyLjySFIPHdBACV0jp/F7
         3FwVpe/IStjyUr5vwiFUlgf5oz/Hra/1jVCnAvDRxjHSeu4OaYpLq/49BCi/BM2x6eCB
         Y70qwomuJ3AvAFgLV1kiEfLJJlOlUJrZZhtEGWVS06EEwYGYzQ+yrVGMnc7BjiBqsuus
         GElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+cNiHFT+wY3afaQYyIxR6Q/+q0rxmvPgYN7lz3CIl1c=;
        fh=vyoXIXDvYhKIJ4WQ5PQwZo88m36vDyPF5hRLn7Nl+y0=;
        b=YRRixjOOERc7fXZbOyV3uboPMsRrWNcA/zXpSfORmX9VRk1CsfPUAbEbZ9brYspMuW
         92rPEMB5Xq4lpsJcCfo+zmIAAOksFjOCwvmGIR0eaNH1hQ2q+96IYtWG1sSiea6TvLRc
         N03ABY/4nMy2k/6wxhCO1pxw1YeFADxFxsjmIyPtuZX1Kb0Dgp6JgMEg4QrJOwaMWBc6
         5ECY+xrEbuM9QqXLfQ6c99CsQHZEq3VTy0eqUfaKjVmGBQ3iKyVd5HKJ+DBkBFkMWxP1
         JT0wuiUseKgeMEMOo2GAF0gdnGgN19Kt8pd0qM1psErLJOuaAGdvzqiQvEwT8DlCnBqM
         v+Ug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773252941; x=1773857741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cNiHFT+wY3afaQYyIxR6Q/+q0rxmvPgYN7lz3CIl1c=;
        b=OR1aQCWAoBgHG9XYMdogjg8TL8TQBD/VHK4Eu3562h1ASpX4nrb8hGVH1+t8jLDJkW
         deIEqjwJmzHXCy7MC5jAS22PxTQusEkEXx8L2Pzkwnlut6XroqvO1jUDE/bUBBBPdp3c
         J3tJbUDD2iMxmUMW0IN4ZHXoWgXtvsbwDwK1bqf3EhrzVPs5c8OpoTJ+rOUxhdMd8kXe
         zxQOaI9rwEBO9I33TU4TDHGDzPdIjl/+M9pohZsj6Tnigh/LGaA6NJZIr1H04XyVAP8o
         lfVD2ca/3tywHVsmB1Q2AP9WRx0lj16Y2IsDEYHhHIgTF2wkAXQdtJH0+yY30oQOB4tc
         YQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773252941; x=1773857741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cNiHFT+wY3afaQYyIxR6Q/+q0rxmvPgYN7lz3CIl1c=;
        b=UheXsTutcym0zAGYPQTnq7eCMvT9FDSgXbvmag1NmKjlRspZNWys0VU6fIjzKeXTWV
         IbgzljdpexevrmbfrvGaTYo8orx9aK8xpyPnZwWBs0y2eWaEEGAUA+wXAh5MRt8+6StM
         MdD5E1IH1hoBhHnSJ3COsYTyvAfLmekhDoXfORQkgyNp22hnqP+Lc4tZUy02+Z3Cvy9G
         mJ389QOpJIgVmbsKmKPkP77478wvnkRhI8LwkwgkAXHd1wgwHPjGHHaFQK8gQEpapBas
         whpsRnjXlmOZLo7c/sS3ao65GG4Hfzed5JTVnoEwCCZqxeDSqsmoVbilhM7ILQEu16X/
         nw0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbI7xn3deZZiimahMVw+qzTfvboBbbU9KmWOyYi7x6uMTZLqu5LT4O0UDIMHK7gTQD+814m7lE1NHmnAnKig==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPVbK9q5ce5qU9c32Fo/N8NTiQqECWEOg4/ug3+4Q/DdwYwR4Z
	j+TTMh4hoJ7JOkwmm4MYYk1lHPtPwGKHAGbEX/9TolKgCyEebTtnsVZDuf2mSl66E+G4X8mbtWv
	3wilD9NqXvCcBzg2MJbsdnlxVT/Z8N7k=
X-Gm-Gg: ATEYQzwrg5Jh0LFkOSCF78UaNlQKQjskPXMaTtxjh4/NcDbK5XDH/n1hjJihQ5dUEQP
	fUT1IrjHl733z9uZyeAZD4eD0RxRUVRmxdO7WffL+lF3txRkHnqV+egLEPz3a/1NhqlmAJHaZRJ
	jCmxkPfoUuH3sAnXTxfh5kiC4ga1EPPUE51f/9DHJhoR5a0pMLch/AMTlg2OyW3M5qolWhQe/vv
	c55RznoHBQN4rIrmgFDosTk4s8yr5zeFufHf4p2aDdFjKnPH2kg6aBddFfhT2HWIcFKzFP3qoSB
	PC5h778jf3eMm/IgiX8TYsNL/hv9Zy/8liwnLekZMx0OqIGyC1pSYbOlYvzJjB4SfIkLGB7QhxQ
	QJZMM150eM9O9CiajHRb6S4jmlfCgElDKcvaxxVZHdcmriaroSfanuyht1FcUMS9B++C8l4FsT9
	VDZJiVG2rcMtqWpcx+/mnlxTUIM48w3oft7Q==
X-Received: by 2002:a05:690c:6d83:b0:799:1f23:6e46 with SMTP id
 00721157ae682-7991f23716bmr18872717b3.33.1773252940653; Wed, 11 Mar 2026
 11:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260311002825.15502-1-sean.wang@kernel.org> <20260311002825.15502-2-sean.wang@kernel.org>
 <CAFktD2cbFJrLS4ggc+yf582BYmw=jJsntfbDR65ssMpVGM2BKA@mail.gmail.com> <CAFrh3J-PsVQ1u_hGFxTVKK0uOs6KxT=euK+jbGvWCueqvynAgw@mail.gmail.com>
In-Reply-To: <CAFrh3J-PsVQ1u_hGFxTVKK0uOs6KxT=euK+jbGvWCueqvynAgw@mail.gmail.com>
From: Satadru Pramanik <satadru@gmail.com>
Date: Wed, 11 Mar 2026 14:15:29 -0400
X-Gm-Features: AaiRm53p8hfe8wBrpyGcXoM78Zv_gF9F9NSxVY9UXwSZNnh9JUTRTDRcyeNi0YQ
Message-ID: <CAFrh3J_4N5j9eZAgbP0gzj5gTGVABat9-4xWZBicKMfgL85LRA@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: mt76: mt792x: fix mt7925u USB WFSYS reset handling
To: Nick <morrownr@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, nbd@nbd.name, lorenzo.bianconi@redhat.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Sean Wang <sean.wang@mediatek.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_111542_356972_6241F378 
X-CRM114-Status: GOOD (  21.35  )
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

After rebuilding the kernel with 7.0-rc3 and the two patches at
https://patchwork.kernel.org/project/linux-wireless/list/?series=3D1064695,
I can confirm that after a warm reboot booted from that kernel, the
mt7925u-based adapter is once again visible.

Thanks!

Regards,

Satadru Pramanik



On Wed, Mar 11, 2026 at 12:42=E2=80=AFPM Satadru Pramanik <satadru@gmail.co=
m> wrote:
>
> Hello all, I'm rebuilding this kernel one more time in case I mispatched,=
 and will let you know shortly if a new kernel build works.
>
> Regards,
>
> Satadru
>
> On Wed, Mar 11, 2026 at 12:15=E2=80=AFPM Nick <morrownr@gmail.com> wrote:
>>
>> > From: Sean Wang <sean.wang@mediatek.com>
>> >
>> > mt7925u uses different reset/status registers from mt7921u. Reusing th=
e
>> > mt7921u register set causes the WFSYS reset to fail.
>> >
>> > Add a chip-specific descriptor in mt792xu_wfsys_reset() to select the
>> > correct registers and fix mt7925u failing to initialize after a warm
>> > reboot.
>> >
>> > Fixes: d28e1a48952e ("wifi: mt76: mt792x: introduce mt792x-usb module"=
)
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> > ---
>> >  drivers/net/wireless/mediatek/mt76/mt792x_regs.h |  4 ++++
>> >  drivers/net/wireless/mediatek/mt76/mt792x_usb.c  | 13 ++++++++++++-
>> >  2 files changed, 16 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h b/driver=
s/net/wireless/mediatek/mt76/mt792x_regs.h
>> > index 7ddde9286861..d2a8b2b0df32 100644
>> > --- a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
>> > +++ b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
>> > @@ -392,6 +392,10 @@
>> >  #define MT_CBTOP_RGU_WF_SUBSYS_RST     MT_CBTOP_RGU(0x600)
>> >  #define MT_CBTOP_RGU_WF_SUBSYS_RST_WF_WHOLE_PATH BIT(0)
>> >
>> > +#define MT7925_CBTOP_RGU_WF_SUBSYS_RST 0x70028600
>> > +#define MT7925_WFSYS_INIT_DONE_ADDR    0x184c1604
>> > +#define MT7925_WFSYS_INIT_DONE         0x00001d1e
>> > +
>> >  #define MT_HW_BOUND                    0x70010020
>> >  #define MT_HW_CHIPID                   0x70010200
>> >  #define MT_HW_REV                      0x70010204
>> > diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers=
/net/wireless/mediatek/mt76/mt792x_usb.c
>> > index a92e872226cf..47827d1c5ccb 100644
>> > --- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
>> > +++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
>> > @@ -224,6 +224,15 @@ static const struct mt792xu_wfsys_desc mt7921_wfs=
ys_desc =3D {
>> >         .need_status_sel =3D true,
>> >  };
>> >
>> > +static const struct mt792xu_wfsys_desc mt7925_wfsys_desc =3D {
>> > +       .rst_reg =3D MT7925_CBTOP_RGU_WF_SUBSYS_RST,
>> > +       .done_reg =3D MT7925_WFSYS_INIT_DONE_ADDR,
>> > +       .done_mask =3D U32_MAX,
>> > +       .done_val =3D MT7925_WFSYS_INIT_DONE,
>> > +       .delay_ms =3D 20,
>> > +       .need_status_sel =3D false,
>> > +};
>> > +
>> >  int mt792xu_dma_init(struct mt792x_dev *dev, bool resume)
>> >  {
>> >         int err;
>> > @@ -254,7 +263,9 @@ EXPORT_SYMBOL_GPL(mt792xu_dma_init);
>> >
>> >  int mt792xu_wfsys_reset(struct mt792x_dev *dev)
>> >  {
>> > -       const struct mt792xu_wfsys_desc *desc =3D &mt7921_wfsys_desc;
>> > +       const struct mt792xu_wfsys_desc *desc =3D is_mt7925(&dev->mt76=
) ?
>> > +                                               &mt7925_wfsys_desc :
>> > +                                               &mt7921_wfsys_desc;
>> >         u32 val;
>> >         int i;
>> >
>> > --
>> > 2.43.0
>> >
>>
>> Sean, testing results from: Satadru Pramanik <satadru@gmail.com>
>>
>> "The updated patches from
>> https://patchwork.kernel.org/project/linux-wireless/list/?series=3D10646=
95
>> do NOT work. I get the -110 error with them on a warm reboot.
>> Reverting to the kernel with the older patch restores my adapter
>> connection on a warm reboot."
>>
>> You are welcome to stop by the Github issue where this issue is being di=
scussed:
>>
>> https://github.com/morrownr/USB-WiFi/issues/688#
>>
>> Nick

