Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA32CC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 00:28:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F2BD60F11
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 00:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F2BD60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dihw5oivbMy+2jjNRh8uMWMAblS0XSfTsp5YcQUi57Q=; b=29sHmnAaDcnuNW
	hOPgZCLcaf4ivoO2WEYTkF+MjQWxlwCpCie92Q3Hs6T6KMU9XFuE9koR6WXAYxyz1EAt0yye9TJDv
	mY/GAzaW5tjZ6YUx8LkixT30WW9mVsvJ4bddSt3kEeQv2XvSVlz0DWLbLCS+yhfd8CK3y5WmrllqZ
	RE0hbaFpNaeZFn0f1j6TWpXg6cJFWedMWfj5vUVskfnBxIFWtnAJtnK5RHDvkrtt2N64oY+/gAA6z
	HolOUXDTtmDWzE/PWO05CAdvGwSv3twRLVoHW9dzaYGbyACtyEV4VHgIx90sczSUnoV9GljONYal7
	KjdL1kyO4GeD/JqfkOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7oTZ-009JWe-P1; Mon, 26 Jul 2021 00:28:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7oTL-009JVF-G6; Mon, 26 Jul 2021 00:27:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1033560F37;
 Mon, 26 Jul 2021 00:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627259275;
 bh=5EChaJLtwzbVLsyJuV9buEjUeWDZmjFho5daWXnpViA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MppDXIdsiBMiySzBFpji3JswurhlZiUe4vRlRAsMMDXmb1oOYcXFlnh1ct7FL7/GO
 +yB+20IZLC8fgYfYELzwf+WwfjDSS0/6c3FOxwdHBvChATAFfviwTAaeIpEE5vDTgS
 rJKHJH3lNKZItUrFxKZqoqrJNWuQSbF+JuV/zi74WbTpbmRnV9vr7TYAkMEpSsi4cv
 HLTrYfjOWYcqCwdWMaFYxDMdCJxKnhzWr4S0WEZidBtds36Krmi+BSZ1Abq7iM6bVc
 0JTBxQk8q503JTxwlGg8fYDGpKsClKjfR7UIQHfmZyLSpvi2G3VEb8TXQVMfvMbJ1G
 FQ6UYY3V9bZ7g==
Received: by mail-ed1-f45.google.com with SMTP id h8so8375784ede.4;
 Sun, 25 Jul 2021 17:27:54 -0700 (PDT)
X-Gm-Message-State: AOAM531TvOeKOBvbhw5T3wMP7VkBx94pPIYObKKzsCwkg/t9X0/IyKI2
 NzKvddbrn0f4tlvVzzYpSjaLQR/aF4Zj9exovQ==
X-Google-Smtp-Source: ABdhPJxRxMiVcAhVNADQkv4nKSd6s3qZWXOhXefQlHs2yzs/g7fStJDFNaMTrIHfMGLrgfiBNRfAzU7erf01ulqv+y0=
X-Received: by 2002:a50:d71e:: with SMTP id t30mr6473038edi.72.1627259273649; 
 Sun, 25 Jul 2021 17:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210710132431.265985-1-linux@fw-web.de>
 <456f0611-1fc7-75ac-ff45-9afd94190283@collabora.com>
 <trinity-02bc17fc-b458-4d17-baca-8afe30e4c92c-1626110171249@3c-app-gmx-bs28>
 <dbe23d2a-cd29-0782-1b7d-bcb5c6683607@collabora.com>
 <6EF00182-1FF4-4061-BCE4-E2AD7275211B@public-files.de>
In-Reply-To: <6EF00182-1FF4-4061-BCE4-E2AD7275211B@public-files.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 26 Jul 2021 08:27:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-2vJE_v2vV=fJqK9--yx=++P9x53T-g3Cv4qKfHhqbLg@mail.gmail.com>
Message-ID: <CAAOTY_-2vJE_v2vV=fJqK9--yx=++P9x53T-g3Cv4qKfHhqbLg@mail.gmail.com>
Subject: Re: Aw: Re: [PATCH] soc: mediatek: mmsys: fix HDMI output on
 mt7623/bananapi-r2
To: Frank Wunderlich <frank-w@public-files.de>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Frank Wunderlich <linux@fw-web.de>, Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_172755_600956_BB3A8BE3 
X-CRM114-Status: GOOD (  15.04  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaW
vCAyMDIx5bm0N+aciDI15pelIOmAseaXpSDkuIrljYgxOjA25a+r6YGT77yaCj4KPiA+T24gMTIu
MDcuMjEgMTk6MTYsIEZyYW5rIFd1bmRlcmxpY2ggd3JvdGU6Cj4gPj4gSGksCj4gPj4KPiA+PiBp
dCB0dXJucyBvdXQgdGhhdCBwcm9ibGVtIGlzIHRoZSByZWFkK29yIG9mIHRoZSBuZXcgdmFsdWUK
PiA+Pgo+ID4+IGkgcmV2ZXJ0ZWQgbXkgcGF0Y2ggYW5kIGNoYW5nZWQKPiA+Pgo+ID4+IHJlZyA9
IHJlYWRsX3JlbGF4ZWQobW1zeXMtPnJlZ3MgKyByb3V0ZXNbaV0uYWRkcikgfCByb3V0ZXNbaV0u
dmFsOwo+ID4+IHdyaXRlbF9yZWxheGVkKHJlZywgbW1zeXMtPnJlZ3MgKyByb3V0ZXNbaV0uYWRk
cik7Cj4gPj4KPiA+PiB0bwo+ID4+Cj4gPj4gd3JpdGVsX3JlbGF4ZWQocm91dGVzW2ldLnZhbCwg
bW1zeXMtPnJlZ3MgKyByb3V0ZXNbaV0uYWRkcik7Cj4gPj4KPiA+PiBhbmQgaXQgd29ya3MgdG9v
LCBidXQgbWF5YmUgaXQgYnJlYWtzIG90aGVyIHBsYXRmb3Jtcwo+Cj4gQSBnZW50bGUgcGluZy4g
QW15IGZ1cnRoZXIgY29tbWVudHMgd2hpY2ggb2YgYm90aCB3YXlzIGlzIHRoZSByaWdodCBvbmUg
KHJlc3RvcmluZyBvbGQgb3V0cHV0IHNlbGVjdCBmdW5jdGlvbiBvciB3cml0ZSBvbmx5IHdpdGhv
dXQgcmVhZCtvcik/CgpBcyBJJ3ZlIGRpc2N1c3NlZCBpbiBbMV0sIFNPVVQgaGFzIG1hbnkgYml0
cyBhbmQgbmVlZCB0byBiZSBjbGVhcmVkCmJlZm9yZSBzZXQgbmV3IHZhbHVlLiBPZiBjb3Vyc2Us
IHdyaXRlIG9ubHkgY291bGQgZG8gdGhlIGNsZWFyLCBidXQKZm9yIE1PVVQsIGl0IGNsZWFyIHRo
ZSBiaXRzIHRoYXQgc2hvdWxkIG5vdCBiZSBjbGVhcmVkLiBJZiB5b3Ugd2FudCB0bwp1c2UgdGhl
IHRhYmxlLCB5b3UgbmVlZCB0byBpbXBsZW1lbnQgdGhlICdtYXNrJy4KClsxXSBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvdHJpbml0eS05
MzdlYmZhMy1kMTIzLTQyZGUtYTI4OS0zYWQwZGJjMDk3ODItMTYyNTgzMDExMDU3NkAzYy1hcHAt
Z214LWJhcDQzLwoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiByZWdhcmRzIEZyYW5rCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
