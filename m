Return-Path: <SRS0=Y72t=EV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8114EC5519F
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2020 00:53:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E2C824137
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2020 00:53:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lLRdInBX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/JPZvzl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E2C824137
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cc7UrLdo8pm0wqduPMDmaxBmCEdrIktYilIjeUCTg0g=; b=lLRdInBXsMblXvfK9yASVwY5k
	Z4HVmhUNyQoDfStKHhKMv9rzDmwa7RkJDOZpcdpDebnSAK1C2J9NhCPCkcZUs7Xhdz9/biVFNYKBq
	ma4DUZMUhZ2eu6HLZKVLqxjyBNxPXRkSXnOZtKfV4KX6JhtAHGxpkgHLydHqeJpnsakHyAW5S10tI
	dYJYdHx6KXmcfjCgp/aIiXRyn08st2+YHEDObKDj0hsYCPpO1d3W3glzfCrvUTsdc5Gi8t6W8LMl3
	TuPysApsy61b1DVE2bu7ICCdvfnvne95OjvicQth+hiKz3K/PL/QrXMjjtKtw0x1kDAzn7z1Nd6Wn
	Y5TzNDwvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke6IW-0003Bk-7j; Sun, 15 Nov 2020 00:53:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke6IU-0003BO-8O
 for linux-mediatek@lists.infradead.org; Sun, 15 Nov 2020 00:53:39 +0000
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D25942415A
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Nov 2020 00:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605401617;
 bh=2xRinuFWqV9wNbtdYn55Adl9enTowu3JLHrktB7k1r8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=I/JPZvzlqno3hdNkxz2d9/Q6nqCdGlmILxEFb8oiPomoOTBUzpW337OlrsZQQ3PCx
 7axUizSij8Yger2piJ5WXvJ29AViJfdCscI7ZS+OXMe2GwNcTcmtmtoOYBm5Sv78g2
 mVWVmJRysOTVvxTiaO+9eid4wqhiCgD0qMf4c3YE=
Received: by mail-ed1-f52.google.com with SMTP id l5so15011106edq.11
 for <linux-mediatek@lists.infradead.org>; Sat, 14 Nov 2020 16:53:36 -0800 (PST)
X-Gm-Message-State: AOAM531HGhhZixdC4J/wmbiug+n+JCNmtbkGJsTRzExwWJe0+e6DBGmU
 kUerlJRq4EUfqIa8afWhbBA9C1A8/INkNq2fcw==
X-Google-Smtp-Source: ABdhPJwW4TOZ4awkXt4BWs5LinUavfZHC1Yo8OVPShdZC9gORcWby3eWUHFQvp97/lNMofLDe1x8TOTpuL10pQBj7Tg=
X-Received: by 2002:a50:f742:: with SMTP id j2mr1351097edn.72.1605401615457;
 Sat, 14 Nov 2020 16:53:35 -0800 (PST)
MIME-Version: 1.0
References: <20201115001403.7833-1-chunkuang.hu@kernel.org>
In-Reply-To: <20201115001403.7833-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 15 Nov 2020 08:53:24 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-16s=NXg2kOJijhO+82nNsT9HkKj4PVh1qN8dKchBOBA@mail.gmail.com>
Message-ID: <CAAOTY_-16s=NXg2kOJijhO+82nNsT9HkKj4PVh1qN8dKchBOBA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Calculate horizontal_backporch_byte by
 itself
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_195338_432562_923E0C74 
X-CRM114-Status: GOOD (  18.98  )
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
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bilal Wasim <bilalwasim676@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEJpbGFsOgoKUGxlYXNlIGhlbHAgdG8gdGVzdCB0aGlzIHBhdGNoIG9uIHlvdXIgQ2hyb21l
Ym9vayBlbG0sIHRoYW5rcy4KClJlZ2FyZHMsCkNodW4tS3VhbmcgSHUKCkNodW4tS3VhbmcgSHUg
PGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDEx5pyIMTXml6Ug6YCx5pelIOS4
iuWNiDg6MTTlr6vpgZPvvJoKPgo+IEZyb206IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4K
PiBVc2luZyB2bS0+aGZyb250X3BvcmNoICsgdm0tPmhiYWNrX3BvcmNoIHRvIGNhbGN1bGF0ZQo+
IGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgd291bGQgbWFrZSBpdCBuZWd0aXZlLCBzbwo+IHVz
ZSBob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlIGl0c2VsZiB0byBtYWtlIGl0IHBvc2l0aXZlLgo+
Cj4gRml4ZXM6IDM1YmY5NDhmMWVkYiAoImRybS9tZWRpYXRlazogZHNpOiBGaXggc2Nyb2xsaW5n
IG9mIHBhbmVsIHdpdGggc21hbGwgaGZwIG9yIGhicCIpCj4KPiBTaWduZWQtb2ZmLWJ5OiBDSyBI
dSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENodW4tS3VhbmcgSHUgPGNo
dW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RzaS5jIHwgNTMgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kc2kuYwo+IGluZGV4IDRhMTg4YTk0MmMzOC4uMmE2NGZkYWVkOWE3IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTQ0NCw3ICs0NDQsMTAgQEAgc3Rh
dGljIHZvaWQgbXRrX2RzaV9jb25maWdfdmRvX3RpbWluZyhzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+
ICAgICAgICAgdTMyIGhvcml6b250YWxfc3luY19hY3RpdmVfYnl0ZTsKPiAgICAgICAgIHUzMiBo
b3Jpem9udGFsX2JhY2twb3JjaF9ieXRlOwo+ICAgICAgICAgdTMyIGhvcml6b250YWxfZnJvbnRw
b3JjaF9ieXRlOwo+ICsgICAgICAgdTMyIGhvcml6b250YWxfZnJvbnRfYmFja19ieXRlOwo+ICsg
ICAgICAgdTMyIGRhdGFfcGh5X2N5Y2xlc19ieXRlOwo+ICAgICAgICAgdTMyIGRzaV90bXBfYnVm
X2JwcCwgZGF0YV9waHlfY3ljbGVzOwo+ICsgICAgICAgdTMyIGRlbHRhOwo+ICAgICAgICAgc3Ry
dWN0IG10a19waHlfdGltaW5nICp0aW1pbmcgPSAmZHNpLT5waHlfdGltaW5nOwo+Cj4gICAgICAg
ICBzdHJ1Y3QgdmlkZW9tb2RlICp2bSA9ICZkc2ktPnZtOwo+IEBAIC00NzQsNDIgKzQ3NywyMiBA
QCBzdGF0aWMgdm9pZCBtdGtfZHNpX2NvbmZpZ192ZG9fdGltaW5nKHN0cnVjdCBtdGtfZHNpICpk
c2kpCj4gICAgICAgICBkYXRhX3BoeV9jeWNsZXMgPSB0aW1pbmctPmxweCArIHRpbWluZy0+ZGFf
aHNfcHJlcGFyZSArCj4gICAgICAgICAgICAgICAgICAgICAgICAgICB0aW1pbmctPmRhX2hzX3pl
cm8gKyB0aW1pbmctPmRhX2hzX2V4aXQ7Cj4KPiAtICAgICAgIGlmIChkc2ktPm1vZGVfZmxhZ3Mg
JiBNSVBJX0RTSV9NT0RFX1ZJREVPX0JVUlNUKSB7Cj4gLSAgICAgICAgICAgICAgIGlmICgodm0t
Pmhmcm9udF9wb3JjaCArIHZtLT5oYmFja19wb3JjaCkgKiBkc2lfdG1wX2J1Zl9icHAgPgo+IC0g
ICAgICAgICAgICAgICAgICAgZGF0YV9waHlfY3ljbGVzICogZHNpLT5sYW5lcyArIDE4KSB7Cj4g
LSAgICAgICAgICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUgPQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm0tPmhmcm9udF9wb3JjaCAqIGRzaV90bXBf
YnVmX2JwcCAtCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoZGF0YV9waHlfY3lj
bGVzICogZHNpLT5sYW5lcyArIDE4KSAqCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB2bS0+aGZyb250X3BvcmNoIC8KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2
bS0+aGZyb250X3BvcmNoICsgdm0tPmhiYWNrX3BvcmNoKTsKPiAtCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSA9Cj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlIC0KPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIChkYXRhX3BoeV9jeWNsZXMgKiBkc2ktPmxhbmVzICsgMTgpICoK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZtLT5oYmFja19wb3JjaCAvCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm0tPmhmcm9udF9wb3JjaCArIHZtLT5oYmFj
a19wb3JjaCk7Cj4gLSAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgRFJNX1dBUk4oIkhGUCBsZXNzIHRoYW4gZC1waHksIEZQUyB3aWxsIHVuZGVyIDYwSHpc
biIpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRl
ID0gdm0tPmhmcm9udF9wb3JjaCAqCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBkc2lfdG1wX2J1Zl9icHA7Cj4gLSAgICAgICAgICAgICAgIH0K
PiArICAgICAgIGRlbHRhID0gZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9WSURFT19C
VVJTVCA/IDE4IDogMTI7Cj4gKwo+ICsgICAgICAgaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUg
PSB2bS0+aGZyb250X3BvcmNoICogZHNpX3RtcF9idWZfYnBwOwo+ICsgICAgICAgaG9yaXpvbnRh
bF9mcm9udF9iYWNrX2J5dGUgPSBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSArIGhvcml6b250
YWxfYmFja3BvcmNoX2J5dGU7Cj4gKyAgICAgICBkYXRhX3BoeV9jeWNsZXNfYnl0ZSA9IGRhdGFf
cGh5X2N5Y2xlcyAqIGRzaS0+bGFuZXMgKyBkZWx0YTsKPiArCj4gKyAgICAgICBpZiAoaG9yaXpv
bnRhbF9mcm9udF9iYWNrX2J5dGUgPiBkYXRhX3BoeV9jeWNsZXNfYnl0ZSkgewo+ICsgICAgICAg
ICAgICAgICBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSAtPSBkYXRhX3BoeV9jeWNsZXNfYnl0
ZSAqCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhvcml6
b250YWxfZnJvbnRwb3JjaF9ieXRlIC8KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9mcm9udF9iYWNrX2J5dGU7Cj4gKwo+ICsgICAgICAg
ICAgICAgICBob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlIC09IGRhdGFfcGh5X2N5Y2xlc19ieXRl
ICoKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBob3Jpem9u
dGFsX2JhY2twb3JjaF9ieXRlIC8KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBob3Jpem9udGFsX2Zyb250X2JhY2tfYnl0ZTsKPiAgICAgICAgIH0gZWxzZSB7
Cj4gLSAgICAgICAgICAgICAgIGlmICgodm0tPmhmcm9udF9wb3JjaCArIHZtLT5oYmFja19wb3Jj
aCkgKiBkc2lfdG1wX2J1Zl9icHAgPgo+IC0gICAgICAgICAgICAgICAgICAgZGF0YV9waHlfY3lj
bGVzICogZHNpLT5sYW5lcyArIDEyKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgaG9yaXpv
bnRhbF9mcm9udHBvcmNoX2J5dGUgPQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dm0tPmhmcm9udF9wb3JjaCAqIGRzaV90bXBfYnVmX2JwcCAtCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAoZGF0YV9waHlfY3ljbGVzICogZHNpLT5sYW5lcyArIDEyKSAqCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2bS0+aGZyb250X3BvcmNoIC8KPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICh2bS0+aGZyb250X3BvcmNoICsgdm0tPmhiYWNrX3Bv
cmNoKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBob3Jpem9udGFsX2JhY2twb3JjaF9ieXRl
ID0gaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSAtCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAoZGF0YV9waHlfY3ljbGVzICogZHNpLT5sYW5lcyArIDEyKSAqCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2bS0+aGJhY2tfcG9yY2ggLwo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKHZtLT5oZnJvbnRfcG9yY2ggKyB2bS0+aGJhY2tfcG9yY2gpOwo+
IC0gICAgICAgICAgICAgICB9IGVsc2Ugewo+IC0gICAgICAgICAgICAgICAgICAgICAgIERSTV9X
QVJOKCJIRlAgbGVzcyB0aGFuIGQtcGh5LCBGUFMgd2lsbCB1bmRlciA2MEh6XG4iKTsKPiAtICAg
ICAgICAgICAgICAgICAgICAgICBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSA9IHZtLT5oZnJv
bnRfcG9yY2ggKgo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZHNpX3RtcF9idWZfYnBwOwo+IC0gICAgICAgICAgICAgICB9Cj4gKyAgICAgICAg
ICAgICAgIERSTV9XQVJOKCJIRlAgKyBIQlAgbGVzcyB0aGFuIGQtcGh5LCBGUFMgd2lsbCB1bmRl
ciA2MEh6XG4iKTsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgd3JpdGVsKGhvcml6b250YWxfc3lu
Y19hY3RpdmVfYnl0ZSwgZHNpLT5yZWdzICsgRFNJX0hTQV9XQyk7Cj4gLS0KPiAyLjE3LjEKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
