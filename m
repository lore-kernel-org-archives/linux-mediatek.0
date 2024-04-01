Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EA1CD1288
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Apr 2024 15:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Kyf88o4qsQlO/wR+KsemeXOmT0rB7nYlUY+SaWAaQc=; b=hhUBmU5qHs2TdgR9U9Qf+Uwizl
	Pymx4RmHU3wRYKLJ3VHfmfa0pa18XwwZw6tHfuHrRV1YZcFKm57CMCzq+DSNFZDLO/ij+m5vk13gF
	uZ4YAEGVDFnetA4s4XXuCt4ntiLYvSj0iwx9yp8438cHqXeCiJC3GWGdGkmZJttF6IWvjgeOsjQDs
	bCJl6RvXdvj/nfGRdEhbJcrmkhWqH3uXsuCoeHJU76/aPrZoY9npxNcLuY+jE64LtxK27gD6nYJZl
	qPz3DYUPr3QAZFAT3G2KnglyAT23wNDb02Ss8fNwOvXWGZZdjLPS6zsDTI5PAQGkdx47UHOG7Ga+4
	zLskH6Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrJTA-00000008ALl-00VI;
	Mon, 01 Apr 2024 15:21:08 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrJT6-00000008AKh-0FRX
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Apr 2024 15:21:06 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2a209b8af12so2625658a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Apr 2024 08:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1711984862; x=1712589662; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Kyf88o4qsQlO/wR+KsemeXOmT0rB7nYlUY+SaWAaQc=;
        b=Tr/jh2d1ldnFoxLQy+NXwBOWISbYQ7LIJiVZm+g6t8HunwPc2pk08wsMmTPXQVwkE6
         oO5Jw4uNGFJMBnb9B4c/6vwI3VL90NofyFKqdy6rNHgbccePEjWQt5F8+v6m2I29ub2e
         5EixvnGFG4sVaVYGszoN7lIwt9nIFA6B5tLyMtz/hCd6QZ7ZKI4q+8cP3QavuYGLK2tF
         WmDBOXFhKV1B71kyRyHWJOdvll+mOytp3d8ZGbBGBDaAWMHiumBH2YLPvXef/YqfwMch
         oyO926I1HDeLS9oAcvmO+O1aqIkWK9tcKpazBoKcc3LX5UUF2GgtcpcGlM2cGy/YcxWJ
         b28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711984862; x=1712589662;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Kyf88o4qsQlO/wR+KsemeXOmT0rB7nYlUY+SaWAaQc=;
        b=ZhGgMFJjOuiK0U++y2H49AKe9jj6CwyLY3VFVX+gYicgH9ZZRwsUkQNle3eayxry2u
         jYdBEwqxp4wgEbw4uA/cBKgFnN50mBS320NFBBCTf6nxYEqgQ6grup19er9XIOHo8bum
         iIJ/5VQ5r+TrYd89Ytn5Y2BD4bmfC7uINZvhUXMAvrgjLtvXt2ujIrohzBPyihB7cHNK
         bWk46QYvCEtpbHg0+n7RPG4jTVMw4zBY6J6Tg6iVJHjWTApFgoBBwyMD/FMZ1rZKrv3q
         PyHAGf3JUMc0JI/LxtZJpL7whfyORcT6NrdW48CSc4ACJLci/T4Jg97zXqJ4Lrgv/tW1
         izpw==
X-Forwarded-Encrypted: i=1; AJvYcCXWo6rsyTrRZ3fOr64JtvnUaRU1f8Tar5AnZBXv/fU4sWLPtvd4smGd26tuzlOyAC6m+2CnlWwWecndwFS6Bx3IrglAIZI2L4SMteIHxJVNo7AY
X-Gm-Message-State: AOJu0Yze0srwEBHItj12T7G+YReh7ZGGvnlfZ4hM0ynoDcd/l8+4P/hx
	OOaTDv4b6zZAyxR6NI32NIO7ssERWuFTHUNumQLBEqZRuJ5uOpiHg0bSuo4Nwu6HtRIx50d/+9K
	pEUGVfWXZNgPQrUdMOeOQ8ii0mk2LqDBGvgVK
X-Google-Smtp-Source: AGHT+IFPdgTg4m5tdz2zVUYiPfiHs6ZUPBKRXVgXamNWYYGHph95LpNshQvN2PHe1hlxkS0udPLirfwMVN9/FJiljx4=
X-Received: by 2002:a17:90a:f3c6:b0:2a0:5234:6842 with SMTP id
 ha6-20020a17090af3c600b002a052346842mr8533728pjb.31.1711984861895; Mon, 01
 Apr 2024 08:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240304144844.2042-1-peter.tsao@mediatek.com> <20240401144424.1714-1-mike@fireburn.co.uk>
In-Reply-To: <20240401144424.1714-1-mike@fireburn.co.uk>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Mon, 1 Apr 2024 16:20:50 +0100
Message-ID: <CAHbf0-FqUqoDty81OH9_Et7MTWFikYYhEvP7SBVGyeXO-R94_A@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] Bluetooth: btusb: Add support Mediatek MT7920
To: peter.tsao@mediatek.com
Cc: aaron.hou@mediatek.com, chris.lu@mediatek.com, deren.Wu@mediatek.com, 
	johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	luiz.dentz@gmail.com, marcel@holtmann.org, sean.wang@mediatek.com, 
	steve.lee@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_082104_448666_C010A3D8 
X-CRM114-Status: GOOD (  12.62  )
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

On Mon, 1 Apr 2024 at 15:44, Mike Lothian <mike@fireburn.co.uk> wrote:
>
> Hi
>
> I think this patch is causing issues with older firmware
>
> Bus 003 Device 002: ID 13d3:3563 IMC Networks Wireless_Device
>
> [    0.315064] Bluetooth: Core ver 2.22
> [    0.315064] NET: Registered PF_BLUETOOTH protocol family
> [    0.315064] Bluetooth: HCI device and connection manager initialized
> [    0.315064] Bluetooth: HCI socket layer initialized
> [    0.315064] Bluetooth: L2CAP socket layer initialized
> [    0.315064] Bluetooth: SCO socket layer initialized
> [    4.670811] Bluetooth: RFCOMM TTY layer initialized
> [    4.671029] Bluetooth: RFCOMM socket layer initialized
> [    4.671790] Bluetooth: RFCOMM ver 1.11
> [    4.673416] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [    4.673659] Bluetooth: BNEP filters: protocol multicast
> [    4.673895] Bluetooth: BNEP socket layer initialized
> [    4.674125] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
> [    4.674360] Bluetooth: HIDP socket layer initialized
> [    5.016365] bluetooth hci0: Direct firmware load for mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin failed with error -2
> [    5.017163] Bluetooth: hci0: Failed to load firmware file (-2)
> [    5.017557] Bluetooth: hci0: Failed to set up firmware (-2)
> [    5.018129] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.
>
> The correct name should be mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
>
> Reverting this patch fixes things
>
> Cheers
>
> Mike

If it helps, the device ID is 0x7961 and the fw_flavour is 24 or 0x18 in hex

