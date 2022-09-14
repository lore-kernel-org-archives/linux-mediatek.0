Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA523C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 22:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpBAm5O1iLVnW0q4rVLaTTneaRaRDMlmG6+w016Lmbc=; b=bhzwF2To7cfLOX4bEIuun3WKes
	yfn4symgFl1kx5DogaXx1mU+0LeKeZhYuxEhWOMs+msL8X95u1eH3As2kpP4krMF8j1zVjusZ+a/Z
	aETfEijh6ERmYkL34yH+NTYwNqSC9+MddNVEkku2Dzpd8SYYona2SHcg4t/MMIJEtslu6t0e2qO9u
	VxQGukCJwgIm/fj7u7C6GC6sM4utbMBrkF5Dw/Hx3sKqYETSyirDK75racZZFeGJphnm6ZsBrg9FW
	K/2OaRp5zu4WN4ECZhqO7E8nKOZ3mI0/q2lKUXEMx+QEon88suXtzjpwRWcarhal5VYnYCUdNVfza
	8lwSGfGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYaxh-00BOUa-UW; Wed, 14 Sep 2022 22:34:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYaxf-00BOTe-40
	for linux-mediatek@lists.infradead.org; Wed, 14 Sep 2022 22:34:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A6097B81CEF
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 22:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFF8C433C1
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 22:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663194863;
	bh=5JNKrPYbxMNe6Hm6rld4fqMiyupR+bHOxvW1ZOcAvpc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZpMMMiJhnoxLtZk9rLxTeIYajMlKz7VBGEy3QpDuF7nVa6PlEKsuJxKPQuiVFSNIe
	 2TL608GGg6RlAB+RVg9htWN6DLNLY0C8kYNgVWficw8w9va44x9+nixDlNGGE6VEUj
	 CgTeUOeyHZEvCBdK4fWbqW5wShEJm8m6V3IceuUiBhl/DRm3NdZS4HtftobWb7Cdq6
	 pDs/LY04D4o9OTkU1CbqBpP0GF9IEXDTSBnKUrKvliZeHx29e0aKM7eFA4m6FHE4jG
	 LfwYzLZWN2Czly7GEs1V2+PbLXtaOGjku1O812e0H1xoneOV2emKaKIX5b5zMSMyub
	 C4i3WX0QThW4w==
Received: by mail-wm1-f52.google.com with SMTP id ay36so3027687wmb.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 15:34:23 -0700 (PDT)
X-Gm-Message-State: ACgBeo1AFYQVp3VQctX63fZlD5TrNk1qyy5BkbEHnwd1MwyLiXLEJDWz
	eiPEVfdfZH6yvsmB4UUrgUfATWa3dPOSqgTFcos=
X-Google-Smtp-Source: AA6agR7ru2g7GnIe25Ah1O05C3vLxOEHyNPJD5VFnOAgGP94sW4ihHDOIPwLKc/bBXA4Vqh3EO+xnXJtdy7eYprJF0Y=
X-Received: by 2002:a7b:c84c:0:b0:3b3:3faa:10c3 with SMTP id
 c12-20020a7bc84c000000b003b33faa10c3mr4601516wml.94.1663194861556; Wed, 14
 Sep 2022 15:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <43b68b1f48c20b1dfcd7e6663c3dcb38e4e0648c.1663020936.git.objelf@gmail.com>
 <a432abf4cf95e93783864b27bafa53d45bdd5212.1663020936.git.objelf@gmail.com> <07016e51-a5b5-a350-cad2-b9fcebfe3706@collabora.com>
In-Reply-To: <07016e51-a5b5-a350-cad2-b9fcebfe3706@collabora.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 14 Sep 2022 15:34:09 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzr7hruZ3LXD_bAVb_xy8v5YXptVpye9tEpO=aF18r_4Cw@mail.gmail.com>
Message-ID: <CAGp9Lzr7hruZ3LXD_bAVb_xy8v5YXptVpye9tEpO=aF18r_4Cw@mail.gmail.com>
Subject: Re: [PATCH 3/4] Bluetooth: btusb: mediatek: reset the device as WMT failed
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@mediatek.com, marcel@holtmann.org, johan.hedberg@gmail.com, 
	luiz.dentz@gmail.com, Soul.Huang@mediatek.com, YN.Chen@mediatek.com, 
	Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, 
	km.lin@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, 
	ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com, 
	Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com, 
	jsiuda@google.com, frankgor@google.com, abhishekpandit@google.com, 
	michaelfsun@google.com, abhishekpandit@chromium.org, mcchou@chromium.org, 
	shawnku@google.com, linux-bluetooth@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_153427_492066_3A9501E9 
X-CRM114-Status: GOOD (  24.06  )
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

Hi, Angelo

On Tue, Sep 13, 2022 at 1:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 13/09/22 00:18, sean.wang@mediatek.com ha scritto:
> > From: Sean Wang <sean.wang@mediatek.com>
> >
> > Reset the BT device whenever the driver detected any WMT failure happened
> > to recover such kind of system-level error as soon as possible.
> >
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>
> This looks like a fix, so you probably want a Fixes tag for backport.

I didn't add the fix tag because there is not a previous patch that
had issues the patch needs to fix.

It would be looking more like an enhancement patch for me to fix up
the potential issue happening in the firmware where the existing
driver cannot detect and recover in time with .cmd_timeout callback
but actually, the kind of potential issue in firmware I was worried
about in the firmware didn't happen or being reported so far.

   Sean

>
> Regards,
> Angelo
>
> > ---
> >   drivers/bluetooth/btusb.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > index 653f57a98233..dc86726c8271 100644
> > --- a/drivers/bluetooth/btusb.c
> > +++ b/drivers/bluetooth/btusb.c
> > @@ -2576,6 +2576,10 @@ static int btusb_mtk_hci_wmt_sync(struct hci_dev *hdev,
> >       data->evt_skb = NULL;
> >   err_free_wc:
> >       kfree(wc);
> > +
> > +     if (err < 0)
> > +             btmtk_reset_sync(hdev);
> > +
> >       return err;
> >   }
> >
>

