Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB93DCCF9E3
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Nov 2025 22:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjPVo8a70nrUP3Q+tkN1iTH3Q52x5tObtzJ+y4wppGs=; b=kAyhbwOPvK4D3JIplW76KF6uih
	0X0x213Ptc1iqndff+5YwHuwfp/FEMNoYkluakmK4BnTsDhqQtD5GXXspA9jFnDC1cnnYEaaTMIXl
	Ev7Or0UlMOeK7m7jmIFGUgMtCULVA4n0NS/iXCGBSmSo4wcppJ3R1a6hFv31p+xM+Ez5MHlT1bgKQ
	OJFcEK1fFpLGCacPzLrmAXRgO+pi6r4XGqu7y57Ymn7aNFa0T2u10u3L2AvqJMtu9YF5bENkY/fQH
	M6QlEylafOptAV8oyManEkLlNDFSpwPCRPUgDM5EyzyuAY6Tz85zlDvxYGeNm7ElJqO3zci57VG55
	Z07J+16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFgth-00000008uCa-03mg;
	Sun, 02 Nov 2025 22:50:05 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFgtd-00000008uBV-1Vmb
	for linux-mediatek@lists.infradead.org;
	Sun, 02 Nov 2025 22:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fjPV
	o8a70nrUP3Q+tkN1iTH3Q52x5tObtzJ+y4wppGs=; b=TsIMeQ/Fb2khTuPOGlyS
	o10tUQHWEMXjuS2wnu5GTWZZqFrgLj+bx2t7Rj7/7h8QLk1Liw7xB3nITHEc3gk9
	PY2JyfZwR2drwiIHnrLneQLQlvZoXwEzonrJH+e2nWqcHrByXSEsO2DL4IIvHI0B
	tyd7lMbivrztnfsONFAZdGlcrAbTw6VSQVzl2PZtaE+FOEoPYZX2OWSLEQZ+wat4
	7C+vMCUpY7Zo9HB+AqFpperLHPSqnoNtnsIv5ZY7tcmVSGa15SGuSaYFif6KdsId
	QX4BOsO6uBz7woYEb6207vzPF66G8gjSk02g9y8AzOdUnpAK7Jb4TOePYsgDvpcf
	Xw==
Received: (qmail 1949471 invoked from network); 2 Nov 2025 23:49:55 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Nov 2025 23:49:55 +0100
X-UD-Smtp-Session: l3s3148p1@YhjWaqRCltAujnv0
Date: Sun, 2 Nov 2025 23:49:54 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Frank Wunderlich (linux)" <linux@fw-web.de>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Wojciech Siudy <wojciech.siudy@nokia.com>,
	linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
	daniel@makrotopia.org
Subject: Re: i2c issues in 6.18 on R4, but not r4pro (both mt7988 with
 i2c-mux on i2c2)
Message-ID: <aQfgEuelvU-8_2rh@shikoro>
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
 <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de>
 <aQdSVcazPQl-shR6@shikoro>
 <1144f62ad9886fed60620bce0bbed7ee@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1144f62ad9886fed60620bce0bbed7ee@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_145002_319430_1A32C349 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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


> from reset maintainers as i have my own defconfig. Tested and my mux works
> now again.

Glad it works again!

> Maybe this option should be enabled by default or when the i2c-mux is
> selected?

That's what we were discussing. At least a warning will now get printed
to the logs when booting suggesting the above solution.

> When moving from specific to a generic aproach (which makes sense) imho it
> should be
> mentioned in commit description which option needed instead :)

We didn't realize this back then. Only when the first bug report came
in :/

> btw. the Authors Email seems not working, got

Yes, he quit Nokia meanwhile.


