Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F13BC28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 13:06:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DC0B20752
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 13:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ssoaUvJd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDhpwgGw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DC0B20752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfkCdwPTGQW8/0gsy0n5y5v2JIF5Si0026YugYg7kco=; b=ssoaUvJdenvc+O
	CKXURd4FSPT51Q6bjx1RAnhZtHpsI3T6Vx5+qC+MoVV6ZAaielWqQFb4IGYpalWoqnLQVJD5CvrKJ
	zbqfPnNfTd11yhdlIS32kOXNPuiVXj/9fM1jlpHCL0eMPOwx0Ao40oYq4oXcXaPVv5tFR1QyFIxAQ
	k5HXRnSFeQGa6uiWF5fCWnFTbEWDQDu5rfjcUezh/LeR7rzrCTBJpOmXy3mM1Bm+thwR7cDKLlK40
	9UzSS8of/soVYNUc8Wao5DZsVAvlpjL3w0KSLAjxPL9iuN45Z5fhKIPZ1o7O9cLu5GM5UwxgT2vtA
	BgMK4be0YajUPdP8iSYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWJlB-0003Lc-Uy; Wed, 06 May 2020 13:06:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWJkr-00035s-SO; Wed, 06 May 2020 13:06:31 +0000
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11A8D2080D;
 Wed,  6 May 2020 13:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588770389;
 bh=ATHyH8IAOOsseNmBMuvH1bf7K+ZrPk88T3wrysHsvGo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nDhpwgGwrJRfIBy7r2ksIqvQKoAT+kJNfZnce9bdk2GF3cqQReLYpUCsgE+FSKx1t
 cHsExvLIyx91KR0wsLbxQxLj8iNOm5dYDDL1eIvQAoEj7cy3EWsuQcM9x3c7w6AkjZ
 BbBhm0kJjfiehpFPVj5HH6tjeIFPoIvbJ6QteoQk=
Received: by mail-ej1-f46.google.com with SMTP id q8so1271151eja.2;
 Wed, 06 May 2020 06:06:28 -0700 (PDT)
X-Gm-Message-State: AGi0Pub814yVf0ZqbBSgIVh5yhjueg++t09mn2oN630Vkpa32x2AwS8C
 QT7IyGc4H+J9ylnkoroJEg5O8GVYW5igWpilMQ==
X-Google-Smtp-Source: APiQypJOTbmWiSdzVNGly6SSLaZh9jOGdF2PgGiwlRXhJuZC2XmN36POei/eZpRmaP/4PMMLclDtYH7GC0RLkw+m2ik=
X-Received: by 2002:a17:906:31d7:: with SMTP id
 f23mr7140816ejf.118.1588770387409; 
 Wed, 06 May 2020 06:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200506124255.9477-1-bernard@vivo.com>
In-Reply-To: <20200506124255.9477-1-bernard@vivo.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 6 May 2020 21:06:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9HjWiWq5twkpXd+-D4fZ32f483815BcZ-5UbA9cyxCjA@mail.gmail.com>
Message-ID: <CAAOTY_9HjWiWq5twkpXd+-D4fZ32f483815BcZ-5UbA9cyxCjA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: eliminate the magic number in array size
To: Bernard Zhao <bernard@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_060629_954556_725B220F 
X-CRM114-Status: GOOD (  13.37  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEJlcm5hcmQ6CgpCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+IOaWvCAyMDIw5bm0
NeaciDbml6Ug6YCx5LiJIOS4i+WNiDg6NDPlr6vpgZPvvJoKPgo+IEVpbWluYXRlIHRoZSBtYWdp
YyBudW1iZXIgaW4gYXJyYXkgc2l6ZSwgdGhlcmUgbWFjcm8gZGVmaW5lcyBpbgo+IGhkbWkuaC4K
ClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4K
PiBTaWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgNiArKystLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jCj4gaW5kZXggZmY0M2EzZDgwNDEwLi40Yzk2MmM3ZjA2ZTUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+IEBAIC05ODIsNyArOTgyLDcgQEAg
c3RhdGljIGludCBtdGtfaGRtaV9zZXR1cF9hdmlfaW5mb2ZyYW1lKHN0cnVjdCBtdGtfaGRtaSAq
aGRtaSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKm1vZGUpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBoZG1pX2F2aV9pbmZv
ZnJhbWUgZnJhbWU7Cj4gLSAgICAgICB1OCBidWZmZXJbMTddOwo+ICsgICAgICAgdTggYnVmZmVy
W0hETUlfSU5GT0ZSQU1FX0hFQURFUl9TSVpFICsgSERNSV9BVklfSU5GT0ZSQU1FX1NJWkVdOwo+
ICAgICAgICAgc3NpemVfdCBlcnI7Cj4KPiAgICAgICAgIGVyciA9IGRybV9oZG1pX2F2aV9pbmZv
ZnJhbWVfZnJvbV9kaXNwbGF5X21vZGUoJmZyYW1lLAo+IEBAIC0xMDA4LDcgKzEwMDgsNyBAQCBz
dGF0aWMgaW50IG10a19oZG1pX3NldHVwX3NwZF9pbmZvZnJhbWUoc3RydWN0IG10a19oZG1pICpo
ZG1pLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFy
ICpwcm9kdWN0KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgaGRtaV9zcGRfaW5mb2ZyYW1lIGZyYW1l
Owo+IC0gICAgICAgdTggYnVmZmVyWzI5XTsKPiArICAgICAgIHU4IGJ1ZmZlcltIRE1JX0lORk9G
UkFNRV9IRUFERVJfU0laRSArIEhETUlfU1BEX0lORk9GUkFNRV9TSVpFXTsKPiAgICAgICAgIHNz
aXplX3QgZXJyOwo+Cj4gICAgICAgICBlcnIgPSBoZG1pX3NwZF9pbmZvZnJhbWVfaW5pdCgmZnJh
bWUsIHZlbmRvciwgcHJvZHVjdCk7Cj4gQEAgLTEwMzEsNyArMTAzMSw3IEBAIHN0YXRpYyBpbnQg
bXRrX2hkbWlfc2V0dXBfc3BkX2luZm9mcmFtZShzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksCj4gIHN0
YXRpYyBpbnQgbXRrX2hkbWlfc2V0dXBfYXVkaW9faW5mb2ZyYW1lKHN0cnVjdCBtdGtfaGRtaSAq
aGRtaSkKPiAgewo+ICAgICAgICAgc3RydWN0IGhkbWlfYXVkaW9faW5mb2ZyYW1lIGZyYW1lOwo+
IC0gICAgICAgdTggYnVmZmVyWzE0XTsKPiArICAgICAgIHU4IGJ1ZmZlcltIRE1JX0lORk9GUkFN
RV9IRUFERVJfU0laRSArIEhETUlfQVVESU9fSU5GT0ZSQU1FX1NJWkVdOwo+ICAgICAgICAgc3Np
emVfdCBlcnI7Cj4KPiAgICAgICAgIGVyciA9IGhkbWlfYXVkaW9faW5mb2ZyYW1lX2luaXQoJmZy
YW1lKTsKPiAtLQo+IDIuMjYuMgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
