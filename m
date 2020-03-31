Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E78C43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 23:28:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 389F820787
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 23:28:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ks2tnA6R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUvJi6wR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 389F820787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVscdo/3wuM6DogSvdxORmVCKyb5G7ADxwR7WvOAyhc=; b=ks2tnA6RLKrQTs
	GSK+3HQEAAOdzT1ZRm0dmfm7Lxcfd4tSuRaCIs5Eqt55gjIa65hpvmKx9xSANsJWhZW4NYuzLAjI+
	sI42f3TUDzImWNwvrT12/UIW+FNedhoBVrSHEFBhNwxW63mzz1PXubXB48ex0/A5IQvFLyPZ9Spiz
	I/QvfqkhY8R/f5uINQ7RJXQ1hpqdUvsbjZKTzR98EbOujxwwcQ0phAvTcgC9olflF5/J59UsFA7FQ
	3EBO1B7s15tezlH7vi8z7o4Qkdk2Xov1FHnJsIgfHs3wvZp1M+7NCuQY2Mq1LZ8ZtXNTNLOCRXpEZ
	Dm1njUF11NkQ6OOGHYjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJQJH-0003hF-4Z; Tue, 31 Mar 2020 23:28:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJQJ5-0003Xk-OR; Tue, 31 Mar 2020 23:28:33 +0000
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B43B21707;
 Tue, 31 Mar 2020 23:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585697311;
 bh=l7zMYSntV7hVq8rfpu63wjGejX5IPF+uFcD9Vs6O3I8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MUvJi6wRPlDITY6PDh0q/OLcS+7pn4GJTp71mf2egrupLmdVom35B4dl/FNfYMSL9
 jvuFOF66rSY6u/g+qJ+tdnewpVmwV4npcvCkbIEEJWd7iaq1I5cAeVEpwD4jZxO/Cs
 hA9NxsSqQJa8j8pW9q2zjQp8YdQnPB3oIcVKIFO8=
Received: by mail-ed1-f41.google.com with SMTP id w26so27445719edu.7;
 Tue, 31 Mar 2020 16:28:31 -0700 (PDT)
X-Gm-Message-State: ANhLgQ00PqpGUaWZjDyhymn5MUL2BdecUMdwOgBdWnAvgP2J/SX4pG2V
 NgTE+N1pzl7X9albp4J+uwQBBs8uqFjmsAZHOg==
X-Google-Smtp-Source: ADFU+vs8xTP/4fNCKc/Lkxq6axyfNY0WeUUpH6PAk0Z4p/Dm89IelQXjsghn8yHY1mTBx4UE/MzCvvq1r5Omz1grjaY=
X-Received: by 2002:a05:6402:b70:: with SMTP id
 cb16mr6166633edb.48.1585697309577; 
 Tue, 31 Mar 2020 16:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200331214609.1742152-1-enric.balletbo@collabora.com>
 <20200331214609.1742152-3-enric.balletbo@collabora.com>
In-Reply-To: <20200331214609.1742152-3-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 1 Apr 2020 07:28:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-wt1shM7RGTquTmej3VeCNXUy9ByxN+T56qDYG-MeJeA@mail.gmail.com>
Message-ID: <CAAOTY_-wt1shM7RGTquTmej3VeCNXUy9ByxN+T56qDYG-MeJeA@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk / soc: mediatek: Bind clock and gpu driver for
 mt2701
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_162831_832799_14386CA9 
X-CRM114-Status: GOOD (  17.80  )
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
 Matthias Brugger <mbrugger@suse.com>, Richard Fontana <rfontana@redhat.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>, matthias.bgg@kernel.org,
 linux-kernel@vger.kernel.org, ulrich.hecht+renesas@gmail.com,
 Nicolas Boichat <drinkcat@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, hsinyi@chromium.org,
 CK Hu <ck.hu@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Allison Randal <allison@lohutok.net>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ05pyIMeaXpSDpgLHkuIkg5LiK5Y2INTo0N+Wvq+mBk++8mgo+
Cj4gTm93IHRoYXQgdGhlIG1tc3lzIGRyaXZlciBpcyB0aGUgdG9wLWxldmVsIGVudHJ5IHBvaW50
IGZvciB0aGUKPiBtdWx0aW1lZGlhIHN1YnN5c3RlbSwgd2UgY291bGQgYmluZCB0aGUgY2xvY2sg
YW5kIHRoZSBncHUgZHJpdmVyIG9uCj4gdGhvc2UgZGV2aWNlcyB0aGF0IGlzIGV4cGVjdGVkIHRv
IHdvcmssIHNvIHRoZSBkcm0gZHJpdmVyIGlzCj4gaW50YW50aWF0ZWQgYnkgdGhlIG1tc3lzIGRy
aXZlciBhbmQgZGlzcGxheSwgaG9wZWZ1bGx5LCB3b3JraW5nIGFnYWluLgoKUmV2aWV3ZWQtYnk6
IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1vZmYt
Ynk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+
Cj4gLS0tCj4gSWYgeW91IGhhdmUgdGhpcyBoYXJkd2FyZSwgcGxlYXNlIGtpbmRseSBwcm92aWRl
IHlvdXIgdGVzdGVkIHRhZy4gT25seQo+IGJ1aWxkIHRlc3RlZC4KPgo+ICBkcml2ZXJzL2Nsay9t
ZWRpYXRlay9jbGstbXQyNzAxLW1tLmMgfCA4ICsrLS0tLS0tCj4gIGRyaXZlcnMvc29jL21lZGlh
dGVrL210ay1tbXN5cy5jICAgICB8IDggKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xr
L21lZGlhdGVrL2Nsay1tdDI3MDEtbW0uYyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDI3
MDEtbW0uYwo+IGluZGV4IDA1NGI1OTdkNGE3My4uM2E0ZTg5NWEzZDBmIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDI3MDEtbW0uYwo+ICsrKyBiL2RyaXZlcnMvY2xr
L21lZGlhdGVrL2Nsay1tdDI3MDEtbW0uYwo+IEBAIC03OSwxNiArNzksMTIgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBtdGtfZ2F0ZSBtbV9jbGtzW10gPSB7Cj4gICAgICAgICBHQVRFX0RJU1AxKENM
S19NTV9UVkVfRk1NLCAibW1fdHZlX2ZtbSIsICJtbV9zZWwiLCAxNCksCj4gIH07Cj4KPiAtc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb2ZfbWF0Y2hfY2xrX210MjcwMV9tbVtdID0g
ewo+IC0gICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtbW1zeXMiLCB9LAo+
IC0gICAgICAge30KPiAtfTsKPiAtCj4gIHN0YXRpYyBpbnQgY2xrX210MjcwMV9tbV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICB7Cj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmcGRldi0+ZGV2Owo+ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpub2RlID0g
ZGV2LT5wYXJlbnQtPm9mX25vZGU7Cj4gICAgICAgICBzdHJ1Y3QgY2xrX29uZWNlbGxfZGF0YSAq
Y2xrX2RhdGE7Cj4gICAgICAgICBpbnQgcjsKPiAtICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bm9kZSA9IHBkZXYtPmRldi5vZl9ub2RlOwo+Cj4gICAgICAgICBjbGtfZGF0YSA9IG10a19hbGxv
Y19jbGtfZGF0YShDTEtfTU1fTlIpOwo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL21lZGlh
dGVrL210ay1tbXN5cy5jIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMKPiBpbmRl
eCBjN2QzYjdiY2ZhMzIuLmNhY2FmZTIzYzgyMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9t
ZWRpYXRlay9tdGstbW1zeXMuYwo+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5
cy5jCj4gQEAgLTgwLDYgKzgwLDEwIEBAIHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVyX2RhdGEgewo+
ICAgICAgICAgY29uc3QgY2hhciAqY2xrX2RyaXZlcjsKPiAgfTsKPgo+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSBtdDI3MDFfbW1zeXNfZHJpdmVyX2RhdGEgPSB7
Cj4gKyAgICAgICAuY2xrX2RyaXZlciA9ICJjbGstbXQyNzAxLW1tIiwKPiArfTsKPiArCj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10MjcxMl9tbXN5c19kcml2
ZXJfZGF0YSA9IHsKPiAgICAgICAgIC5jbGtfZHJpdmVyID0gImNsay1tdDI3MTItbW0iLAo+ICB9
Owo+IEBAIC0zMjMsNiArMzI3LDEwIEBAIHN0YXRpYyBpbnQgbXRrX21tc3lzX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIH0KPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBvZl9tYXRjaF9tdGtfbW1zeXNbXSA9IHsKPiArICAgICAgIHsKPiArICAgICAg
ICAgICAgICAgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLW1tc3lzIiwKPiArICAgICAg
ICAgICAgICAgLmRhdGEgPSAmbXQyNzAxX21tc3lzX2RyaXZlcl9kYXRhLAo+ICsgICAgICAgfSwK
PiAgICAgICAgIHsKPiAgICAgICAgICAgICAgICAgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQy
NzEyLW1tc3lzIiwKPiAgICAgICAgICAgICAgICAgLmRhdGEgPSAmbXQyNzEyX21tc3lzX2RyaXZl
cl9kYXRhLAo+IC0tCj4gMi4yNS4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
