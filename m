Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6D2C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 14:31:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC87206C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 14:31:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S06gL2Gk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EC87206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DK7MhzGEqhfgZ4wRq7dSi1B6ZGM1bffpbPtySgS339o=; b=S06gL2Gk2EMn9W
	aCKWQbeIWQ57/8DD7lLJIaMbBy+8xR+r18JMhaj/UeuPtZUtCf42MBsDS1l9+QsbSXy/P5iFqsunk
	mfrADwv5zEUMq5gIfC8/i0YxFx3DUwK/kyV4/OGxOi+jPM0vBaELEaf6OMbnWW6WPkq3cuBS+NOQ+
	dEApgebq2KDKin2rAY+mdjswZQ77ZoT0nXtExDKoTZNyQ4jK3PttYP/IP6z4Apl0GehyHrdZSZI4F
	G96lecuCNnWPk4PkMFe/T+etOK72O/aJCDMtAokq48h483Pk/SpwKd/jJsG3ni0+JiebRt2WnNcVT
	/ZRqfC1jVYcgqXJ+uN1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMuh0-00039V-9t; Fri, 10 Apr 2020 14:31:38 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMugq-00030S-EE; Fri, 10 Apr 2020 14:31:29 +0000
Received: by mail-oi1-f195.google.com with SMTP id o25so1504811oic.11;
 Fri, 10 Apr 2020 07:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KmPT0kqXRKOHeqpvmmMJlgFcmC7GqFpKeaTOCrQ8Wtg=;
 b=s57XVxcNTjll+ZElyUXWtMB34+POUxH9Ni81kQP0EFqYBOh+/5IGP3juhEerCwfV5K
 ouIjSi8aULG0VTCKTFjXgq0unQu444Zlp7CTDXEZqIvVGTqC7IB7UWHzoG2rnsRpgy27
 KRHwFp26g6Xo+BkIiZj4nM/tMQ412tAkDTlddIfjjg04HDwT6zw00SPNDZbuwcmV+qqa
 1UBm0xl4O1uT5T9mL2xuQxH0baxvNOf80/EHZsQtP0dvCfQGt75L47v4z12yE9VadwbM
 M3+e1O7xW0acBW06Hyuz7/CaXuSVavS0w1O6zkIYbwf+NrB8Tj1EFK2i9LgiylYGQ6He
 hg+g==
X-Gm-Message-State: AGi0PubunyP7ILQmU9+4wfXDznsX6iRJfnzhtYAiCIn3MDtU2Jm2jpba
 GmVtc4ZyePXXczWg+JMpQK2j7lG6KH+YGY4xLWc=
X-Google-Smtp-Source: APiQypLr/SVeq2mdMekyoC1fUcboiqejAedCf/X8jFVX6LIVAyFSHTCwj5yNU/ZuaKgxmeqtpp5acBArep16IQooSIY=
X-Received: by 2002:aca:ac09:: with SMTP id v9mr3407739oie.148.1586529086780; 
 Fri, 10 Apr 2020 07:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200410142648.18599-1-geert@linux-m68k.org>
In-Reply-To: <20200410142648.18599-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Apr 2020 16:31:15 +0200
Message-ID: <CAMuHMdUghCZuh1zGbi=_9s7pMB34TuawMQ-b6N+f+hDdPOAs0Q@mail.gmail.com>
Subject: Re: [PATCH] netfilter: nft_fwd_netdev: Fix CONFIG_NET_CLS_ACT=n build
To: Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_073128_474375_A4E3C1AD 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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
Cc: Linux IOMMU <iommu@lists.linux-foundation.org>,
 linux-mediatek@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBcHIgMTAsIDIwMjAgYXQgNDoyNiBQTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiBJZiBDT05GSUdfTkVUX0NMU19BQ1Q9bjoKPgo+ICAg
ICBuZXQvbmV0ZmlsdGVyL25mdF9md2RfbmV0ZGV2LmM6IEluIGZ1bmN0aW9uIOKAmG5mdF9md2Rf
bmV0ZGV2X2V2YWzigJk6Cj4gICAgIG5ldC9uZXRmaWx0ZXIvbmZ0X2Z3ZF9uZXRkZXYuYzozMjox
MDogZXJyb3I6IOKAmHN0cnVjdCBza19idWZm4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYdGNf
cmVkaXJlY3RlZOKAmQo+ICAgICAgIHBrdC0+c2tiLT50Y19yZWRpcmVjdGVkID0gMTsKPiAgICAg
ICAgICAgICAgIF5+Cj4gICAgIG5ldC9uZXRmaWx0ZXIvbmZ0X2Z3ZF9uZXRkZXYuYzozMzoxMDog
ZXJyb3I6IOKAmHN0cnVjdCBza19idWZm4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYdGNfZnJv
bV9pbmdyZXNz4oCZCj4gICAgICAgcGt0LT5za2ItPnRjX2Zyb21faW5ncmVzcyA9IDE7Cj4gICAg
ICAgICAgICAgICBefgo+Cj4gRml4IHRoaXMgYnkgcHJvdGVjdGluZyB0aGlzIGNvZGUgaHVuayB3
aXRoIHRoZSBhcHByb3ByaWF0ZSAjaWZkZWYuCj4KPiBSZXBvcnRlZC1ieTogbm9yZXBseUBlbGxl
cm1hbi5pZC5hdQo+IEZpeGVzOiBiY2ZhYmVlMWFmZDk5NDg0ICgibmV0ZmlsdGVyOiBuZnRfZndk
X25ldGRldjogYWxsb3cgdG8gcmVkaXJlY3QgdG8gaWZiIHZpYSBpbmdyZXNzIikKPiBTaWduZWQt
b2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgoKUGxlYXNl
IGlnbm9yZSwgd3JvbmcgcGF0Y2guClNvcnJ5IGZvciB0aGUgbWVzcy4KCkdye29ldGplLGVldGlu
Z31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02
OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
