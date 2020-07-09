Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D836C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 13:02:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BF7F2077D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 13:02:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="19sjbob8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tfp0iRBH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BF7F2077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rdCIrdMYll2xyw6JkDCBoBnnMX5HZxQ6LxZR7AAdse0=; b=19sjbob8/JgBTLzOM0BHrYooe
	t9x/RSINQ3nO6nTEEx4ifPirb8+LwUo+Y/k6w4CaxzdhxjEKJ/MPUfzjLLSvUsV1tCriQmGAoh4/N
	oGsEweUTS4Krm4VnOuQr3TELobaUE5GvckcUt/uA3fFZLfroQvR35U4U14XyI9UOql9ubMXH7lmLG
	T4su/B0qs5UWyt/wlZVXH1Gc3FRe+m88+JSca0/26d+bLaWnPBJ0WrwO5UnpItpqiMkzo8L+JTYpw
	/ZEeCY3jwd4TptXQqJZBEi0gASDNrGVnGp6uCU3OmU1wDNmkBHqlBO+zRRMUKCluiTHpVI588d5x2
	M8a2Nch+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtWBe-0001gP-Tm; Thu, 09 Jul 2020 13:02:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtWBa-0001ec-Ea; Thu, 09 Jul 2020 13:01:59 +0000
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 139612073A;
 Thu,  9 Jul 2020 13:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594299717;
 bh=svdZb33Y7t1B2vg6ybn6AQgGBJfX7TqitPVoZxOAkL4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Tfp0iRBHR5aRvFS09s+qOKpZQFFKbB2kScnHzox4/rJKRdocXBIsmZ28HBb3wD6CE
 fKw6nsoiJUi2ZgfsRnVpWaI7fWnNz2BK3OkaPyeUML/jj6UJmVbe7il6EwRsOjeAHl
 W+g1fWQZWJ2nrfLleVShsmjfFnoDtyXOcL1gBhhc=
Received: by mail-ed1-f46.google.com with SMTP id dg28so1738444edb.3;
 Thu, 09 Jul 2020 06:01:57 -0700 (PDT)
X-Gm-Message-State: AOAM531h0zWvkzofPxhyaJ0RrBT0XDh2J++jNuyrv1egsD3nHM3OS5vd
 apv+JS/4X8a0KNsrgawPJlBvy8SAf5XcW2mJjA==
X-Google-Smtp-Source: ABdhPJwXcokw3x2lqWpS4cVqHBkCVCiRJ+sqhgLCVDH335FOjvxmmxIFTWC0erzNbub7XMGUoCnGTGG4fug7NRxffhU=
X-Received: by 2002:a05:6402:1766:: with SMTP id
 da6mr69654748edb.48.1594299715658; 
 Thu, 09 Jul 2020 06:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <1594285927-1840-1-git-send-email-neal.liu@mediatek.com>
 <1594285927-1840-3-git-send-email-neal.liu@mediatek.com>
In-Reply-To: <1594285927-1840-3-git-send-email-neal.liu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 9 Jul 2020 21:01:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-7PwoPG_0ce2p4BCNQ3rundg40Bsni14XSmVETExkKkw@mail.gmail.com>
Message-ID: <CAAOTY_-7PwoPG_0ce2p4BCNQ3rundg40Bsni14XSmVETExkKkw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_090158_622465_2C81785B 
X-CRM114-Status: GOOD (  17.16  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfm
nIg55pelIOmAseWbmyDkuIvljYg1OjEz5a+r6YGT77yaCj4KPiBNZWRpYVRlayBidXMgZmFicmlj
IHByb3ZpZGVzIFRydXN0Wm9uZSBzZWN1cml0eSBzdXBwb3J0IGFuZCBkYXRhCj4gcHJvdGVjdGlv
biB0byBwcmV2ZW50IHNsYXZlcyBmcm9tIGJlaW5nIGFjY2Vzc2VkIGJ5IHVuZXhwZWN0ZWQKPiBt
YXN0ZXJzLgo+IFRoZSBzZWN1cml0eSB2aW9sYXRpb24gaXMgbG9nZ2VkIGFuZCBzZW50IHRvIHRo
ZSBwcm9jZXNzb3IgZm9yCj4gZnVydGhlciBhbmFseXNpcyBvciBjb3VudGVybWVhc3VyZXMuCj4K
PiBBbnkgb2NjdXJyZW5jZSBvZiBzZWN1cml0eSB2aW9sYXRpb24gd291bGQgcmFpc2UgYW4gaW50
ZXJydXB0LCBhbmQKPiBpdCB3aWxsIGJlIGhhbmRsZWQgYnkgbXRrLWRldmFwYyBkcml2ZXIuIFRo
ZSB2aW9sYXRpb24KPiBpbmZvcm1hdGlvbiBpcyBwcmludGVkIGluIG9yZGVyIHRvIGZpbmQgdGhl
IG11cmRlcmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmVhbCBMaXUgPG5lYWwubGl1QG1lZGlhdGVr
LmNvbT4KCltzbmlwXQoKPiArCj4gK3N0YXRpYyB1MzIgZ2V0X3NoaWZ0X2dyb3VwKHN0cnVjdCBt
dGtfZGV2YXBjX2NvbnRleHQgKmRldmFwY19jdHgsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50IHNsYXZlX3R5cGUsIGludCB2aW9faWR4KQoKdmlvX2lkeCAgaXMgdXNlbGVzcywgc28g
cmVtb3ZlIGl0LgoKPiArewo+ICsgICAgICAgdTMyIHZpb19zaGlmdF9zdGE7Cj4gKyAgICAgICB2
b2lkIF9faW9tZW0gKnJlZzsKPiArICAgICAgIGludCBiaXQ7Cj4gKwo+ICsgICAgICAgcmVnID0g
bXRrX2RldmFwY19wZF9nZXQoZGV2YXBjX2N0eCwgc2xhdmVfdHlwZSwgVklPX1NISUZUX1NUQSwg
MCk7Cj4gKyAgICAgICB2aW9fc2hpZnRfc3RhID0gcmVhZGwocmVnKTsKPiArCj4gKyAgICAgICBm
b3IgKGJpdCA9IDA7IGJpdCA8IDMyOyBiaXQrKykgewo+ICsgICAgICAgICAgICAgICBpZiAoKHZp
b19zaGlmdF9zdGEgPj4gYml0KSAmIDB4MSkKPiArICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1cm4gYml0Owo+ICt9Cj4gKwoKW3NuaXBd
Cgo+ICsKPiArLyoKPiArICogZGV2YXBjX3Zpb2xhdGlvbl9pcnEgLSB0aGUgZGV2YXBjIEludGVy
cnVwdCBTZXJ2aWNlIFJvdXRpbmUgKElTUikgd2lsbCBkdW1wCj4gKyAqICAgICAgICAgICAgICAg
ICAgICAgICB2aW9sYXRpb24gaW5mb3JtYXRpb24gaW5jbHVkaW5nIHdoaWNoIG1hc3RlciB2aW9s
YXRlcwo+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgYWNjZXNzIHNsYXZlLgo+ICsgKi8KPiAr
c3RhdGljIGlycXJldHVybl90IGRldmFwY192aW9sYXRpb25faXJxKGludCBpcnFfbnVtYmVyLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX2RldmFw
Y19jb250ZXh0ICpkZXZhcGNfY3R4KQo+ICt7Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX2Rl
dmljZV9pbmZvICoqZGV2aWNlX2luZm87Cj4gKyAgICAgICBpbnQgc2xhdmVfdHlwZV9udW07Cj4g
KyAgICAgICBpbnQgdmlvX2lkeCA9IC0xOwo+ICsgICAgICAgaW50IHNsYXZlX3R5cGU7Cj4gKwo+
ICsgICAgICAgc2xhdmVfdHlwZV9udW0gPSBkZXZhcGNfY3R4LT5zbGF2ZV90eXBlX251bTsKPiAr
ICAgICAgIGRldmljZV9pbmZvID0gZGV2YXBjX2N0eC0+ZGV2aWNlX2luZm87Cj4gKwo+ICsgICAg
ICAgZm9yIChzbGF2ZV90eXBlID0gMDsgc2xhdmVfdHlwZSA8IHNsYXZlX3R5cGVfbnVtOyBzbGF2
ZV90eXBlKyspIHsKCklmIHNsYXZlX3R5cGVfbnVtIGlzIDEsIEkgdGhpbmsgdGhlIGNvZGUgc2hv
dWxkIGJlIHNpbXBsZXIuCgo+ICsgICAgICAgICAgICAgICBpZiAoIW10a19kZXZhcGNfZHVtcF92
aW9fZGJnKGRldmFwY19jdHgsIHNsYXZlX3R5cGUsICZ2aW9faWR4KSkKPiArICAgICAgICAgICAg
ICAgICAgICAgICBjb250aW51ZTsKPiArCj4gKyAgICAgICAgICAgICAgIC8qIEVuc3VyZSB0aGF0
IHZpb2xhdGlvbiBpbmZvIGFyZSB3cml0dGVuIGJlZm9yZQo+ICsgICAgICAgICAgICAgICAgKiBm
dXJ0aGVyIG9wZXJhdGlvbnMKPiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAg
IHNtcF9tYigpOwo+ICsKPiArICAgICAgICAgICAgICAgbWFza19tb2R1bGVfaXJxKGRldmFwY19j
dHgsIHNsYXZlX3R5cGUsIHZpb19pZHgsIHRydWUpOwoKV2h5IGRvIHlvdSBtYXNrIGlycT8KCj4g
Kwo+ICsgICAgICAgICAgICAgICBjbGVhcl92aW9fc3RhdHVzKGRldmFwY19jdHgsIHNsYXZlX3R5
cGUsIHZpb19pZHgpOwo+ICsKPiArICAgICAgICAgICAgICAgbWFza19tb2R1bGVfaXJxKGRldmFw
Y19jdHgsIHNsYXZlX3R5cGUsIHZpb19pZHgsIGZhbHNlKTsKPiArICAgICAgIH0KPiArCj4gKyAg
ICAgICByZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gK30KPiArCj4gKy8qCj4gKyAqIHN0YXJ0X2RldmFw
YyAtIGluaXRpYWxpemUgZGV2YXBjIHN0YXR1cyBhbmQgc3RhcnQgcmVjZWl2aW5nIGludGVycnVw
dAo+ICsgKiAgICAgICAgICAgICAgIHdoaWxlIGRldmFwYyB2aW9sYXRpb24gaXMgdHJpZ2dlcmVk
Lgo+ICsgKi8KCltzbmlwXQoKPiArCj4gK3N0cnVjdCBtdGtfZGV2aWNlX2luZm8gewo+ICsgICAg
ICAgaW50IHN5c19pbmRleDsKClVzZWxlc3MsIHNvIHJlbW92ZSBpdC4KCj4gKyAgICAgICBpbnQg
Y3RybF9pbmRleDsKCkRpdHRvLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gKyAgICAgICBpbnQg
dmlvX2luZGV4Owo+ICt9Owo+ICsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
