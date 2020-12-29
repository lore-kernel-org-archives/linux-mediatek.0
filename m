Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A594C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 15:22:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDB75221F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 15:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDB75221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DPjF5tKe59Pqn1rGBCvklYrWDTuAVovphG5wBAaQYKw=; b=xmyTTi3cS5eDYw+BWySBN7ryP
	cXzdFM/WJgOBXIOdNgzfePCopxdMgtuBGlKoleKMuqLh2zzJP5MTrmWVCxpiWPN37i7RXk2t6tBMe
	iOtVHG6b1MgEv1wwZ+L+WV2KjdJGhWhpfTt9iiudz7iahb1D0GmYHJ/i9DFim+0dcIovNdny+Gkyl
	SsgoCmGvDAD7DR3F0u3N2NYh4Zm3UqOhTWovWcvDMyICsCsEjpO1pjh5mWspcQQXe/4yhO3g8RaxJ
	TmtQYNXVnW834+mcs3cDIikbrN9vboTkMESo0ZMGScL5HdDYArs5BuTrHviWiSDQhDx9A2EnjTkWg
	r5apYZ3fA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuGpT-0005ou-5F; Tue, 29 Dec 2020 15:22:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuGpP-0005nz-O0
 for linux-mediatek@lists.infradead.org; Tue, 29 Dec 2020 15:22:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8ABC122209
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Dec 2020 15:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609255346;
 bh=EcbY3tBmE+XNiwSBNU+M0B9u9tbcrcx1W9ScTO00l2I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pN72iZrV/xvNPE9aYrtkPkxRAjmk8J6P0ikMKuM++3r/XBlevoLkLJkIY5A0Uoaih
 bP4yR70tUaJT5C1TYeh3YjeSVT1z/BUkYSTLlnjQ/kNDOIH3e8EtWCYvC9dVUNIjXE
 AITK9OROC9mDtKWFXk1qTbznRPnz5q2QI1nzPcjwfuinP6omSIKaxKVDG4SlyWnsm7
 F9+WRBZpikYJ1wDwC41Z6MkFuJ3oXIs7nmnBdR+eqTXeIfbNIQKZtyrerILdpEpByj
 lmW+LNcFw6F8+xtMJhYHQxY+0zZmXKcgeDNMVzWZ3bWllZnnFSyra6390GHTiIeenB
 JwyJ9f7nFjcxA==
Received: by mail-wm1-f44.google.com with SMTP id r4so2494572wmh.5
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Dec 2020 07:22:26 -0800 (PST)
X-Gm-Message-State: AOAM531R91CYaX2LTUOWWdgiikpWahRr2wx2Spr5OHbJd/Fnx8h9Y6At
 yHWIk5QKMKyZQRYhVdibb/S9YGhCARjISxOtJg==
X-Google-Smtp-Source: ABdhPJw83mtFxW60YQI/HdgpPys5MV9pxy4kWjlMbFbA7Z1YOykYu4n+U3qMNGmaxcnU/lk60OcC5GVIqLCtncF4QkM=
X-Received: by 2002:a05:600c:25c2:: with SMTP id
 2mr3975607wml.170.1609255345223; 
 Tue, 29 Dec 2020 07:22:25 -0800 (PST)
MIME-Version: 1.0
References: <20201225082441.10412-1-jitao.shi@mediatek.com>
In-Reply-To: <20201225082441.10412-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Dec 2020 23:22:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8MFfGg_uZDZXDuhm+jO=bc8hiXx=09Nva5vyaUrVwmKQ@mail.gmail.com>
Message-ID: <CAAOTY_8MFfGg_uZDZXDuhm+jO=bc8hiXx=09Nva5vyaUrVwmKQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Use IRQF_TRIGGER_NONE for dsi irq
 trigger type
To: Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_102227_975126_3F4C7077 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 David Airlie <airlied@linux.ie>, stonea168@163.com, cawa.cheng@mediatek.com,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDEy5pyIMjXml6Ug6YCx5LqUIOS4i+WNiDQ6MzDlr6vpgZPvvJoKPgo+IFRoZSBpbnRlcnJ1cHQg
dHJpZ2dlciBpcyBhbHJlYWR5IHNldCBieSBPRi4gV2hlbiBkbyBkZXZtX3JlcXVlc3RfaXJxKCkK
PiBpbiBkcml2ZXIsIHBsZWFzZSB1c2UgSVJRRl9UUklHR0VSX05PTkUgYW5kIGRvbid0IHNwZWNp
ZnkgdHJpZ2dlciB0eXBlCj4gYWdhaW4uCj4KPiBDaGFuZ2UtSWQ6IEllNTlkN2JkOWE0NGExMzA0
MjA4OTBiMTY5Y2MyZTZmZWUzYWQ3NjMzCgpJIHJlbW92ZSBjaGFuZ2UtaWQgYW5kIGFwcGx5IHRo
aXMgcGF0Y2ggdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4
LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+IFNp
Z25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYwo+IGluZGV4IDRhMTg4YTk0MmMzOC4uMWQ2MjQ4OTMwYmRmIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTExMjgsOSArMTEyOCw4IEBAIHN0YXRpYyBp
bnQgbXRrX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAg
ICAgICAgICBnb3RvIGVycl91bnJlZ2lzdGVyX2hvc3Q7Cj4gICAgICAgICB9Cj4KPiAtICAgICAg
IGlycV9zZXRfc3RhdHVzX2ZsYWdzKGlycV9udW0sIElSUV9UWVBFX0xFVkVMX0xPVyk7Cj4gICAg
ICAgICByZXQgPSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYsIGlycV9udW0sIG10a19kc2lf
aXJxLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJUlFGX1RSSUdHRVJfTE9XLCBk
ZXZfbmFtZSgmcGRldi0+ZGV2KSwgZHNpKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgSVJRRl9UUklHR0VSX05PTkUsIGRldl9uYW1lKCZwZGV2LT5kZXYpLCBkc2kpOwo+ICAgICAg
ICAgaWYgKHJldCkgewo+ICAgICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWls
ZWQgdG8gcmVxdWVzdCBtZWRpYXRlayBkc2kgaXJxXG4iKTsKPiAgICAgICAgICAgICAgICAgZ290
byBlcnJfdW5yZWdpc3Rlcl9ob3N0Owo+IC0tCj4gMi4xMi41Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
