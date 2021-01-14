Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9CAC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 22:56:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1644423A5C
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 22:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1644423A5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vO5fx4RAfTBC4H/RiU16DFNq04pLVG56JMno2xJXp/E=; b=ARufG7iP5nv53wMzLfGrMxeXT
	Bs9IM7aD9nfcXMXNvq1EDc94tazro+BgmzAKbRj/9Dnmib6qAqGieOE6nj6ETVglApPpggzfsyiJU
	D+KEKY1HhCHfEiSWHsZ0LJ133N+IrSKZjivbd4JNGSKvO5VcoBIsge42pOEG24cTjalx3Tf5urym3
	8qAUJxfo6adlk28VomwyiK767nAwmpxLsLppDdEEHRv+flQfNflsKGuKZ2kSOZ5qYEl16e/FpLk1N
	JVdLmL1wVIJx35Av+vv5OZP1PKYGBSBHxQkYsx7iw3ZfNtHEWA0K/PT3K7MDebtlEWTrhKYHyycvM
	55tNN8Rag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0BXK-0003tw-IU; Thu, 14 Jan 2021 22:56:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0BXG-0003sE-2E; Thu, 14 Jan 2021 22:56:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD6CC23A5A;
 Thu, 14 Jan 2021 22:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610664969;
 bh=uXGJ6xCEysiGL4Hzw3Uu8vrJXyYKiGWf1f8PXzrKYZo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T0OYHM0DE9MxSFhjc+wnS050JkMkxrfkLbuJ9FBqrk4S3OUzL7++4cDszksupy22F
 XJ10HvCzRzb9+VaoeIs9WkDS/CzFm9MI3dd6+4WbZepqbmZXHNHrG6PmMJAPPiYqk5
 II3N6J46S/kljP87jktuL+bZNDH9qImPRcYS0zczAWCgAevk6aPcGt3ajSJijEDVRd
 kHJpf6aIPg9uqKLZxjAMgNqyOOsN9pwJHLM6EaPHZ6ClEd4BVoiLQGW39whevDNNal
 m7PqT0gL5GbK+GjGvMmpedOlNdG/jyBk6UmQskq4Bw+f2FbzX9joKG+XwRWyU8fTce
 5L3lfWBxeBjbA==
Received: by mail-ed1-f54.google.com with SMTP id u19so7532332edx.2;
 Thu, 14 Jan 2021 14:56:08 -0800 (PST)
X-Gm-Message-State: AOAM532yHMyd3+n/PCz/tHP2CGzVy5Nlc+dD09GefzIQz6U5nWkB+WR6
 f5DBeksW13Z+mREyjZTWFtcvNgqAaKEZw4RYmQ==
X-Google-Smtp-Source: ABdhPJzKHMc6mf/hOkNc8AU+Eybq1geWp6Y8iOKubI270z1OJwevJFI1fq4ScBjoTzAbQLMHBTJ9Z/F6mN1e3WoR/rE=
X-Received: by 2002:a50:fc96:: with SMTP id f22mr7742818edq.162.1610664967322; 
 Thu, 14 Jan 2021 14:56:07 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-12-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-12-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 15 Jan 2021 06:55:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY_98=hJvQibAUfk3f9NF+3sEZ4JuANEDgp6WJ7cVAOygQQ@mail.gmail.com>
Message-ID: <CAAOTY_98=hJvQibAUfk3f9NF+3sEZ4JuANEDgp6WJ7cVAOygQQ@mail.gmail.com>
Subject: Re: [PATCH v3, 11/15] drm/mediatek: fix aal size config
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_175610_318608_44921954 
X-CRM114-Status: GOOD (  17.04  )
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
PiDmlrwgMjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2IMzo0OOWvq+mBk++8mgo+Cj4gdGhl
IG9yZ2luYWwgc2V0dGluZyBpcyBub3QgY29ycmVjdCwgZml4IGl0IGZvbGxvdyBoYXJkd2FyZSBk
YXRhIHNoZWV0Lgo+IGlmIGtlZXAgdGhpcyBlcnJvciBzZXR0aW5nLCBtdDgxNzMvbXQ4MTgzIGRp
c3BsYXkgb2sKPiBidXQgbXQ4MTkyIGRpc3BsYXkgYWJub3JtYWwuCj4KCkFwcGxpZWQgdG8gbWVk
aWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVk
aWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+IEZpeGVzOiAwNjY0ZDEzOTJj
MjYgKGRybS9tZWRpYXRlazogQWRkIEFBTCBlbmdpbmUgYmFzaWMgZnVuY3Rpb24pCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBpbmRleCBmYzAxZmVh
Li42MDgxODAwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcF9jb21wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBf
Y29tcC5jCj4gQEAgLTE3NCw3ICsxNzQsNyBAQCBzdGF0aWMgdm9pZCBtdGtfYWFsX2NvbmZpZyhz
dHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQgdywKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaCwgdW5zaWduZWQgaW50IHZyZWZyZXNoLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBicGMsIHN0cnVjdCBjbWRxX3Br
dCAqY21kcV9wa3QpCj4gIHsKPiAtICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIGggPDwg
MTYgfCB3LCBjb21wLCBESVNQX0FBTF9TSVpFKTsKPiArICAgICAgIG10a19kZHBfd3JpdGUoY21k
cV9wa3QsIHcgPDwgMTYgfCBoLCBjb21wLCBESVNQX0FBTF9TSVpFKTsKPiAgfQo+Cj4gIHN0YXRp
YyB2b2lkIG10a19hYWxfc3RhcnQoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKPiAtLQo+IDEu
OC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
