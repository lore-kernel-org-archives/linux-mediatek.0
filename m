Return-Path: <SRS0=jy+D=E3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9069EC388F9
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2020 23:42:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E20520A8B
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2020 23:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pr7HCie9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UzbHtR2N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8BGdgIZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E20520A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+sCQCvLb/IaEwGp0JjMA8SWvtHlPqprksKRJCb7DW+E=; b=Pr7HCie9YPYkHlWvzF7TbglIN
	7+DuDQsNq63AXzqrL+3e8cL3+oQgbBuzKEaTec5+tRpFLwwQP3M7geQ4aF1YqFrgMNE01ztlK0TJc
	7IOGb/E7JDq1WZSMzwXL6G5Rf5qGuURfhu2fpcbnDJ4QQ4sEN2ltOZgso6wZtxxgn0X6vuwS0BW4+
	C8NkbtRLuU8NeJJn3K2CDKJbx9rNzFEApaaE18PjqdrdxaFIPpuHGV6+0hGSKXs3DyVuPysq8TPQm
	1WroF3QMQUGA/yAxOJvYOCmCuGjJSCbjWMEnFu+CPck1x40Ai9V6Ka84QYy3l0uY4nZSenxc9v00O
	qHhvRsbqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgcWT-0006EH-Rd; Sat, 21 Nov 2020 23:42:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgcW8-00068m-7G
 for linux-mediatek@merlin.infradead.org; Sat, 21 Nov 2020 23:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=sCpwAHLa5mI34KFvHEg31DGS9bBgznBTX4PAQYWMbP0=; b=UzbHtR2NmETrHkh7J9wBkgkmJ4
 OBCwRIoOhHj9v0QgQKZXRrAavaETAfFSKQYc2vUvFog5flYt7jKMNEgV75eTdQPgrJjywm6Snqp6u
 u7WeQxmJ+T4IAiNRRhMY7jaqMiaSUHb93dv6OrEE3k5rjQ8a+F5T5VDVOapW6s5Hc6XXLcBjkvX3o
 adyjNfhhgFP3kDNIsLz9dIrf6GxS47yLLmi74g6DOISH/NRCbTBrnimWHaNTJLIOXc+DjxWR84q6z
 bnEbR6c8vDRHY1lDcijJz2ojfz9OT65mpSn4P5P6YVFgwwb7b4ie0IAYR9zJr4KkzIzqjqWM3gNKf
 s7d4g/aw==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgQHI-000343-Tu
 for linux-mediatek@lists.infradead.org; Sat, 21 Nov 2020 10:38:04 +0000
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D940223FD
 for <linux-mediatek@lists.infradead.org>; Sat, 21 Nov 2020 10:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605955076;
 bh=0iPSg8OjIQe2EwLNb/s9nIdiFuPHQuOfmsC85sp8jCg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Z8BGdgIZyJ89SBcXgRK/tQq1W75b7JbcAUk64naWQM60X7zxB3U0u+eh/aukIsBcs
 ulcPuega36oBIlk4axL2h29qK/76dqZaIjhWtayHaP1spkrX2rnMnpyep3hrPxZgS+
 fcreDNGBKMBfMLBGPwGBCpgtNvsQHBhhEVCVAIqg=
Received: by mail-wr1-f43.google.com with SMTP id 64so57220wra.11
 for <linux-mediatek@lists.infradead.org>; Sat, 21 Nov 2020 02:37:56 -0800 (PST)
X-Gm-Message-State: AOAM530x2ta3yXrltyqk7e6ZiQnYt9+QsQeXWTo0ZTAAMKm6RrlL71z0
 f9rnIjmGW/H8EuSXx+KU2eFSAi//b+qPbIj14Q==
X-Google-Smtp-Source: ABdhPJwp4mVAZqzRDcuKqvKnD+d0FY5VtF17c3UkrCjWQfKRDx+PjqKzlAeeWBvohP0VqYKp57XUz0y81glkncyvErg=
X-Received: by 2002:a5d:6689:: with SMTP id l9mr19872241wru.134.1605955074930; 
 Sat, 21 Nov 2020 02:37:54 -0800 (PST)
MIME-Version: 1.0
References: <20201119232335.6704-1-chunkuang.hu@kernel.org>
 <20201120052950.0ca597fb@a-VirtualBox>
In-Reply-To: <20201120052950.0ca597fb@a-VirtualBox>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 21 Nov 2020 18:37:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8yS=c3052vCTtD53oz0bx6gQkCG9b-SvZR0oCznLUx1A@mail.gmail.com>
Message-ID: <CAAOTY_8yS=c3052vCTtD53oz0bx6gQkCG9b-SvZR0oCznLUx1A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Modify horizontal front/back porch
 byte formula
To: Bilal Wasim <bilalwasim676@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_103801_587043_543BF5F1 
X-CRM114-Status: GOOD (  21.10  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

QmlsYWwgV2FzaW0gPGJpbGFsd2FzaW02NzZAZ21haWwuY29tPiDmlrwgMjAyMOW5tDEx5pyIMjDm
l6Ug6YCx5LqUIOS4iuWNiDg6MzDlr6vpgZPvvJoKPgo+IEhpIENLLAo+Cj4gT24gRnJpLCAyMCBO
b3YgMjAyMCAwNzoyMzozNSArMDgwMAo+IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+ID4gRnJvbTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+
Cj4gPiBJbiB0aGUgcGF0Y2ggdG8gYmUgZml4ZWQsIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUg
YmVjb21lIHRvIGxhcmdlCj4gPiBmb3Igc29tZSBwYW5lbCwgc28gcm9sbCBiYWNrIHRoYXQgcGF0
Y2guIEZvciBzbWFsbCBoZnAgb3IgaGJwIHBhbmVsLAo+ID4gdXNpbmcgdm0tPmhmcm9udF9wb3Jj
aCArIHZtLT5oYmFja19wb3JjaCB0byBjYWxjdWxhdGUKPiA+IGhvcml6b250YWxfYmFja3BvcmNo
X2J5dGUgd291bGQgbWFrZSBpdCBuZWd0aXZlLCBzbwo+ID4gdXNlIGhvcml6b250YWxfYmFja3Bv
cmNoX2J5dGUgaXRzZWxmIHRvIG1ha2UgaXQgcG9zaXRpdmUuCgpBcHBsaWVkIHRvIG1lZGlhdGVr
LWRybS1maXhlcyBbMV0uCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLWZp
eGVzCgo+ID4KPiA+IEZpeGVzOiAzNWJmOTQ4ZjFlZGIgKCJkcm0vbWVkaWF0ZWs6IGRzaTogRml4
IHNjcm9sbGluZyBvZiBwYW5lbCB3aXRoCj4gPiBzbWFsbCBoZnAgb3IgaGJwIikKPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgNjEKPiA+ICsrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLSAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMzkKPiA+
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgaW5k
ZXggNGExODhhOTQyYzM4Li42NWZkOTljNTI4YWYKPiA+IDEwMDY0NCAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jCj4gPiBAQCAtNDQ0LDcgKzQ0NCwxMCBAQCBzdGF0aWMgdm9pZCBtdGtfZHNp
X2NvbmZpZ192ZG9fdGltaW5nKHN0cnVjdAo+ID4gbXRrX2RzaSAqZHNpKSB1MzIgaG9yaXpvbnRh
bF9zeW5jX2FjdGl2ZV9ieXRlOwo+ID4gICAgICAgdTMyIGhvcml6b250YWxfYmFja3BvcmNoX2J5
dGU7Cj4gPiAgICAgICB1MzIgaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGU7Cj4gPiArICAgICB1
MzIgaG9yaXpvbnRhbF9mcm9udF9iYWNrX2J5dGU7Cj4gPiArICAgICB1MzIgZGF0YV9waHlfY3lj
bGVzX2J5dGU7Cj4gPiAgICAgICB1MzIgZHNpX3RtcF9idWZfYnBwLCBkYXRhX3BoeV9jeWNsZXM7
Cj4gPiArICAgICB1MzIgZGVsdGE7Cj4gPiAgICAgICBzdHJ1Y3QgbXRrX3BoeV90aW1pbmcgKnRp
bWluZyA9ICZkc2ktPnBoeV90aW1pbmc7Cj4gPgo+ID4gICAgICAgc3RydWN0IHZpZGVvbW9kZSAq
dm0gPSAmZHNpLT52bTsKPiA+IEBAIC00NjYsNTAgKzQ2OSwzMCBAQCBzdGF0aWMgdm9pZCBtdGtf
ZHNpX2NvbmZpZ192ZG9fdGltaW5nKHN0cnVjdAo+ID4gbXRrX2RzaSAqZHNpKSBob3Jpem9udGFs
X3N5bmNfYWN0aXZlX2J5dGUgPSAodm0tPmhzeW5jX2xlbiAqCj4gPiBkc2lfdG1wX2J1Zl9icHAg
LSAxMCk7Cj4gPiAgICAgICBpZiAoZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9WSURF
T19TWU5DX1BVTFNFKQo+ID4gLSAgICAgICAgICAgICBob3Jpem9udGFsX2JhY2twb3JjaF9ieXRl
ID0gdm0tPmhiYWNrX3BvcmNoICoKPiA+IGRzaV90bXBfYnVmX2JwcDsKPiA+ICsgICAgICAgICAg
ICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSA9IHZtLT5oYmFja19wb3JjaCAqCj4gPiBkc2lf
dG1wX2J1Zl9icHAgLSAxMDsgZWxzZQo+ID4gICAgICAgICAgICAgICBob3Jpem9udGFsX2JhY2tw
b3JjaF9ieXRlID0gKHZtLT5oYmFja19wb3JjaCArCj4gPiB2bS0+aHN5bmNfbGVuKSAqCj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkc2lfdG1wX2J1Zl9icHA7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkc2lfdG1wX2J1
Zl9icHAgLSAxMDsKPiA+Cj4gPiAgICAgICBkYXRhX3BoeV9jeWNsZXMgPSB0aW1pbmctPmxweCAr
IHRpbWluZy0+ZGFfaHNfcHJlcGFyZSArCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICB0aW1p
bmctPmRhX2hzX3plcm8gKyB0aW1pbmctPmRhX2hzX2V4aXQ7Cj4gPiAtCj4gPiAtICAgICBpZiAo
ZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9WSURFT19CVVJTVCkgewo+ID4gLSAgICAg
ICAgICAgICBpZiAoKHZtLT5oZnJvbnRfcG9yY2ggKyB2bS0+aGJhY2tfcG9yY2gpICoKPiA+IGRz
aV90bXBfYnVmX2JwcCA+Cj4gPiAtICAgICAgICAgICAgICAgICBkYXRhX3BoeV9jeWNsZXMgKiBk
c2ktPmxhbmVzICsgMTgpIHsKPiA+IC0gICAgICAgICAgICAgICAgICAgICBob3Jpem9udGFsX2Zy
b250cG9yY2hfYnl0ZSA9Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2bS0+aGZy
b250X3BvcmNoICogZHNpX3RtcF9idWZfYnBwIC0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIChkYXRhX3BoeV9jeWNsZXMgKiBkc2ktPmxhbmVzICsgMTgpICoKPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHZtLT5oZnJvbnRfcG9yY2ggLwo+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKHZtLT5oZnJvbnRfcG9yY2ggKyB2bS0+aGJhY2tfcG9yY2gpOwo+
ID4gLQo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUg
PQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hf
Ynl0ZSAtCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoZGF0YV9waHlfY3ljbGVz
ICogZHNpLT5sYW5lcyArIDE4KSAqCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2
bS0+aGJhY2tfcG9yY2ggLwo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZtLT5o
ZnJvbnRfcG9yY2ggKyB2bS0+aGJhY2tfcG9yY2gpOwo+ID4gLSAgICAgICAgICAgICB9IGVsc2Ug
ewo+ID4gLSAgICAgICAgICAgICAgICAgICAgIERSTV9XQVJOKCJIRlAgbGVzcyB0aGFuIGQtcGh5
LCBGUFMgd2lsbAo+ID4gdW5kZXIgNjBIelxuIik7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAg
aG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUgPQo+ID4gdm0tPmhmcm9udF9wb3JjaCAqCj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkc2lfdG1w
X2J1Zl9icHA7Cj4gPiAtICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHRpbWluZy0+ZGFfaHNfemVybyArIHRpbWluZy0+ZGFfaHNfZXhpdCArCj4gPiAzOyArCj4gPiAr
ICAgICBkZWx0YSA9IGRzaS0+bW9kZV9mbGFncyAmIE1JUElfRFNJX01PREVfVklERU9fQlVSU1Qg
PyAxOCA6Cj4gPiAxMjsgKwo+ID4gKyAgICAgaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUgPSB2
bS0+aGZyb250X3BvcmNoICoKPiA+IGRzaV90bXBfYnVmX2JwcDsKPiA+ICsgICAgIGhvcml6b250
YWxfZnJvbnRfYmFja19ieXRlID0gaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUgKwo+ID4gaG9y
aXpvbnRhbF9iYWNrcG9yY2hfYnl0ZTsKPiA+ICsgICAgIGRhdGFfcGh5X2N5Y2xlc19ieXRlID0g
ZGF0YV9waHlfY3ljbGVzICogZHNpLT5sYW5lcyArIGRlbHRhOwo+ID4gKwo+ID4gKyAgICAgaWYg
KGhvcml6b250YWxfZnJvbnRfYmFja19ieXRlID4gZGF0YV9waHlfY3ljbGVzX2J5dGUpIHsKPiA+
ICsgICAgICAgICAgICAgaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUgLT0gZGF0YV9waHlfY3lj
bGVzX2J5dGUgKgo+ID4gKwo+ID4gaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUgLwo+ID4gKwo+
ID4gaG9yaXpvbnRhbF9mcm9udF9iYWNrX2J5dGU7ICsKPiA+ICsgICAgICAgICAgICAgaG9yaXpv
bnRhbF9iYWNrcG9yY2hfYnl0ZSAtPSBkYXRhX3BoeV9jeWNsZXNfYnl0ZSAqCj4gPiArCj4gPiBo
b3Jpem9udGFsX2JhY2twb3JjaF9ieXRlIC8KPiA+ICsKPiA+IGhvcml6b250YWxfZnJvbnRfYmFj
a19ieXRlOyB9IGVsc2Ugewo+ID4gLSAgICAgICAgICAgICBpZiAoKHZtLT5oZnJvbnRfcG9yY2gg
KyB2bS0+aGJhY2tfcG9yY2gpICoKPiA+IGRzaV90bXBfYnVmX2JwcCA+Cj4gPiAtICAgICAgICAg
ICAgICAgICBkYXRhX3BoeV9jeWNsZXMgKiBkc2ktPmxhbmVzICsgMTIpIHsKPiA+IC0gICAgICAg
ICAgICAgICAgICAgICBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSA9Cj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB2bS0+aGZyb250X3BvcmNoICogZHNpX3RtcF9idWZfYnBwIC0K
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIChkYXRhX3BoeV9jeWNsZXMgKiBkc2kt
PmxhbmVzICsgMTIpICoKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZtLT5oZnJv
bnRfcG9yY2ggLwo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZtLT5oZnJvbnRf
cG9yY2ggKyB2bS0+aGJhY2tfcG9yY2gpOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGhvcml6
b250YWxfYmFja3BvcmNoX2J5dGUgPQo+ID4gaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSAtCj4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoZGF0YV9waHlfY3ljbGVzICogZHNpLT5s
YW5lcyArIDEyKSAqCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2bS0+aGJhY2tf
cG9yY2ggLwo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZtLT5oZnJvbnRfcG9y
Y2ggKyB2bS0+aGJhY2tfcG9yY2gpOwo+ID4gLSAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgIERSTV9XQVJOKCJIRlAgbGVzcyB0aGFuIGQtcGh5LCBGUFMgd2ls
bAo+ID4gdW5kZXIgNjBIelxuIik7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgaG9yaXpvbnRh
bF9mcm9udHBvcmNoX2J5dGUgPQo+ID4gdm0tPmhmcm9udF9wb3JjaCAqCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkc2lfdG1wX2J1Zl9icHA7
Cj4gPiAtICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgRFJNX1dBUk4oIkhGUCArIEhC
UCBsZXNzIHRoYW4gZC1waHksIEZQUyB3aWxsIHVuZGVyCj4gPiA2MEh6XG4iKTsgfQo+ID4KPiA+
ICAgICAgIHdyaXRlbChob3Jpem9udGFsX3N5bmNfYWN0aXZlX2J5dGUsIGRzaS0+cmVncyArIERT
SV9IU0FfV0MpOwo+Cj4gVGVzdGVkIG9uIENocm9tZWJvb2sgRUxNLgo+Cj4gVGVzdGVkLWJ5OiBC
aWxhbCBXYXNpbSA8YmlsYWwud2FzaW1AaW1ndGVjLmNvbT4KPgo+IFRoYW5rcywKPiBCaWxhbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
