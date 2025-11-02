Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3259BCCF9E3
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Nov 2025 12:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FCXeGRB5nwxiHZNvSW8WJ8QeL6xegUsGs8BFEFXEO0=; b=qdwBkMj4slV5fwo8iaNmRYexHY
	O+Fs1lDVc2mco5bEqcf/ZUJV4TedmJOpsbHvHn2qlN/0Lh9UVD48Oc9XulOHVblwEMHWUFcuqCZcL
	FxH0UNJMfr5K68nzoQLEjvxv0I3uZwQuzFJRHFDE1VyADJkCyYETfiwzU+/TK7iXadzMusxWByDJ6
	QxwlL+z/NqHT2thQMwucDj2djSbaWqT95rna8tvgfCxfbRwaVzNTXjN9kZarYfSF4rp8JV6RMRcSI
	CGr043YTUBnOne7giVA/WmIOGDrGT5XaEc9p7w5sKjldE07QEPiLwf9sozPxTi/fgqUg/KVfVh/dD
	c+SUxSuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFXSU-00000008Xrj-3s8L;
	Sun, 02 Nov 2025 12:45:22 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFXSQ-00000008XrG-2unc
	for linux-mediatek@lists.infradead.org;
	Sun, 02 Nov 2025 12:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9FCX
	eGRB5nwxiHZNvSW8WJ8QeL6xegUsGs8BFEFXEO0=; b=Ve76RgEcDwnLKktwUX3T
	OAtGPvhlFVyJXHg0cgbwe2S/D7souSPU13JEXuh1fSZ+i1uZoTNF/a+Y5iKbgAQW
	Z28MghY0ND5OnVxsdJgu3WNhdzt/QrJkd+sYz1bAdfpEmoGa0K55hSLpuUSC7+xc
	TTM6IIYbfumIjbsWTfpFS5q2e9WuQ7o/7O41C7cbgSKrL6ScXXHHTy39pDwCdzUL
	3aF4NaMRWPJi1WH468ktyV6v/cUMDdppEpDxBfEgn4EBOmfMRxDeRb4TDMfEYRjm
	jmW/ydifulRLB5MjU4+ecRha0OKb+64iT+8cCuPhanSxnkT1M1BUPt/s6wLGYqEn
	0w==
Received: (qmail 1814717 invoked from network); 2 Nov 2025 13:45:10 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Nov 2025 13:45:10 +0100
X-UD-Smtp-Session: l3s3148p1@BTge+JtC/NAujnv0
Date: Sun, 2 Nov 2025 13:45:09 +0100
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
Message-ID: <aQdSVcazPQl-shR6@shikoro>
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
 <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_044520_241072_E12351B7 
X-CRM114-Status: UNSURE (   7.58  )
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


> 
> I'm sure that i had tested with them already reverted, but maybe powercycle
> was not complete.
> Git bisect pointed also to "i2c: muxes: pca954x: Use reset controller only".

Can you try enabling CONFIG_RESET_GPIO please? It is probably that this
driver is missing. The core relies on that driver for the fallback the
above patch makes use of. Sadly, I couldn't convince the reset
maintainers of a way to automatically select the driver for existing
users :(


