Return-Path: <SRS0=EHBe=FS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5E0C2BB48
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 14:54:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE6D3225AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 14:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE6D3225AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YoRK3GeGJeknXJlt1zHywenDHFjyl+8Q222wdIvWW7s=; b=AiuR1PQhZP9tD4lmgeEI9w+oL
	rgr+1AJBqDe1cEvhqyak4GzLWZ1ycK++QuOEI/tVSu6Ebz/8uRWHCXZLg5Cc4Ev4Q1v1rIB1fi3yt
	Vc/iwfixQRlHWF1aymXGdBmkGJoO6t8/wfL6CtJoVx9eHHNNJd1nTS0ntgnPUjTmOtSWOgu37Gqrj
	K+MkFdDpydUCtC4GcAk6XJfIjyB5K8Dw5B4rOyPyUemUVliQix0SOBwdCnqXzSjxd6ZKE+ndfIP0S
	6MWJCQ/XkPkPWrlMQsY4cHrxyh/8qFjMzOlZhBoQ3nZw6p3tE+Zm6DROSLFaZBT/4AlSFNJDwkAFf
	ZCg3v3FXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kopFC-0005cR-T4; Mon, 14 Dec 2020 14:54:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kopF8-0005bH-GN; Mon, 14 Dec 2020 14:54:31 +0000
X-Gm-Message-State: AOAM532ChHcGXPniFnG5UkwAWr64Zc2wm53uexuwqkxaghg8roNY0kgc
 ND3fjGHb/8IfslVpY3rO58BGCXjwHCUfpG+UGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607957668;
 bh=lx5LcB4r8kThhsWgyjSZ+LWhuKJpQwGa8oXjjRjm8yY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RS3eYjNQYmDFQA7FmdEX3nxqALFkO77gC8VpWHirjJClhd+5Dwy0yRNu1+KhTfH4a
 cqLZgg/Kkskv4JPmU7JM+DynYOaMl3h0zivY/hoPC+ErlcrFlPH/ad04c1d+5YQ5Ma
 rZhVtTeWMyp9ZI3yoPEaQYE6IZmJsOf3Diyl2l8fuvOsYYoia+bs9NqJlPn6agoKZ1
 bIfwzohw/9gHciYqVku6BHJ8LazxVQiEexyGXGFREbFUxxkfjWPvOfuwJN5CWS91HD
 0kWGbHqO9DXNIcJL+uV33r6CGR+3Ocj3JgrL05xqwZ8KmJWNCI5trWCt0ktl5sT5yp
 nKd/kmFx/tQVw==
X-Google-Smtp-Source: ABdhPJywDyFHYaIxrWSBcAnDDsvFyzMN1rO/xQl7TxTsoTfGwXme0jp7BjNRTzumje835VaKEkDPyyP8R0QtuCPZpGE=
X-Received: by 2002:a17:906:ae4e:: with SMTP id
 lf14mr23355440ejb.310.1607957666417; 
 Mon, 14 Dec 2020 06:54:26 -0800 (PST)
MIME-Version: 1.0
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_-aYFz1Xg6r2ur+BF_k_35F3qNLLb16_2c0MaMsYre-+w@mail.gmail.com>
 <1607647514.12750.5.camel@mhfsdcap03>
In-Reply-To: <1607647514.12750.5.camel@mhfsdcap03>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 14 Dec 2020 22:54:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY__HA95WLNppOKainvsZCxA6Wv3edLyvOW6FxAjUos=afQ@mail.gmail.com>
Message-ID: <CAAOTY__HA95WLNppOKainvsZCxA6Wv3edLyvOW6FxAjUos=afQ@mail.gmail.com>
Subject: Re: [PATCH v8, 5/6] drm/mediatek: add RDMA fifo size error handle
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_095430_726896_C04995BE 
X-CRM114-Status: GOOD (  24.10  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
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
PiDmlrwgMjAyMOW5tDEy5pyIMTHml6Ug6YCx5LqUIOS4iuWNiDg6NDXlr6vpgZPvvJoKPgo+IE9u
IFRodSwgMjAyMC0xMi0xMCBhdCAyMzo1MCArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiA+
IEhpLCBZb25ncWlhbmc6Cj4gPgo+ID4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMOaXpSDpgLHlm5sg5LiL5Y2INTowOOWvq+mBk++8
mgo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIGFkZCBSRE1BIGZpZm8gc2l6ZSBlcnJvciBoYW5kbGUK
PiA+ID4gcmRtYSBmaWZvIHNpemUgd2lsbCBub3QgYWx3YXlzIGJpZ2dlciB0aGFuIHRoZSBjYWxj
dWxhdGVkIHRocmVzaG9sZAo+ID4gPiBpZiB0aGF0IGNhc2UgaGFwcGVuZWQsIHdlIG5lZWQgc2V0
IGZpZm8gc2l6ZSBhcyB0aGUgdGhyZXNob2xkCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlv
bmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+ID4gPiAtLS0KPiA+ID4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgfCA0ICsrKysKPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jCj4gPiA+IGluZGV4IDc5NGFjYzUuLjA1MDgzOTIg
MTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1h
LmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYwo+
ID4gPiBAQCAtMTUxLDYgKzE1MSwxMCBAQCBzdGF0aWMgdm9pZCBtdGtfcmRtYV9jb25maWcoc3Ry
dWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWduZWQgaW50IHdpZHRoLAo+ID4gPiAgICAgICAg
ICAqIGFjY291bnQgZm9yIGJsYW5raW5nLCBhbmQgd2l0aCBhIHBpeGVsIGRlcHRoIG9mIDQgYnl0
ZXM6Cj4gPiA+ICAgICAgICAgICovCj4gPiA+ICAgICAgICAgdGhyZXNob2xkID0gd2lkdGggKiBo
ZWlnaHQgKiB2cmVmcmVzaCAqIDQgKiA3IC8gMTAwMDAwMDsKPiA+ID4gKwo+ID4gPiArICAgICAg
IGlmICh0aHJlc2hvbGQgPiByZG1hX2ZpZm9fc2l6ZSkKPiA+ID4gKyAgICAgICAgICAgICAgIHRo
cmVzaG9sZCA9IHJkbWFfZmlmb19zaXplOwo+ID4KPiA+IElmIHRoZSBmb3JtdWxhIGlzIG5vdCBj
b3JyZWN0LCB5b3Ugc2hvdWxkIGZpeCB0aGUgZm9ybXVsYSBub3Qgd29yayBhcm91bmQuCj4gPgo+
ID4gUmVnYXJkcywKPiA+IENodW4tS3VhbmcuCj4KPiBob3cgYWJvdXQgdGhpczoKPiB0aHJlc2hv
bGQgPSBtYXgod2lkdGggKiBoZWlnaHQgKiB2cmVmcmVzaCAqIDQgKiA3IC8gMTAwMDAwMCwKPiBy
ZG1hX2ZpZm9fc2l6ZSk7CgpXaGVuIEkgdXNlIHdpZHRoID0gMTkyMCwgaGVpZ2h0ID0gMTA4MCwg
dnJlZnJlc2ggPSA2MCB0byBjYWxjdWxhdGUsIEkKZ2V0IHRocmVzaG9sZCA9IDI5ODUuClNvIEkg
dGhpbmsgc2V0IHRocmVzaG9sZCB0byBoYWxmIG9mIGZpZm8gc2l6ZSBpcyBPSyBmb3IgTUFYX1dJ
RFRILApNQVhfSEVJR0hULCBNQVhfVlJFRlJFU0ggKHRoZXNlIHRocmVlIG1heSBiZSBkaWZmZXJl
bnQgaW4gZWFjaCBTb0MpCgp0aHJlc2hvbGQgPSBSRE1BX0ZJRk9fUFNFVURPX1NJWkUocmRtYV9m
aWZvX3NpemUpIC8gMjsKCkJ1dCBJIHdvcnJ5IGhhbGYgZmlmbyBzaXplIGlzIHRvbyBiaWcgZm9y
IHNtYWxsIHJlc29sdXRpb24gYW5kIGxldApzbWFsbCByZXNvbHV0aW9uIHRvbyBlYXN5IHRvIHRy
aWdnZXIgYnVyc3QgcmVhZCBEUkFNLiBTbyBsZXQgdGhlCmZvcm11bGEgdG8gYmUgdGhpczoKCnRo
cmVzaG9sZCA9IFJETUFfRklGT19QU0VVRE9fU0laRShyZG1hX2ZpZm9fc2l6ZSkgKiB3aWR0aCAq
IGhlaWdodCAqCnZyZWZyZXNoIC8gMiAvIE1BWF9XSURUSCAvIE1BWF9IRUlHSFQgLyBNQVhfVlJF
RlJFU0g7CgpIb3cgZG8geW91IHRoaW5rIGFib3V0IHRoaXM/CgpSZWdhcmRzLApDaHVuLUt1YW5n
LgoKPiA+Cj4gPiA+ICsKPiA+ID4gICAgICAgICByZWcgPSBSRE1BX0ZJRk9fVU5ERVJGTE9XX0VO
IHwKPiA+ID4gICAgICAgICAgICAgICBSRE1BX0ZJRk9fUFNFVURPX1NJWkUocmRtYV9maWZvX3Np
emUpIHwKPiA+ID4gICAgICAgICAgICAgICBSRE1BX09VVFBVVF9WQUxJRF9GSUZPX1RIUkVTSE9M
RCh0aHJlc2hvbGQpOwo+ID4gPiAtLQo+ID4gPiAxLjguMS4xLmRpcnR5Cj4gPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IExpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdAo+ID4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
