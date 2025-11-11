Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F13FCCFA1A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Nov 2025 14:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txdEdm40JEr5pC5+2I7HwpHNOaO4GAfSSqE8ztv0UX0=; b=4wweiZOZpyf5uXaB7JjlnFNc67
	hARxJPEqXqgt3kJk5wY9jvC1F7A2nVNRq6Ow72SuqqGoqeG0/5WedskRID/6oCklsFTwwasWn8woR
	X8jf1OG+X8mmvy376KMu6NWGK+iLKYZ9e0MGX6/BDouNVbM7P4PY9HHGg0JTnelhjsm5b7FQ+tJ6b
	8q0JcdErxdcpQd9ATFkoU1r7qReGFGgQJ6Po0MeUmqdOTgxKu7VakFKrMBCgHLJ4MNgMGKqKwvT7q
	8eOih4v3XWOcPq4lK0vUe4YCNQrx7pbSN5x/nNfgXr1B7uwRboVecZ1p3Mwm17uKMlIRFSN9MmpuB
	8xzsBOPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIp5N-00000007IPF-20ju;
	Tue, 11 Nov 2025 14:11:05 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIp5K-00000007IMj-2nHt
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Nov 2025 14:11:04 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-3c96de7fe7eso2750351fac.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Nov 2025 06:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762870261; x=1763475061; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txdEdm40JEr5pC5+2I7HwpHNOaO4GAfSSqE8ztv0UX0=;
        b=Yp30PNMEs3s0QL0xMcqM7rUmpTGv+C8YgFITk/LiYa1XVMTAHo4I3KudvsUj9ODmxO
         68e7dd4u+FynIbf3O2ljtaVJeMwcGITWNHEM+eTG7eObS7pTyW+mlsx7+JzzwufkAOZu
         3ndEH+a+kMvogsuOqCMyrZUlzMicFKfkC8tWMtjTzht3kmih+IoEBZGnVyCtsDapbiJc
         GdnpgH+RLk0gWB42znW+TDvT1DdjEzhxfjxBxvLatYOtzre0ay5ExLrgN4Z43z2lQtBS
         ms8Zd6rGviOpnDwmjqxt0Fxw6vX45SKQ9+M1j8FW5cAqJAbUQg1S7rr0rJSYngEVgxF8
         XB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762870261; x=1763475061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=txdEdm40JEr5pC5+2I7HwpHNOaO4GAfSSqE8ztv0UX0=;
        b=h2mB0kVBv/D4frzzd5U2G15BScbFDR3hEDvscKhs3GN1F7Yo+rl3FQr5pvCya5WFSo
         BUlg1YdnaBijB6M/NKBgeZ4NC3R4NY5wRpvQdVAgkC7X+eaXPTA1WBLcCVhO543a5QuC
         XUnQXbn+zlZsaBJkdxRa6kjgjMSLbazbR6NPmZeNwzNCl4IgszsGFsWtUgrK83ajjFec
         K5PhKbS8HdO03fxJz8+WhEhxWOgfr9zjAsjHE75MmHZuoLloSSbsGoMu8vdQuZEm+HGC
         TnIBtITJuz004FIUVh49lShde4afpirRVFsn1ssPaHGXDxUFKewoa5JbATfSyu7VGi2l
         TpyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9Sh3pJx9YTaQWz9K25J6OE7CtApiOe9yrgLtuGh+qgbnXgdWtrwo6gjz/lrDJhbow57y1dc/vrJ9r+FxVPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxC80Ncp2nePLvz0zxmV31FXwKQ2/wlBufnWpcmnqLjNFZMf4PC
	DcNDJi5GM9aB4wgwFkx/Byt/iuzpXTSIIb88gXNCtbq7Wtl+roq38LNVT8+uCT5X619+wURX2YZ
	mfigosM0uZ2kIXjrv2D6KVVxCvkUYhQc=
X-Gm-Gg: ASbGncve5DxYGaJL7st4OBmt9vjAsePETyGxDlAbGj3sIe621ZrLvjxd0wqJLaOWoD7
	ifP59pK0pLZY0O3YKKR/L+o+Vh0To3rLnnEoghZiN7eLFMgGK5BbRAShZ/SG8VjCFAT1W5hJ7x9
	bQcbrkKCXk4BZQJPN13wHetOQjgENA/Ep3scymQcjvmFmvwjX5xZapd5z1660p86sUsVKjuqvGu
	1ZTyMLvLWIPALMWBm0C6wdjT1iHOURLfAOBWvXfpgJjGmAGKhw52aOmemtki33UHLpHRmNt
X-Google-Smtp-Source: AGHT+IH9NsGeAGXbfrkGaLkI4eT/HyQdZyA7+2QW2Tz3Nh3t6elSCgFx6DzEmvDROMRAAY0dK1BfQ/UaepIHAEj/9uQ=
X-Received: by 2002:a05:6870:899a:b0:3d4:760f:544b with SMTP id
 586e51a60fabf-3e7c294ab31mr8000185fac.46.1762870261279; Tue, 11 Nov 2025
 06:11:01 -0800 (PST)
MIME-Version: 1.0
References: <20251111134400.5258-1-sef1548@gmail.com> <aRNBak9Xl_wsBJ6w@lore-desk>
In-Reply-To: <aRNBak9Xl_wsBJ6w@lore-desk>
From: Nick Huang <sef1548@gmail.com>
Date: Tue, 11 Nov 2025 22:10:50 +0800
X-Gm-Features: AWmQ_bkn9vJFX_qKrlLafWMdsY1_qiyP8xv9zY7kAo8K6GWks1Gw41ZZnCWDwno
Message-ID: <CABZAGRG-7T2mp3UYRaJ5c7eTi1B4hWybtJrfPwdo2aSEvhcMqg@mail.gmail.com>
Subject: Re: [PATCH] mt76: connac: remove unused reserved field in gtk rekey
 TLV struct
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, ryder.lee@mediatek.com, shayne.chen@mediatek.com, 
	sean.wang@mediatek.com, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_061102_704587_3BDF99C6 
X-CRM114-Status: GOOD (  14.98  )
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

Lorenzo Bianconi <lorenzo@kernel.org> =E6=96=BC 2025=E5=B9=B411=E6=9C=8811=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:00=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> > The 'reserverd' field in struct mt76_connac_gtk_rekey_tlv was unused
> > and misspelled. Removing it cleans up the structure definition and
> > improves code readability.
> >
> > Signed-off-by: Nick Huang <sef1548@gmail.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/dri=
vers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > index 27daf4195..28cf46a5f 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > @@ -1681,7 +1681,6 @@ struct mt76_connac_gtk_rekey_tlv {
> >       __le32 group_cipher;
> >       __le32 key_mgmt; /* NONE-PSK-IEEE802.1X */
> >       __le32 mgmt_group_cipher;
> > -     u8 reserverd[4];
>
> This field is used to keep the struct size consistent with the fw one so =
it is
> expected to not be used.
>
> Regards,
> Lorenzo
>
> >  } __packed;
> >
> >  #define MT76_CONNAC_WOW_MASK_MAX_LEN                 16
> > --
> > 2.48.1
> >
Hi Lorenzo,

Got it, thanks for explaining. Makes sense that this field is just for
size consistency.

Cheers,
Nick Huang

