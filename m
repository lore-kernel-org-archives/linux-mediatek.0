Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DFAC19F21
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 11:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCTDsjMvQ42bPcKeynsewoMKhH82hXRbjXkjEys14+o=; b=JsZLA/ZacDWf/mDQ+1RVnm9Ubq
	Z5t6V3UB4AMeSSDEjQhrfYhQ47V1hNUON0WGtOPpiYhjJPaz4OWhsOXAktpyUzv8wMeSaaqwPoLg5
	lEfDKPJjJW/BCJdyheoWL53Woc9xuP9hDgILeHNB4GNhDIRDzN4+dg87rI9BKKt8Vw5iDij2I2o1Q
	eE0Ji/hUHtpXAK8IPc205p/znM4Iqj1ioXQbGEl0mSdqx8rXfRKWOokOmRuclLVw4r9DWs7ihREdZ
	KpCojXUnY5wn9e/BhG6mczHcYugnh7ejasxe086aUtx9+SPkOS5kBDU72500Jf0akhtfn0RuXLTdV
	5sR3F86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1qh-008oCD-N0; Thu, 28 Jul 2022 11:38:39 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1qf-008o2U-Pw
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 11:38:39 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 15F3D33A33;
	Thu, 28 Jul 2022 11:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1659008309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oCTDsjMvQ42bPcKeynsewoMKhH82hXRbjXkjEys14+o=;
	b=omc4xCiOI34ZURPO6ixkP/uM/28AmQNQ9D/KYHl2zwrMmYPGWdhL2b8tO2Yl/f+MAJXFbl
	MwUaaiKaY8gIFi8D7dAWO6EZaHq9HDAVr0JYIbspFhGsFqvh8i/R/CRDDBM8AhHvsBGkM3
	hGTYXqshrC4Rgew4+48qfResC4jdvOE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1659008309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oCTDsjMvQ42bPcKeynsewoMKhH82hXRbjXkjEys14+o=;
	b=hLYRud54mwo3moDg6l4rB2DIBukOy5LJogc1A5UZIOtVgajMsk99MS0vV03xfWO52gSGjt
	QgYkrgNGATMdZcAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D20B213A7E;
	Thu, 28 Jul 2022 11:38:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XbipMTR14mKOEAAAMHmgww
	(envelope-from <jdelvare@suse.de>); Thu, 28 Jul 2022 11:38:28 +0000
Date: Thu, 28 Jul 2022 13:38:27 +0200
From: Jean Delvare <jdelvare@suse.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, LKML
 <linux-kernel@vger.kernel.org>, Chenglin Xu <chenglin.xu@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: Let PMIC Wrapper and SCPSYS depend on OF
Message-ID: <20220728133827.5f59e824@endymion.delvare>
In-Reply-To: <98eccbdd-3446-f44d-9278-79a4a60c1c18@collabora.com>
References: <20220728112216.13b10689@endymion.delvare>
	<98eccbdd-3446-f44d-9278-79a4a60c1c18@collabora.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_043838_012154_69B5176D 
X-CRM114-Status: GOOD (  13.21  )
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

Hi Angelo,

On Thu, 28 Jul 2022 12:51:44 +0200, AngeloGioacchino Del Regno wrote:
> Il 28/07/22 11:22, Jean Delvare ha scritto:
> > With the following configuration options:
> > CONFIG_OF is not set
> > CONFIG_MTK_PMIC_WRAP=3Dy
> > CONFIG_MTK_SCPSYS=3Dy
> > we get the following build warnings:
> >=20
> >    CC      drivers/soc/mediatek/mtk-pmic-wrap.o
> > drivers/soc/mediatek/mtk-pmic-wrap.c:2138:34: warning: =E2=80=98of_pwra=
p_match_tbl=E2=80=99 defined but not used [-Wunused-const-variable=3D]
> > drivers/soc/mediatek/mtk-pmic-wrap.c:1953:34: warning: =E2=80=98of_slav=
e_match_tbl=E2=80=99 defined but not used [-Wunused-const-variable=3D]
> >    CC      drivers/soc/mediatek/mtk-scpsys.o
> > drivers/soc/mediatek/mtk-scpsys.c:1084:34: warning: =E2=80=98of_scpsys_=
match_tbl=E2=80=99 defined but not used [-Wunused-const-variable=3D]
> >=20
> > Looking at the code, both drivers can only bind to OF-defined device
> > nodes, so these drivers are useless without OF and should therefore
> > depend on it.
>=20
> I would prefer that you solve this warning by removing of_match_ptr() fro=
m both
> drivers instead.

Actually we could do both. Once the drivers depend on OF,
of_match_ptr(_ptr) will always resolve to (_ptr) so we can indeed
save the preprocessor some work.

--=20
Jean Delvare
SUSE L3 Support

