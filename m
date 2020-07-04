Return-Path: <SRS0=EBBG=AP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE365C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 22:19:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97E802070C
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 22:19:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cj7RW0fT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="se3OQJCl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97E802070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l7iGHgAO/J/6G/YeR4oyi/JTp1ZV2D5XUqN7wRnj1jk=; b=Cj7RW0fT2zHja5DfzAb+O7gQM
	syP56W6W8Xkiq+sS+AizC8yIcdmoKWtHlnzQQXqgYi3lYRYq8KyabMXC+JWOIfbDphUdQ1d3dHQ81
	vaRx74WWd6eRGu3VhFq1me5eDg8KpU+deXCbqgSFkQHwngvQnRC0lR85N6gUf5N+5+OvlNYwebcGs
	hv8RgdBTWxsqVSzTJ7Q3ARr42PM0bkJL3J/sCmEB8/zS4gqbUzAhJqzTnzDspO4y3Yzue5P2SAo6B
	j0BVbcBtwWQi7QklZHYKxmPewQaRBrb87HckL6He2MXyj73zxuWcel1GEGySCdJ9xqE5M6b3U+Hk2
	dtkCg4msQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrqVQ-0001sj-AF; Sat, 04 Jul 2020 22:19:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrqVH-0001rF-6E; Sat, 04 Jul 2020 22:19:24 +0000
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2017E2070C;
 Sat,  4 Jul 2020 22:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593901161;
 bh=9v1dX1d5CT4OlZG432LBpmp+z8QjBxiwBh7CgA1A544=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=se3OQJClKKjKhYoH9WhQiUxEFZX2L1NvaCCUMqtw7TdurqgGX58PSFP4Skgh6Vvju
 vh4aaV/eWxRDjkmOCifgaTNdIJMHSYciq6XCi2nR+4YsxXKzZYgzkWkdfIIR/oAscc
 tkMswjD4s1D410+EJomp69qFD7gFMMT8MZv//3+w=
Received: by mail-ej1-f53.google.com with SMTP id rk21so38398902ejb.2;
 Sat, 04 Jul 2020 15:19:21 -0700 (PDT)
X-Gm-Message-State: AOAM533VaQHTYSMOnbFSteVhdniwuy/0CubORQKzurbwlKLBq0NbdRjA
 MS17ZaAkqrQ4xw6UC7orr1zjsgjP3Yimjpjj2w==
X-Google-Smtp-Source: ABdhPJzpbnPFMQGBtbgHPK/mpFFqynZ8/TPSZmE0VOmdWVSRLcQBDhVy6aNOzos4UlWBPw4oa0qmR7WsUfFu23y1s4M=
X-Received: by 2002:a17:906:856:: with SMTP id
 f22mr36036089ejd.245.1593901159756; 
 Sat, 04 Jul 2020 15:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200518112254.23692-1-matthias.bgg@kernel.org>
In-Reply-To: <20200518112254.23692-1-matthias.bgg@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Jul 2020 06:19:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9gcFvNv26FgKHwN7cxha57sDJ8dzvmBKf-vtUx82YcoA@mail.gmail.com>
Message-ID: <CAAOTY_9gcFvNv26FgKHwN7cxha57sDJ8dzvmBKf-vtUx82YcoA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Delete not used of_device_get_match_data
To: matthias.bgg@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200704_181923_413441_30EA1A2C 
X-CRM114-Status: GOOD (  16.88  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hdHRoaWFzOgoKPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDXmnIgx
OOaXpSDpgLHkuIAg5LiL5Y2INzoyM+Wvq+mBk++8mgo+Cj4gRnJvbTogTWF0dGhpYXMgQnJ1Z2dl
ciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPgo+IFRoZSBkcml2ZXIgd2lsbCBiZSBsb2FkZWQg
YnkgdmlhIGEgcGxhdGZvcm0gZGV2aWNlLiBTbyB3ZQo+IHdpbGwgbmVlZCB0byBnZXQgdGhlIGRl
dmljZV9ub2RlIGZyb20gdGhlIHBhcmVudCBkZXZpY2UuCj4gRGVwZW5kaW5nIG9uIHRoaXMgd2Ug
d2lsbCBzZXQgdGhlIGRyaXZlciBkYXRhLgo+IEFzIGFsbCB0aGlzIGlzIGRvbmUgbGF0ZXIgYWxy
ZWFkeSwganVzdCBkZWxldGUgdGhlIGNhbGwgdG8KPiBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEu
CgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1maXhlcyBbMV0sIHRoYW5rcy4KClsxXSBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGlu
dXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tZml4ZXMKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+
Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAxIC0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5jCj4gaW5kZXggZTJiYjBkMTllZjk5Li42M2VjOTJiYTBlOTIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+IEBAIC00NDcsNyArNDQ3LDYg
QEAgc3RhdGljIGludCBtdGtfZHJtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gICAgICAgICBpZiAoIXByaXZhdGUpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
Owo+Cj4gLSAgICAgICBwcml2YXRlLT5kYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRl
dik7Cj4gICAgICAgICBwcml2YXRlLT5tbXN5c19kZXYgPSBkZXYtPnBhcmVudDsKPiAgICAgICAg
IGlmICghcHJpdmF0ZS0+bW1zeXNfZGV2KSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2
LCAiRmFpbGVkIHRvIGdldCBNTVNZUyBkZXZpY2VcbiIpOwo+IC0tCj4gMi4yNi4yCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
