Return-Path: <SRS0=Y72t=EV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33CEC61DD8
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2020 19:25:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 614CA22384
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2020 19:25:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LkF4BHUK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyIikv2Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 614CA22384
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wdf2yH5V9bhcssQioPN61Rmw3DGfXyHDSeKF6RL+5sU=; b=LkF4BHUKpbfu9FZi1C9kRoBzK
	QXMXIvOg1Owgdgfc1gn7Ih7N6pK4qWdspRE/zvfnS91KwtkYODYFtUWaV3A+EmRGE5R1RwzCIsc1b
	A6iPwt8Wf0x9CltXc2KN87GA/+icp2FpXM5HNUeB1VGmSRU4Fut7CD5f79SCJUzTh5+Wkq2jwzJBg
	Kf88gMmMYlWnMRJrn5ztn5PrWcheNqflkbxeCc99+V8qRv/GWYe1Femq/avPqpffho0e88sgXuFNW
	6JiK4ctU3wgd2UAoX5k/z63qB6NG2zLmrnPSTp/HzQSG+0YzYrwiTu41qb/WSoTlFAW+91APUsa4a
	+irJwleNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keNeb-0007pO-Tj; Sun, 15 Nov 2020 19:25:37 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keNeY-0007ok-9k
 for linux-mediatek@lists.infradead.org; Sun, 15 Nov 2020 19:25:35 +0000
Received: by mail-ej1-x642.google.com with SMTP id f20so21408797ejz.4
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Nov 2020 11:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xB3qnHJkLixs9eUsHbiHUvqVDk7eh+uvldQKjizPJpk=;
 b=gyIikv2QoBHSmo3GXfTZCoJpENLKByqzYlL4BJQAkUjm8QbHavAdx6z8LCFuDODvAw
 PnJoLxPyaQnOMUw/LZgsD+7GDn3nh+9LJoZhP4xDFlZO1bB+/a1hcUr6TOm/flRwUoHQ
 TAMfyxta6QoKfhYNUg2oXnWIwI5gTtm6hBQnnukj17HgzF1KELxcpvn0W5LE9MGZ8zfT
 YN5u0I12pR0dsx8TRsVkH/ZNMpR5nVxoE8odCsBmidofp5Zby7JZV+lEVnj9Q0e55i26
 N3KZxGIwoKYHbCWTPAd+WkJRRPfBuGwRq95IfdeBk4DziMAkAepsezC9x95P2IumUZQe
 G3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xB3qnHJkLixs9eUsHbiHUvqVDk7eh+uvldQKjizPJpk=;
 b=KLyyfzIwENtZhojAvZoaa5FY/vhibgeRkbFRIAvCMrraxTadvACoZ6SI5k3pm/Ek0O
 4YvkamC9oofUBhtOlKOYiJ1sXGapBtkkkuudbDPar0TI5EiCJbFbRXYW2wsWaRNu0/Hx
 6s5Gxe/wr42PJYleCENh/ei5iU7c6SydT28NeTdHbNvlILrv3iSk8Kh9H0quPcpcE2jm
 razVQeYPdhedgAiPNs37H/WrxGLi/rE2YKcJJEiqQmdCde63gjnlmQB7mGyyZrb1DuXF
 K9lTK+nR2ckhg/L+qSS1SNhtGYFi00jD+sF0cY0Y1i1gF+826YYKNYAqgdluX6CekJpz
 fB8Q==
X-Gm-Message-State: AOAM531vWN5xzYYu24GsprKoZhfswZyu2AX6HKicnP5eVwMIv0aq8Srb
 3/S4stbda4eVtUEAh/1kyN0=
X-Google-Smtp-Source: ABdhPJwojTgCrs7WkkvNVHL8ZGygT/viZY4rQYGKpf65SaKcUgVB/s3s2/PwE3EfvSJVKjs1imrfoQ==
X-Received: by 2002:a17:906:3ada:: with SMTP id
 z26mr11511937ejd.151.1605468331907; 
 Sun, 15 Nov 2020 11:25:31 -0800 (PST)
Received: from a-VirtualBox ([103.120.71.253])
 by smtp.gmail.com with ESMTPSA id e19sm9306082ejz.35.2020.11.15.11.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 11:25:31 -0800 (PST)
Date: Mon, 16 Nov 2020 00:25:22 +0500
From: Bilal Wasim <bilalwasim676@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH] drm/mediatek: dsi: Calculate horizontal_backporch_byte
 by itself
Message-ID: <20201116002522.1a5c3736@a-VirtualBox>
In-Reply-To: <CAAOTY_-16s=NXg2kOJijhO+82nNsT9HkKj4PVh1qN8dKchBOBA@mail.gmail.com>
References: <20201115001403.7833-1-chunkuang.hu@kernel.org>
 <CAAOTY_-16s=NXg2kOJijhO+82nNsT9HkKj4PVh1qN8dKchBOBA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_142534_358722_D2E4EAB8 
X-CRM114-Status: GOOD (  21.21  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ0ssIAoKT24gU3VuLCAxNSBOb3YgMjAyMCAwODo1MzoyNCArMDgwMApDaHVuLUt1YW5nIEh1
IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IEhpLCBCaWxhbDoKPiAKPiBQbGVh
c2UgaGVscCB0byB0ZXN0IHRoaXMgcGF0Y2ggb24geW91ciBDaHJvbWVib29rIGVsbSwgdGhhbmtz
Lgo+IAo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZyBIdQoKSnVzdCB0cmllZCB0aGlzIHBhdGNoIG9u
IHRoZSBDaHJvbWVib29rIEVsbSwgYW5kIGl0IGRvZXNuJ3Qgd29yay4gVGhlCkhETUkgc2NyZWVu
IHJlbWFpbnMgYmxhY2ssIHRob3VnaCB0aGUgcmVzdCBvZiB0aGUgc3lzdGVtIGtlZXBzIG9uCm9w
ZXJhdGluZyBub3JtYWxseS4KCj4gCj4gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5l
bC5vcmc+IOaWvCAyMDIw5bm0MTHmnIgxNeaXpSDpgLHml6UKPiDkuIrljYg4OjE05a+r6YGT77ya
Cj4gPgo+ID4gRnJvbTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+Cj4gPiBVc2luZyB2
bS0+aGZyb250X3BvcmNoICsgdm0tPmhiYWNrX3BvcmNoIHRvIGNhbGN1bGF0ZQo+ID4gaG9yaXpv
bnRhbF9iYWNrcG9yY2hfYnl0ZSB3b3VsZCBtYWtlIGl0IG5lZ3RpdmUsIHNvCj4gPiB1c2UgaG9y
aXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSBpdHNlbGYgdG8gbWFrZSBpdCBwb3NpdGl2ZS4KPiA+Cj4g
PiBGaXhlczogMzViZjk0OGYxZWRiICgiZHJtL21lZGlhdGVrOiBkc2k6IEZpeCBzY3JvbGxpbmcg
b2YgcGFuZWwKPiA+IHdpdGggc21hbGwgaGZwIG9yIGhicCIpCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IENodW4tS3Vh
bmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDUzCj4gPiArKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0gMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDM1Cj4gPiBkZWxldGlvbnMo
LSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2ku
Ywo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGluZGV4Cj4gPiA0YTE4
OGE5NDJjMzguLjJhNjRmZGFlZDlhNyAxMDA2NDQgLS0tCj4gPiBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMgKysrCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHNpLmMgQEAgLTQ0NCw3ICs0NDQsMTAgQEAgc3RhdGljCj4gPiB2b2lkIG10a19kc2lfY29uZmln
X3Zkb190aW1pbmcoc3RydWN0IG10a19kc2kgKmRzaSkgdTMyCj4gPiBob3Jpem9udGFsX3N5bmNf
YWN0aXZlX2J5dGU7IHUzMiBob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlOwo+ID4gICAgICAgICB1
MzIgaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGU7Cj4gPiArICAgICAgIHUzMiBob3Jpem9udGFs
X2Zyb250X2JhY2tfYnl0ZTsKPiA+ICsgICAgICAgdTMyIGRhdGFfcGh5X2N5Y2xlc19ieXRlOwo+
ID4gICAgICAgICB1MzIgZHNpX3RtcF9idWZfYnBwLCBkYXRhX3BoeV9jeWNsZXM7Cj4gPiArICAg
ICAgIHUzMiBkZWx0YTsKPiA+ICAgICAgICAgc3RydWN0IG10a19waHlfdGltaW5nICp0aW1pbmcg
PSAmZHNpLT5waHlfdGltaW5nOwo+ID4KPiA+ICAgICAgICAgc3RydWN0IHZpZGVvbW9kZSAqdm0g
PSAmZHNpLT52bTsKPiA+IEBAIC00NzQsNDIgKzQ3NywyMiBAQCBzdGF0aWMgdm9pZCBtdGtfZHNp
X2NvbmZpZ192ZG9fdGltaW5nKHN0cnVjdAo+ID4gbXRrX2RzaSAqZHNpKSBkYXRhX3BoeV9jeWNs
ZXMgPSB0aW1pbmctPmxweCArIHRpbWluZy0+ZGFfaHNfcHJlcGFyZQo+ID4gKyB0aW1pbmctPmRh
X2hzX3plcm8gKyB0aW1pbmctPmRhX2hzX2V4aXQ7Cj4gPgo+ID4gLSAgICAgICBpZiAoZHNpLT5t
b2RlX2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9WSURFT19CVVJTVCkgewo+ID4gLSAgICAgICAgICAg
ICAgIGlmICgodm0tPmhmcm9udF9wb3JjaCArIHZtLT5oYmFja19wb3JjaCkgKgo+ID4gZHNpX3Rt
cF9idWZfYnBwID4KPiA+IC0gICAgICAgICAgICAgICAgICAgZGF0YV9waHlfY3ljbGVzICogZHNp
LT5sYW5lcyArIDE4KSB7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBob3Jpem9udGFsX2Zy
b250cG9yY2hfYnl0ZSA9Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZtLT5o
ZnJvbnRfcG9yY2ggKiBkc2lfdG1wX2J1Zl9icHAgLQo+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAoZGF0YV9waHlfY3ljbGVzICogZHNpLT5sYW5lcyArIDE4KQo+ID4gKgo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2bS0+aGZyb250X3BvcmNoIC8KPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZtLT5oZnJvbnRfcG9yY2ggKwo+ID4gdm0t
PmhiYWNrX3BvcmNoKTsgLQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9i
YWNrcG9yY2hfYnl0ZSA9Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhvcml6
b250YWxfYmFja3BvcmNoX2J5dGUgLQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAoZGF0YV9waHlfY3ljbGVzICogZHNpLT5sYW5lcyArIDE4KQo+ID4gKgo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2bS0+aGJhY2tfcG9yY2ggLwo+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAodm0tPmhmcm9udF9wb3JjaCArCj4gPiB2bS0+aGJhY2tfcG9y
Y2gpOwo+ID4gLSAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICBEUk1fV0FSTigiSEZQIGxlc3MgdGhhbiBkLXBoeSwgRlBTIHdpbGwKPiA+IHVuZGVyIDYw
SHpcbiIpOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9mcm9udHBvcmNo
X2J5dGUgPQo+ID4gdm0tPmhmcm9udF9wb3JjaCAqCj4gPiAtCj4gPiBkc2lfdG1wX2J1Zl9icHA7
Cj4gPiAtICAgICAgICAgICAgICAgfQo+ID4gKyAgICAgICBkZWx0YSA9IGRzaS0+bW9kZV9mbGFn
cyAmIE1JUElfRFNJX01PREVfVklERU9fQlVSU1QgPyAxOCA6Cj4gPiAxMjsgKwo+ID4gKyAgICAg
ICBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSA9IHZtLT5oZnJvbnRfcG9yY2ggKgo+ID4gZHNp
X3RtcF9idWZfYnBwOwo+ID4gKyAgICAgICBob3Jpem9udGFsX2Zyb250X2JhY2tfYnl0ZSA9IGhv
cml6b250YWxfZnJvbnRwb3JjaF9ieXRlICsKPiA+IGhvcml6b250YWxfYmFja3BvcmNoX2J5dGU7
Cj4gPiArICAgICAgIGRhdGFfcGh5X2N5Y2xlc19ieXRlID0gZGF0YV9waHlfY3ljbGVzICogZHNp
LT5sYW5lcyArIGRlbHRhOwo+ID4gKwo+ID4gKyAgICAgICBpZiAoaG9yaXpvbnRhbF9mcm9udF9i
YWNrX2J5dGUgPiBkYXRhX3BoeV9jeWNsZXNfYnl0ZSkgewo+ID4gKyAgICAgICAgICAgICAgIGhv
cml6b250YWxfZnJvbnRwb3JjaF9ieXRlIC09IGRhdGFfcGh5X2N5Y2xlc19ieXRlICoKPiA+ICsK
PiA+IGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlIC8KPiA+ICsKPiA+IGhvcml6b250YWxfZnJv
bnRfYmFja19ieXRlOyArCj4gPiArICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hf
Ynl0ZSAtPSBkYXRhX3BoeV9jeWNsZXNfYnl0ZSAqCj4gPiArCj4gPiBob3Jpem9udGFsX2JhY2tw
b3JjaF9ieXRlIC8KPiA+ICsKPiA+IGhvcml6b250YWxfZnJvbnRfYmFja19ieXRlOyB9IGVsc2Ug
ewo+ID4gLSAgICAgICAgICAgICAgIGlmICgodm0tPmhmcm9udF9wb3JjaCArIHZtLT5oYmFja19w
b3JjaCkgKgo+ID4gZHNpX3RtcF9idWZfYnBwID4KPiA+IC0gICAgICAgICAgICAgICAgICAgZGF0
YV9waHlfY3ljbGVzICogZHNpLT5sYW5lcyArIDEyKSB7Cj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSA9Cj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHZtLT5oZnJvbnRfcG9yY2ggKiBkc2lfdG1wX2J1Zl9icHAgLQo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoZGF0YV9waHlfY3ljbGVzICogZHNpLT5sYW5l
cyArIDEyKQo+ID4gKgo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2bS0+aGZy
b250X3BvcmNoIC8KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZtLT5oZnJv
bnRfcG9yY2ggKwo+ID4gdm0tPmhiYWNrX3BvcmNoKTsKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgPQo+ID4gaG9yaXpvbnRhbF9iYWNrcG9yY2hf
Ynl0ZSAtCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChkYXRhX3BoeV9jeWNs
ZXMgKiBkc2ktPmxhbmVzICsgMTIpCj4gPiAqCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHZtLT5oYmFja19wb3JjaCAvCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICh2bS0+aGZyb250X3BvcmNoICsKPiA+IHZtLT5oYmFja19wb3JjaCk7Cj4gPiAtICAgICAg
ICAgICAgICAgfSBlbHNlIHsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIERSTV9XQVJOKCJI
RlAgbGVzcyB0aGFuIGQtcGh5LCBGUFMgd2lsbAo+ID4gdW5kZXIgNjBIelxuIik7Cj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSA9Cj4gPiB2bS0+
aGZyb250X3BvcmNoICoKPiA+IC0KPiA+IGRzaV90bXBfYnVmX2JwcDsKPiA+IC0gICAgICAgICAg
ICAgICB9Cj4gPiArICAgICAgICAgICAgICAgRFJNX1dBUk4oIkhGUCArIEhCUCBsZXNzIHRoYW4g
ZC1waHksIEZQUyB3aWxsIHVuZGVyCj4gPiA2MEh6XG4iKTsgfQo+ID4KPiA+ICAgICAgICAgd3Jp
dGVsKGhvcml6b250YWxfc3luY19hY3RpdmVfYnl0ZSwgZHNpLT5yZWdzICsgRFNJX0hTQV9XQyk7
Cj4gPiAtLQo+ID4gMi4xNy4xCj4gPiAgCgpUaGFua3MsCkJpbGFsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
