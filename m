Return-Path: <SRS0=bt65=BM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20F9C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 23:47:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6E4B2070A
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 23:47:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FHK8QJZQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Go3oZucO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6E4B2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J5BYib9N45Nqaud0W3PfGA7Fn+aRGYLjlCAT1Wd0jqk=; b=FHK8QJZQx/7XoKV3q51hiKXqs
	6oSfyVaT7QQStA2yr9ky3xrV16t7Q19LUoTsiQC1IyGP5mzxJSHV9M9Wh8Hep5GBfhHgz6WHCfYWb
	nu4tKwzM7QlRiHpQw2Pj3Oo94w9VaQFW1NVhWQ4Lf7zSVX3uHf6NP1cW2rIbfzbrC/YaYHFBGniw1
	aWGvpzKl2EdZTRtfcWPF5UAvroFvDEL57SPRTYJG+71i6jJXH1zEaFHkpdGO83fAEJ/27lx9YAapp
	71KUrLAvQ0kcE+kxJbbPN3asqCYN6Z7ZW4ki3VRi6ifP0NVrLqSyiaHI4K92RJegP6e0nbcBsLiBW
	17uJiYnBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2NhI-0003my-R7; Sun, 02 Aug 2020 23:47:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2NhF-0003mM-4m; Sun, 02 Aug 2020 23:47:18 +0000
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC14020775;
 Sun,  2 Aug 2020 23:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596412036;
 bh=H6xs6d3dgK+96AhAZfXFX14NGYOEMH4Vnh+W+8vKrRM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Go3oZucOiO54h/ogekRM80Sp6VSziLs3eP9hpBKzaoXCRzDt5X8V8XwrpcS5cCeoH
 I32EKp/7kD3dH3qHpDNM36VNPXgKoG/gFmCz/csInD7ME+fqmTuv3AIOP1JbbOoWtY
 71M4qKXrXezwCgl60zBpaVuOzs3gIqzLU0BILPlk=
Received: by mail-ej1-f42.google.com with SMTP id jp10so10226442ejb.0;
 Sun, 02 Aug 2020 16:47:15 -0700 (PDT)
X-Gm-Message-State: AOAM531fPgMxvjdYPTuS09JqXBfA2AT27nRZ+qxL53+Jtf5XrBMc3Z82
 sE4j/DU2V5nTJ/Io73aPK/J6DLxOS18MxR4AmA==
X-Google-Smtp-Source: ABdhPJyL2FRZjVaVXf05r+Yl7rsuKM/lyGziOQXjYfTFU+c3+d5hQt1lqNUv6jMUYMcrdqrwKRXBJ0KXCVGRZuVao9A=
X-Received: by 2002:a17:906:60d5:: with SMTP id
 f21mr663711ejk.94.1596412034498; 
 Sun, 02 Aug 2020 16:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-2-frank-w@public-files.de>
 <CAAOTY_8nm0KDHFzOX9+qTTHOUd0Vik063J+rScu_y-hTBTkrCQ@mail.gmail.com>
 <trinity-2bdb3521-256a-4d4d-928a-be9b8c179d4c-1596355539029@3c-app-gmx-bs58>
In-Reply-To: <trinity-2bdb3521-256a-4d4d-928a-be9b8c179d4c-1596355539029@3c-app-gmx-bs58>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Aug 2020 07:47:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY__TsqrfRX-z+DE0+X_UzxBqChJ+VdyQG6z9N6Qr4bn2Kg@mail.gmail.com>
Message-ID: <CAAOTY__TsqrfRX-z+DE0+X_UzxBqChJ+VdyQG6z9N6Qr4bn2Kg@mail.gmail.com>
Subject: Re: Re: [PATCH v2 1/5] drm/mediatek: config component output by
 device node port
To: Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_194717_347407_B4C8C187 
X-CRM114-Status: GOOD (  19.52  )
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
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaW
vCAyMDIw5bm0OOaciDLml6Ug6YCx5pelIOS4i+WNiDQ6MDblr6vpgZPvvJoKPgo+ID4gR2VzZW5k
ZXQ6IFNvbm50YWcsIDAyLiBBdWd1c3QgMjAyMCB1bSAwMjowMyBVaHIKPiA+IFZvbjogIkNodW4t
S3VhbmcgSHUiIDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiA+IEFuOiAiRnJhbmsgV3VuZGVy
bGljaCIgPGZyYW5rLXdAcHVibGljLWZpbGVzLmRlPgo+ID4gQ2M6ICJDaHVuLUt1YW5nIEh1IiA8
Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+LCAiUGhpbGlwcCBaYWJlbCIgPHAuemFiZWxAcGVuZ3V0
cm9uaXguZGU+LCAiRGF2aWQgQWlybGllIiA8YWlybGllZEBsaW51eC5pZT4sICJsaW51eC1rZXJu
ZWwiIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiwgIkRSSSBEZXZlbG9wbWVudCIgPGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+LCAibW9kZXJhdGVkIGxpc3Q6QVJNL01lZGlh
dGVrIFNvQyBzdXBwb3J0IiA8bGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJE
YW5pZWwgVmV0dGVyIiA8ZGFuaWVsQGZmd2xsLmNoPiwgIk1hdHRoaWFzIEJydWdnZXIiIDxtYXR0
aGlhcy5iZ2dAZ21haWwuY29tPiwgIkJpYmJ5IEhzaWVoIiA8YmliYnkuaHNpZWhAbWVkaWF0ZWsu
Y29tPiwgIkxpbnV4IEFSTSIgPGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4K
PiA+IEJldHJlZmY6IFJlOiBbUEFUQ0ggdjIgMS81XSBkcm0vbWVkaWF0ZWs6IGNvbmZpZyBjb21w
b25lbnQgb3V0cHV0IGJ5IGRldmljZSBub2RlIHBvcnQKPiA+ID4gKwo+ID4gPiArICAgICAgICAg
ICAgICAgaWYgKGNvbXBfdHlwZSAhPSBNVEtfRFNJICYmIGNvbXBfdHlwZSAhPSBNVEtfRFBJKSB7
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBvcnQgPSBvZl9ncmFwaF9nZXRfcG9ydF9i
eV9pZChub2RlLCAwKTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFwb3J0KQo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBlcCA9IG9mX2dldF9jaGlsZF9ieV9uYW1lKHBvcnQsICJlbmRw
b2ludCIpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChwb3J0KTsK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFlcCkKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmVtb3RlID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9wb3J0X3BhcmVudChlcCk7Cj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KGVwKTsKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKCFyZW1vdGUpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29udGludWU7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIG9mX2lkID0gb2Zf
bWF0Y2hfbm9kZShtdGtfZGRwX2NvbXBfZHRfaWRzLCByZW1vdGUpOwo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoIW9mX2lkKQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wX3R5cGUg
PSAoZW51bSBtdGtfZGRwX2NvbXBfdHlwZSlvZl9pZC0+ZGF0YTsKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IHByaXZhdGUtPmRhdGEtPm1haW5fbGVuIC0gMTsg
aSsrKQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChwcml2YXRlLT5k
YXRhLT5tYWluX3BhdGhbaV0gPT0gY29tcF9pZCkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHByaXZhdGUtPmRhdGEtPm1haW5fcGF0aFtpICsgMV0gPQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXRrX2RkcF9jb21wX2dl
dF9pZChub2RlLCBjb21wX3R5cGUpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBmb3Ig
KGkgPSAwOyBpIDwgcHJpdmF0ZS0+ZGF0YS0+ZXh0X2xlbiAtIDE7IGkrKykKPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocHJpdmF0ZS0+ZGF0YS0+ZXh0X3BhdGhbaV0g
PT0gY29tcF9pZCkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHByaXZhdGUtPmRhdGEtPmV4dF9wYXRoW2kgKyAxXSA9Cj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBtdGtfZGRwX2NvbXBfZ2V0X2lkKG5vZGUsIGNvbXBfdHlw
ZSk7Cj4gPiA+ICsgICAgICAgICAgICAgICB9Cj4gPgo+ID4gVGhlIHBvcnQgcHJvcGVydHkgaXMg
bm90IGRlZmluZWQgaW4gYmluZGluZyBkb2N1bWVudCBbMV0sIHNvIGRlZmluZSBpdAo+ID4gaW4g
YmluZGluZyBkb2N1bWVudCBmaXJzdC4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlz
cC50eHQ/aD12NS44LXJjNwo+Cj4gaGksCj4gd291bGQgYmUgdGhlIGZvbGxvd2luZyBlbm91Z2gg
Zm9yIGRlc2NyaWJpbmcgdGhlIHBvcnRzPwo+Cj4gUG9ydCBiaW5kaW5nCj4gPT09PT09PT09PT09
PQo+Cj4gc29tZSBub2RlcyBsaWtlCj4KPiAtIGNvbm5lY3RvciAoZS5nLiBoZG1pLWNvbm5lY3Rv
cikKPiAtIGJscyAobWVkaWF0ZWssbXQ3NjIzLWRpc3AtcHdtKQo+IC0gaGRtaXggKG1lZGlhdGVr
LG10NzYyMy1oZG1pKQoKTm93IEkganVzdCBjYXJlIGFib3V0IHRoZSBibHMgdG8gZHBpLiBTbyBp
biBtZWRpYXRlayxkaXNwLnR4dCwgeW91Cmp1c3QgbmVlZCB0byBhZGQgYSBPcHRpb25hbCBwcm9w
ZXJ0aWVzIC0gcG9ydCAoaW5wdXQgYW5kIG91dHB1dCksIGFuZAptb2RpZnkgbWVkaWF0ZWssZHBp
LnR4dCBmb3IgaXRzIGlucHV0IHBvcnQuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IGNhbiBo
YXZlIHBvcnQgYmluZGluZ3MgdG8gY29ubmVjdCBlYWNoIG90aGVyLiBFYWNoIHBvcnQgY2FuIGhh
dmUgb25seSAxIGVuZHBvaW50Cj4KPiBtb3JlIGRldGFpbCBhYm91dCBwb3J0cy9lbmRwb2ludHMg
aW4gLi4vLi4vbWVkaWEvdmlkZW8taW50ZXJmYWNlcy50eHQKPiBoZG1pLWNvbm5lY3RvciBpcyBk
ZXNjcmliZWQgaGVyZTogLi4vY29ubmVjdG9yL2hkbWktY29ubmVjdG9yLnR4dAo+Cj4gZXhhbXBs
ZToKPgo+IGNvbm5lY3RvciB7Cj4gICAgICAgICBjb21wYXRpYmxlID0gImhkbWktY29ubmVjdG9y
IjsKPgo+ICAgICAgICAgcG9ydCB7Cj4gICAgICAgICAgICAgICAgIGhkbWlfY29ubmVjdG9yX2lu
OiBlbmRwb2ludCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0g
PCZoZG1pMF9vdXQ+Owo+ICAgICAgICAgICAgICAgICB9Owo+ICAgICAgICAgfTsKPiB9Owo+Cj4K
PiAmYmxzIHsKPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPgo+ICAgICAgICAgcG9ydCB7Cj4g
ICAgICAgICAgICAgICAgIGJsc19vdXQ6IGVuZHBvaW50IHsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRwaTBfaW4+Owo+ICAgICAgICAgICAgICAgICB9Owo+
ICAgICAgICAgfTsKPiB9Owo+Cj4gJmRwaTAgewo+ICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+
Cj4gICAgICAgICBwb3J0cyB7Cj4gICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
Owo+ICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiAgICAgICAgICAgICAgICAg
cG9ydEAwIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MD47Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgZHBpMF9vdXQ6IGVuZHBvaW50IHsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmaGRtaTBfaW4+Owo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIH07Cj4gICAgICAgICAgICAgICAgIH07Cj4KPiAgICAgICAgICAgICAgICAg
cG9ydEAxIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MT47Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgZHBpMF9pbjogZW5kcG9pbnQgewo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZibHNfb3V0PjsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICB9Owo+ICAgICAgICAgICAgICAgICB9Owo+ICAgICAgICAgfTsKPiB9Owo+Cj4g
JmhkbWkwIHsKPgo+ICAgICAgICAgcG9ydHMgewo+ICAgICAgICAgICAgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKPiAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gICAgICAg
ICAgICAgICAgIHBvcnRAMCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+Owo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGhkbWkwX2luOiBlbmRwb2ludCB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRwaTBfb3V0PjsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICB9Owo+ICAgICAgICAgICAgICAgICB9Owo+Cj4gICAgICAg
ICAgICAgICAgIHBvcnRAMSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDE+Owo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGhkbWkwX291dDogZW5kcG9pbnQgewo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pX2Nvbm5lY3Rv
cl9pbj47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfTsKPiAgICAgICAgICAgICAgICAgfTsK
PiAgICAgICAgIH07Cj4gfTsKPgo+IHJlZ2FyZHMgRnJhbmsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
