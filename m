Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED25EC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 23:13:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F9A823A54
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 23:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F9A823A54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YhaU3TsJLrThm7DKLHxTObbPANyIvuzZaItfHBcBDeo=; b=PK8ToQh+nPX4Tav67d90lRdmI
	ehETVsOpVyDUKzOTjlu45ZZLT6871rev1j1VTkhO+ERsi47Jddv7nSNvX3s6RnzO6n/XAB2wAWNfQ
	ZeG0H17vkZYvkDeqK38Zy1RKq/RI/VDh9x0JRDzVhEcye8AwMuCDgwqZi83mm/GiAPsbEFj+8D07K
	a0Un1SXDDnmDwVA5ixQSz+INeqsgsQOrZlDfv00ZNKo0RmTuvUdKvNISYkN7tWiVLen55WpC3D9Rv
	lzBBR5qRl0RZxnCgcODFjyoLnIOVtm72FxNYUt8SA2jrbwsnaGc7HkW+24kN/mMRQ5OHOcXiVcLGc
	tB41QVOdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2j8o-0001sk-7j; Thu, 21 Jan 2021 23:13:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2j8j-0001rP-WE; Thu, 21 Jan 2021 23:13:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0F1923A62;
 Thu, 21 Jan 2021 23:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611270801;
 bh=L82o30HXnB+r+O8K3ReoPbDoDul/+56tBIA0cVJ1k7o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HTOCdCskXbs2ygNkKPsG2P/cbDyJwdctxQKe61LEcLxV9yAgYlXmUGknc9aMA733k
 lFEVo5RGDpfHMyCrPK8I4zIkWz8gqhp1sKdmpaC0oCoT0dSpVk2cZQ6IWum8IpG2O1
 Nuf8grls9siIib7NylYx48OvFGZjNapsm4txfvJPNmzqwpc0oXR93FmZqr473CHDQT
 xf+WWTZ3xWTpw9RPiTmsUbc8zOvpLw9KqwE+apkX6ydfRTvzJgoE3aSdxHssYc8A6G
 eOEgBtgfD86bUveAE0nqHDzF6kE6UyAcK80EnXsuA1an5FihgZ+557zMS+EOuTVmj3
 WvX5rUauXdLmA==
Received: by mail-ej1-f44.google.com with SMTP id ke15so4997611ejc.12;
 Thu, 21 Jan 2021 15:13:20 -0800 (PST)
X-Gm-Message-State: AOAM532nq3Y32D02vtfTxuVhU8MkyGc00JjZHfJDOd0Kl+R/WQcDWbIS
 O6h6UjmfmJ4Sl016igfc28C91O3IADvU0+C+Vg==
X-Google-Smtp-Source: ABdhPJzG4Ks7WM5fSRNcwNtoBMUhfREE7+DUgbVC917IPz+USYGjYtUsbnVlrkK0juN38OIES4PmwqHxTUNKY+mA6hY=
X-Received: by 2002:a17:906:ada:: with SMTP id
 z26mr1169169ejf.127.1611270799319; 
 Thu, 21 Jan 2021 15:13:19 -0800 (PST)
MIME-Version: 1.0
References: <20210106231729.17173-1-chunkuang.hu@kernel.org>
 <20210106231729.17173-4-chunkuang.hu@kernel.org>
 <YAh2JGUUpMcgyke0@ziggy.stardust>
 <CAAOTY_82Z_DQuJWDD5NMeq35o2Tf-zQzmSxJwRYRRpHQJVHNEA@mail.gmail.com>
 <YAk4722oCzcegGdx@ziggy.stardust>
In-Reply-To: <YAk4722oCzcegGdx@ziggy.stardust>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 22 Jan 2021 07:13:06 +0800
X-Gmail-Original-Message-ID: <CAAOTY__S2WMO9sUOP4NaObCdvtRNdLNe3VHrE2RbgHBM-gYosw@mail.gmail.com>
Message-ID: <CAAOTY__S2WMO9sUOP4NaObCdvtRNdLNe3VHrE2RbgHBM-gYosw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/mediatek: Change disp/ddp term to mutex in mtk
 mutex driver
To: Matthias Brugger <matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_181322_177800_CF2E225D 
X-CRM114-Status: GOOD (  25.34  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0Meac
iDIx5pelIOmAseWbmyDkuIvljYg0OjE55a+r6YGT77yaCj4KPiBPbiBUaHUsIEphbiAyMSwgMjAy
MSBhdCAwNzo0Njo0NEFNICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gSGksIE1hdHRo
aWFzOgo+ID4KPiA+IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnPiDm
lrwgMjAyMeW5tDHmnIgyMeaXpSDpgLHlm5sg5LiK5Y2IMjoyN+Wvq+mBk++8mgo+ID4gPgo+ID4g
PiBPbiBUaHUsIEphbiAwNywgMjAyMSBhdCAwNzoxNzoyN0FNICswODAwLCBDaHVuLUt1YW5nIEh1
IHdyb3RlOgo+ID4gPiA+IEZyb206IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gPiA+ID4K
PiA+ID4gPiBtdGsgbXV0ZXggaXMgdXNlZCBieSBib3RoIGRybSBhbmQgbWRwIGRyaXZlciwgc28g
Y2hhbmdlIGRpc3AvZGRwIHRlcm0gdG8KPiA+ID4gPiBtdXRleCB0byBzaG93IHRoYXQgaXQncyBh
IGNvbW1vbiBkcml2ZXIgZm9yIGRybSBhbmQgbWRwLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBD
aHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4g
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIHwgIDMwICstLQo+ID4g
PiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgfCAgIDIgKy0KPiA+
ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmggIHwgICAyICstCj4g
PiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXV0ZXguYyAgICB8IDMwNSArKysr
KysrKysrKystLS0tLS0tLS0tLS0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19tdXRleC5oICAgIHwgIDI2ICstCj4gPiA+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTgyIGluc2Vy
dGlvbnMoKyksIDE4MyBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiBbLi4uXQo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX211dGV4LmMgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX211dGV4LmMKPiA+ID4gPiBpbmRleCAxYzhhMjUzZjQ3ODgu
Ljk4YTA2MGJmMjI1ZCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX211dGV4LmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X211dGV4LmMKPiA+ID4gWy4uLl0KPiA+ID4gPgo+ID4gPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBkZHBfZHJpdmVyX2R0X21hdGNoW10gPSB7Cj4gPiA+ID4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG11dGV4X2RyaXZlcl9kdF9tYXRjaFtdID0gewo+ID4g
PiA+ICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLWRpc3AtbXV0ZXgiLAo+
ID4gPiA+IC0gICAgICAgLmRhdGEgPSAmbXQyNzAxX2RkcF9kcml2ZXJfZGF0YX0sCj4gPiA+ID4g
KyAgICAgICAuZGF0YSA9ICZtdDI3MDFfbXV0ZXhfZHJpdmVyX2RhdGF9LAo+ID4gPiA+ICAgICAg
IHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzEyLWRpc3AtbXV0ZXgiLAo+ID4gPiA+IC0g
ICAgICAgLmRhdGEgPSAmbXQyNzEyX2RkcF9kcml2ZXJfZGF0YX0sCj4gPiA+ID4gKyAgICAgICAu
ZGF0YSA9ICZtdDI3MTJfbXV0ZXhfZHJpdmVyX2RhdGF9LAo+ID4gPiA+ICAgICAgIHsgLmNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3LWRpc3AtbXV0ZXgiLAo+ID4gPiA+IC0gICAgICAgLmRh
dGEgPSAmbXQ4MTY3X2RkcF9kcml2ZXJfZGF0YX0sCj4gPiA+ID4gKyAgICAgICAuZGF0YSA9ICZt
dDgxNjdfbXV0ZXhfZHJpdmVyX2RhdGF9LAo+ID4gPiA+ICAgICAgIHsgLmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ4MTczLWRpc3AtbXV0ZXgiLAo+ID4gPiA+IC0gICAgICAgLmRhdGEgPSAmbXQ4
MTczX2RkcF9kcml2ZXJfZGF0YX0sCj4gPiA+ID4gKyAgICAgICAuZGF0YSA9ICZtdDgxNzNfbXV0
ZXhfZHJpdmVyX2RhdGF9LAo+ID4gPiA+ICAgICAgIHt9LAo+ID4gPiA+ICB9Owo+ID4gPiA+IC1N
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkZHBfZHJpdmVyX2R0X21hdGNoKTsKPiA+ID4gPiArTU9E
VUxFX0RFVklDRV9UQUJMRShvZiwgbXV0ZXhfZHJpdmVyX2R0X21hdGNoKTsKPiA+ID4KPiA+ID4g
SSB0aGluayBpdCB3b3VsZCBtYWtlIHNlbnNlIGluIGEgZm9sbG93LXVwIHBhdGNoIHRvIHVwZGF0
ZSB0aGUgYmluZGluZwo+ID4gPiB0byB1c2UgIm1lZGlhdGVrLG10MjcwMS1tdXRleCIgdG8gcmVm
bGVjdCB0aGF0IG11dGV4IGlzIHVzZWQgZm9yIGRybSBhbmQKPiA+ID4gbWRwIGRyaXZlci4gTWFr
ZSBzZW5zZT8KPiA+Cj4gPiBZZXMsIGl0IG1ha2Ugc2Vuc2UuIEkgd291bGQgdHJ5IHRvIHVwZGF0
ZSB0aGUgYmluZGluZywgYnV0IEkgd29uZGVyCj4gPiBkZXZpY2UgdHJlZSBzaG91bGQgYmUgYmFj
a3dhcmQgY29tcGF0aWJsZT8gTGV0J3MgZGlzY3VzcyBpbiB0aGF0Cj4gPiBmb2xsb3ctdXAgcGF0
Y2hlcy4KPiA+Cj4KPiBGcm9tIG15IHVuZGVyc3RhbmRpbmcsIHdlIHdpbGwgbmVlZCB0byBrZWVw
IHRoZSBvZl9kZXZpY2VfaWQgZW50cmllcyBmb3IKPiB0aGUgb2xkIGJpbmRpbmcgaW4gdGhlIGRy
aXZlciAoc28gdGhhdCBvbGQgRFRzIHN0aWxsIHdvcmspIHdoaWxlIHdlCj4gc2hvdWxkIGVuZm9y
Y2UgdGhlIG5ldyBiaW5kaW5nLiBJJ20gbm90IHN1cmUgaWYgdGhlIHlhbWwgaGFzIGEgb3B0aW9u
Cj4gZm9yIG91dC1vZi1kYXRlIGNvbXBhdGlibGVzLgoKT0ssIEkgd291bGQgZG8gaXQgc28gYW5k
IHJlbW92ZSBvdXQtZi1kYXRlIGNvbXBhdGlibGVzIGluIHlhbWwgYXQKZmlyc3QgdG8gc2VlIGFu
eSBmZWVkYmFjay4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gUmVnYXJkcywKPiBNYXR0aGlh
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
