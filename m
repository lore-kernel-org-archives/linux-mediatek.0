Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEF8C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1/tnrB70XWYjlWUwcfIBEhtcb3QwOg7FdjqmKSJ7rw=; b=VAM6/hPDXzUvkP
	KJ08uHZgOhW/nppQY3172LP6L5/m6RVppkMgEZJpMtuS/to/6wRO7jxSjAOTHp51vZYZ21LFO2VoT
	mJBrKkagIQF5YvrYSiK+K0W/75Dz5jHJICAxWGXu8mhVWDjjmbuMtP3WVGt3e8439SgBJLsQ3+eyN
	UTnZ2AICwq7f+VVuZRDugWpdIwxpxZqqd+q7AETAMtpTxR9+9+seYortr65PF2ZqVFHRkIEkIG2hU
	n5VjFcRgWVtcj/3S6Uu6vosxsz3m15b8Cs/7uil/U9pf08BKlbvtDJUGff6TNSso3gBY0OSQIXI1L
	irYClsDRstIO/5DiI30A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niyqT-009gDl-44; Mon, 25 Apr 2022 13:33:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niyq0-009fyL-M4; Mon, 25 Apr 2022 13:33:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F6726155C;
 Mon, 25 Apr 2022 13:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A74C385AB;
 Mon, 25 Apr 2022 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650893588;
 bh=uUdOOm568rK7RuFDvgybG0cdg/NEgZ8We82vdTXHL6I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X6ZT7zsiyniAqHXRoBvDeDPxJOkZwjC+Q1PCXuiwmT8/CtHtG/GHhswgENI6vpZsn
 Qo2hYa2v+Py4v0x0F6IBIgzffhoyoge8PrOA8wURB/9SSjQvCht9F8mTlEehD5ziut
 f3wujf23LkadumwIApsgIWQv5VTnw8cHumTpJvtsjOi/ie3fHk3gcLMFPqgn2X8QeK
 smskJHjQ78Rm4NsPAsDfFlyJDiXAaA/jafPThy/zgo3pq6/S2Ifm2nfhFS2P7C6UyG
 tw5AOd6pUdIu65wMVXaSeC7GkOj/v4ezjZ0LZfSoawAxpG7dUMcScJi8G5TbxLb8rB
 jMiIxRqaxc9EA==
Received: by mail-yb1-f178.google.com with SMTP id w187so17651050ybe.2;
 Mon, 25 Apr 2022 06:33:08 -0700 (PDT)
X-Gm-Message-State: AOAM532PdwDgXSCjS/RSD1PUJM02LXS9YI9NELZop2xh0EVUCBNJIXV3
 UaIp8Ha4CM5HBxU0nET8TT1so0TYd9aKBvQ38w==
X-Google-Smtp-Source: ABdhPJx1LinCS1pOqWEkgprmbR0KqvlB+UwCup/pn2fKM40C2TTP+BRtcH8NDydUzPiPForDxp/bLl8r9BLHa4F/ckY=
X-Received: by 2002:a25:c604:0:b0:645:d969:97a7 with SMTP id
 k4-20020a25c604000000b00645d96997a7mr12121163ybf.134.1650893587786; Mon, 25
 Apr 2022 06:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-12-nancy.lin@mediatek.com>
 <2cd07faf-e903-e55b-85c1-ce7a823ddb8b@gmail.com>
In-Reply-To: <2cd07faf-e903-e55b-85c1-ce7a823ddb8b@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 25 Apr 2022 21:32:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8Ei1e+Y==y+e7LoHBH3-SZEiz4M0SSqecRfWVMsLKH3Q@mail.gmail.com>
Message-ID: <CAAOTY_8Ei1e+Y==y+e7LoHBH3-SZEiz4M0SSqecRfWVMsLKH3Q@mail.gmail.com>
Subject: Re: [PATCH v17 11/21] drm/mediatek: add display merge start/stop API
 for cmdq support
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 wim@linux-watchdog.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DTML <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, llvm@lists.linux.dev, 
 singo.chang@mediatek.com, srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_063312_965173_D53A5C3A 
X-CRM114-Status: GOOD (  21.89  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hdHRoaWFzOgoKTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g
5pa8IDIwMjLlubQ05pyIMjLml6Ug6YCx5LqUIOS4i+WNiDc6NDjlr6vpgZPvvJoKPgo+Cj4KPiBP
biAxNi8wNC8yMDIyIDA0OjA3LCBOYW5jeS5MaW4gd3JvdGU6Cj4gPiBBZGQgbWVyZ2Ugc3RhcnQv
c3RvcCBBUEkgZm9yIGNtZHEgc3VwcG9ydC4gVGhlIG92bF9hZGFwdG9yIG1lcmdlcwo+ID4gYXJl
IGNvbmZpZ3VyZWQgd2l0aCBlYWNoIGRybSBwbGFuZSB1cGRhdGUuIE5lZWQgdG8gZW5hYmxlL2Rp
c2FibGUKPiA+IG1lcmdlIHdpdGggY21kcSBtYWtpbmcgc3VyZSBhbGwgdGhlIHNldHRpbmdzIHRh
a2VuIGVmZmVjdCBpbiB0aGUKPiA+IHNhbWUgdmJsYW5rLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IE5hbmN5LkxpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBDaHVu
LUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9k
cnYuaCAgIHwgIDIgKysKPiA+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX21l
cmdlLmMgfCAyMCArKysrKysrKysrKysrKysrKy0tLQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDE5
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9kcnYuaAo+ID4gaW5kZXggNTNhYTk4OGRkZTNiLi40M2E0MTI1MjViNzUg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZHJ2LmgK
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaAo+ID4gQEAg
LTY2LDYgKzY2LDggQEAgdm9pZCBtdGtfbWVyZ2Vfc3RvcChzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+
ID4gICB2b2lkIG10a19tZXJnZV9hZHZhbmNlX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVu
c2lnbmVkIGludCBsX3csIHVuc2lnbmVkIGludCByX3csCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50IGgsIHVuc2lnbmVkIGludCB2cmVmcmVzaCwgdW5zaWduZWQg
aW50IGJwYywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgY21kcV9wa3Qg
KmNtZHFfcGt0KTsKPiA+ICt2b2lkIG10a19tZXJnZV9zdGFydF9jbWRxKHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCk7Cj4gPiArdm9pZCBtdGtfbWVyZ2Vfc3Rv
cF9jbWRxKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCk7Cj4g
Pgo+ID4gICB2b2lkIG10a19vdmxfYmdjbHJfaW5fb24oc3RydWN0IGRldmljZSAqZGV2KTsKPiA+
ICAgdm9pZCBtdGtfb3ZsX2JnY2xyX2luX29mZihzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9tZXJnZS5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX21lcmdlLmMKPiA+IGluZGV4IDQwZGEwNTU1
NDE2ZC4uYzBkOWI0M2IyYTY2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX21lcmdlLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9tZXJnZS5jCj4gPiBAQCAtNjcsMTcgKzY3LDMxIEBAIHN0cnVjdCBtdGtfZGlzcF9t
ZXJnZSB7Cj4gPiAgIH07Cj4gPgo+ID4gICB2b2lkIG10a19tZXJnZV9zdGFydChzdHJ1Y3QgZGV2
aWNlICpkZXYpCj4KPiBQcm9iYWJseSBub3QgbXkgY2FsbCwgYnV0IHdvdWxkbid0IGl0IG1ha2Ug
c2Vuc2UgdG8gZW5oYW5jZSBtdGtfbWVyZ2Vfc3RhcnQgdG8KPiBwYXNzICdzdHJ1Y3QgY21kcV9w
a3QgKmNtZHFfcGt0JyBkaXJlY3RseSBpbnN0ZWFkIG9mIGFkZGluZyB0aGlzICdhZGFwdGVyJz8K
CkluIFsxXSwgbXRrX21lcmdlX3N0YXJ0KCkgc2hvdWxkIG1hdGNoIHRoZSBmdW5jdGlvbiBwcm90
b3R5cGUgb2YKbXRrX2RkcF9jb21wX2Z1bmNzLnN0YXJ0LCBzbyBrZWVwIHRoZSBub24tY21kcSBp
bnRlcmZhY2UuCgpzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyBkZHBfbWVy
Z2UgPSB7CiAuY2xrX2VuYWJsZSA9IG10a19tZXJnZV9jbGtfZW5hYmxlLAogLmNsa19kaXNhYmxl
ID0gbXRrX21lcmdlX2Nsa19kaXNhYmxlLAogLnN0YXJ0ID0gbXRrX21lcmdlX3N0YXJ0LAogLnN0
b3AgPSBtdGtfbWVyZ2Vfc3RvcCwKIC5jb25maWcgPSBtdGtfbWVyZ2VfY29uZmlnLAp9OwoKWzFd
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRj
aC8yMDIyMDQxOTA5NDE0My45NTYxLTUtamFzb24tamgubGluQG1lZGlhdGVrLmNvbS8KClJlZ2Fy
ZHMsCkNodW4tS3VhbmcuCgo+Cj4gSW4gdGhlIGVuZCB0aGlzIGlzIHVwIHRvIENodW4tS3Vhbmcu
Cj4KPiBSZWdhcmRzLAo+IE1hdHRoaWFzCj4KPiA+ICt7Cj4gPiArICAgICBtdGtfbWVyZ2Vfc3Rh
cnRfY21kcShkZXYsIE5VTEwpOwo+ID4gK30KPiA+ICsKPiA+ICt2b2lkIG10a19tZXJnZV9zdG9w
KHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICAgewo+ID4gICAgICAgc3RydWN0IG10a19kaXNwX21l
cmdlICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gPgo+ID4gLSAgICAgd3JpdGVsKE1F
UkdFX0VOLCBwcml2LT5yZWdzICsgRElTUF9SRUdfTUVSR0VfQ1RSTCk7Cj4gPiArICAgICBtdGtf
bWVyZ2Vfc3RvcF9jbWRxKGRldiwgTlVMTCk7Cj4gPiAgIH0KPiA+Cj4gPiAtdm9pZCBtdGtfbWVy
Z2Vfc3RvcChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiArdm9pZCBtdGtfbWVyZ2Vfc3RhcnRfY21k
cShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QpCj4gPiArewo+
ID4gKyAgICAgc3RydWN0IG10a19kaXNwX21lcmdlICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7Cj4gPiArCj4gPiArICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCAxLCAmcHJpdi0+Y21k
cV9yZWcsIHByaXYtPnJlZ3MsCj4gPiArICAgICAgICAgICAgICAgICAgIERJU1BfUkVHX01FUkdF
X0NUUkwpOwo+ID4gK30KPiA+ICsKPiA+ICt2b2lkIG10a19tZXJnZV9zdG9wX2NtZHEoc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0KQo+ID4gICB7Cj4gPiAgICAg
ICBzdHJ1Y3QgbXRrX2Rpc3BfbWVyZ2UgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiA+
Cj4gPiAtICAgICB3cml0ZWwoMHgwLCBwcml2LT5yZWdzICsgRElTUF9SRUdfTUVSR0VfQ1RSTCk7
Cj4gPiArICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCAwLCAmcHJpdi0+Y21kcV9yZWcsIHBy
aXYtPnJlZ3MsCj4gPiArICAgICAgICAgICAgICAgICAgIERJU1BfUkVHX01FUkdFX0NUUkwpOwo+
ID4gICB9Cj4gPgo+ID4gICBzdGF0aWMgdm9pZCBtdGtfbWVyZ2VfZmlmb19zZXR0aW5nKHN0cnVj
dCBtdGtfZGlzcF9tZXJnZSAqcHJpdiwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
