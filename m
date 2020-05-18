Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EB1C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 14:38:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E303206D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 14:38:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LKU14JmL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E303206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aR4u5n4NUhy1ptiR2R6YEJMHgi8/gWies6tcrE8tmsA=; b=LKU14JmL+DgHbF
	exRPZ3EJLBevfid307spIWaNqbiKRCJ5E5yWP822oUUaGLqgWI7nnMC8FYJwcDhnuomSarr1Lnx66
	qMv2tV8KACT8E4kh5S1Z34IzAeYc5jrTKkwy2jCndhKr0CqR0p/PVtjZVDBEz2QBEP0Q5RoK1YPaY
	xIM7oTlxvmbjpeRbjE/1C4Mz5hc/1NFvqv9n7RoYv8LrcD5mHwW8MxTbWgHeJCOMITPxg8ojzTfRn
	EciZ7rnIPyk5hnslXX77LE7wzlIzM9kSlMTpv1JywoKnCDyau7jVTbSpmIbwWuaAjQuho+SLXufX4
	RQW4HWtXo+KDWEDMSCBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaguo-0003E9-Kx; Mon, 18 May 2020 14:38:50 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jagum-0003DB-Kb; Mon, 18 May 2020 14:38:50 +0000
Received: from mail-qk1-f171.google.com ([209.85.222.171]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M8QiW-1jf4cv0BBw-004XAr; Mon, 18 May 2020 16:38:45 +0200
Received: by mail-qk1-f171.google.com with SMTP id y22so10279317qki.3;
 Mon, 18 May 2020 07:38:43 -0700 (PDT)
X-Gm-Message-State: AOAM5306K5u2iWpfwIs3Ntrqe/F1D4b4MuCt8Axei6wVSJ4Y1WO0l6TM
 Fy/4/Um3qYhrN7Cchb4rIGdf3v4bBCUSkylN9/U=
X-Google-Smtp-Source: ABdhPJxzhsnxVhq8ZSNDtJoBCI07uV5rPB2Xy6wBijq3wixD3dVCpTMzBq7wTOe/KdpPc4bGdgY7xrXJK4eQYms1WB8=
X-Received: by 2002:a37:aa82:: with SMTP id t124mr15128415qke.3.1589812722617; 
 Mon, 18 May 2020 07:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200514075942.10136-1-brgl@bgdev.pl>
 <20200514075942.10136-11-brgl@bgdev.pl>
 <CAK8P3a0XgJtZNKePZUUpzADO25-JZKyDiVHFS_yuHRXTjvjDwg@mail.gmail.com>
 <CAMRc=MeVyNzTWw_hk=J9kX1NE9reCE_O4P3wrNpMMc9z4xA_DA@mail.gmail.com>
In-Reply-To: <CAMRc=MeVyNzTWw_hk=J9kX1NE9reCE_O4P3wrNpMMc9z4xA_DA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 May 2020 16:38:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1xaWE0gNx-PnJz08XzUkPW6YB7U6NfFS+Y1VXwG+VR+w@mail.gmail.com>
Message-ID: <CAK8P3a1xaWE0gNx-PnJz08XzUkPW6YB7U6NfFS+Y1VXwG+VR+w@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] net: ethernet: mtk-eth-mac: new driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Provags-ID: V03:K1:JNTZ3sqNdk5D+8w2BvCzgGr3slwRLu6SKTQu7fezHsTMDQTgtYd
 S8YUUJCNh5dmIyLK7E6koQVs16dAM5DdXgnihWkESR0iLp7KbwEUv0spdJqhs4DfFrr5jtq
 HQty8bygDjt/vjZ0YzxvngeVS/ygDSSUn3qcP8nKix8tuc6kgR07BSnae0Ka3wn+Ld/AcQP
 TfFrqpJ7v/lOkq39kkfjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bBdzMXl1Xzs=:FrEksEBt03Hvs16s/Aie9d
 /zS/P8FZpuC/TsmH8OxhjEwYclYhdFCAyZyYt5nQ8uMjcVggIk3SvdBs8ErVxn8rMjojqOd/q
 htDd6kR+z3ZnPcTqolO/ZxefcN6eVuyRgywwvvIXlrxhoZ62BMlpCQC0PzGgeXvfvi5JHXatm
 YaJ2u71MuLneQSjAcpzhS3Nz6G0B8sHde2Nvhhmi05Ej0wG0jKDHR3FCMF4UTbbYd8qpuOQyr
 KLm+DgAMSLWKM2fsytQgZplaaV4Ti6wQlPrT8+oUsLA6YLdhbBdXmC7382Xv4b3pGynBHeDNt
 owTRWjo/VwnXrpRg+W7UkP1YUiEgm1/eq4m3aioglX4cVWZ5nMi6/Gtu8LRmuiLMeT6ikWnIo
 4SIeRa979r0dwAbmV3j1hgsEEh8FHumPI/KA9JmtFwU6vGsnMdL4I9U9eawQEAyWSeRilJDMr
 OqSc2ToL+/f9RvhehOPiWR9sWahg08DQv026aFRfKLMqCM9Nc8J9jFTUB5V5redN/LN0qyHlB
 Zf6qp2ihCH2U+ukgUExZSxYQg7RBjX0mHGCPClmupcgeGFWGGMNaVGpE0qaBhF97ZSEGC4Gx0
 qoI2XzuEjLJnU+dINmFAuIlXOmB87i/H0DEfjRCC+a0xnx+HQ0as989qyMdeV0iq74bRnhtOn
 ZP9ml/RfArXVAamVItUyuH4jZBCzMTKnRiEvu7sqR/8ovBFcTU6dMqvbvYy9GAJmq1cw5CBst
 f0PQx4SkM18fjDI12d9omf6dfck+j6kOiislOQW1pTlm7ue0ZBBSg2SMd6r+UmOrzkE5sLF7r
 tAJUINiKlR+bcd7FsE8MEX3FrnxJF0BdcbhdfWgZnVWSobHrwI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_073848_966341_718DC531 
X-CRM114-Status: GOOD (  19.21  )
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
Cc: Edwin Peer <edwin.peer@broadcom.com>, DTML <devicetree@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Jonathan Corbet <corbet@lwn.net>, Networking <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pedro Tsai <pedro.tsai@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXkgMTgsIDIwMjAgYXQgNDowNyBQTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmds
QGJnZGV2LnBsPiB3cm90ZToKPiBwdC4sIDE1IG1haiAyMDIwIG8gMTU6MzIgQXJuZCBCZXJnbWFu
biA8YXJuZEBhcm5kYi5kZT4gbmFwaXNhxYIoYSk6Cgo+ID4gSSB3b3VsZCBnZXQgcmlkIG9mIHRo
ZSAnY291bnQnIGhlcmUsIGFzIGl0IGR1cGxpY2F0ZXMgdGhlIGluZm9ybWF0aW9uCj4gPiB0aGF0
IGlzIGFscmVhZHkga25vd24gZnJvbSB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIGhlYWQgYW5kIHRh
aWwsIGFuZCB5b3UKPiA+IGNhbid0IHVwZGF0ZSBpdCBhdG9taWNhbGx5IHdpdGhvdXQgaG9sZGlu
ZyBhIGxvY2sgYXJvdW5kIHRoZSBhY2Nlc3MgdG8KPiA+IHRoZSByaW5nLiBUaGUgd2F5IEknZCBk
byB0aGlzIGlzIHRvIGhhdmUgdGhlIGhlYWQgYW5kIHRhaWwgcG9pbnRlcnMKPiA+IGluIHNlcGFy
YXRlIGNhY2hlIGxpbmVzLCBhbmQgdGhlbiB1c2UgUkVBRF9PTkNFL1dSSVRFX09OQ0UKPiA+IGFu
ZCBzbXAgYmFycmllcnMgdG8gYWNjZXNzIHRoZW0sIHdpdGggZWFjaCBvbmUgdXBkYXRlZCBvbiBv
bmUKPiA+IHRocmVhZCBidXQgcmVhZCBieSB0aGUgb3RoZXIuCj4gPgo+Cj4gWW91ciBwcmV2aW91
cyBzb2x1dGlvbiBzZWVtcyBtdWNoIG1vcmUgcmVsaWFibGUgdGhvdWdoLiBGb3IgaW5zdGFuY2UK
PiBpbiB0aGUgYWJvdmU6IHdoZW4gd2UncmUgZG9pbmcgdGhlIFRYIGNsZWFudXAgKHdlIGdvdCB0
aGUgVFggcmVhZHkKPiBpcnEsIHdlJ3JlIGl0ZXJhdGluZyBvdmVyIGRlc2NyaXB0b3JzIHVudGls
IHdlIGtub3cgdGhlcmUgYXJlIG5vIG1vcmUKPiBwYWNrZXRzIHNjaGVkdWxlZCAoY291bnQgPT0g
MCkgb3Igd2UgZW5jb3VudGVyIG9uZSB0aGF0J3Mgc3RpbGwgb3duZWQKPiBieSBETUEpLCBhIHBh
cmFsbGVsIFRYIHBhdGggY2FuIHNjaGVkdWxlIG5ldyBwYWNrZXRzIHRvIGJlIHNlbnQgYW5kIEkK
PiBkb24ndCBzZWUgaG93IHdlIGNhbiBhdG9taWNhbGx5IGNoZWNrIHRoZSBjb3VudCAodW5kZXJz
dG9vZCBhcyBhCj4gZGlmZmVyZW5jZSBiZXR3ZWVuIHRhaWwgYW5kIGhlYWQpIGFuZCBydW4gYSBu
ZXcgaXRlcmF0aW9uICh3aGVyZSB3ZSdkCj4gbW9kaWZ5IHRoZSBoZWFkIG9yIHRhaWwpIHdpdGhv
dXQgcmlza2luZyB0aGUgb3RoZXIgcGF0aCBnZXR0aW5nIGluIHRoZQo+IHdheS4gV2UnZCBoYXZl
IHRvIGFsd2F5cyBjaGVjayB0aGUgZGVzY3JpcHRvci4KCkl0IHNob3VsZCBiZSBlbm91Z2ggdG8g
cmVhZCBib3RoIHBvaW50ZXJzIG9uY2UgYXQgdGhlIHN0YXJ0IG9mIGVhY2gKc2lkZSwgdGhlbiBk
byB3aGF0ZXZlciB3b3JrIHlvdSB3YW50IHRvIGRvIChjbGVhbmluZywgc2VuZGluZywKcmVjZWl2
aW5nLCByZWZpbGxpbmcpIGFuZCBmaW5hbGx5IHVwZGF0aW5nIHRoZSBvbmUgcG9pbnRlciB0aGF0
IGNoYW5nZWQuCklmIGJvdGggc2lkZXMgZG8gdGhhdCwgeW91IG1pbmltaXplIHRoZSBjYWNoZSBs
aW5lIGJvdW5jaW5nIGFuZAphbHdheXMgZG8gYSB1c2VmdWwgYW1vdW50IG9mIHdvcmsgdGhhdCBn
dWFyYW50ZWVzIGZvcndhcmQgcHJvZ3Jlc3MKYW5kIGRvZXMgbm90IGludGVyZmVyZSB3aXRoIHRo
ZSBvdGhlciBzaWRlLgoKPiBJIGV4cGVyaW1lbnRlZCBhIGJpdCB3aXRoIHRoaXMgYW5kIGNvdWxk
bid0IGNvbWUgdXAgd2l0aCBhbnl0aGluZyB0aGF0Cj4gd291bGQgcGFzcyBhbnkgc3RyZXNzIHRl
c3QuCj4KPiBPbiB0aGUgb3RoZXIgaGFuZDogc3Bpbl9sb2NrX2JoKCkgd29ya3MgZmluZSBhbmQg
SSBsaWtlIHlvdXIgYXBwcm9hY2gKPiBmcm9tIHRoZSBwcmV2aW91cyBlLW1haWwgLSBleGNlcHQg
Zm9yIHRoZSB3b3JrIGZvciB1cGRhdGluZyBzdGF0cyBhcwo+IHdlIGNvdWxkIHBvdGVudGlhbGx5
IGxvc2Ugc29tZSBzdGF0cyB3aGVuIHdlJ3JlIHVwZGF0aW5nIGluIHByb2Nlc3MKPiBjb250ZXh0
IHdpdGggUlgvVFggcGF0aHMgcnVubmluZyBpbiBwYXJhbGxlbCBpbiBuYXBpIGNvbnRleHQgYnV0
IHRoYXQKPiB3b3VsZCBiZSByYXJlIGVub3VnaCB0byBvdmVybG9vayBpdC4KPgo+IEkgaG9wZSB2
NCB3aWxsIGJlIGdvb2QgZW5vdWdoIGV2ZW4gd2l0aCBzcGlubG9ja3MuIDopCgpZZXMsIGl0IHNo
b3VsZCBiZSBmaW5lLiBBdm9pZGluZyBhbGwgdGhlIGxvY2tzIGlzIG1haW5seSBhbiBvcHRpbWl6
YXRpb24KZm9yIHRoZSBudW1iZXIgb2YgQ1BVIGN5Y2xlcyBzcGVudCBwZXIgcGFja2V0LCB0aGUg
b3RoZXIgcG9pbnRzCmFyZSBtb3JlIGltcG9ydGFudCB0byBnZXQgcmlnaHQsIGluIHBhcnRpY3Vs
YXIgdGhlIGZsb3cgY29udHJvbC4KCiAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
