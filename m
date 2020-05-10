Return-Path: <SRS0=ZjOp=6Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E407C47257
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 May 2020 01:31:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47F1B21582
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 May 2020 01:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hpHtOlFB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WixNi7vG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47F1B21582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cBXvK/Gme7kqHUV/GqQ2YdMK3Khvf+53Uj0F6J/+EA=; b=hpHtOlFBc2oR3r
	bGbvOCODdRyb6/IZsbBhG/7NlI8t2cGz0DFzg7VjKT20NLU3PeJ0tPHonZo6QVBy6CZQHqewAj4k2
	xhT7p9ZvPjwB0pqaBa75Mu+QfwADLwMPFQFUnP6xu57AixQjdOl2j37jwlEVr3i2OrkozrkPT2ijM
	sXYYutMmPYtD+xUSYCMHlFOPUcuF2JyF/wTE4qUyhliw4/9aJf3ahh9c2eq/FEIOwBxHxrK+XKTvD
	vxvzKhFcrUwUWqVJk25PHW8P04R43MiDU+vy1zdp/7kcE7uChuacg5iQ8lWPi52jl8HJiMEXwi9JW
	dEnkJHl2ifi5ttwIRbbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXaoA-0004XI-Dk; Sun, 10 May 2020 01:31:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXao1-0004P6-Px; Sun, 10 May 2020 01:31:03 +0000
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3708524957;
 Sun, 10 May 2020 01:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589074261;
 bh=ZFWESm7BCWR/1W4jYyjzg2GMZbin6TOpjGg+VzUNEZw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WixNi7vGq6fwF+jXK+YId/1rB8G+PTd4s4v9spXxhIej/fIqTIBM7l1xQ622g4SRs
 FJK4xHHtNzpB3AfmcDFaDThmjEcrTB2GPoJXeccEy7GlFLAUL4Jefturov6uDNdr0O
 F2R3x80oOncFEJNRshjB7qwvtjunQXppRuJOHWW0=
Received: by mail-ej1-f50.google.com with SMTP id s3so4797993eji.6;
 Sat, 09 May 2020 18:31:01 -0700 (PDT)
X-Gm-Message-State: AGi0PuaE9utzTXw1BXC/G7gsEr/AJ7uZCcgb6Ouv0Uaa9ZZVIFQaF+qj
 JfO91Ip6s/lzAQeYihX1kjCmaONrCRctneEm0Q==
X-Google-Smtp-Source: APiQypLLpbjrFxVDPm7x548/daha8AvlKc41zGr1ENz1S4CiuA/k3u8aVFCV/n89pbH/JXLI098lhHIujmbMaZ4UR7k=
X-Received: by 2002:a17:906:2503:: with SMTP id
 i3mr7553000ejb.293.1589074259573; 
 Sat, 09 May 2020 18:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200506124255.9477-1-bernard@vivo.com>
In-Reply-To: <20200506124255.9477-1-bernard@vivo.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 10 May 2020 09:30:49 +0800
X-Gmail-Original-Message-ID: <CAAOTY__L44OeoDeyhbSRQRiTSksDsW-H5c0VZNv_1h7yXC3Oww@mail.gmail.com>
Message-ID: <CAAOTY__L44OeoDeyhbSRQRiTSksDsW-H5c0VZNv_1h7yXC3Oww@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: eliminate the magic number in array size
To: Bernard Zhao <bernard@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_183101_879431_31A4601B 
X-CRM114-Status: GOOD (  12.85  )
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
CkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4
LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcKCj4KPiBT
aWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgNiArKystLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaS5jCj4gaW5kZXggZmY0M2EzZDgwNDEwLi40Yzk2MmM3ZjA2ZTUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+IEBAIC05ODIsNyArOTgyLDcgQEAgc3Rh
dGljIGludCBtdGtfaGRtaV9zZXR1cF9hdmlfaW5mb2ZyYW1lKHN0cnVjdCBtdGtfaGRtaSAqaGRt
aSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm1vZGUpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBoZG1pX2F2aV9pbmZvZnJh
bWUgZnJhbWU7Cj4gLSAgICAgICB1OCBidWZmZXJbMTddOwo+ICsgICAgICAgdTggYnVmZmVyW0hE
TUlfSU5GT0ZSQU1FX0hFQURFUl9TSVpFICsgSERNSV9BVklfSU5GT0ZSQU1FX1NJWkVdOwo+ICAg
ICAgICAgc3NpemVfdCBlcnI7Cj4KPiAgICAgICAgIGVyciA9IGRybV9oZG1pX2F2aV9pbmZvZnJh
bWVfZnJvbV9kaXNwbGF5X21vZGUoJmZyYW1lLAo+IEBAIC0xMDA4LDcgKzEwMDgsNyBAQCBzdGF0
aWMgaW50IG10a19oZG1pX3NldHVwX3NwZF9pbmZvZnJhbWUoc3RydWN0IG10a19oZG1pICpoZG1p
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpw
cm9kdWN0KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgaGRtaV9zcGRfaW5mb2ZyYW1lIGZyYW1lOwo+
IC0gICAgICAgdTggYnVmZmVyWzI5XTsKPiArICAgICAgIHU4IGJ1ZmZlcltIRE1JX0lORk9GUkFN
RV9IRUFERVJfU0laRSArIEhETUlfU1BEX0lORk9GUkFNRV9TSVpFXTsKPiAgICAgICAgIHNzaXpl
X3QgZXJyOwo+Cj4gICAgICAgICBlcnIgPSBoZG1pX3NwZF9pbmZvZnJhbWVfaW5pdCgmZnJhbWUs
IHZlbmRvciwgcHJvZHVjdCk7Cj4gQEAgLTEwMzEsNyArMTAzMSw3IEBAIHN0YXRpYyBpbnQgbXRr
X2hkbWlfc2V0dXBfc3BkX2luZm9mcmFtZShzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksCj4gIHN0YXRp
YyBpbnQgbXRrX2hkbWlfc2V0dXBfYXVkaW9faW5mb2ZyYW1lKHN0cnVjdCBtdGtfaGRtaSAqaGRt
aSkKPiAgewo+ICAgICAgICAgc3RydWN0IGhkbWlfYXVkaW9faW5mb2ZyYW1lIGZyYW1lOwo+IC0g
ICAgICAgdTggYnVmZmVyWzE0XTsKPiArICAgICAgIHU4IGJ1ZmZlcltIRE1JX0lORk9GUkFNRV9I
RUFERVJfU0laRSArIEhETUlfQVVESU9fSU5GT0ZSQU1FX1NJWkVdOwo+ICAgICAgICAgc3NpemVf
dCBlcnI7Cj4KPiAgICAgICAgIGVyciA9IGhkbWlfYXVkaW9faW5mb2ZyYW1lX2luaXQoJmZyYW1l
KTsKPiAtLQo+IDIuMjYuMgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
