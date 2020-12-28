Return-Path: <SRS0=fEyP=GA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EC4C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 23:32:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E45DD222F9
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 23:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E45DD222F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QGgMaeSSTeg2EoSJo9jict3XKD2xi6JyXktW5m6woQs=; b=JLqeOD3XgTXh5Vb+FnhAt18+Y
	5CVCSOmTjy5WxCS6T6NhJJu8blq2E2x6frjFz3OkQZZIRcY9fti1vaTFjhweKzRF2q75v0WQGzOtI
	6FOdx+M5KHaRXm70VQUEDLu5yPlTczeyykmBf2LjFS7cH6SvsvYhO+DpE1XvI9oXURVWb5ImsT87v
	+j33cIxhkCfzx2fc+NHP0xOoLHijcYJQFmcBmhhvPUd18/yUr6c1E6v9DjDzMapWszP6mX30oMeE3
	7nZJL27jNofzVzUFHuEIWpJLNRj6WInVTswJz2ReLCZlpEIsRZK2Gq0xtQonqGfZFnQXaZWurSgPI
	1SjmoLPLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ku1zt-0003b1-5t; Mon, 28 Dec 2020 23:32:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ku1zq-0003aa-T8
 for linux-mediatek@lists.infradead.org; Mon, 28 Dec 2020 23:32:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33AAD223C8
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Dec 2020 23:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609198333;
 bh=4zuOP87T+tBs/U4EXSadvydWrwt6Bdq/pnBuDyNsp3I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MHDXi03f6vV1G6r6J8eFCqOIkk4cqccxHFFVwin1a+8+kZzWn+BEsSAcrFk3u2n/d
 IV61cDtg8SfC13nFvgcrDj5TQvSvEgBeiooxTnLLWzv6J0IRxUrMOd3djHju93YkuF
 yGwuP3iSRjDdcgwB9OpA9MwRPi6zp4gssF+xUXElj13YzfV2fxqYYKaG5Ut3Pqw+PM
 iIw0zohsbxUniZC76Go+v0RypNxVa5uyZobQ9pvQuKNpqbzA3Tlw1or6YfrL1EdW2D
 H1OgXrkfbC3NLj4nOfZ8qSDCfBDqlzhwkzgI/tq6luEysWVdltiITD4FafGRmMLgud
 uMi1kAUMFexQw==
Received: by mail-ej1-f54.google.com with SMTP id w1so16079596ejf.11
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Dec 2020 15:32:13 -0800 (PST)
X-Gm-Message-State: AOAM53106JN6AQxHED31/QA9DopjB9ujjVOFDqo2VRUDMFtAVJVNTVsR
 GkFZ1BBG3ULZLDwjHipHSLsdDE1vaXjSAXhfTw==
X-Google-Smtp-Source: ABdhPJyi7sWe+M1pwp7M/taBxI8fPAUdgCkIwfXdysJx91vWg0TwrvQd0TZnEL+XEJtjyTVXSlFp6eaIJBvkueKMUQw=
X-Received: by 2002:a17:906:fb1a:: with SMTP id
 lz26mr43221179ejb.194.1609198331821; 
 Mon, 28 Dec 2020 15:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20201210161050.8460-1-chunkuang.hu@kernel.org>
In-Reply-To: <20201210161050.8460-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Dec 2020 07:32:00 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8vxmAR-RBVhPZdpMRZzUZZ8KBAV2R1rR0FvxhMv22UvQ@mail.gmail.com>
Message-ID: <CAAOTY_8vxmAR-RBVhPZdpMRZzUZZ8KBAV2R1rR0FvxhMv22UvQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] Decouple Mediatek DRM sub driver
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_183215_078006_C8A15194 
X-CRM114-Status: GOOD (  13.70  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTLmnIgx
MeaXpSDpgLHkupQg5LiK5Y2IMTI6MTDlr6vpgZPvvJoKPgo+IG10ayBjY29yciBpcyBjb250cm9s
bGVkIGJ5IERSTSBhbmQgTURQIFsxXS4gSW4gb3JkZXIgdG8gc2hhcmUKPiBtdGtfY2NvcnIgZHJp
dmVyIGZvciBEUk0gYW5kIE1EUCwgZGVjb3VwbGUgTWVkaWF0ZWsgRFJNIHN1YiBkcml2ZXIKPiB3
aGljaCBpbmNsdWRlIG10a19jY29yciwgc28gTURQIGNvdWxkIHVzZSB0aGlzIGRlY291cGxlZCBt
dGtfY2NvcnIuCgpGb3IgdGhpcyBzZXJpZXMsIGFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQg
WzFdLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRz
LApDaHVuLUt1YW5nLgoKPgo+IENoYW5nZXMgaW4gdjI6Cj4gMS4gRml4IGlvbW11IGxhcmIgcHJv
YmxlbS4KPiAyLiBCYXNlZCBvbiBtZWRpYXRlay1kcm0tbmV4dC01LjExLTIgWzJdLgo+Cj4gWzFd
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNDA3NTEvCj4gWzJdIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9s
aW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0LTUuMTEtMgo+Cj4gQ0sgSHUgKDEwKToK
PiAgIGRybS9tZWRpYXRlazogU2VwYXJhdGUgZ2V0dGluZyBsYXJiIGRldmljZSB0byBhIGZ1bmN0
aW9uCj4gICBkcm0vbWVkaWF0ZWs6IE1vdmUgY2xrIGluZm8gZnJvbSBzdHJ1Y3QgbXRrX2RkcF9j
b21wIHRvIHN1YiBkcml2ZXIKPiAgICAgcHJpdmF0ZSBkYXRhCj4gICBkcm0vbWVkaWF0ZWs6IE1v
dmUgcmVncyBpbmZvIGZyb20gc3RydWN0IG10a19kZHBfY29tcCB0byBzdWIgZHJpdmVyCj4gICAg
IHByaXZhdGUgZGF0YQo+ICAgZHJtL21lZGlhdGVrOiBSZW1vdmUgaXJxIGluIHN0cnVjdCBtdGtf
ZGRwX2NvbXAKPiAgIGRybS9tZWRpYXRlazogVXNlIHN0cnVjdCBjbWRxX2NsaWVudF9yZWcgdG8g
Z2F0aGVyIGNtZHEgdmFyaWFibGUKPiAgIGRybS9tZWRpYXRlazogTW92ZSBjbWRxX3JlZyBpbmZv
IGZyb20gc3RydWN0IG10a19kZHBfY29tcCB0byBzdWIKPiAgICAgZHJpdmVyIHByaXZhdGUgZGF0
YQo+ICAgZHJtL21lZGlhdGVrOiBDaGFuZ2Ugc3ViIGRyaXZlciBpbnRlcmZhY2UgZnJvbSBtdGtf
ZGRwX2NvbXAgdG8gZGV2aWNlCj4gICBkcm0vbWVkaWF0ZWs6IFJlZ2lzdGVyIHZibGFuayBjYWxs
YmFjayBmdW5jdGlvbgo+ICAgZHJtL21lZGlhdGVrOiBEUk0gZHJpdmVyIGRpcmVjdGx5IHJlZmVy
IHRvIHN1YiBkcml2ZXIncyBmdW5jdGlvbgo+ICAgZHJtL21lZGlhdGVrOiBNb3ZlIG10a19kZHBf
Y29tcF9pbml0KCkgZnJvbSBzdWIgZHJpdmVyIHRvIERSTSBkcml2ZXIKPgo+IENodW4tS3Vhbmcg
SHUgKDIpOgo+ICAgZHJtL21lZGlhdGVrOiBHZXQgQ01EUSBjbGllbnQgcmVnaXN0ZXIgZm9yIGFs
bCBkZHAgY29tcG9uZW50Cj4gICBkcm0vbWVkaWF0ZWs6IFVzZSBjb3JyZWN0IGRldmljZSBwb2lu
dGVyIHRvIGdldCBDTURRIGNsaWVudCByZWdpc3Rlcgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9jb2xvci5jICAgfCAgODkgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfZHJ2LmggICAgIHwgIDY5ICsrKysKPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kaXNwX292bC5jICAgICB8IDIxNyArKysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgICAgfCAxNjkgKysrKy0tLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyAgICAgICAgICB8ICA0NCArLQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgICAgIHwgIDc1ICsrLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5oICAgICB8ICAgMSAtCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgfCA0MjkgKysrKysrKysrKysrLS0t
LS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCB8IDEw
MCArKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgICAgIHwg
IDMwICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oICAgICAgfCAg
IDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyAgICAgICAgICB8ICA0
NyArLS0KPiAgMTIgZmlsZXMgY2hhbmdlZCwgNjc2IGluc2VydGlvbnMoKyksIDU5NiBkZWxldGlv
bnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9kcnYuaAo+Cj4gLS0KPiAyLjE3LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
