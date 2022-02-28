Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F66C4167E
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 22:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FqDb+UH7sIGKP8uy6U++HMfFsRekJ80vz3weEIr88dw=; b=nGVoyJ8Nwcl6ne
	fBN31ajgZXSjBewZPaoImyrhbNqzWwy24bBdJq43LQkx2S47A98ghHJtCSvA8ozQ8n9T4RoHxuylm
	fjRhrf1J6A41NVza/WMVMTrWu01l5O4mOZp2jnxWPj3RfVuwN4KpxPGCXdgVBufKugNX1HRgM2r+r
	lkBKxlR3RhJndkxgtxzX6Xn/Ug/eYCCu18Wuu9YA7h7MggpXKzo9h1nRnUyTmgxDBidPfk1CuLkrC
	dDzcJ0CJwBGhldIRdNmLwsC4IXHmIgwy/O5M6po6S9D83Do5ffh8woGdidRh39pxaqWWoDYeHfOaR
	XwyFn38xJmbUhwU7JNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOo97-00EG2b-RC; Mon, 28 Feb 2022 22:05:33 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOo95-00EG21-8h; Mon, 28 Feb 2022 22:05:32 +0000
Received: by mail-ej1-x629.google.com with SMTP id vz16so27760602ejb.0;
 Mon, 28 Feb 2022 14:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rjAgW0TZYa01aB+RWuD5jL6/P65QVmPGzGS1fypwqkM=;
 b=SsE2iptdX/xTNU84zbtZf+FZ8hKTkJX9H9ZM578+fdgJrDU7+0yGKs3Y1+Ec8zM22z
 4L/SCSccM9eH+aBbsU9p5ll5VTrDlXvOt1QFHQZ0QoX++s1RFseEQQ8VJGBWAvwFCFIq
 jeFzH1SGTYgHS7irPmR7cmG6wYjaX3+E6LxhLklpw86+z7E18Zuelcsa1QvD5X9AuKj5
 NYlhLrqxXUYjh+QgOiXwDeMKoQqdSp4BR7hulFUTvSZMfnkNflEuO+lrt30n2JUf7UIn
 5TdA8KwzIEgmQjPXnxPtLxIzLgpwPLiA+LehnjNWRY5HBdt4E59Tm/VNBLrMAmAi/DS2
 EEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rjAgW0TZYa01aB+RWuD5jL6/P65QVmPGzGS1fypwqkM=;
 b=zqBTbWCT+t2VfnRDGmm88GB4ws/G/O2WFu9QfIfuQpa0dnNZqRbk/PQBwT4KCCHscq
 o7g6jn+wH8+FsrbjVG46f2zI0d2XqNSFKX/I0glN3yWcSf7euoQv9HXwbjRiU5L4BHS9
 OS36wySmhq1l4l1qDP7A/3V4uDprZYk51KC7GhTxZ83CLn3UNCEE8bnIlaBMZyKUe+Hb
 V75HJcO3Ov9Mi3cEIhiZIOlPJknSpYNOv3M8ezxo3V6CoxFuoDZABbg2QNZNoTpHNuWT
 visrEIZ69HXq2p5Dj20EDTUIZdz8HyV+P5XN1QiLgek7Tfjq0JCDjTDAGLFWnCyYt2dg
 hkZw==
X-Gm-Message-State: AOAM532Hzu2RL1jibtBJeLe+VLzF6IVkK6YtNGknxShp6K4L9Y/Dv4Ib
 eiWk9lb03BJ7Pa0M22G/400=
X-Google-Smtp-Source: ABdhPJy9dyrpbH/urhqhSpy7WKh/oklsnc56vlW33h3ZTWE1g0yI8U4qpehenqdC8nVSV7dV3sC9Vw==
X-Received: by 2002:a17:906:370f:b0:6ce:6e7:7344 with SMTP id
 d15-20020a170906370f00b006ce06e77344mr16083589ejc.654.1646085929715; 
 Mon, 28 Feb 2022 14:05:29 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:957a:1d13:c949:d1f3])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a17090606c200b006a728f4a9bcsm4769566ejb.148.2022.02.28.14.05.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Feb 2022 14:05:29 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <0b65541a-3da7-dc35-690a-0ada75b0adae@amd.com>
Date: Mon, 28 Feb 2022 23:05:26 +0100
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net,
 drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>, KVM list <kvm@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 "Bos, H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-sgx@vger.kernel.org, linux-block <linux-block@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mike Rapoport <rppt@kernel.org>
Message-Id: <192A6D7F-E803-47AE-9C7A-267B4E87C856@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <0b65541a-3da7-dc35-690a-0ada75b0adae@amd.com>
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_140531_343671_369816A7 
X-CRM114-Status: GOOD (  22.96  )
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

Cgo+IE9uIDI4LiBGZWIgMjAyMiwgYXQgMjE6NTYsIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gCj4gCj4gCj4gQW0gMjguMDIuMjIgdW0gMjE6NDIg
c2NocmllYiBKYW1lcyBCb3R0b21sZXk6Cj4+IE9uIE1vbiwgMjAyMi0wMi0yOCBhdCAyMTowNyAr
MDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDI4LjAyLjIyIHVtIDIwOjU2IHNj
aHJpZWIgTGludXMgVG9ydmFsZHM6Cj4+Pj4gT24gTW9uLCBGZWIgMjgsIDIwMjIgYXQgNDoxOSBB
TSBDaHJpc3RpYW4gS8O2bmlnCj4+Pj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6
Cj4+Pj4gW1NOSVBdCj4+Pj4gQW55Ym9keSBoYXZlIGFueSBpZGVhcz8KPj4+IEkgdGhpbmsgd2Ug
c2hvdWxkIGxvb2sgYXQgdGhlIHVzZSBjYXNlcyB3aHkgY29kZSBpcyB0b3VjaGluZyAocG9zKQo+
Pj4gYWZ0ZXIgdGhlIGxvb3AuCj4+PiAKPj4+IEp1c3QgZnJvbSBza2ltbWluZyBvdmVyIHRoZSBw
YXRjaGVzIHRvIGNoYW5nZSB0aGlzIGFuZCBleHBlcmllbmNlCj4+PiB3aXRoIHRoZSBkcml2ZXJz
L3N1YnN5c3RlbXMgSSBoZWxwIHRvIG1haW50YWluIEkgdGhpbmsgdGhlIHByaW1hcnkKPj4+IHBh
dHRlcm4gbG9va3Mgc29tZXRoaW5nIGxpa2UgdGhpczoKPj4+IAo+Pj4gbGlzdF9mb3JfZWFjaF9l
bnRyeShlbnRyeSwgaGVhZCwgbWVtYmVyKSB7Cj4+PiAgICAgIGlmIChzb21lX2NvbmRpdGlvbl9j
aGVja2luZyhlbnRyeSkpCj4+PiAgICAgICAgICBicmVhazsKPj4+IH0KPj4+IGRvX3NvbWV0aGlu
Z193aXRoKGVudHJ5KTsKClRoZXJlIGFyZSBvdGhlciBjYXNlcyB3aGVyZSB0aGUgbGlzdCBpdGVy
YXRvciB2YXJpYWJsZSBpcyB1c2VkIGFmdGVyIHRoZSBsb29wClNvbWUgZXhhbXBsZXM6CgotIGxp
c3RfZm9yX2VhY2hfZW50cnlfY29udGludWUoKSBhbmQgbGlzdF9mb3JfZWFjaF9lbnRyeV9mcm9t
KCkuCgotIChhbHRob3VnaCB2ZXJ5IHJhcmUpIHRoZSBoZWFkIGlzIGFjdHVhbGx5IG9mIHRoZSBj
b3JyZWN0IHN0cnVjdCB0eXBlLgoJCShwcGM0NDBzcGVfZ2V0X2dyb3VwX2VudHJ5KCk6IGRyaXZl
cnMvZG1hL3BwYzR4eC9hZG1hLmM6MTQzNikKCi0gdG8gdXNlIHBvcy0+bGlzdCBmb3IgZXhhbXBs
ZSBmb3IgbGlzdF9hZGRfdGFpbCgpOgoJCShhZGRfc3RhdGljX3ZtX2Vhcmx5KCk6IGFyY2gvYXJt
L21tL2lvcmVtYXAuYzoxMDcpCgpJZiB0aGUgc2NvcGUgb2YgdGhlIGxpc3QgaXRlcmF0b3IgaXMg
bGltaXRlZCB0aG9zZSBzdGlsbCBuZWVkIGZpeGluZyBpbiBhIGRpZmZlcmVudCB3YXkuCgo+PiAK
Pj4gQWN0dWFsbHksIHdlIHVzdWFsbHkgaGF2ZSBhIGNoZWNrIHRvIHNlZSBpZiB0aGUgbG9vcCBm
b3VuZCBhbnl0aGluZywKPj4gYnV0IGluIHRoYXQgY2FzZSBpdCBzaG91bGQgc29tZXRoaW5nIGxp
a2UKPj4gCj4+IGlmIChsaXN0X2VudHJ5X2lzX2hlYWQoZW50cnksIGhlYWQsIG1lbWJlcikpIHsK
Pj4gICAgIHJldHVybiB3aXRoIGVycm9yOwo+PiB9Cj4+IGRvX3NvbWV0aGluX3dpdGgoZW50cnkp
Owo+PiAKPj4gU3VmZmljZT8gIFRoZSBsaXN0X2VudHJ5X2lzX2hlYWQoKSBtYWNybyBpcyBkZXNp
Z25lZCB0byBjb3BlIHdpdGggdGhlCj4+IGJvZ3VzIGVudHJ5IG9uIGhlYWQgcHJvYmxlbS4KPiAK
PiBUaGF0IHdpbGwgd29yayBhbmQgaXMgYWxzbyB3aGF0IHBlb3BsZSBhbHJlYWR5IGRvLgo+IAo+
IFRoZSBrZXkgcHJvYmxlbSBpcyB0aGF0IHdlIGxldCBwZW9wbGUgZG8gdGhlIHNhbWUgdGhpbmcg
b3ZlciBhbmQgb3ZlciBhZ2FpbiB3aXRoIHNsaWdodGx5IGRpZmZlcmVudCBpbXBsZW1lbnRhdGlv
bnMuCj4gCj4gT3V0IGluIHRoZSB3aWxkIEkndmUgc2VlbiBhdCBsZWFzdCB1c2luZyBhIHNlcGFy
YXRlIHZhcmlhYmxlLCB1c2luZyBhIGJvb2wgdG8gaW5kaWNhdGUgdGhhdCBzb21ldGhpbmcgd2Fz
IGZvdW5kIGFuZCBqdXN0IGFzc3VtaW5nIHRoYXQgdGhlIGxpc3QgaGFzIGFuIGVudHJ5Lgo+IAo+
IFRoZSBsYXN0IGNhc2UgaXMgYm9ndXMgYW5kIGJhc2ljYWxseSB3aGF0IGNhbiBicmVhayBiYWRs
eS4KPiAKPiBJZiB3ZSB3b3VsZCBoYXZlIGFuIHVuaWZpZWQgbWFjcm8gd2hpY2ggc2VhcmNoIGZv
ciBhbiBlbnRyeSBjb21iaW5lZCB3aXRoIGF1dG9tYXRlZCByZXBvcnRpbmcgb24gcGF0Y2hlcyB0
byB1c2UgdGhhdCBtYWNybyBJIHRoaW5rIHRoZSBwb3RlbnRpYWwgdG8gaW50cm9kdWNlIHN1Y2gg
aXNzdWVzIHdpbGwgYWxyZWFkeSBnbyBkb3duIG1hc3NpdmVseSB3aXRob3V0IGF1ZGl0aW5nIHRv
bnMgb2YgZXhpc3RpbmcgY29kZS4KCkhhdmluZyBhIHVuaWZpZWQgd2F5IHRvIGRvIHRoZSBzYW1l
IHRoaW5nIHdvdWxkIGluZGVlZCBiZSBncmVhdC4KCj4gCj4gUmVnYXJkcywKPiBDaHJpc3RpYW4u
Cj4gCj4+IAo+PiBKYW1lcwo+PiAKPj4gCj4gCgotIEpha29iCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
