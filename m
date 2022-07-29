Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C8DC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 13:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FMeB7gNzDdPBcB0grv6dwqtsT3RsWnwrpI2BT3+73M=; b=iDSRAz5mqg12VG4HnmSJmSC5Ty
	u6qMSQcfIqNIxNlK8uNh1uwC7mObC1T79DyJXZgO3u+sQoWcLXoXq7dahcSXgPHL1eWxVE0pOAGil
	G3jaH7WpLr0ml1MP4GYhkKxOoe6uPpdRxNnXCnwcewo3ErIVVjMhNpAe2vSB94/Vs9sBQYa1nZrZq
	aUhA7Cz5uSF3dvtjJB/t60HvmGaEXrgxZlYbLgj3Fm2kI/xy1w4hKBUnw9A0WmVyV3vKYkKLfg+d4
	hbrTYcIQ36f3f7rtyDN/ZIWj34DqZJEplmu8hJdQU3/HcTOP9DdSWBAAWCm1/yRSyAmRvenc5QeEn
	zKBZDXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHPyB-00580R-1x; Fri, 29 Jul 2022 13:23:59 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHPy8-0057wv-7Y
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 13:23:57 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BE9EA1FACC;
	Fri, 29 Jul 2022 13:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1659101030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5FMeB7gNzDdPBcB0grv6dwqtsT3RsWnwrpI2BT3+73M=;
	b=OyhcVXwJEDTEnywR51HSrlFRd3VcmWxHiufTNsvD83+QpZ4KJZiDh79T+20FNSZyLp3Rix
	p3sZ1WJBG6t2S+VMiaQ/WT4rxYb+aZr55x5FqyXm18qX8/5yywgFz+Zp57pZdWCpIYi+I1
	y0HyvAd553z2CmEWrxGmvLq1TfcUtuY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1659101030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5FMeB7gNzDdPBcB0grv6dwqtsT3RsWnwrpI2BT3+73M=;
	b=os5OdYUSfFMSQBT3slgxbpu2pzJSEDtwvJQygrEH95h25oYKy173Yqp9oc7kNH3TmM54BL
	de/nFXErN45gjdCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 704EF13A8E;
	Fri, 29 Jul 2022 13:23:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id J9C5GWbf42JiSwAAMHmgww
	(envelope-from <jdelvare@suse.de>); Fri, 29 Jul 2022 13:23:50 +0000
Date: Fri, 29 Jul 2022 15:23:49 +0200
From: Jean Delvare <jdelvare@suse.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Mark
 Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Chenglin Xu <chenglin.xu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH RFC] regulator: mt6380: Fix unused array warning
Message-ID: <20220729152349.6a4801a5@endymion.delvare>
In-Reply-To: <decb7338-eeb8-3c0c-88f2-c0b00fb8b0e7@collabora.com>
References: <20220727132637.76d6073f@endymion.delvare>
	<decb7338-eeb8-3c0c-88f2-c0b00fb8b0e7@collabora.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_062356_457672_CD41CD15 
X-CRM114-Status: GOOD (  14.72  )
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

On Thu, 28 Jul 2022 13:15:14 +0200, AngeloGioacchino Del Regno wrote:
> Il 27/07/22 13:26, Jean Delvare ha scritto:
> > With the following configuration options:
> > CONFIG_OF is not set
> > CONFIG_REGULATOR_MT6380=3Dy
> > we get the following build warning:
> >=20
> >    CC      drivers/regulator/mt6380-regulator.o
> > drivers/regulator/mt6380-regulator.c:322:34: warning: =E2=80=98mt6380_o=
f_match=E2=80=99 defined but not used [-Wunused-const-variable=3D]
> >=20
> > Fix this by annotating that array with __maybe_unused, as done in
> > various regulator drivers. =20
>=20
> I know I'm late to the party, but I would've preferred to see the
> of_match_ptr() dropped instead of adding a __maybe_unused.

Doing that for this driver would basically prevent the compiler from
dropping out the variable in the !CONFIG_OF case. If this is a valid
case (and I really would like Mediatek people to comment on that) then
I can't see how that would be an improvement.

--=20
Jean Delvare
SUSE L3 Support

