Return-Path: <SRS0=zFd5=FP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2157BC4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 14:54:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94F2523BF0
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 14:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94F2523BF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QoNE39xrF4OnMiBWVxZOxec0p5mfDTlVowiga95FjMU=; b=rJ4TEWAh5KtXar29W1j4OZXUj
	hAZKB6mVKmh9evAjJowH4ThbHxCykSi1pktx4Hn2Ehm4Js6FvPkXny1uRBrLKpb79e4+iIvTowtXW
	3zRMttD0etOvX+xo13bIDhhJhtbSoB0r3zaMvb8hgZ9hiRhv04DK8xvYix4KvWt1HswugJ81xdxBH
	rVMdSyQc2KnJjHUuKeoFMfBdxLs2D9ttQr3/DqrnzaLZ5Rsqi99K1zyHduL4Dokac2ZzXe6mQLqlq
	rqTKuNE39r++CWhPhy3WQUxZL/FGPYmjyXNQQkh5cDNIZwEc09E+UJbsVTStZ0z6DY/PIKtTeXcsR
	DlIOpkInA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knjnx-0004nY-Fy; Fri, 11 Dec 2020 14:53:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knjno-0004kN-By; Fri, 11 Dec 2020 14:53:49 +0000
X-Gm-Message-State: AOAM530l/8OM6X7lLeFFlRNj7jWnambLAgCa06oSigQS5X7STfaTUz3A
 ctJbKYPjmObtUdnT1D3gXl5WWbPWikKo0LGVbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607698012;
 bh=kMGlC86uydZtd+hqrVgic6SM+HBSXPFoclUBLRZV+W0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oIyQEnHRnQVqjF3lPXkM2jdJZPuJrBRV4mjDmkyC7D2YkMytrKxvnLYtY/MuZ8U/Z
 W2OUDIdIl5P5nA+Grcj7irhjVn0ALUSpEaB9xq3sTtFco4Ioc5EaORLgi+/Fx1x1B1
 xuTzcH5vpNBd8jobFSsDlhuU/N6m6vTAlNmwOCa52uoTl+L+OKQeUIZBQMMDrnbCbl
 aWGhg7987Lki9Xe3xfn+ju4MxOO01qIDqA7zvZYo8oun/gimaAkwCOmj43NF6l0pID
 NrBJeFA4dAUjrbCc1WRzn31ZiyySttmX0+rmnlXaoevbPEZszXOPWO4MHLzSftdiW2
 VV7HliYYfHt3g==
X-Google-Smtp-Source: ABdhPJwAF2z+4ptZLYQgJaLTwt2m+q4kzvOhtU1ax7sWHg9DZiTR/rIDy9PKQk1Nfa6Qmwufx6w8ViJve1ZjDZ/qZUQ=
X-Received: by 2002:a5d:6443:: with SMTP id d3mr14035794wrw.422.1607698005242; 
 Fri, 11 Dec 2020 06:46:45 -0800 (PST)
MIME-Version: 1.0
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-2-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_-oL+NyzDKssCjyP=E8Py3oyEK6a6s=XoYvTFymZE9-zQ@mail.gmail.com>
 <1607647416.12750.3.camel@mhfsdcap03>
In-Reply-To: <1607647416.12750.3.camel@mhfsdcap03>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 11 Dec 2020 22:46:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY__y70tF2ORQDgZfk7RfeQm4fKraPnOQWMDnWsBb7HmZnQ@mail.gmail.com>
Message-ID: <CAAOTY__y70tF2ORQDgZfk7RfeQm4fKraPnOQWMDnWsBb7HmZnQ@mail.gmail.com>
Subject: Re: [PATCH v8, 1/6] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_095348_559613_68F8D02E 
X-CRM114-Status: GOOD (  23.53  )
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
PiDmlrwgMjAyMOW5tDEy5pyIMTHml6Ug6YCx5LqUIOS4iuWNiDg6NDPlr6vpgZPvvJoKPgo+IE9u
IFRodSwgMjAyMC0xMi0xMCBhdCAyMzo0MCArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiA+
IEhpLCBZb25ncWlhbmc6Cj4gPgo+ID4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMOaXpSDpgLHlm5sg5LiL5Y2INToyMuWvq+mBk++8
mgo+ID4gPgo+ID4gPiByZG1hIGZpZm8gc2l6ZSBtYXkgYmUgZGlmZmVyZW50IGV2ZW4gaW4gc2Ft
ZSBTT0MsIGFkZCB0aGlzCj4gPiA+IHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25kaW5nIHJkbWEK
PiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBt
ZWRpYXRlay5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKysrCj4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWssZGlzcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ID4gPiBpbmRleCAxMjEyMjA3Li42NGM2NGVl
IDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+
ID4gPiBAQCAtNjYsNiArNjYsMTMgQEAgUmVxdWlyZWQgcHJvcGVydGllcyAoRE1BIGZ1bmN0aW9u
IGJsb2Nrcyk6Cj4gPiA+ICAgIGFyZ3VtZW50LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlvbW11LnR4dAo+ID4gPiAgICBmb3IgZGV0YWlscy4K
PiA+ID4KPiA+ID4gK09wdGlvbmFsIHByb3BlcnRpZXMgKFJETUEgZnVuY3Rpb24gYmxvY2tzKToK
PiA+ID4gKy0gbWVkaWF0ZWsscmRtYV9maWZvX3NpemU6IHJkbWEgZmlmbyBzaXplIG1heSBiZSBk
aWZmZXJlbnQgZXZlbiBpbiBzYW1lIFNPQywgYWRkIHRoaXMKPiA+ID4gKyAgcHJvcGVydHkgdG8g
dGhlIGNvcnJlc3BvbmRpbmcgcmRtYQo+ID4gPiArICB0aGUgdmFsdWUgaXMgdGhlIE1heCB2YWx1
ZSB3aGljaCBkZWZpbmVkIGluIGhhcmR3YXJlIGRhdGEgc2hlZXQuCj4gPiA+ICsgIHJkbWFfZmlm
b19zaXplIG9mIHJkbWEwIGluIG10ODE4MyBpcyA1MTIwCj4gPiA+ICsgIHJkbWFfZmlmb19zaXpl
IG9mIHJkbWExIGluIG10ODE4MyBpcyAyMDQ4Cj4gPiA+ICsKPiA+ID4gIEV4YW1wbGVzOgo+ID4g
Pgo+ID4gPiAgbW1zeXM6IGNsb2NrLWNvbnRyb2xsZXJAMTQwMDAwMDAgewo+ID4gPiBAQCAtMjA3
LDMgKzIxNCwxMiBAQCBvZEAxNDAyMzAwMCB7Cj4gPiA+ICAgICAgICAgcG93ZXItZG9tYWlucyA9
IDwmc2Nwc3lzIE1UODE3M19QT1dFUl9ET01BSU5fTU0+Owo+ID4gPiAgICAgICAgIGNsb2NrcyA9
IDwmbW1zeXMgQ0xLX01NX0RJU1BfT0Q+Owo+ID4gPiAgfTsKPiA+ID4gKwo+ID4gPiArcmRtYTE6
IHJkbWFAMTQwMGMwMDAgewo+ID4gPiArICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTgzLWRpc3AtcmRtYSI7Cj4gPiA+ICsgICAgICAgcmVnID0gPDAgMHgxNDAwYzAwMCAwIDB4MTAw
MD47Cj4gPiA+ICsgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIyOSBJUlFfVFlQRV9MRVZF
TF9MT1c+Owo+ID4gPiArICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNjcHN5cyBNVDgxODNfUE9X
RVJfRE9NQUlOX0RJU1A+Owo+ID4gPiArICAgICAgIGNsb2NrcyA9IDwmbW1zeXMgQ0xLX01NX0RJ
U1BfUkRNQTE+Owo+ID4gPiArICAgICAgIG1lZGlhdGVrLHJkbWFfZmlmb19zaXplID0gPDIwNDg+
Owo+ID4gPiArfTsKPiA+Cj4gPiBJbiBbMV0sIFJvYiBoYXMgc3VnZ2VzdCB0aGF0IG5vdCBhZGQg
ZXhhbXBsZSBvZiByZG1hMSwgaXQncyBiZXR0ZXIgdG8KPiA+IGFkZCBtZWRpYXRlayxyZG1hX2Zp
Zm9fc2l6ZSBpbiByZG1hMCBmb3IgZXhhbXBsZS4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzE1OTY4NTUyMzEtNTc4
Mi0yLWdpdC1zZW5kLWVtYWlsLXlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tLwo+ID4KPiA+IFJl
Z2FyZHMsCj4gPiBDaHVuLUt1YW5nLgo+Cj4gdGhlIGRlc2NyaXB0aW9uIG9mIHJkbWEwIGlzIG10
ODE3MywgYW5kIG10ODE3MyByZG1hIGRyaXZlciBzZXQgdGhlCj4gY29ycmVzcG9uZCBmaWZvIHNp
emUgYWxyZWFkeSBvayBsaWtlIHRoaXM6Cj4gc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9y
ZG1hX2RhdGEgbXQ4MTczX3JkbWFfZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAgICAuZmlmb19zaXpl
ID0gU1pfOEssCj4gfTsKPgo+IHBsZWFzZSBkb3VibGUgY29uZmlybSBzaGFsbCB3ZSBhZGQgdGhp
cyBpbmZvcm1hdGlvbiBpbnRvIHJkbWEwCj4gZGVzY3JpcHRpb24uCj4KCkRldmljZSB0cmVlIGlz
IHVzZWQgdG8gZGVzY3JpYmUgaGFyZHdhcmUuIFRoYXQgbWVhbnMgZGV2aWNlIHRyZWUKZGVzY3Jp
cHRpb24gc2hvdWxkIG5vdCBjb25zaWRlciB5b3VyIGRyaXZlcidzIGltcGxlbWVudGF0aW9uLgpt
ZWRpYXRlayxyZG1hLWZpZm8tc2l6ZSBvZiBtdDgxNzMtcmRtYTAgaXMgOEssIHNvIEkgY291bGQg
d3JpdGUgdGhpcwppbmZvcm1hdGlvbiBpbiBkZXZpY2Ugbm9kZSBiZWNhdXNlIHRoaXMgaGFyZHdh
cmUgaXMuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+ID4KPiA+ID4gLS0KPiA+ID4gMS44LjEu
MS5kaXJ0eQo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+ID4gPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiA+ID4gTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
