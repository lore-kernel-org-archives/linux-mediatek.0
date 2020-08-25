Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C5AC433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 10:02:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A76C2068F
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 10:02:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vMv/RhMu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMm7sBzV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A76C2068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mRirk3UyOUMzA+89doxjMZkC6jARkA6GSa0OGlFi0g4=; b=vMv/RhMuFw3WTIAp3ylp5pgqR
	Lla4sij+0EefUlxGZrlaBeqNJF/n6SrJ+V87PZghEz7I8AF678N9ZQvT+JPVnRF/xKtySbEP6WdQV
	IoUkTWTQpZzyYhxjedc4/WuptR46r82BhuiubuOz8drmPHO69zuP+AD4N/JdgwdT7HVN305JhH7nI
	OPvSjlpU/4A3aBBlE/R2HQA7pnvaVr4Aor5QT4B9tJ0D9P06LIP6vFo1h+NZwxaOIRdZ57eBqIXag
	y3hk+Z2JGPXXUgOZNaRIyQHDmR/44zf6DQ6fQ3NqGgjge8NxVpWX5YBhb6ulaXNljnDYknccnVFo+
	TS77j5u3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAVmJ-0008Kv-Ki; Tue, 25 Aug 2020 10:02:07 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAVmB-0008G4-5w; Tue, 25 Aug 2020 10:01:59 +0000
Received: by mail-io1-xd41.google.com with SMTP id i10so6237255iow.3;
 Tue, 25 Aug 2020 03:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cdXOSaIFKvjsoYRk7r3Xc53JhhLYHxWYCI7Z/n8m81k=;
 b=IMm7sBzV5X4zwHRscPuoC3u9UZqt64hd8sserQGXxqI6mbxEAT5Ms9HrY+73TDaR9X
 hssRtyidc1rNEIWFRnnPUI8DpBEQrN/tb7Xv/0hzfkC+HPdeVpoJcP/C34djpr2BOoQm
 AtWheKvk4bAllhjI0NxhEAOMQunK5VwKRfKd2b3EH57VD00UNQ+ReJxKWe4aBV0Tr+eX
 nZhtemUUyga8ZwenQ/ktaRhJCt3HwXkCDpOS4eFv7Xwtb3Ppefq/4m95ohaW2gWW/luY
 clmlgEXY6U5luciZ3tHnvcw5IKpvvPm3i1UqZr+d2hDUemTdh1T+zo0jnSf0Juu6TXjM
 8SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cdXOSaIFKvjsoYRk7r3Xc53JhhLYHxWYCI7Z/n8m81k=;
 b=TiaCGa0QF99y9aZHRQaotORf8/s3UI8ZnMdRwt/md/iHslektKWCaDt/C4IwBQTbpp
 7kT/tCiisgVNlp3W8ld7Sp3rkI8a+IEQC9kvGt5dnlqNbY1VQZnl8saeIwC9knSiluet
 Fofo1UNJF0i5bXXaBiLBJSXeB3lIc+JJX1jbYIppNRNQndWL5ABnMP7tx/1gEopoMoQe
 f2oDWGnLrUtHZfrolo6PlB9+CoyIzKyIjb+mys+Fr1P5O0XP3u+SzwhXGruhvasuSFBI
 uIDRodrt4CzOJqW/5FNYrbynn6XOcOFTYg44GUTSyjiqJf51f+1I7kYjDUj7mry0qQKX
 57Kg==
X-Gm-Message-State: AOAM531Odtt1uGVlp+DWaDQTPorOkRspLhqJrhb1afSEmCaCuc34Rwdf
 9HGsw8UCADm/6mjv17uesxfyKqDbAhy5f7h4jj4=
X-Google-Smtp-Source: ABdhPJzDO96H7XqMQSuPKRRm7Xpb0ASLiPOw/vsNFPklO/wlYprIV8dh62cilZJfg4HxBBtKiJJpZmTY1PLmOH2OeX8=
X-Received: by 2002:a6b:dc0e:: with SMTP id s14mr2679164ioc.8.1598349717314;
 Tue, 25 Aug 2020 03:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597910022-22617-3-git-send-email-gene.chen.richtek@gmail.com>
 <20200820113015.GB5854@sirena.org.uk>
 <CAE+NS36C0AwbrFJdYGY6_n_g3DVitp_e1GfZUxjMbKu1bJ_t4w@mail.gmail.com>
 <20200824194840.GF4676@sirena.org.uk>
 <CAE+NS37p38dAN1bAi_VvEYYGNiWDVFKrdHL-hTgi2nim_7Zvqw@mail.gmail.com>
 <20200825093404.GB5379@sirena.org.uk>
In-Reply-To: <20200825093404.GB5379@sirena.org.uk>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 25 Aug 2020 18:01:46 +0800
Message-ID: <CAE+NS35eh9PhRA1M2f2med52WhRsEfWp=zWUfgETq4odHouxDg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] regulator: mt6360: Add DT binding documentation
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_060159_241272_8576D077 
X-CRM114-Status: GOOD (  13.98  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Gene Chen <gene_chen@richtek.com>, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDjmnIgyNeaXpSDpgLHk
uowg5LiL5Y2INTozNOWvq+mBk++8mgo+Cj4gT24gVHVlLCBBdWcgMjUsIDIwMjAgYXQgMDU6MjE6
MDZQTSArMDgwMCwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gTWFyayBCcm93biA8YnJvb25pZUBrZXJu
ZWwub3JnPiDmlrwgMjAyMOW5tDjmnIgyNeaXpSDpgLHkuowg5LiK5Y2IMzo0OeWvq+mBk++8mgo+
Cj4gPiA+IFNvIHNob3VsZG4ndCB0aGVyZSBiZSBhIGRvY3VtZW50ZWQgTERPX1ZJTjEvMiB0aGVu
Pwo+Cj4gPiBMRE9fVklOeCBpcyBIVyBkZXNpZ24gbGF5b3V0LCBzbyBhY3R1YWxseSBpdCBjYW4n
dCBiZSBjaGFuZ2VkIGJ5IGRldmljZSB0cmVlLgo+ID4gTERPX1ZJTjEvTERPX1ZJTjIgc3VwcGx5
IGZyb20gVlNZUywgbm90IHJlZ3VsYXRvciwgc28gSSB0aGluayB1c3VhbGx5Cj4gPiBub3QgdG8g
c2hvdyB0aGUgc3VwcGx5IGZyb20gaW4gZGV2aWNlIHRyZWUuCj4gPiBvciBJIHNob3VsZCBkZWNs
YXJlIGEgZHVtbXkgcmVmZXJlbmNlIHRvIHN5c3RlbSBwb3dlciBsaWtlICIqLXN1cHBseSA9Cj4g
PiA8JnN5c3RlbV9wb3dlcj47Ij8KPgo+IFdoZW4geW91IHNheSBpdCdzIGZyb20gdGhlIGhhcmR3
YXJlIGRlc2lnbiBkbyB5b3UgbWVhbiBpdCdzIGZpeGVkIGJ5IHRoZQo+IHNpbGljb24gb3IgaXMg
dGhpcyBzb21ldGhpbmcgdGhhdCdzIGZpeGVkIGluIHRoZSBib2FyZD8KCmZpeGVkIGluIHRoZSBi
b2FyZCwgbm90IHNpbGljb24uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
