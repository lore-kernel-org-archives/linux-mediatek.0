Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61ABC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 07:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3S4Yt9KRW9mIMVSzDkJNrOjrrrON2LvriyMnFjZOzM=; b=Fl5xqguOoZEXBn
	IW3sK6g/6TvzLH1C7Bgm3uWsLD5Ccc6YN6Qs8b042QWIQBqoGD6gYSroQEw5XcOewBsU8pBDAvkLa
	zXxCBHskhqFfWX21wspnDI/87ips75JGetTQTJvgty6tT6mXGnTjKsNYIhb/4+iC0sWIC/GgbqIn2
	Y1suJClvhvtS2KStg1eZD3b3kj0lQLT11jvwCkjT4q8xw8CjXbasNS0CgsALaFqooKtjvjdfiHHfW
	z+LUGvJ78AjIwLLOgz9UkWGRp+h5ZDg5rj3bTX0MLmbdCfwDTFAy2HoHXHAW0JK/qs0wd5OMbeylv
	u6hiunBpAZqHnyzDZo9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPfx2-005aGS-6s; Thu, 03 Mar 2022 07:32:40 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPfwy-005aFa-PD; Thu, 03 Mar 2022 07:32:38 +0000
Received: by mail-ej1-x636.google.com with SMTP id hw13so8663697ejc.9;
 Wed, 02 Mar 2022 23:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Gor8M86/GsIuBlid/S84lkBznvRDaKBCWzgLUKh5JV4=;
 b=k+fk9urovAn8Fq6hF831psJF6X0Hx41hiPVDAocMfW4Gi2tjP5gBRRyYi9UY1gS3y9
 T1f7NxhpZChRCZGs3wiKfQBYFQeu68Ugjwk2rWVNy++UqI5E9Ffm7Qe5sREsy932o9zn
 yoQiy9LiamLlfFC8y8nGBw2mIwTduboT8pHpf33UZ2RGjV2D/meZqmuHsAbl7tfxfJuC
 e8redX9TOEvOJZ9E1AYG0yGidZEg6kfprz6yLCxUQC7gampXaGyLYaXWTA6umkTeR66S
 hL8UX9htvKnv+kjTxwKZtpIsvgv4G4bDiBBsZxSW5S7a6ZZ6AFWNSxZHN5mDaVwEmoV0
 Hg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Gor8M86/GsIuBlid/S84lkBznvRDaKBCWzgLUKh5JV4=;
 b=P33p+eyhP7OhhXRrIV9TMc0fz6J2LI1KZ7Nzky7PG2UWIKwweglJMvAbwG2sV7qFzw
 4vifvZW+YcKCOU1F2bDdM4MakOytJWyXJuyEbhK5Ht4EAoXOLJv9P+bbXNEXXV5sEYj4
 qYDal4DhpFb3thEpupnBMVMsWfc3Mpl60SMExbOS5DfDYwK9pEvyfvDYtcBO960dSTO2
 tDXhAzdaAzKTNz+kNuX5hpQ7PRjpD3mGyyN9Wd8uNdssKUH8Ez5U4mEawdiMaZTZxH0D
 cXs3qFcKhkuvMbCStyEqlX40noXg1IPezOGnCspwxxGM8JwHD7e1MLPX5C93i9cLtVdO
 mBnA==
X-Gm-Message-State: AOAM531mMoFAhsgQVEKkfeSVGeOWb67lFtc/Zm1fuZg2nPyES4LluxKR
 9HxMV6IS1J8MU1YGEUvaT+c=
X-Google-Smtp-Source: ABdhPJzeteUoFgq8PxHWf79kt1+XNtdp+qSeHQzci99kHRtMUTD40dS4a5KNav7C0/39ueCDeIyc3w==
X-Received: by 2002:a17:906:7c93:b0:6cd:341a:a1d5 with SMTP id
 w19-20020a1709067c9300b006cd341aa1d5mr25639417ejo.698.1646292754302; 
 Wed, 02 Mar 2022 23:32:34 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:896:faf2:6663:1f74])
 by smtp.gmail.com with ESMTPSA id
 gj18-20020a170907741200b006da82539c83sm410819ejc.73.2022.03.02.23.32.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Mar 2022 23:32:33 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
Date: Thu, 3 Mar 2022 08:32:31 +0100
Cc: Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, 
 "bjohannesmeyer@gmail.com" <bjohannesmeyer@gmail.com>,
 "c.giuffrida@vu.nl" <c.giuffrida@vu.nl>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gustavo@embeddedor.com" <gustavo@embeddedor.com>,
 "h.j.bos@vu.nl" <h.j.bos@vu.nl>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "jgg@ziepe.ca" <jgg@ziepe.ca>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>, 
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, 
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>, 
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rppt@kernel.org" <rppt@kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>, 
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
 "v9fs-developer@lists.sourceforge.net" <v9fs-developer@lists.sourceforge.net>
Message-Id: <A568BD90-FE81-4740-B1D3-C795EB636A5A@gmail.com>
References: <1077f17e50d34dc2bbfdf4e52a1cb2fd@AcuMS.aculab.com>
 <20220303022729.9321-1-xiam0nd.tong@gmail.com>
 <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
To: David Laight <David.Laight@ACULAB.COM>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_233236_857728_C0C3167D 
X-CRM114-Status: GOOD (  31.68  )
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

Cgo+IE9uIDMuIE1hciAyMDIyLCBhdCAwNTo1OCwgRGF2aWQgTGFpZ2h0IDxEYXZpZC5MYWlnaHRA
QUNVTEFCLkNPTT4gd3JvdGU6Cj4gCj4gRnJvbTogWGlhb21lbmcgVG9uZwo+PiBTZW50OiAwMyBN
YXJjaCAyMDIyIDAyOjI3Cj4+IAo+PiBPbiBXZWQsIDIgTWFyIDIwMjIgMTQ6MDQ6MDYgKzAwMDAs
IERhdmlkIExhaWdodAo+PiA8RGF2aWQuTGFpZ2h0QEFDVUxBQi5DT00+IHdyb3RlOgo+Pj4gSSB0
aGluayB0aGF0IGl0IHdvdWxkIGJlIGJldHRlciB0byBtYWtlIGFueSBhbHRlcm5hdGUgbG9vcCBt
YWNybwo+Pj4ganVzdCBzZXQgdGhlIHZhcmlhYmxlIHRvIE5VTEwgb24gdGhlIGxvb3AgZXhpdC4K
Pj4+IFRoYXQgaXMgZWFzaWVyIHRvIGNvZGUgZm9yIGFuZCB0aGUgY29tcGlsZXIgbWlnaHQgYmUg
cGVyc3VhZGVkIHRvCj4+PiBub3QgcmVkbyB0aGUgdGVzdC4KPj4gCj4+IE5vLCB0aGF0IHdvdWxk
IGxlYWQgdG8gYSBOVUxMIGRlcmVmZXJlbmNlLgo+IAo+IFdoeSwgaXQgd291bGQgbWFrZSBpdCBi
IGV0aGUgc2FtZSBhcyB0aGUgJ2Vhc3kgdG8gdXNlJzoKPiAJZm9yIChpdGVtID0gaGVhZDsgaXRl
bTsgaXRlbSA9IGl0ZW0tPm5leHQpIHsKPiAJCS4uLgo+IAkJaWYgKC4uLikKPiAJCQlicmVhazsK
PiAJCS4uLgo+IAl9Cj4gCWlmICghaXRlbSkKPiAJCXJldHVybjsKPiAKPj4gVGhlIHByb2JsZW0g
aXMgdGhlIG1pcy11c2Ugb2YgaXRlcmF0b3Igb3V0c2lkZSB0aGUgbG9vcCBvbiBleGl0LCBhbmQK
Pj4gdGhlIGl0ZXJhdG9yIHdpbGwgYmUgdGhlIEhFQUQncyBjb250YWluZXJfb2YgcG9pbnRlciB3
aGljaCBwb2ludGVycwo+PiB0byBhIHR5cGUtY29uZnVzZWQgc3RydWN0LiBTaWRlbm90ZTogVGhl
ICptaXMtdXNlKiBoZXJlIHJlZmVycyB0bwo+PiBtaXN0YWtlbHkgYWNjZXNzIHRvIG90aGVyIG1l
bWJlcnMgb2YgdGhlIHN0cnVjdCwgaW5zdGVhZCBvZiB0aGUKPj4gbGlzdF9oZWFkIG1lbWJlciB3
aGljaCBhY3V0YWxseSBpcyB0aGUgdmFsaWQgSEVBRC4KPiAKPiBUaGUgcHJvYmxlbSBpcyB0aGF0
IHRoZSBIRUFEJ3MgY29udGFpbmVyX29mIHBvaW50ZXIgc2hvdWxkIG5ldmVyCj4gYmUgY2FsY3Vs
YXRlZCBhdCBhbGwuCj4gVGhpcyBpcyB3aGF0IGlzIGZ1bmRhbWVudGFsbHkgYnJva2VuIGFib3V0
IHRoZSBjdXJyZW50IGRlZmluaXRpb24uCj4gCj4+IElPVywgeW91IHdvdWxkIGRlcmVmZXJlbmNl
IGEgKE5VTEwgKyBvZmZzZXRfb2ZfbWVtYmVyKSBhZGRyZXNzIGhlcmUuCj4gCj4gV2hlcmU/Cj4g
Cj4+IFBsZWFzZSByZW1pbmQgbWUgaWYgaSBtaXNzZWQgc29tZXRoaW5nLCB0aGFua3MuCj4+IAo+
PiBDYW4geW91IHNoYXJlIHlvdXIgImFsdGVybmF0aXZlIGRlZmluaXRpb25zIiBkZXRhaWxzPyB0
aGFua3MhCj4gCj4gVGhlIGxvb3Agc2hvdWxkIHByb2JhYmx5IHVzZSBhcyBleHRyYSB2YXJpYWJs
ZSB0aGF0IHBvaW50cwo+IHRvIHRoZSAnbGlzdCBub2RlJyBpbiB0aGUgbmV4dCBzdHJ1Y3R1cmUu
Cj4gU29tZXRoaW5nIGxpa2U6Cj4gCWZvciAoeHh4ICppdGVyID0gaGVhZC0+bmV4dDsKPiAJCWl0
ZXIgPT0gJmhlYWQgPyAoKGl0ZW0gPSBOVUxMKSwwKSA6ICgoaXRlbSA9IGxpc3RfaXRlbShpdGVy
KSwxKSk7Cj4gCQlpdGVyID0gaXRlbS0+bWVtYmVyLT5uZXh0KSB7Cj4gCSAgIC4uLgo+IFdpdGgg
YSBiaXQgb2YgY2FzdGluZyB5b3UgY2FuIHVzZSAnaXRlbScgdG8gaG9sZCAnaXRlcicuCgpJIHRo
aW5rIHRoaXMgd291bGQgbWFrZSBzZW5zZSwgaXQgd291bGQgbWVhbiB5b3Ugb25seSBhc3NpZ24g
dGhlIGNvbnRhaW5pbmcKZWxlbWVudCBvbiB2YWxpZCBlbGVtZW50cy4KCkkgd2FzIHRoaW5raW5n
IHNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXMgb2Y6CgojZGVmaW5lIGxpc3RfZm9yX2VhY2hfZW50
cnkocG9zLCBoZWFkLCBtZW1iZXIpCQkJCQlcCglmb3IgKHN0cnVjdCBsaXN0X2hlYWQgKmxpc3Qg
PSBoZWFkLT5uZXh0LCB0eXBlb2YocG9zKSBwb3M7CVwKCSAgICAgbGlzdCA9PSBoZWFkID8gMCA6
ICgoIHBvcyA9IGxpc3RfZW50cnkocG9zLCBsaXN0LCBtZW1iZXIpLCAxKSk7CVwKCSAgICAgbGlz
dCA9IGxpc3QtPm5leHQpCgpBbHRob3VnaCB0aGUgaW5pdGlhbGl6YXRpb24gYmxvY2sgb2YgdGhl
IGZvciBsb29wIGlzIG5vdCB2YWxpZCBDLCBJJ20Kbm90IHN1cmUgdGhlcmUgaXMgYW55IHdheSB0
byBkZWNsYXJlIHR3byB2YXJpYWJsZXMgb2YgYSBkaWZmZXJlbnQgdHlwZQppbiB0aGUgaW5pdGlh
bGl6YXRpb24gcGFydCBvZiB0aGUgbG9vcC4KCkkgYmVsaWV2ZSBhbGwgdGhpcyBkb2VzIGlzIGdl
dCByaWQgb2YgdGhlICZwb3MtPm1lbWJlciA9PSAoaGVhZCkgY2hlY2sKdG8gdGVybWluYXRlIHRo
ZSBsaXN0LgpJdCBhbG9uZSB3aWxsIG5vdCBmaXggYW55IG9mIHRoZSBvdGhlciBpc3N1ZXMgdGhh
dCB1c2luZyB0aGUgaXRlcmF0b3IKdmFyaWFibGUgYWZ0ZXIgdGhlIGxvb3AgY3VycmVudGx5IGhh
cy4KCgpBRkFJSyBBZHJpw6FuIE1vcmVubyBpcyB3b3JraW5nIG9uIGRvaW5nIHNvbWV0aGluZyBh
bG9uZyB0aG9zZSBsaW5lcwpmb3IgdGhlIGxpc3QgaXRlcmF0b3IgaW4gb3BlbnZzd2l0Y2ggKHRo
YXQgd2FzIHNpbWlsYXIgdG8gdGhlIGtlcm5lbApvbmUgYmVmb3JlKSBbMV0uCgpJICp0aGluayog
dGhleSBkb24ndCBkZWNsYXJlICdwb3MnIHdpdGhpbiB0aGUgbG9vcCB3aGljaCB3ZSAqZG8gd2Fu
dCoKdG8gYXZvaWQgYW55IHVzZXMgb2YgaXQgYWZ0ZXIgdGhlIGxvb3AuCihJZiBwb3MgaXMgbm90
IGRlY2xhcmVkIGluIHRoZSBpbml0aWFsaXphdGlvbiBibG9jaywgc2hhZG93aW5nIHRoZQoqb3V0
ZXIqIHBvcywgaXQgd291bGQganVzdCBwb2ludCB0byB0aGUgbGFzdCBlbGVtZW50IG9mIHRoZSBs
aXN0IG9yIHN0YXkKdW5pbml0aWFsaXplZCBpZiB0aGUgbGlzdCBpcyBlbXB0eSkuCgoKWzFdIGh0
dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vb3ZzLWRldkBvcGVudnN3aXRjaC5vcmcvbXNnNjM0
OTcuaHRtbAoKCj4gCj4+IAo+Pj4gT1RPSCB0aGVyZSBtYXkgYmUgYWx0ZXJuYXRpdmUgZGVmaW5p
dGlvbnMgdGhhdCBjYW4gYmUgdXNlZCB0byBnZXQKPj4+IHRoZSBjb21waWxlciAob3Igb3RoZXIg
Y29tcGlsZXItbGlrZSB0b29scykgdG8gZGV0ZWN0IGJyb2tlbiBjb2RlLgo+Pj4gRXZlbiBpZiB0
aGUgZGVmaW5pdGlvbiBjYW4ndCBwb3NzaWJseSBnZW5lcmF0ZSBhIHdvcmtpbmcga2Vycm5lbC4K
Pj4gCj4+IFRoZSAibGlzdF9mb3JfZWFjaF9lbnRyeV9pbnNpZGUocG9zLCB0eXBlLCBoZWFkLCBt
ZW1iZXIpIiB3YXkgbWFrZXMKPj4gdGhlIGl0ZXJhdG9yIGludmlzaWFibGUgb3V0c2lkZSB0aGUg
bG9vcCwgYW5kIHdvdWxkIGJlIGNhdGNoZWQgYnkKPj4gY29tcGlsZXIgaWYgdXNlLWFmdGVyLWxv
b3AgdGhpbmdzIGhhcHBlbmVkLgo+IAo+IEl0IGlzIGFsc28gYSBjb21wZXRlIFBJVEEgZm9yIGFu
eXRoaW5nIGRvaW5nIGEgc2VhcmNoLgo+IAo+IAlEYXZpZAo+IAo+IC0KPiBSZWdpc3RlcmVkIEFk
ZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywg
TUsxIDFQVCwgVUsKPiBSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQo+IAoKLSBKYWtv
YgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
