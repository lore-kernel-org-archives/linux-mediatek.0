Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F212EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 21:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYM5SdXApbs5UlDa5x0c5XBikN3h6vAe0XNHAnuaE7A=; b=tN8nuLj3725UZ0pPk1zZ9nQtjl
	7Ddy9YAtX4KroT2e89kJj6mFCh1z3FzfIg/hb40C5fG+PpV4ck6KmZ683bn10EBHis9X9Ej+J28VE
	oH8VpLzWnmoN0ht1tvp+EZWV1ng0GTxtmX9HmoBkaD+MLIOSlWPZd5CYh08aAz6le8K2xiF3VGsd+
	uemXVPhlheSiOeyFjmngOk0u//JqFIe0VAY9dCSYBXi/AZTAfzclbftr8Euqb8HfSJGURBpysv999
	+VBkbebfkSsHY3iWbow70ZP3e1eru8t5KRekhd+E4QCzuLvMO0Ma5yBGGxu0g9VJFBt8cOX4egxI2
	IzJZpP0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEysA-002BVj-2t;
	Thu, 29 Jun 2023 21:08:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEys7-002BV7-32
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jun 2023 21:08:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5BE9A61602
	for <linux-mediatek@lists.infradead.org>; Thu, 29 Jun 2023 21:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CA9C433CB
	for <linux-mediatek@lists.infradead.org>; Thu, 29 Jun 2023 21:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688072889;
	bh=QVWWSgeIDy9G1T0y1s1CguF1zCjfXWdS83lM64yH870=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R0CzxeqamLxMSeOUudK9QLDYHXutU4k1i7YAU/+nbdoHGbbXXiPe7urw9sDNEJLAL
	 aVDE8AZM6wPuRaqrkBRJQ+Vsp7VabCX8CRCZyCzpLv0sGygnHpMeEzcuGK9nBIb98U
	 Wj3wtfiP8Or1RUoId9/E1N7KZdRJTK/S+EsW7yEiRpxUebQt52CKB3gnG9nY9/9Fo5
	 OE9oWn+jsh5oWgUc3BBhvjBbt72tozVDtgMUSHcEabrlow+kZqmeyfQ2/OJFpl9UTk
	 OeytmAd7bSVCpIXGYlID5yu9Gs8H4hh+ifQbjlMMRuDi4DLp9IO3GdvQOI7Qcl/6xJ
	 TTi8z1bczuBiw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b69e11fa0aso3404931fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Jun 2023 14:08:09 -0700 (PDT)
X-Gm-Message-State: ABy/qLaqsl5bq1PyWUjn86jQWj5PR2DlqRH/CWeQRsa1KeT4YIkqPeB8
	IH+fWcjfGHECeJ9vhxZLGzVipXfLKilOP1xMEaw=
X-Google-Smtp-Source: APBJJlFiLvq/00pxW1fSfw8POZDWzgKpN6sQ94B0C73Uomase4zWNPqdpHugOi5T3I9U3e3RhH+sUGWixwBHEGJceUE=
X-Received: by 2002:a05:651c:c97:b0:2b6:b9ee:a7b1 with SMTP id
 bz23-20020a05651c0c9700b002b6b9eea7b1mr708635ljb.5.1688072887642; Thu, 29 Jun
 2023 14:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <1c40a12b51ccd6ee2ee002276f5b1ba92c377100.1687990098.git.objelf@gmail.com>
 <20b61d77-7397-e3ba-3215-232f49eb8c07@molgen.mpg.de>
In-Reply-To: <20b61d77-7397-e3ba-3215-232f49eb8c07@molgen.mpg.de>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 29 Jun 2023 14:07:55 -0700
X-Gmail-Original-Message-ID: <CAGp9LzqbqAGe0AXN2zH-PViOtu0TcygE265S61QfLxczoHgm3Q@mail.gmail.com>
Message-ID: <CAGp9LzqbqAGe0AXN2zH-PViOtu0TcygE265S61QfLxczoHgm3Q@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: btmtk: add printing firmware information
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Sean Wang <sean.wang@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, marcel@holtmann.org, 
	johan.hedberg@gmail.com, luiz.dentz@gmail.com, Soul.Huang@mediatek.com, 
	Leon.Yen@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com, 
	robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, 
	jenhao.yang@mediatek.com, Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, 
	steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com, 
	abhishekpandit@google.com, michaelfsun@google.com, mmandlik@google.com, 
	abhishekpandit@chromium.org, mcchou@chromium.org, shawnku@google.com, 
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_140812_084518_7DACDCE0 
X-CRM114-Status: GOOD (  21.79  )
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

HI Paul,

Thanks! I will update the patch with your suggestions.

thanks!
Sean

On Wed, Jun 28, 2023 at 3:44=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> Dear Sean, dear Chris,
>
>
> Thank you for your patch.
>
> Am 29.06.23 um 00:20 schrieb sean.wang@mediatek.com:
> > From: Chris Lu <chris.lu@mediatek.com>
> >
> > Add printing firmware information part when driver loading firmware tha=
t
> > user can get mediatek bluetooth information.
>
> Maybe use the commit message summary/title below:
>
> Bluetooth: btmtk: Log hw/sw version and fw build time
>
> Maybe also paste one log message example to the commit message.
>
> > Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> > ---
> > v3: resend again with the latest tree
> > ---
> >   drivers/bluetooth/btmtk.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> > index 9482401d97fa..8490d59502a5 100644
> > --- a/drivers/bluetooth/btmtk.c
> > +++ b/drivers/bluetooth/btmtk.c
> > @@ -57,6 +57,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, c=
onst char *fwname,
> >                             wmt_cmd_sync_func_t wmt_cmd_sync)
> >   {
> >       struct btmtk_hci_wmt_params wmt_params;
> > +     struct btmtk_patch_header *hdr;
> >       struct btmtk_global_desc *globaldesc =3D NULL;
> >       struct btmtk_section_map *sectionmap;
> >       const struct firmware *fw;
> > @@ -75,9 +76,13 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, =
const char *fwname,
> >
> >       fw_ptr =3D fw->data;
> >       fw_bin_ptr =3D fw_ptr;
> > +     hdr =3D (struct btmtk_patch_header *)fw_ptr;
> >       globaldesc =3D (struct btmtk_global_desc *)(fw_ptr + MTK_FW_ROM_P=
ATCH_HEADER_SIZE);
> >       section_num =3D le32_to_cpu(globaldesc->section_num);
> >
> > +     bt_dev_info(hdev, "HW/SW Version: 0x%04x%04x, Build Time: %s",
>
> Why not print 0x%04x/0x%04x, that means with a slash?
>
> > +                 le16_to_cpu(hdr->hwver), le16_to_cpu(hdr->swver), hdr=
->datetime);
> > +
> >       for (i =3D 0; i < section_num; i++) {
> >               first_block =3D 1;
> >               fw_ptr =3D fw_bin_ptr;
>
>
> Kind regards,
>
> Paul

