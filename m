Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48746C2BB48
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 15:41:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 023FD23770
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 15:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 023FD23770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uumBP4458qcfNjaRksx2TbPudjck/wflrG2i3s7a2y0=; b=b0xX4yN9SydY6KMVlRBfr+nyx
	ulDFB0gDlKsgRmR65uxcMSya6qQd9keNVCl/t4aA+XlYAXXc7cRzyQnTPZPpZiEiFeb0G3HY8ncW6
	TsoqfMrZwF9Q8jtrZYUdjVSlqKP+vLKr7C5CID139qQYh5F6SZxN45mSm3XTFUecxl6DkWGwhiYvr
	o1t2S8B+BwICGTBpOgrEO+t5MPWhfgswzET5Z/veFv5TtVNj5JGL3Tmj4w0C4oAHmNjAPNiZQiTED
	OWKhJ50Iy/Vy0V4z5I5s3dpK+ZTFBwklnD5aJVQv2IW8ZMbg4K995OWR4HwGD7yhElySEC0tQQt5n
	D9xuOT9xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knO3z-000770-7p; Thu, 10 Dec 2020 15:41:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knO3u-00075A-0w; Thu, 10 Dec 2020 15:40:58 +0000
X-Gm-Message-State: AOAM530hJo946r1YFN26LBmam07dHIXb1LpeYiwDw7gs5F0AE0ymKofK
 wTqcYCr3nWOarjW7haTIEU9lVKHwY7kjfrVZYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607614857;
 bh=kLtdmt4oMcr69ZeEaGpqsEmfBzPYipCBB3bI8s06kKQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GVcosNOtUN4j/bxX47UVlveHVCGqW8i9QaQZ6HkPlxWC3uYI0yv+Gz8C/CmsFnuUh
 VHH6yRauv30XoxLjQP5qjpc9eNzgSOp8wiOZEFUefda4NKkf4zSwZUnhmpq04/8qxC
 32fwTWovPXPS9Zl/un6zRImWeQV8nhGgzN3F5iIYbeGf1eXyg6AGD8bzI0PSh1xxtT
 9pvdLYb2YwC3PrITFjio+/qf16+/CeVjxca6hB5cvpEs7nUm2sAyern7NBYbJbdmYr
 ITHCpGuWGMKHJQ91R/TmXQHkCPjo0M+0pbylEP5aNu4c0HmGWu90CNCtWfpWtSUrDu
 wYrkLofnlRiIg==
X-Google-Smtp-Source: ABdhPJx0j+Lqm6Jk4mCnuNpLmDuRmlHsWfRP57mzErtMeTRrN6xR9D9GsxcZ0189bugqUjaw7RdnSXryhX8yUPqWXoM=
X-Received: by 2002:a17:906:a106:: with SMTP id
 t6mr7055105ejy.63.1607614855174; 
 Thu, 10 Dec 2020 07:40:55 -0800 (PST)
MIME-Version: 1.0
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607591262-21736-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 10 Dec 2020 23:40:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-oL+NyzDKssCjyP=E8Py3oyEK6a6s=XoYvTFymZE9-zQ@mail.gmail.com>
Message-ID: <CAAOTY_-oL+NyzDKssCjyP=E8Py3oyEK6a6s=XoYvTFymZE9-zQ@mail.gmail.com>
Subject: Re: [PATCH v8, 1/6] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_104058_227631_496907FF 
X-CRM114-Status: GOOD (  17.10  )
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
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTDml6Ug6YCx5ZubIOS4i+WNiDU6MjLlr6vpgZPvvJoKPgo+IHJk
bWEgZmlmbyBzaXplIG1heSBiZSBkaWZmZXJlbnQgZXZlbiBpbiBzYW1lIFNPQywgYWRkIHRoaXMK
PiBwcm9wZXJ0eSB0byB0aGUgY29ycmVzcG9uZGluZyByZG1hCj4KPiBTaWduZWQtb2ZmLWJ5OiBZ
b25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgLi4uL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgICAgICAgfCAxNiAr
KysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVk
aWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+IGluZGV4IDEyMTIyMDcuLjY0
YzY0ZWUgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+IEBA
IC02Niw2ICs2NiwxMyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzIChETUEgZnVuY3Rpb24gYmxvY2tz
KToKPiAgICBhcmd1bWVudCwgc2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
b21tdS9tZWRpYXRlayxpb21tdS50eHQKPiAgICBmb3IgZGV0YWlscy4KPgo+ICtPcHRpb25hbCBw
cm9wZXJ0aWVzIChSRE1BIGZ1bmN0aW9uIGJsb2Nrcyk6Cj4gKy0gbWVkaWF0ZWsscmRtYV9maWZv
X3NpemU6IHJkbWEgZmlmbyBzaXplIG1heSBiZSBkaWZmZXJlbnQgZXZlbiBpbiBzYW1lIFNPQywg
YWRkIHRoaXMKPiArICBwcm9wZXJ0eSB0byB0aGUgY29ycmVzcG9uZGluZyByZG1hCj4gKyAgdGhl
IHZhbHVlIGlzIHRoZSBNYXggdmFsdWUgd2hpY2ggZGVmaW5lZCBpbiBoYXJkd2FyZSBkYXRhIHNo
ZWV0Lgo+ICsgIHJkbWFfZmlmb19zaXplIG9mIHJkbWEwIGluIG10ODE4MyBpcyA1MTIwCj4gKyAg
cmRtYV9maWZvX3NpemUgb2YgcmRtYTEgaW4gbXQ4MTgzIGlzIDIwNDgKPiArCj4gIEV4YW1wbGVz
Ogo+Cj4gIG1tc3lzOiBjbG9jay1jb250cm9sbGVyQDE0MDAwMDAwIHsKPiBAQCAtMjA3LDMgKzIx
NCwxMiBAQCBvZEAxNDAyMzAwMCB7Cj4gICAgICAgICBwb3dlci1kb21haW5zID0gPCZzY3BzeXMg
TVQ4MTczX1BPV0VSX0RPTUFJTl9NTT47Cj4gICAgICAgICBjbG9ja3MgPSA8Jm1tc3lzIENMS19N
TV9ESVNQX09EPjsKPiAgfTsKPiArCj4gK3JkbWExOiByZG1hQDE0MDBjMDAwIHsKPiArICAgICAg
IGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLWRpc3AtcmRtYSI7Cj4gKyAgICAgICByZWcg
PSA8MCAweDE0MDBjMDAwIDAgMHgxMDAwPjsKPiArICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQ
SSAyMjkgSVJRX1RZUEVfTEVWRUxfTE9XPjsKPiArICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNj
cHN5cyBNVDgxODNfUE9XRVJfRE9NQUlOX0RJU1A+Owo+ICsgICAgICAgY2xvY2tzID0gPCZtbXN5
cyBDTEtfTU1fRElTUF9SRE1BMT47Cj4gKyAgICAgICBtZWRpYXRlayxyZG1hX2ZpZm9fc2l6ZSA9
IDwyMDQ4PjsKPiArfTsKCkluIFsxXSwgUm9iIGhhcyBzdWdnZXN0IHRoYXQgbm90IGFkZCBleGFt
cGxlIG9mIHJkbWExLCBpdCdzIGJldHRlciB0bwphZGQgbWVkaWF0ZWsscmRtYV9maWZvX3NpemUg
aW4gcmRtYTAgZm9yIGV4YW1wbGUuCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzE1OTY4NTUyMzEtNTc4Mi0yLWdpdC1zZW5kLWVt
YWlsLXlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tLwoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4g
LS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
