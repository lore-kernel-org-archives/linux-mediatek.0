Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3683BC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 00:00:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F02EF22CA2
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 00:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F02EF22CA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cvW1D7JOKTbu5fVjE90fMWQk35dsoKgsSV5qrgTdkzs=; b=JPvQLq4xy3xBSejGzVGjpuwVa
	DF10z+al4sC2BKXkotbUH/9SYm4HqrXyFqXtckcgJm/dyMtYdOr6YyaUaJCMI5PpwVlJlaFqjcs4N
	QIO4QDXgF9NZIjxJozcJhKVfglXl7bTeKKXu7KaeGAuF9bvmz+qdKzmCoKBiPfnemrYMOtY05kdaf
	D8n1sJhejFdmayYBSqavPWrSxqwGgVBkoabv5ve/ncEtIfmJ4WTVUcdEqOL0Cn/ub0hGz1QU65Kpd
	BlsnO1FzRsN8+MsfWPUR+SPc+SbZgULtd3Vz1cgwjzMDyinFsmnJS2S3Yr62jKLgZDxFmVEf+PWX3
	PnzbVux2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz76X-00073K-96; Tue, 12 Jan 2021 00:00:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz76N-0006yp-VJ; Tue, 12 Jan 2021 00:00:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE9EF22D57;
 Mon, 11 Jan 2021 23:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610409599;
 bh=S7y++HNlfNSNt0z4hKXdDcHN7UOBqQprNlJ3aTrtBYQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HiEvwXA9IroMbrlXh21jp1S6SSV5cJVAv5JBbdYAC0J/v9aYUHcpGAN4kNXLIkpbH
 VNycfN43tf06eRJc9uEXH005Degd9TEXsuYcw4BgAgx5jcd5kimfaSH8hJGC0pd2Rg
 bH9aUEuYO25srMpMsa+x1RYbgPfKAHoHjxhkFNLp0fvceYv2qqYEZul+ZrynvrGO5N
 iXYbeQL2ir8N6zlGoZO8A0eke6L1NsfJiXYELNcL8lGh/esLkO3imBgr/5Ro4Rrrbx
 NPVXKTy+8p/KLyv9Hn8Am30PzYImkTnzjPkIegI1cRXuwzCJh+Iun+1/mH/1AEmV8f
 4Qq0DxucXbkKA==
Received: by mail-ej1-f53.google.com with SMTP id t16so857460ejf.13;
 Mon, 11 Jan 2021 15:59:58 -0800 (PST)
X-Gm-Message-State: AOAM532o1iBr48EK9aL3IMNiPX00OovDk2uCmBtdyfYLtnavaAtXacfq
 hNtPRZWLbgFVHsc6+4cju9+R9z3ZutZRN9eCtQ==
X-Google-Smtp-Source: ABdhPJxUeXqwm6w53tZVM99kGi6AORPcbUrwUwsYACUNteu6ZKUg3hrzvr3AzddjV19UEYCrp6RdUGZBIAssahFIByc=
X-Received: by 2002:a17:906:ae4e:: with SMTP id
 lf14mr1336071ejb.310.1610409597420; 
 Mon, 11 Jan 2021 15:59:57 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-8-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-8-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 12 Jan 2021 07:59:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9_LN8nYSmg42gpR5dLqTe+ABt61WzM8S5cp2D6-rWKyw@mail.gmail.com>
Message-ID: <CAAOTY_9_LN8nYSmg42gpR5dLqTe+ABt61WzM8S5cp2D6-rWKyw@mail.gmail.com>
Subject: Re: [PATCH v3, 07/15] drm/mediatek: enable OVL_LAYER_SMI_ID_EN for
 multi-layer usecase
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_190000_187231_0B197482 
X-CRM114-Status: GOOD (  19.16  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2IMzo0NOWvq+mBk++8mgo+Cj4gZW5h
YmxlIE9WTF9MQVlFUl9TTUlfSURfRU4gZm9yIG11bHRpLWxheWVyIHVzZWNhc2UKCkNvdWxkIHlv
dSBkZXNjcmliZSBtb3JlIGluZm9ybWF0aW9uPyBXaXRob3V0IHRoaXMgcGF0Y2gsIHdoYXQgd291
bGQgaGFwcGVuPwoKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5u
aXVAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsLmMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
b3ZsLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiBpbmRleCBi
NDdjMjM4Li40OTM0YmVlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9vdmwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9v
dmwuYwo+IEBAIC0yMyw2ICsyMyw3IEBACj4gICNkZWZpbmUgRElTUF9SRUdfT1ZMX1JTVCAgICAg
ICAgICAgICAgICAgICAgICAgMHgwMDE0Cj4gICNkZWZpbmUgRElTUF9SRUdfT1ZMX1JPSV9TSVpF
ICAgICAgICAgICAgICAgICAgMHgwMDIwCj4gICNkZWZpbmUgRElTUF9SRUdfT1ZMX0RBVEFQQVRI
X0NPTiAgICAgICAgICAgICAgMHgwMDI0Cj4gKyNkZWZpbmUgT1ZMX0xBWUVSX1NNSV9JRF9FTiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMCkKPiAgI2RlZmluZSBPVkxfQkdDTFJfU0VM
X0lOICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgyKQo+ICAjZGVmaW5lIERJU1Bf
UkVHX09WTF9ST0lfQkdDTFIgICAgICAgICAgICAgICAgIDB4MDAyOAo+ICAjZGVmaW5lIERJU1Bf
UkVHX09WTF9TUkNfQ09OICAgICAgICAgICAgICAgICAgIDB4MDAyYwo+IEBAIC02MSw2ICs2Miw3
IEBAIHN0cnVjdCBtdGtfZGlzcF9vdmxfZGF0YSB7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgZ21j
X2JpdHM7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgbGF5ZXJfbnI7Cj4gICAgICAgICBib29sIGZt
dF9yZ2I1NjVfaXNfMDsKPiArICAgICAgIGJvb2wgc21pX2lkX2VuOwo+ICB9Owo+Cj4gIC8qKgo+
IEBAIC0xMTYsNyArMTE4LDE3IEBAIHN0YXRpYyB2b2lkIG10a19vdmxfZGlzYWJsZV92Ymxhbmso
c3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKPgo+ICBzdGF0aWMgdm9pZCBtdGtfb3ZsX3N0YXJ0
KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCj4gIHsKPiArICAgICAgIHN0cnVjdCBtdGtfZGlz
cF9vdmwgKm92bCA9IGNvbXBfdG9fb3ZsKGNvbXApOwo+ICsKPiAgICAgICAgIHdyaXRlbF9yZWxh
eGVkKDB4MSwgY29tcC0+cmVncyArIERJU1BfUkVHX09WTF9FTik7Cj4gKwo+ICsgICAgICAgaWYo
b3ZsLT5kYXRhLT5zbWlfaWRfZW4pIHsKPiArICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHJl
ZzsKPiArCj4gKyAgICAgICAgICAgICAgIHJlZyA9IHJlYWRsKGNvbXAtPnJlZ3MgKyBESVNQX1JF
R19PVkxfREFUQVBBVEhfQ09OKTsKPiArICAgICAgICAgICAgICAgcmVnID0gcmVnIHwgT1ZMX0xB
WUVSX1NNSV9JRF9FTjsKPiArICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBjb21w
LT5yZWdzICsgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTik7CgpJIHRoaW5rIHRoaXMgc2V0dGlu
ZyBzaG91bGQgYmVmb3JlIHdyaXRlIDEgdG8gRElTUF9SRUdfT1ZMX0VOLgoKPiArICAgICAgIH0K
PiAgfQo+Cj4gIHN0YXRpYyB2b2lkIG10a19vdmxfc3RvcChzdHJ1Y3QgbXRrX2RkcF9jb21wICpj
b21wKQoKU2hvdWxkIGNsZWFyIERJU1BfUkVHX09WTF9EQVRBUEFUSF9DT04gd2hlbiBzdG9wPwoK
UmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
