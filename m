Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123EAC43381
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 00:42:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71DA464F2B
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 00:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71DA464F2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zdMpE9RGkNwRQVe7XMGj0oTcEylAG1pe2QitrnB9Ymw=; b=njR3H+h1PjXp9PuMz9JqCWiLW
	DgUDxoBiAPer/virKI1Ve48uMUEvl8dlZdTWmIJAB9TH+lBQSPI/oct29pti7qh6orGEJvTBzIyxx
	JD+9BdFCjkhyJSwUP8LwgND8qtu8/zk/6Ly9gyi1TcOBSs+bGETYd9NqmphaE5n3Az3sfVWvnQ83H
	dwWK5bbGTqxHv1v2Cw7AdDKKwU4fcz8mlMy73uHux1HwTpKTRfOocr7aYz8DH8FNr0PuL8VdSDH0j
	k8aS2Vrg50421HD7TbJkMDvJ3cypHydjo/ifAwxp/9T8wpcDUDdrXoNzH6sTJV8wW5aIi7VYOzZqK
	fsMuvzYCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMgjm-004BC6-Qr; Thu, 18 Mar 2021 00:42:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMgjN-004B9Z-AC; Thu, 18 Mar 2021 00:41:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CA1964F38;
 Thu, 18 Mar 2021 00:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616028099;
 bh=aW5f462X/+nQqIhoFPP4SR6iv2e/m+Gbr4HadtAx6cM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MEhLDb4ckb148NPNK29xr2etYjyxHvgx6tMH78prIIK+USr16mkUU5MoWiWoyeDd6
 2NRWgmw8GboHr30cgBexd4X7vKUBCQQ9J4nNCHsjapD5zpVUe7uiJvfigrKnGTL4ZG
 BZ78mpiJE4ld7XybI2HbF6qFtJg88b+fL8gE4ZgEEyGsPeRz3jewiGNjQFccF3IF3b
 Ta69l9NKUPJpzdUJ+rJcuoGX2VFCB4P3wCUeTKCjkCKmhL+uOH3WCNWoGuOwHRm0U4
 u1Ela704zLNrNaFAjIsVSO47pR517UVfFC6/f4ZqU35YaJh5Y+fh/qu+kpedhMHTyb
 ze3zpbP4e+/mg==
Received: by mail-ed1-f47.google.com with SMTP id w18so4546209edc.0;
 Wed, 17 Mar 2021 17:41:39 -0700 (PDT)
X-Gm-Message-State: AOAM532QrX98Jds/y+J3e1Ke9i4todaM+364cP4qTxz8mIq1roq4Edlc
 M8AjUb6AaeVdavu6LdyYsS1QSo+roOifmpcgfg==
X-Google-Smtp-Source: ABdhPJwMzddDsRL8I33MhffqwoNiBgxeGM1JoCsyv0MHPlhw5w9VDGlLglkIdTIDlBT3lzFYudhs/kFq9pB2MXCDdrk=
X-Received: by 2002:a50:ec07:: with SMTP id g7mr468206edr.72.1616028097740;
 Wed, 17 Mar 2021 17:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201027160631.608503-1-fparent@baylibre.com>
 <20201030191714.GA4171611@bogus>
 <CAAOTY_8LwVDxZnSQAdK7mS8MAFZ1y_0EnSzj3UqeCxq-Tc5FuQ@mail.gmail.com>
 <CAOwMV_wWqCsVTmt-0DDeB-WHdQKiKqT63O6sX2nFM27t34Osug@mail.gmail.com>
In-Reply-To: <CAOwMV_wWqCsVTmt-0DDeB-WHdQKiKqT63O6sX2nFM27t34Osug@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 18 Mar 2021 08:41:26 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9b_88qzEov0mMzrrR-61TvS9-7QY=gaCzUY=KaSqPWfw@mail.gmail.com>
Message-ID: <CAAOTY_9b_88qzEov0mMzrrR-61TvS9-7QY=gaCzUY=KaSqPWfw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mediatek: mmsys: add mt1867 binding
To: Fabien Parent <fparent@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 DTML <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_004141_677904_0225A86A 
X-CRM114-Status: GOOD (  19.90  )
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

SGksIE1hdHRoaWFzOgoKUGluZyBhZ2Fpbi4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgpGYWJpZW4g
UGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4g5pa8IDIwMjHlubQy5pyIMjTml6Ug6YCx5LiJ
IOS4iuWNiDY6MjHlr6vpgZPvvJoKPgo+IEhpIE1hdHRoaWFzLAo+Cj4gUGluZ2luZyB5b3UgaW4g
Y2FzZSB5b3UgZGlkbid0IHNlZSBAQ2h1bi1LdWFuZyBIdSdzIHF1ZXN0aW9uIGZvciB5b3UuCj4K
PiBUaGFua3MsCj4gQmVzdCByZWdhcmRzLAo+IEZhYmllbgo+Cj4gT24gU3VuLCBKYW4gMTAsIDIw
MjEgYXQgMTI6MTggQU0gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4KPiA+IEhpLCBNYXR0aGlhczoKPiA+Cj4gPiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiDmlrwgMjAyMOW5tDEw5pyIMzHml6Ug6YCx5YWtIOS4iuWNiDM6MTflr6vpgZPvvJoK
PiA+ID4KPiA+ID4gT24gVHVlLCAyNyBPY3QgMjAyMCAxNzowNjoyOSArMDEwMCwgRmFiaWVuIFBh
cmVudCB3cm90ZToKPiA+ID4gPiBBZGQgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBNVDgxNjcg
U29DLgo+ID4KPiA+IEV2ZW4gdGhvdWdoIHRoZSB0aXRsZSBuZWVkIHRvIGNoYW5nZSB0byAnbXQ4
MTY3JywgdGhpcyBwYXRjaCBsb29rcwo+ID4gZ29vZCB0byBtZS4gSG93IGRvIHlvdSB0aGluayBh
Ym91dCB0aGlzIHBhdGNoPyBPbmUgZHJtIHBhdGNoIFsxXQo+ID4gZGVwZW5kIG9uIHRoaXMgcGF0
Y2gsIGlmIHlvdSBsaWtlIHRoaXMgcGF0Y2gsIGNvdWxkIHlvdSBhcHBsaWVkIHRoaXMKPiA+IHBh
dGNoIGZpcnN0Pwo+ID4KPiA+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMDEwMjMxMzMxMzAuMTk0MTQwLTYtZnBhcmVudEBi
YXlsaWJyZS5jb20vCj4gPgo+ID4gUmVnYXJkcywKPiA+IENodW4tS3VhbmcuCj4gPgo+ID4gPiA+
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRmFiaWVuIFBhcmVudCA8ZnBhcmVudEBiYXlsaWJyZS5j
b20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRp
YXRlay9tZWRpYXRlayxtbXN5cy50eHQgICAgICAgICAgfCAxICsKPiA+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiA+ID4KPiA+ID4KPiA+ID4gQWNrZWQtYnk6IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiA+Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdAo+ID4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
