Return-Path: <SRS0=MkRU=6K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE00C55191
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Apr 2020 08:21:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E3E62070A
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Apr 2020 08:21:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cFx7wxVQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0tLZar1Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E3E62070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Wxt4QOtgHWciYlNblvt6DStDZJRSBqyunrbWk0ToOs=; b=cFx7wxVQMg87Qx
	/8sCwK6BLge8zrOQ0H9X+D22vDoQOok6x4xUT1fxyqBNouEeeWL/RgCeO4iFNLxOiEQ3StxMAMucx
	Lpd/WcC7reZ4IUH40PRjV+Gy3zmHo97Q5Lvhl3G3nJkIVTjESkoIlWmE7zwegp2XyD5WxSxMWLAm3
	gkvbM7u7WL0ca0yAcmgtTHhWTq+To/Yi5+wl9D0iRKq5U8F83wu+2XcyIHLQB9tPjn3ZpTh7iMRcY
	mdL60yefVfkLxGTm1/bsHZXCiKOKHroxBFybEa2LeO4FyYiFag3uEZB3rg2zMazxBxe8eOlzwKH45
	6OHfxCvNSdT+Uxuxg17A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jScXS-0007Qu-3k; Sun, 26 Apr 2020 08:21:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jScX0-0006vR-AP; Sun, 26 Apr 2020 08:20:55 +0000
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2011F21841;
 Sun, 26 Apr 2020 08:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587889253;
 bh=32JPrJrGuDRD2wkuFtj2MYt27oiR4LTyT2PFdhPaclQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0tLZar1QUA+vvcNySsyW0rfaxWr2woQV7fXM/l6uVDEwEdBMdtgw//+P20sNglhU3
 iyD7SKLm3Iz9jffpJMcaScYEERBIum/EprF3MM1+3GfpD5aXy7yoPfl3eygBsfKVpA
 XSP2CPssF5zHqiaYcKY2fqCuFWxFRkkcTZMUh+mk=
Received: by mail-ej1-f54.google.com with SMTP id re23so11410521ejb.4;
 Sun, 26 Apr 2020 01:20:53 -0700 (PDT)
X-Gm-Message-State: AGi0PubSBVr+i60f5rX3xmVW9zE/QKO52msnJvdudFk7QyIkafhY1sm9
 guBT3uKq/cwrriRXn9N3VqJZwucQPZlt8qWohA==
X-Google-Smtp-Source: APiQypIeMlhVPVvjZ/EzBhYNkJSsKB75b0ue/XkSPqE14oZvx51BpCqy/qg7FEkcuFRxAPFavqIR3TDtbcx1mHFl0LQ=
X-Received: by 2002:a17:906:eb90:: with SMTP id
 mh16mr14806818ejb.201.1587889251405; 
 Sun, 26 Apr 2020 01:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200420135045.27984-1-yuehaibing@huawei.com>
In-Reply-To: <20200420135045.27984-1-yuehaibing@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 26 Apr 2020 16:20:39 +0800
X-Gmail-Original-Message-ID: <CAAOTY__km=QZQACp8g-Qr+aWZ4r0Yp7O5j7u8ZTpDpTXXfUdNw@mail.gmail.com>
Message-ID: <CAAOTY__km=QZQACp8g-Qr+aWZ4r0Yp7O5j7u8ZTpDpTXXfUdNw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mediatek: Fix Kconfig warning
To: YueHaibing <yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200426_012054_389328_39C0FE1A 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFl1ZUhhaWJpbmc6CgpZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+IOaWvCAy
MDIw5bm0NOaciDIw5pelIOmAseS4gCDkuIvljYgxMDowNOWvq+mBk++8mgo+Cj4gV0FSTklORzog
dW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgTVRLX01NU1lTCj4gICBEZXBl
bmRzIG9uIFtuXTogKEFSQ0hfTUVESUFURUsgWz15XSB8fCBDT01QSUxFX1RFU1QgWz1uXSkgJiYg
Q09NTU9OX0NMS19NVDgxNzNfTU1TWVMgWz1uXQo+ICAgU2VsZWN0ZWQgYnkgW3ldOgo+ICAgLSBE
Uk1fTUVESUFURUsgWz15XSAmJiBIQVNfSU9NRU0gWz15XSAmJiBEUk0gWz15XSAmJiAoQVJDSF9N
RURJQVRFSyBbPXldIHx8IEFSTSAmJiBDT01QSUxFX1RFU1QgWz1uXSkgJiYgQ09NTU9OX0NMSyBb
PXldICYmIEhBVkVfQVJNX1NNQ0NDIFs9eV0gJiYgT0YgWz15XQo+Cj4gQWRkIG1pc3NpbmcgZGVw
ZW5kY3kgQ09NTU9OX0NMS19NVDgxNzNfTU1TWVMgdG8gZml4IHRoaXMuCgpGcm9tIHRoZSBjb2Rl
IHJlbGF0aW9uc2hpcCwgbWVkaWF0ZWsgZHJtIGhhcyByZWxhdGlvbiB3aXRoIG1lZGlhdGVrCm1t
c3lzLCBhbmQgbWVkaWF0ZWsgbW1zeXMgaGFzIHJlbGF0aW9uIHdpdGggbWVkYWl0ZWsgY2xvY2su
ClNvIEkgdGhpbmsgaXQncyBiZXR0ZXIgdGhhdCBDT05GSUdfTVRLX01NU1lTIHNlbGVjdApDT05G
SUdfQ09NTU9OX0NMS19NVDgxNzNfTU1TWVMuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IEZp
eGVzOiAyYzc1OGUzMDFlZDkgKCJzb2MgLyBkcm06IG1lZGlhdGVrOiBNb3ZlIHJvdXRpbmcgY29u
dHJvbCB0byBtbXN5cyBkZXZpY2UiKQo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhh
aWJpbmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25m
aWcgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvS2NvbmZpZwo+IGluZGV4IGM0MjBmNWEzZDMzYi4uNGQ5YjU1NDBkZTY4IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL0tjb25maWcKPiBAQCAtNiw2ICs2LDcgQEAgY29uZmlnIERSTV9NRURJ
QVRFSwo+ICAgICAgICAgZGVwZW5kcyBvbiBDT01NT05fQ0xLCj4gICAgICAgICBkZXBlbmRzIG9u
IEhBVkVfQVJNX1NNQ0NDCj4gICAgICAgICBkZXBlbmRzIG9uIE9GCj4gKyAgICAgICBkZXBlbmRz
IG9uIENPTU1PTl9DTEtfTVQ4MTczX01NU1lTCj4gICAgICAgICBzZWxlY3QgRFJNX0dFTV9DTUFf
SEVMUEVSCj4gICAgICAgICBzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiAgICAgICAgIHNlbGVjdCBE
Uk1fTUlQSV9EU0kKPiAtLQo+IDIuMTcuMQo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
