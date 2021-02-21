Return-Path: <SRS0=8HwV=HX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96451C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Feb 2021 23:55:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3740E64E44
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Feb 2021 23:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3740E64E44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uEsIAwB4eFaAHfYdOaHMsUTdkxVqPh5va6eVYlRCjKc=; b=QdW2XlfsupbrDY8G+VgTp/H5Q
	uieaqXCjxI1Lo5GswlH0wIDvhlp2oFBtLT6RiDJ3Xrir+bEMqYCvhZ6u92aBqBInYUAxRKUjz66Jm
	9m/WSOkQyUjBBudeczziuXCkG1YlROoXoviKF4edhvdUIEYTCwhWyH1OVEchTt0ENdmObFCMaCWYu
	tOutx6Y36acyhr7tOgQMarEN2lMy3q7t7SrZ9xNoPssteCd3eWAWiqv3v7QYVdNnLfweN1Ns+dFKC
	PCucbVhL4JqtnSQJaQyavMYvCR5lSoPcS1xCYyqWJWiVYN3gRgIETxjsTxY9NubP3gy4zUvW5c3Un
	/r1KdBrTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDyZW-000128-7i; Sun, 21 Feb 2021 23:55:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDyZP-000115-SM; Sun, 21 Feb 2021 23:55:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 753A164E5F;
 Sun, 21 Feb 2021 23:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613951721;
 bh=pCV1sQy9uTqnFAmmvzP8ZG3dSUM5TF1WU3OUbHWIOv4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T1pRRi5/D/X7oVKcOmFHTJtXqE5RutVhZWk7CLVNL5XbPT8qLQytrs0gEhOLn4zd/
 oMtzAGHyufc5EAcu9qpi67kgU5sFMf0THymI2PM4BPddsXq3IEgenfteJzQ7WsMpWg
 Fh++ylm32cIb7DV/46FFXRFy9poORUQIvjU8kqLcIl0MrLQppdq+Qg8jAVnNCwkeN8
 /s3Qc9qVacn1oOqUcFUrQUhG+UfoVpF7MO9ssZOm1coRCCrCAsNKygsF8/yDUcW1cN
 zVRfdYaI0IFjAPoRJWcZeJb+WzRvA2sS0avXg/cZpzLDNODhVX8uiwhLavvKRoiERK
 9eZgDdBOeY/sQ==
Received: by mail-ed1-f41.google.com with SMTP id h10so19690787edl.6;
 Sun, 21 Feb 2021 15:55:21 -0800 (PST)
X-Gm-Message-State: AOAM531sfcVU/NzrAQ7EDOIQoGR/u25pvHhAN1KavyG8kyxJxwTtLXfL
 mWgzL112QtJzI1OPsfPG1wV41nxzXJ32j0f2XA==
X-Google-Smtp-Source: ABdhPJzjfP1nPPQ1MNPaWVnfk2Mr7HLZ5b27HJabVIkK5eW+HiRwhioG5vwkCodyWo5nFcJXQ+8wp5PIi/mGH6iID4E=
X-Received: by 2002:aa7:dd4b:: with SMTP id o11mr19989951edw.303.1613951719928; 
 Sun, 21 Feb 2021 15:55:19 -0800 (PST)
MIME-Version: 1.0
References: <1613728452-24871-1-git-send-email-yongqiang.niu@mediatek.com>
 <1613728452-24871-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1613728452-24871-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 22 Feb 2021 07:55:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY_92-Kw+BFnxgQbh2zFT5hDBAF+uZe+_VgCd4NAziQ0wUg@mail.gmail.com>
Message-ID: <CAAOTY_92-Kw+BFnxgQbh2zFT5hDBAF+uZe+_VgCd4NAziQ0wUg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/mediatek: move page flip handle into cmdq cb
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210221_185524_162117_F78E4603 
X-CRM114-Status: GOOD (  19.46  )
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
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDLmnIgxOeaXpSDpgLHkupQg5LiL5Y2INTo1NOWvq+mBk++8mgo+Cj4gbW92
ZSBwYWdlIGZsaXAgaGFuZGxlIGludG8gY21kcSBjYgo+IGlycSBjYWxsYmFjayB3aWxsIGJlZm9y
ZSBjbWRxIGZsdXNoIGRkcCByZWdpc3Rlcgo+IGludG8gaGFyZHdhcmUsIHRoYXQgd2lsbCBjYXVz
ZSB0aGUgZGlzcGxheSBmcmFtZSBwYWdlCj4gZmxpcCBldmVudCBiZWZvcmUgaXQgcmVhbHkgZGlz
cGxheSBvdXQgdGltZQo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5n
Lm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2NydGMuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBpbmRleCBiZGQzN2VhLi5iZWNlMzI3IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+IEBAIC03Miw2ICs3
MiwxMyBAQCBzdHJ1Y3QgbXRrX2NydGNfc3RhdGUgewo+ICAgICAgICAgdW5zaWduZWQgaW50ICAg
ICAgICAgICAgICAgICAgICBwZW5kaW5nX3ZyZWZyZXNoOwo+ICB9Owo+Cj4gKyNpZiBJU19SRUFD
SEFCTEUoQ09ORklHX01US19DTURRKQo+ICtzdHJ1Y3QgbXRrX2NtZHFfY2JfZGF0YSB7Cj4gKyAg
ICAgICBzdHJ1Y3QgY21kcV9wa3QgICAgICAgICAgICAgICAgICpjbWRxX2hhbmRsZTsKPiArICAg
ICAgIHN0cnVjdCBtdGtfZHJtX2NydGMgICAgICAgICAgICAgKm10a19jcnRjOwo+ICt9Owo+ICsj
ZW5kaWYKPiArCj4gIHN0YXRpYyBpbmxpbmUgc3RydWN0IG10a19kcm1fY3J0YyAqdG9fbXRrX2Ny
dGMoc3RydWN0IGRybV9jcnRjICpjKQo+ICB7Cj4gICAgICAgICByZXR1cm4gY29udGFpbmVyX29m
KGMsIHN0cnVjdCBtdGtfZHJtX2NydGMsIGJhc2UpOwo+IEBAIC05Niw3ICsxMDMsNiBAQCBzdGF0
aWMgdm9pZCBtdGtfZHJtX2NydGNfZmluaXNoX3BhZ2VfZmxpcChzdHJ1Y3QgbXRrX2RybV9jcnRj
ICptdGtfY3J0YykKPgo+ICBzdGF0aWMgdm9pZCBtdGtfZHJtX2ZpbmlzaF9wYWdlX2ZsaXAoc3Ry
dWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMpCj4gIHsKPiAtICAgICAgIGRybV9jcnRjX2hhbmRs
ZV92YmxhbmsoJm10a19jcnRjLT5iYXNlKTsKPiAgICAgICAgIGlmIChtdGtfY3J0Yy0+cGVuZGlu
Z19uZWVkc192YmxhbmspIHsKPiAgICAgICAgICAgICAgICAgbXRrX2RybV9jcnRjX2ZpbmlzaF9w
YWdlX2ZsaXAobXRrX2NydGMpOwo+ICAgICAgICAgICAgICAgICBtdGtfY3J0Yy0+cGVuZGluZ19u
ZWVkc192YmxhbmsgPSBmYWxzZTsKPiBAQCAtMjQxLDcgKzI0NywxOSBAQCBzdHJ1Y3QgbXRrX2Rk
cF9jb21wICptdGtfZHJtX2RkcF9jb21wX2Zvcl9wbGFuZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
Cj4gICNpZiBJU19SRUFDSEFCTEUoQ09ORklHX01US19DTURRKQo+ICBzdGF0aWMgdm9pZCBkZHBf
Y21kcV9jYihzdHJ1Y3QgY21kcV9jYl9kYXRhIGRhdGEpCj4gIHsKPiAtICAgICAgIGNtZHFfcGt0
X2Rlc3Ryb3koZGF0YS5kYXRhKTsKPiArICAgICAgIHN0cnVjdCBtdGtfY21kcV9jYl9kYXRhICpj
Yl9kYXRhID0gZGF0YS5kYXRhOwo+ICsKPiArICAgICAgIGlmIChjYl9kYXRhKSB7Cj4gKyAgICAg
ICAgICAgICAgIHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjID0gY2JfZGF0YS0+bXRrX2Ny
dGM7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAobXRrX2NydGMpCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgbXRrX2RybV9maW5pc2hfcGFnZV9mbGlwKG10a19jcnRjKTsKPiArCj4gKyAgICAg
ICAgICAgICAgIGlmIChjYl9kYXRhLT5jbWRxX2hhbmRsZSkKPiArICAgICAgICAgICAgICAgICAg
ICAgICBjbWRxX3BrdF9kZXN0cm95KGNiX2RhdGEtPmNtZHFfaGFuZGxlKTsKPiArCj4gKyAgICAg
ICAgICAgICAgIGtmcmVlKGNiX2RhdGEpOwo+ICsgICAgICAgfQo+ICB9Cj4gICNlbmRpZgo+Cj4g
QEAgLTQ4MSwxMyArNDk5LDIwIEBAIHN0YXRpYyB2b2lkIG10a19kcm1fY3J0Y19od19jb25maWco
c3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMpCj4gICAgICAgICB9Cj4gICNpZiBJU19SRUFD
SEFCTEUoQ09ORklHX01US19DTURRKQo+ICAgICAgICAgaWYgKG10a19jcnRjLT5jbWRxX2NsaWVu
dCkgewo+ICsgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX2NtZHFfY2JfZGF0YSAqY2JfZGF0YTsK
PiArCj4gICAgICAgICAgICAgICAgIG1ib3hfZmx1c2gobXRrX2NydGMtPmNtZHFfY2xpZW50LT5j
aGFuLCAyMDAwKTsKPiAgICAgICAgICAgICAgICAgY21kcV9oYW5kbGUgPSBjbWRxX3BrdF9jcmVh
dGUobXRrX2NydGMtPmNtZHFfY2xpZW50LCBQQUdFX1NJWkUpOwo+ICAgICAgICAgICAgICAgICBj
bWRxX3BrdF9jbGVhcl9ldmVudChjbWRxX2hhbmRsZSwgbXRrX2NydGMtPmNtZHFfZXZlbnQpOwo+
ICAgICAgICAgICAgICAgICBjbWRxX3BrdF93ZmUoY21kcV9oYW5kbGUsIG10a19jcnRjLT5jbWRx
X2V2ZW50LCBmYWxzZSk7Cj4gICAgICAgICAgICAgICAgIG10a19jcnRjX2RkcF9jb25maWcoY3J0
YywgY21kcV9oYW5kbGUpOwo+ICAgICAgICAgICAgICAgICBjbWRxX3BrdF9maW5hbGl6ZShjbWRx
X2hhbmRsZSk7Cj4gLSAgICAgICAgICAgICAgIGNtZHFfcGt0X2ZsdXNoX2FzeW5jKGNtZHFfaGFu
ZGxlLCBkZHBfY21kcV9jYiwgY21kcV9oYW5kbGUpOwo+ICsKPiArICAgICAgICAgICAgICAgY2Jf
ZGF0YSA9IGttYWxsb2Moc2l6ZW9mKCpjYl9kYXRhKSwgR0ZQX0tFUk5FTCk7Cj4gKyAgICAgICAg
ICAgICAgIGNiX2RhdGEtPmNtZHFfaGFuZGxlID0gY21kcV9oYW5kbGU7Cj4gKyAgICAgICAgICAg
ICAgIGNiX2RhdGEtPm10a19jcnRjID0gbXRrX2NydGM7Cj4gKwo+ICsgICAgICAgICAgICAgICBj
bWRxX3BrdF9mbHVzaF9hc3luYyhjbWRxX2hhbmRsZSwgZGRwX2NtZHFfY2IsIGNiX2RhdGEpOwo+
ICAgICAgICAgfQo+ICAjZW5kaWYKPiAgICAgICAgIG11dGV4X3VubG9jaygmbXRrX2NydGMtPmh3
X2xvY2spOwo+IEBAIC02NzQsNyArNjk5LDcgQEAgdm9pZCBtdGtfY3J0Y19kZHBfaXJxKHN0cnVj
dCBkcm1fY3J0YyAqY3J0Yywgc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKPiAgI2VuZGlmCj4g
ICAgICAgICAgICAgICAgIG10a19jcnRjX2RkcF9jb25maWcoY3J0YywgTlVMTCk7Cj4KPiAtICAg
ICAgIG10a19kcm1fZmluaXNoX3BhZ2VfZmxpcChtdGtfY3J0Yyk7Cj4gKyAgICAgICBkcm1fY3J0
Y19oYW5kbGVfdmJsYW5rKCZtdGtfY3J0Yy0+YmFzZSk7CgpGb3IgQ1BVIGFuZCBzaGFkb3cgcmVn
aXN0ZXIgY2FzZSwgd2hlcmUgdG8gaGFuZGxlIHBhZ2UgZmxpcD8KVGhlIGNvcnJlY3Qgc2VxdWVu
Y2Ugc2hvdWxkIGJlOgoKMS4gc2V0IHBlbmRpbmdfbmVlZHNfdmJsYW5rIHRvIHRydWUKMi4gbXRr
X2RybV9jcnRjX2h3X2NvbmZpZwozLiBpcnEgY29tZXMsIGhhbmRsZSBwYWdlIGZsaXAsIGFuZCBz
ZXQgcGVuZGluZ19uZWVkc192YmxhbmsgdG8gZmFsc2UKCkJ1dCBub3cgaXJxIGNvbWVzIGJlZm9y
ZSAyLCBzbyB0aGlzIHBhdGNoIHdhbnQgdG8gZml4IHRoaXMgYnVnLgpJIHRoaW5rIHNoYWRvdyBy
ZWdpc3RlciBhbHNvIGhhdmUgdGhpcyBwcm9ibGVtLiBUaGUgY29udHJvbCBmbG93IG9mCnNoYWRv
dyByZWdpc3RlciBpcyBzaW1pbGFyIHRvIGNtZHEsIHNvIEkgd291bGQgbGlrZSB0byBmaXggYm90
aApwcm9ibGVtIGluIHRoZSBzYW1lIHdheS4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICB9Cj4K
PiAgc3RhdGljIGludCBtdGtfZHJtX2NydGNfbnVtX2NvbXBfcGxhbmVzKHN0cnVjdCBtdGtfZHJt
X2NydGMgKm10a19jcnRjLAo+IC0tCj4gMS44LjEuMS5kaXJ0eQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
