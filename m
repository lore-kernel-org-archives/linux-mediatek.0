Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED88C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 15:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3ZK5PEIQzGXwIxflXIb2FqySGR5R909kpAdscoZpec=; b=V1xm+HM2lFEUD+
	Mk9ulhklnihQnlb1LEy/XSKQHtXPDp2jfo+ck96kvTXCAjE6xZ0oPAFwGeG1oKM0gTfVC3V8SixeO
	9Oxt3IljMrcwo8qwE7Y3uf4MVTOcj5SFtbJsRYFyHRC3vrXzs1SV5WpqPr39S4skp7pQaBPKGIatc
	SvJM0fxbC4/W4k9XnFBoM9VnJRg79Mw2jSDoIZRMBhcBz6HQK0v2Qcp8LTz2Jqov+m6rZvvD+qA0N
	3ERHFkTvwnZCRfYYiwKuF1u4subvr6YW8djInp8rXLFh6N5umggJ932xBTl7ggi2lthfvWS8sXFRz
	GKwOx17LO4PkM1+eOLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj0cu-00A6Qi-AC; Mon, 25 Apr 2022 15:27:48 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj0ch-00A6MT-Vi; Mon, 25 Apr 2022 15:27:37 +0000
Received: by mail-io1-xd2f.google.com with SMTP id p62so16269974iod.0;
 Mon, 25 Apr 2022 08:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nYsiunOUmFwZ8o8GT74juEfa6oLm3zN9Ibj3gVa3bhU=;
 b=i77OZZbZby0nwayMxGseETzr9Nj7J6fX5a++xq03SVhVqRw1UzRVEFc2taTVeAwKIx
 bpvm7uM3vRs39zX0rrxk5JDfUWPopToIhRBrDI+o4mAuHvh3vFBZupK5zorHVe/CmH+u
 vyFzmNAsKrnn+xdUsiFFpZlPY+NZEygZg5XCeHV51KiCqTj00m5DiEP+e+DnYHXQHART
 h1Zphjo3zCVJueWZVhkfeYvQk2BGyHdlT/ujK+BZc6F7STAC3GVIK4fd389QU+E3CWYZ
 WgAQhDs9ANzbCD4mOfXtByWpJFFyk+yN6QxirF8aFCaVelBhgkxpLlYf5lARzkvP5tZT
 cS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nYsiunOUmFwZ8o8GT74juEfa6oLm3zN9Ibj3gVa3bhU=;
 b=W/ve1GA0+HlvqeCUjxFXxA7aqceqZP2BXdm/k8OozLlKyrfWuqcWJSrT2U/DWtSQuR
 hMATxe/oGT6tiaGm1kAYXsxZbAGVEYTcmMiFz9ZrQsTzjYbiqdQYoJlfP/UpWUTwEZaF
 8j2tmIZ5a0j68D66jWZNQXoeDF90ipFA3Ec8FbPIeWU5lEXLf1Ka3WJZ/KmCWXlL8oG1
 Ll5Dv0nKy2y4TB+izW2jz2gfXQ2bWRiq4W6sILdNQqk90sLOfdXLgM04DjkGhQQgnDpV
 tgM6QTo4F0Uu2wMj0p0LxinEKrJDwCfDfLSwUBjOmhOahwiBOVXgSJFBFixMglDnOLWS
 35lw==
X-Gm-Message-State: AOAM530OJHDutxwWkt4MCdO3YQ5Ds61taAITouSsqWAsMq6GRnDAansX
 ZSsCbvB4nFbIUW2/mIMpi4Fb1h/QmwuijQ==
X-Google-Smtp-Source: ABdhPJzaOOhKV4BPWVeNOg0tWQ6bvh+gsUzBd/G0AXF40GnUFg0YdN6YZlGg+EFWAsS/57V61YrvNQ==
X-Received: by 2002:a05:6638:1352:b0:321:547b:daa2 with SMTP id
 u18-20020a056638135200b00321547bdaa2mr7317700jad.128.1650900453788; 
 Mon, 25 Apr 2022 08:27:33 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 b11-20020a6be70b000000b00654b3a46b5esm7499151ioh.53.2022.04.25.08.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 08:27:33 -0700 (PDT)
Message-ID: <7faa6c9a-9ace-d1eb-0bca-8e8d7c3ae7ec@gmail.com>
Date: Mon, 25 Apr 2022 17:27:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v17 11/21] drm/mediatek: add display merge start/stop API
 for cmdq support
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, DTML
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, llvm@lists.linux.dev,
 singo.chang@mediatek.com, srv_heupstream <srv_heupstream@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-12-nancy.lin@mediatek.com>
 <2cd07faf-e903-e55b-85c1-ce7a823ddb8b@gmail.com>
 <CAAOTY_8Ei1e+Y==y+e7LoHBH3-SZEiz4M0SSqecRfWVMsLKH3Q@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAAOTY_8Ei1e+Y==y+e7LoHBH3-SZEiz4M0SSqecRfWVMsLKH3Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_082736_058744_B6B22A01 
X-CRM114-Status: GOOD (  17.69  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAyNS8wNC8yMDIyIDE1OjMyLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+IEhpLCBNYXR0aGlh
czoKPiAKPiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPiDmlrwgMjAy
MuW5tDTmnIgyMuaXpSDpgLHkupQg5LiL5Y2INzo0OOWvq+mBk++8mgo+Pgo+Pgo+Pgo+PiBPbiAx
Ni8wNC8yMDIyIDA0OjA3LCBOYW5jeS5MaW4gd3JvdGU6Cj4+PiBBZGQgbWVyZ2Ugc3RhcnQvc3Rv
cCBBUEkgZm9yIGNtZHEgc3VwcG9ydC4gVGhlIG92bF9hZGFwdG9yIG1lcmdlcwo+Pj4gYXJlIGNv
bmZpZ3VyZWQgd2l0aCBlYWNoIGRybSBwbGFuZSB1cGRhdGUuIE5lZWQgdG8gZW5hYmxlL2Rpc2Fi
bGUKPj4+IG1lcmdlIHdpdGggY21kcSBtYWtpbmcgc3VyZSBhbGwgdGhlIHNldHRpbmdzIHRha2Vu
IGVmZmVjdCBpbiB0aGUKPj4+IHNhbWUgdmJsYW5rLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE5h
bmN5LkxpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPj4+IFJldmlld2VkLWJ5OiBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEu
Y29tPgo+Pj4gLS0tCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZHJ2
LmggICB8ICAyICsrCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfbWVy
Z2UuYyB8IDIwICsrKysrKysrKysrKysrKysrLS0tCj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDE5
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9kcnYuaAo+Pj4gaW5kZXggNTNhYTk4OGRkZTNiLi40M2E0MTI1MjViNzUg
MTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZHJ2LmgK
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaAo+Pj4gQEAg
LTY2LDYgKzY2LDggQEAgdm9pZCBtdGtfbWVyZ2Vfc3RvcChzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+
Pj4gICAgdm9pZCBtdGtfbWVyZ2VfYWR2YW5jZV9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1
bnNpZ25lZCBpbnQgbF93LCB1bnNpZ25lZCBpbnQgcl93LAo+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgaCwgdW5zaWduZWQgaW50IHZyZWZyZXNoLCB1bnNpZ25l
ZCBpbnQgYnBjLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgY21kcV9w
a3QgKmNtZHFfcGt0KTsKPj4+ICt2b2lkIG10a19tZXJnZV9zdGFydF9jbWRxKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCk7Cj4+PiArdm9pZCBtdGtfbWVyZ2Vf
c3RvcF9jbWRxKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCk7
Cj4+Pgo+Pj4gICAgdm9pZCBtdGtfb3ZsX2JnY2xyX2luX29uKHN0cnVjdCBkZXZpY2UgKmRldik7
Cj4+PiAgICB2b2lkIG10a19vdmxfYmdjbHJfaW5fb2ZmKHN0cnVjdCBkZXZpY2UgKmRldik7Cj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX21lcmdlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfbWVyZ2UuYwo+Pj4gaW5kZXggNDBk
YTA1NTU0MTZkLi5jMGQ5YjQzYjJhNjYgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3BfbWVyZ2UuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX21lcmdlLmMKPj4+IEBAIC02NywxNyArNjcsMzEgQEAgc3RydWN0IG10a19k
aXNwX21lcmdlIHsKPj4+ICAgIH07Cj4+Pgo+Pj4gICAgdm9pZCBtdGtfbWVyZ2Vfc3RhcnQoc3Ry
dWN0IGRldmljZSAqZGV2KQo+Pgo+PiBQcm9iYWJseSBub3QgbXkgY2FsbCwgYnV0IHdvdWxkbid0
IGl0IG1ha2Ugc2Vuc2UgdG8gZW5oYW5jZSBtdGtfbWVyZ2Vfc3RhcnQgdG8KPj4gcGFzcyAnc3Ry
dWN0IGNtZHFfcGt0ICpjbWRxX3BrdCcgZGlyZWN0bHkgaW5zdGVhZCBvZiBhZGRpbmcgdGhpcyAn
YWRhcHRlcic/Cj4gCj4gSW4gWzFdLCBtdGtfbWVyZ2Vfc3RhcnQoKSBzaG91bGQgbWF0Y2ggdGhl
IGZ1bmN0aW9uIHByb3RvdHlwZSBvZgo+IG10a19kZHBfY29tcF9mdW5jcy5zdGFydCwgc28ga2Vl
cCB0aGUgbm9uLWNtZHEgaW50ZXJmYWNlLgoKV2VsbCBvdGhlciBjYWxsYmFja3MsIG5hbWVseSBj
b25maWcgaGFzcyBjbWRxX3BrdC4gU28gd2UgY291bGQgY2hhbmdlIHRoZSAKY2FsbGJhY2sgaW4g
YSBzaW1pbGFyIHdheSBpcyB3YXMgZG9uZSBpbgpkMGFmZTM3ZjUyMDkgKCJkcm0vbWVkaWF0ZWs6
IHN1cHBvcnQgQ01EUSBpbnRlcmZhY2UgaW4gZGRwIGNvbXBvbmVudCIpCgoKQnV0IGFzIGkgc2Fp
ZCBpdCdzIHVwIHRvIHlvdS4gWW91IGFyZSB0aGUgbWFpbnRhaW5lci4KClJlZ2FyZHMsCk1hdHRo
aWFzCgo+IAo+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RkcF9jb21wX2Z1bmNzIGRkcF9tZXJn
ZSA9IHsKPiAgIC5jbGtfZW5hYmxlID0gbXRrX21lcmdlX2Nsa19lbmFibGUsCj4gICAuY2xrX2Rp
c2FibGUgPSBtdGtfbWVyZ2VfY2xrX2Rpc2FibGUsCj4gICAuc3RhcnQgPSBtdGtfbWVyZ2Vfc3Rh
cnQsCj4gICAuc3RvcCA9IG10a19tZXJnZV9zdG9wLAo+ICAgLmNvbmZpZyA9IG10a19tZXJnZV9j
b25maWcsCj4gfTsKPiAKPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0
L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjIwNDE5MDk0MTQzLjk1NjEtNS1qYXNvbi1qaC5saW5A
bWVkaWF0ZWsuY29tLwo+IAo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPiAKPj4KPj4gSW4gdGhl
IGVuZCB0aGlzIGlzIHVwIHRvIENodW4tS3VhbmcuCj4+Cj4+IFJlZ2FyZHMsCj4+IE1hdHRoaWFz
Cj4+Cj4+PiArewo+Pj4gKyAgICAgbXRrX21lcmdlX3N0YXJ0X2NtZHEoZGV2LCBOVUxMKTsKPj4+
ICt9Cj4+PiArCj4+PiArdm9pZCBtdGtfbWVyZ2Vfc3RvcChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+
PiAgICB7Cj4+PiAgICAgICAgc3RydWN0IG10a19kaXNwX21lcmdlICpwcml2ID0gZGV2X2dldF9k
cnZkYXRhKGRldik7Cj4+Pgo+Pj4gLSAgICAgd3JpdGVsKE1FUkdFX0VOLCBwcml2LT5yZWdzICsg
RElTUF9SRUdfTUVSR0VfQ1RSTCk7Cj4+PiArICAgICBtdGtfbWVyZ2Vfc3RvcF9jbWRxKGRldiwg
TlVMTCk7Cj4+PiAgICB9Cj4+Pgo+Pj4gLXZvaWQgbXRrX21lcmdlX3N0b3Aoc3RydWN0IGRldmlj
ZSAqZGV2KQo+Pj4gK3ZvaWQgbXRrX21lcmdlX3N0YXJ0X2NtZHEoc3RydWN0IGRldmljZSAqZGV2
LCBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0KQo+Pj4gK3sKPj4+ICsgICAgIHN0cnVjdCBtdGtf
ZGlzcF9tZXJnZSAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+Pj4gKwo+Pj4gKyAgICAg
bXRrX2RkcF93cml0ZShjbWRxX3BrdCwgMSwgJnByaXYtPmNtZHFfcmVnLCBwcml2LT5yZWdzLAo+
Pj4gKyAgICAgICAgICAgICAgICAgICBESVNQX1JFR19NRVJHRV9DVFJMKTsKPj4+ICt9Cj4+PiAr
Cj4+PiArdm9pZCBtdGtfbWVyZ2Vfc3RvcF9jbWRxKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0
IGNtZHFfcGt0ICpjbWRxX3BrdCkKPj4+ICAgIHsKPj4+ICAgICAgICBzdHJ1Y3QgbXRrX2Rpc3Bf
bWVyZ2UgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPj4+Cj4+PiAtICAgICB3cml0ZWwo
MHgwLCBwcml2LT5yZWdzICsgRElTUF9SRUdfTUVSR0VfQ1RSTCk7Cj4+PiArICAgICBtdGtfZGRw
X3dyaXRlKGNtZHFfcGt0LCAwLCAmcHJpdi0+Y21kcV9yZWcsIHByaXYtPnJlZ3MsCj4+PiArICAg
ICAgICAgICAgICAgICAgIERJU1BfUkVHX01FUkdFX0NUUkwpOwo+Pj4gICAgfQo+Pj4KPj4+ICAg
IHN0YXRpYyB2b2lkIG10a19tZXJnZV9maWZvX3NldHRpbmcoc3RydWN0IG10a19kaXNwX21lcmdl
ICpwcml2LAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
