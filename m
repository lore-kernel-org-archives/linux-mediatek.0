Return-Path: <SRS0=NHOn=6A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FE2C352BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 16:23:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E26320857
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 16:23:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qoUvA+tB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7MEdxx3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E26320857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YSZPJPSmyoJbT0QzkNIoe/YUuc1DFSVOubywDBDRpY=; b=qoUvA+tBS2V3ao
	AsNtz6Ms2YpwX9dpniaQ9tZUf6pXVivY/Fbt8NqI097UykUFAiEFeJusVGUK/zEB2KF9rMb818OPQ
	cbqTqQOZKl9Vhh/jYmRJwYpmdiqnRc7w0QXxdfd3OmIv5/NBrMtlm7VjFKEVogh3V5FIZBbdrhikS
	jpGDBGO8Qpz1wAOvwcqf5sslqPXXniiZGJGrHPhacz6y4a9jIfPEmLtXZJpZrdit6sBJvsBTPjY2s
	h44GIHXlSa5az/va2dDWKNsgZsfSB528zvsbO2U7rTR96MvGvj3lh47ivPYPnQW74IDIGYHK32Gyc
	uWorUYst1g3ylv9/bhKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP7IH-0005s6-Qa; Thu, 16 Apr 2020 16:23:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP7IA-0005lE-LM; Thu, 16 Apr 2020 16:23:08 +0000
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B07A022253;
 Thu, 16 Apr 2020 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587054186;
 bh=dYe0L8knPjq4V+e3C0CynMr68uvk2h/61C1ujyYiF70=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=V7MEdxx39YfP2AZW0LEXomuLOzYhPDadjG1M1p7YwOqsORcQXVVHXqavfTvWDpr3Y
 V0GXNVV7w9U9mLckuLo1G5UOleiYYbm0f0waGgvIz8XD716xxxFe8xxthHC9utiK9J
 V7soWb53dKIFjDhjqfA3Y52gqMKkkEL6j8qy0tXg=
Received: by mail-ej1-f50.google.com with SMTP id n4so1711462ejs.11;
 Thu, 16 Apr 2020 09:23:05 -0700 (PDT)
X-Gm-Message-State: AGi0PuaIXZm5E4UB9+1mHbFGzOKRhVdcLKW5XOfYfcW0Sk/C3D2EeIq2
 NaZcjmfdXyR3pqR6UN9hQ+kP6w90/+6l7/mtlg==
X-Google-Smtp-Source: APiQypJY17+s5/o0+wlz0famZC0WrI5UI7Klts8JPoOZRnB9zgY8QO2uzy/FBMWzeg9CvxriYGO6Q1j1IF4pKi5aPZw=
X-Received: by 2002:a17:906:2ad4:: with SMTP id
 m20mr10975923eje.324.1587054183934; 
 Thu, 16 Apr 2020 09:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200311165322.1594233-1-enric.balletbo@collabora.com>
 <20200311165322.1594233-5-enric.balletbo@collabora.com>
 <02290a21-7392-a2cf-576c-215091ec05e8@suse.com>
 <1585177534.26117.4.camel@mtksdaap41>
 <f3c2926a-ef92-b004-9786-5be1645af497@suse.com>
 <1585234277.12089.3.camel@mtksdaap41>
 <73ef0b8e-2802-a047-2a56-936b63d264cb@suse.com>
In-Reply-To: <73ef0b8e-2802-a047-2a56-936b63d264cb@suse.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 17 Apr 2020 00:22:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY__EV8PHau9CzSiA8up1QAmZxfK2QnaTid0WrNOsn2Xcag@mail.gmail.com>
Message-ID: <CAAOTY__EV8PHau9CzSiA8up1QAmZxfK2QnaTid0WrNOsn2Xcag@mail.gmail.com>
Subject: Re: [PATCH v12 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
To: Matthias Brugger <mbrugger@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_092306_739041_9DAD5578 
X-CRM114-Status: GOOD (  19.54  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Richard Fontana <rfontana@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>,
 mtk01761 <wendell.lin@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Frank Wunderlich <frank-w@public-files.de>,
 Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, matthias.bgg@kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hdHRoaWFzOgoKTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+IOaWvCAy
MDIw5bm0M+aciDI25pelIOmAseWbmyDkuIvljYgxMTo0NeWvq+mBk++8mgo+Cj4KPgo+IE9uIDI2
LzAzLzIwMjAgMTU6NTEsIENLIEh1IHdyb3RlOgo+ID4gSGksIE1hdHRoaWFzOgo+ID4KPiA+IE9u
IFRodSwgMjAyMC0wMy0yNiBhdCAxMjo1NCArMDEwMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToK
PiA+PiBIaSBDSywKPiA+Pgo+ID4+IE9uIDI2LzAzLzIwMjAgMDA6MDUsIENLIEh1IHdyb3RlOgo+
ID4+PiBIaSwgTWF0dGhpYXM6Cj4gPj4+Cj4gPj4+IE9uIFdlZCwgMjAyMC0wMy0yNSBhdCAxNzox
NiArMDEwMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKPiA+Pj4+Cj4gPj4+PiBPbiAxMS8wMy8y
MDIwIDE3OjUzLCBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIHdyb3RlOgo+ID4+Pj4+IFByb3ZpZGUg
YSBtdGtfbW1zeXNfZGRwX2Nvbm5lY3QoKSBhbmQgbXRrX21tc3lzX2Rpc2Nvbm5lY3QoKSBmdW5j
dGlvbnMgdG8KPiA+Pj4+PiByZXBsYWNlIG10a19kZHBfYWRkX2NvbXBfdG9fcGF0aCgpIGFuZCBt
dGtfZGRwX3JlbW92ZV9jb21wX2Zyb21fcGF0aCgpLgo+ID4+Pj4+IFRob3NlIGZ1bmN0aW9ucyB3
aWxsIGFsbG93IERSTSBkcml2ZXIgYW5kIG90aGVycyB0byBjb250cm9sIHRoZSBkYXRhCj4gPj4+
Pj4gcGF0aCByb3V0aW5nLgo+ID4+Pj4+Cj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFs
bGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KPiA+Pj4+PiBSZXZp
ZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPiA+Pj4+
PiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+Pj4+PiBBY2tlZC1i
eTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+Pj4+Cj4gPj4+PiBUaGlzIHBhdGNoIGRv
ZXMgbm90IGFwcGx5IGFnYWluc3QgdjUuNi1yYzEuCj4gPj4+PiBQbGVhc2UgcmViYXNlIGFzIHRo
aXMgaXMgYSBxdWl0ZSBiaWcgcGF0Y2ggYW5kIGl0IHdvbid0IGJlIGVhc3kgdG8gZG8gdGhhdCBi
eSBoYW5kLgo+ID4+Pgo+ID4+PiBJIHRoaW5rIHRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBbMV0gd2hp
Y2ggaGFzIGJlZW4gYWNrZWQgYnkgbWUgYW5kIEkgaGF2ZQo+ID4+PiBub3QgcGlja2VkIGl0LiBU
aGUgc2ltcGxlIHdheSBpcyB0aGF0IHlvdSBwaWNrIFsxXSBmaXJzdCBhbmQgdGhlbiBwaWNrCj4g
Pj4+IHRoaXMgc2VyaWVzLgo+ID4+Pgo+ID4+PiBbMV0KPiA+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wYXRjaC8xMTQwNjIyNy8KPiA+Pj4KPiA+Pgo+ID4+IFlvdSB3b3VsZCBuZWVk
IHRvIHByb3ZpZGUgYSBzdGFibGUgdGFnIGZvciBtZSB0aGF0IEkgY2FuIG1lcmdlIGludG8gbXkg
dHJlZS4gWW91Cj4gPj4gY2FuIGFsc28gdHJ5IHRvIG1lcmdlIG15IGZvci1uZXh0IFsxXSB3aGlj
aCBoYXMgdGhlIG5ld2VzdCB2ZXJzaW9uIGZyb20gRW5yaWMuCj4gPj4gSWYgeW91IHNlZSBhbnkg
bWVyZ2UgY29uZmxpY3QsIHRoZW4gd2UgaGF2ZSB0byBkbyBzb21ldGhpbmcgYWJvdXQgaXQgOikK
PiA+Pgo+ID4+IFJlZ2FyZHMsCj4gPj4gTWF0dGhpYXMKPiA+Pgo+ID4+IFsxXQo+ID4+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L21hdHRoaWFzLmJnZy9s
aW51eC5naXQvbG9nLz9oPWZvci1uZXh0Cj4gPj4KPiA+Cj4gPiBZb3UgaGF2ZSBhcHBsaWVkIHRo
aXMgc2VyaWVzLCBzbyBJIHdvdWxkIG5vdCBhcHBseSBvdGhlciBwYXRjaGVzIHdoaWNoCj4gPiB3
b3VsZCBjb25mbGljdCB3aXRoIHRoaXMgc2VyaWVzLiBBZnRlciB0aGlzIHNlcmllcyBsYW5kIG9u
IG1haW4gc3RyZWFtCj4gPiAod2lzaCBpdCBoYXBwZW4gaW4gdGhpcyBtZXJnZSB3aW5kb3cpLCBJ
IHdvdWxkIHJlYmFzZSBvdGhlciBwYXRjaCBvbgo+ID4gbWFpbiBzdHJlYW0uCj4gPgo+Cj4gSSBo
YXZlbid0ICh5ZXQpIHNlbmQgdGhlIHB1bGwgcmVxdWVzdC4gSWYgeW91IHdhbnQgdG8gYnJpbmcg
aW4geW91ciBwYXRjaGVzIGluCj4gdjUuNyBhcyB3ZWxsIHdlIGNhbiBmaW5kIGEgc29sdXRpb24g
dG8gdGhhdC4gU2hhbGwgSSBwcm92aWRlIHlvdSB3aXRoIGEgc3RhYmxlCj4gYnJhbmNoIHdoaWNo
IHlvdSBjYW4gbWVyZ2U/IFRoaXMgd2F5IHlvdSBjYW4gYWRkIGFsbCB5b3VyIHBhdGNoZXMgaW4g
dGhlIHB1bGwKPiByZXF1ZXN0IGFzIHdlbGwgYW5kIHdlIGRvbid0IGhhdmUgdG8gd2FpdCBmb3Ig
djUuOCB0byBnZXQgdGhpbmdzIGludG8gbWFpbmxpbmUuCj4KPiBMZXQgbWUga25vdyBhbmQgSSds
bCBwcm92aWRlIHlvdSB3aXRoIGEgc3RhYmxlIGJyYW5jaC4KClRoaXMgc2VyaWVzIGlzIGluIGxp
bnV4LW5leHQgYnV0IGRvZXMgbm90IGluIG1haW4gc3RyZWFtLiBTbyB3b3VsZCB5b3UKcGxlYXNl
IHByb3ZpZGUgYSBzdGFibGUgYnJhbmNoIHNvIEkgY291bGQgcHVsbCB0aGlzIHNlcmllcz8KClJl
Z2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gUmVnYXJkcywKPiBNYXR0aGlhcwo+Cj4gPiBSZWdhcmRz
LAo+ID4gQ0sKPiA+Cj4gPj4+IFJlZ2FyZHMsCj4gPj4+IENLCj4gPj4+Cj4gPj4+Pgo+ID4+Pj4g
UmVnYXJkcywKPiA+Pj4+IE1hdHRoaWFzCj4gPj4+Pgo+ID4+Pj4+IC0tLQo+ID4+Pj4+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
