Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D866CC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 23:47:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A1B9613FA
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 23:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A1B9613FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Xhpe46g0rldKqncoHpLzuNGEAtMYHCdIJvtUpxy164=; b=jFiBXzyz3Cxf32uBcqS/Ia/IA
	Xc4mvmKipEDRsGyosf464K8kFu70SkazMujDPfXhAG/gIcCrrwJC4IViEmUcdSySyd0gyLKq0EBsj
	PAogMYwWOz5Cq36F6b1QYujgX1RB8vMsoWqh0l83weCCsnivB5mCW72UkWUk7oYX9Ff6lnSx6JYiu
	5ccdG5XY0S+/bo/ee9ubf+gAXnZiKGUxFefQwxwMG0yJAHzmDVpuFxKnIzt9pQHY8P9yRWqfQ9o+J
	uttyQhOV3ZSvIu0UNvSj2CvMEKoaE8Mv0XGVbTjd5+NR5GLb3DSYG+O8aBMMy0fD8UUkBbat/0ryE
	p+WI4aWLw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ05U-00DHre-5Z; Tue, 20 Apr 2021 23:47:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ05F-00DHmh-7g; Tue, 20 Apr 2021 23:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=BYu+GP4VpuEZMzXvLVjs7Gm/gsEL2xuHKAuPadI5SlQ=; b=APzFB05YUIkHEsvTQihwIAjyu8
 glWOY973U09eDzSixw18XvMU3Yqq0zSL5ITGNVVOFR+YuDrmq7j0JZwK5nuKwbK5pnfsf5+CGupfV
 aY4O7HyhCc04Ps2fEXz28Gzk/E13RRVIXGSQe/t9S/8in5awHbL3nU1ntz3FDGIu7UtstM+pG0ZyZ
 8/DtLbTE4i2FkD0eDRo4nw71/LhviPIZfrDUFxOvaXaMlu1TzMuZCSQ8JB1dW+McipFhewAjHC+2T
 wZsvHY14wUXwEeltb9yWpxDWlIc8S2bZ3MfgVZkn8K/DfccikBarEZU3rXhEkG1/UWANEU1pgeNwh
 8wxRy9LA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ05C-00CUAH-GC; Tue, 20 Apr 2021 23:47:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 303C561417;
 Tue, 20 Apr 2021 23:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618962425;
 bh=eA0je9XIMBi+hBIu0Pn+Aqj2T8qTA7b2uS0VLUF9zzI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LLoLlHkeLBDnQdbZLhuvX9xOoH4axN0qp+9NqdkFFfPTNsTVrZX2BYwP95/jmzXbe
 FZdHUD9WmZ8roFsiA8D2MZxqFnhaf8wG4d0mEji0L11b9lNqtTc226sT81K2/sFg0d
 3NOutLIfcIdLaCAfDJuBkkcQsjJn7GG+NnryiTpTIJNTAgZ4rrxfKGKH7Z/fdQEgu9
 jO3bL4tY86zEh/S5odoWApJ/bgqVsXXCohotJowhgy8LdR2mLlCrl7mJxFJaisZsLq
 UkCous9eWdQPBpcr/CN9dWVs4HWZTJ42DMYruXNpzSY8/J57DCFo4UA6mwFLZ7lwl2
 C5ymHH/U29J+w==
Received: by mail-ej1-f53.google.com with SMTP id g5so54092947ejx.0;
 Tue, 20 Apr 2021 16:47:05 -0700 (PDT)
X-Gm-Message-State: AOAM530n7rcZ3lEXt7fYsS8sR3rZwalUEXg4vk459NgeU63/OPEewueD
 05DVzAUTb+FUEW/vePOLkvpXikUhZbi62K3/1A==
X-Google-Smtp-Source: ABdhPJzWtA0GFcdRkEW30nmVsBQ8OqLDMIWv7BThU6NzNQoUVz5rdXp0ZYW89/UGZrCQLN81Daaw9OUcamTMW6UpIik=
X-Received: by 2002:a17:907:629c:: with SMTP id
 nd28mr30584066ejc.267.1618962423550; 
 Tue, 20 Apr 2021 16:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210409045314.3420733-1-hsinyi@chromium.org>
 <CAJMQK-gFk8WV0W2TTP7=OTsBqgWmy_eKSd42Xa5dJzvUFDTAXQ@mail.gmail.com>
In-Reply-To: <CAJMQK-gFk8WV0W2TTP7=OTsBqgWmy_eKSd42Xa5dJzvUFDTAXQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 21 Apr 2021 07:46:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9pJ=H4gQKsC1VeHo6Z4qsHFzOe267QVu6p_Jid0AXsKQ@mail.gmail.com>
Message-ID: <CAAOTY_9pJ=H4gQKsC1VeHo6Z4qsHFzOe267QVu6p_Jid0AXsKQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mediatek: set panel orientation before
 drm_dev_register().
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Devicetree List <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_164706_657179_52809FA5 
X-CRM114-Status: GOOD (  22.21  )
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

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx
5bm0NOaciDIw5pelIOmAseS6jCDkuIvljYg1OjA15a+r6YGT77yaCj4KPiBPbiBGcmksIEFwciA5
LCAyMDIxIGF0IDEyOjUzIFBNIEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4gd3Jv
dGU6Cj4gPgo+ID4gZHJtX2Rldl9yZWdpc3RlcigpIHNldHMgY29ubmVjdG9yLT5yZWdpc3RyYXRp
b25fc3RhdGUgdG8KPiA+IERSTV9DT05ORUNUT1JfUkVHSVNURVJFRCBhbmQgZGV2LT5yZWdpc3Rl
cmVkIHRvIHRydWUuIElmCj4gPiBkcm1fY29ubmVjdG9yX3NldF9wYW5lbF9vcmllbnRhdGlvbigp
IGlzIGZpcnN0IGNhbGxlZCBhZnRlcgo+ID4gZHJtX2Rldl9yZWdpc3RlcigpLCBpdCB3aWxsIGZh
aWwgc2V2ZXJhbCBjaGVja3MgYW5kIHJlc3VsdHMgaW4gZm9sbG93aW5nCj4gPiB3YXJuaW5nLiBT
byBzZXQgcGFuZWwgb3JpZW50YXRpb24gaW4gZHNpIGJlZm9yZSBkcm1fZGV2X3JlZ2lzdGVyKCkg
aXMKPiA+IGNhbGxlZC4KCkFsbCBjb25uZWN0b3Igd291bGQgaGF2ZSB0aGlzIHByb2JsZW0sIHNv
IEkgd291bGQgbGlrZSB0byBmaXggdGhpcyBpbgpjb21tb24gY29kZS4KSW4gZHJtX2Nvbm5lY3Rv
cl9pbml0KCksIHlvdSBjb3VsZCBhZGQgInBhbmVsIG9yaWVudGF0aW9uIiBwcm9wZXJ0eQp3aXRo
IHZhbHVlIERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX1VOS05PV04sIHNvIGl0IHdvdWxkIG5v
dCBhZGQgbmV3Cm9iamVjdCB3aGVuIGdldCBtb2Rlcy4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+
ID4KPiA+IFsgICAgNC40ODA5NzZdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0t
LQo+ID4gWyAgICA0LjQ4NTYwM10gV0FSTklORzogQ1BVOiA1IFBJRDogMzY5IGF0IGRyaXZlcnMv
Z3B1L2RybS9kcm1fbW9kZV9vYmplY3QuYzo0NSBfX2RybV9tb2RlX29iamVjdF9hZGQrMHhiNC8w
eGJjCj4gPiA8c25pcD4KPiA+IFsgICAgNC42MDk3NzJdIENhbGwgdHJhY2U6Cj4gPiBbICAgIDQu
NjEyMjA4XSAgX19kcm1fbW9kZV9vYmplY3RfYWRkKzB4YjQvMHhiYwo+ID4gWyAgICA0LjYxNjQ2
Nl0gIGRybV9tb2RlX29iamVjdF9hZGQrMHgyMC8weDJjCj4gPiBbICAgIDQuNjIwNTUyXSAgZHJt
X3Byb3BlcnR5X2NyZWF0ZSsweGRjLzB4MTc0Cj4gPiBbICAgIDQuNjI0NzIzXSAgZHJtX3Byb3Bl
cnR5X2NyZWF0ZV9lbnVtKzB4MzQvMHg5OAo+ID4gWyAgICA0LjYyOTI0MV0gIGRybV9jb25uZWN0
b3Jfc2V0X3BhbmVsX29yaWVudGF0aW9uKzB4NjQvMHhhMAo+ID4gWyAgICA0LjYzNDcxNl0gIGJv
ZV9wYW5lbF9nZXRfbW9kZXMrMHg4OC8weGQ4Cj4gPiBbICAgIDQuNjM4ODAyXSAgZHJtX3BhbmVs
X2dldF9tb2RlcysweDJjLzB4NDgKPiA+IFsgICAgNC42NDI4ODddICBwYW5lbF9icmlkZ2VfZ2V0
X21vZGVzKzB4MWMvMHgyOAo+ID4gWyAgICA0LjY0NzIzM10gIGRybV9icmlkZ2VfY29ubmVjdG9y
X2dldF9tb2RlcysweGEwLzB4ZDQKPiA+IFsgICAgNC42NTIyNzNdICBkcm1faGVscGVyX3Byb2Jl
X3NpbmdsZV9jb25uZWN0b3JfbW9kZXMrMHgyMTgvMHg3MDAKPiA+IFsgICAgNC42NTgyNjZdICBk
cm1fbW9kZV9nZXRjb25uZWN0b3IrMHgxYjQvMHg0NWMKPiA+IFsgICAgNC42NjI2OTldICBkcm1f
aW9jdGxfa2VybmVsKzB4YWMvMHgxMjgKPiA+IFsgICAgNC42NjY2MTFdICBkcm1faW9jdGwrMHgy
NjgvMHg0MTAKPiA+IFsgICAgNC42NzAwMDJdICBkcm1fY29tcGF0X2lvY3RsKzB4ZGMvMHhmMAo+
ID4gWyAgICA0LjY3MzgyOV0gIF9fYXJtNjRfY29tcGF0X3N5c19pb2N0bCsweGM4LzB4MTAwCj4g
PiBbICAgIDQuNjc4NDM2XSAgZWwwX3N2Y19jb21tb24rMHhmNC8weDFjMAo+ID4gWyAgICA0LjY4
MjE3NF0gIGRvX2VsMF9zdmNfY29tcGF0KzB4MjgvMHgzYwo+ID4gWyAgICA0LjY4NjA4OF0gIGVs
MF9zdmNfY29tcGF0KzB4MTAvMHgxYwo+ID4gWyAgICA0LjY4OTczOF0gIGVsMF9zeW5jX2NvbXBh
dF9oYW5kbGVyKzB4YTgvMHhjYwo+ID4gWyAgICA0LjY5NDE3MV0gIGVsMF9zeW5jX2NvbXBhdCsw
eDE3OC8weDE4MAo+ID4gWyAgICA0LjY5ODA4Ml0gLS0tWyBlbmQgdHJhY2UgYjRmMmRiOWQ5Yzg4
NjEwYiBdLS0tCj4gPiBbICAgIDQuNzAyNzIxXSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0t
LS0tLS0tLS0KPiA+IFsgICAgNC43MDczMjldIFdBUk5JTkc6IENQVTogNSBQSUQ6IDM2OSBhdCBk
cml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfb2JqZWN0LmM6MjQzIGRybV9vYmplY3RfYXR0YWNoX3By
b3BlcnR5KzB4NDgvMHhiOAo+ID4gPHNuaXA+Cj4gPiBbICAgIDQuODMzODMwXSBDYWxsIHRyYWNl
Ogo+ID4gWyAgICA0LjgzNjI2Nl0gIGRybV9vYmplY3RfYXR0YWNoX3Byb3BlcnR5KzB4NDgvMHhi
OAo+ID4gWyAgICA0Ljg0MDk1OF0gIGRybV9jb25uZWN0b3Jfc2V0X3BhbmVsX29yaWVudGF0aW9u
KzB4ODQvMHhhMAo+ID4gWyAgICA0Ljg0NjQzMl0gIGJvZV9wYW5lbF9nZXRfbW9kZXMrMHg4OC8w
eGQ4Cj4gPiBbICAgIDQuODUwNTE2XSAgZHJtX3BhbmVsX2dldF9tb2RlcysweDJjLzB4NDgKPiA+
IFsgICAgNC44NTQ2MDBdICBwYW5lbF9icmlkZ2VfZ2V0X21vZGVzKzB4MWMvMHgyOAo+ID4gWyAg
ICA0Ljg1ODk0Nl0gIGRybV9icmlkZ2VfY29ubmVjdG9yX2dldF9tb2RlcysweGEwLzB4ZDQKPiA+
IFsgICAgNC44NjM5ODRdICBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMr
MHgyMTgvMHg3MDAKPiA+IFsgICAgNC44Njk5NzhdICBkcm1fbW9kZV9nZXRjb25uZWN0b3IrMHgx
YjQvMHg0NWMKPiA+IFsgICAgNC44NzQ0MTBdICBkcm1faW9jdGxfa2VybmVsKzB4YWMvMHgxMjgK
PiA+IFsgICAgNC44NzgzMjBdICBkcm1faW9jdGwrMHgyNjgvMHg0MTAKPiA+IFsgICAgNC44ODE3
MTFdICBkcm1fY29tcGF0X2lvY3RsKzB4ZGMvMHhmMAo+ID4gWyAgICA0Ljg4NTUzNl0gIF9fYXJt
NjRfY29tcGF0X3N5c19pb2N0bCsweGM4LzB4MTAwCj4gPiBbICAgIDQuODkwMTQyXSAgZWwwX3N2
Y19jb21tb24rMHhmNC8weDFjMAo+ID4gWyAgICA0Ljg5Mzg3OV0gIGRvX2VsMF9zdmNfY29tcGF0
KzB4MjgvMHgzYwo+ID4gWyAgICA0Ljg5Nzc5MV0gIGVsMF9zdmNfY29tcGF0KzB4MTAvMHgxYwo+
ID4gWyAgICA0LjkwMTQ0MV0gIGVsMF9zeW5jX2NvbXBhdF9oYW5kbGVyKzB4YTgvMHhjYwo+ID4g
WyAgICA0LjkwNTg3M10gIGVsMF9zeW5jX2NvbXBhdCsweDE3OC8weDE4MAo+ID4gWyAgICA0Ljkw
OTc4M10gLS0tWyBlbmQgdHJhY2UgYjRmMmRiOWQ5Yzg4NjEwYyBdLS0tCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgo+Cj4gcGluZyBvbiB0
aGUgdGhyZWFkLCB0aGFua3MuCj4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMgfCA5ICsrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiA+IGluZGV4IGFlNDAz
YzY3Y2JkOS4uNDVhNzAyZWUwOWYzIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kc2kuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYwo+ID4gQEAgLTIwNSw2ICsyMDUsNyBAQCBzdHJ1Y3QgbXRrX2RzaSB7Cj4gPiAgICAgICAg
IHUzMiBpcnFfZGF0YTsKPiA+ICAgICAgICAgd2FpdF9xdWV1ZV9oZWFkX3QgaXJxX3dhaXRfcXVl
dWU7Cj4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRhICpkcml2ZXJf
ZGF0YTsKPiA+ICsgICAgICAgZW51bSBkcm1fcGFuZWxfb3JpZW50YXRpb24gb3JpZW50YXRpb247
Cj4gPiAgfTsKPiA+Cj4gPiAgc3RhdGljIGlubGluZSBzdHJ1Y3QgbXRrX2RzaSAqYnJpZGdlX3Rv
X2RzaShzdHJ1Y3QgZHJtX2JyaWRnZSAqYikKPiA+IEBAIC05NjYsNiArOTY3LDggQEAgc3RhdGlj
IGludCBtdGtfZHNpX2VuY29kZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3Qg
bXRrX2RzaSAqZHNpKQo+ID4gICAgICAgICB9Cj4gPiAgICAgICAgIGRybV9jb25uZWN0b3JfYXR0
YWNoX2VuY29kZXIoZHNpLT5jb25uZWN0b3IsICZkc2ktPmVuY29kZXIpOwo+ID4KPiA+ICsgICAg
ICAgZHJtX2Nvbm5lY3Rvcl9zZXRfcGFuZWxfb3JpZW50YXRpb24oZHNpLT5jb25uZWN0b3IsIGRz
aS0+b3JpZW50YXRpb24pOwo+ID4gKwo+ID4gICAgICAgICByZXR1cm4gMDsKPiA+Cj4gPiAgZXJy
X2NsZWFudXBfZW5jb2RlcjoKPiA+IEBAIC0xMDI5LDYgKzEwMzIsMTIgQEAgc3RhdGljIGludCBt
dGtfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGRzaS0+bmV4dF9icmlkZ2UpOwo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgZ290byBlcnJfdW5yZWdpc3Rlcl9ob3N0Owo+ID4gICAgICAgICAg
ICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgICByZXQgPSBvZl9kcm1fZ2V0X3BhbmVs
X29yaWVudGF0aW9uKHBhbmVsLT5kZXYtPm9mX25vZGUsICZkc2ktPm9yaWVudGF0aW9uKTsKPiA+
ICsgICAgICAgICAgICAgICBpZiAocmV0KSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBk
ZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgcGFuZWwgb3JpZW50YXRpb24gJWRcbiIsIHJldCk7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKyAgICAgICAgICAg
ICAgIH0KPiA+ICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgZHNpLT5kcml2ZXJfZGF0YSA9IG9m
X2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwo+ID4gLS0KPiA+IDIuMzEuMS4yOTUuZzllYTQ1
YjYxYjgtZ29vZwo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
