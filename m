Return-Path: <SRS0=8Gmr=6M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F9EC83000
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 14:56:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACF09206D9
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 14:56:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OacR6YS/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="BZjH9ieY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACF09206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMI9ElnNLvnAfp5ct+CKcqyZfdZVWmRvW31KDASYlZI=; b=OacR6YS/gBgLW5
	pXp2eOew5lPFT0rk32k6mpD9Wy8iQHZxpmfX2N9dYQOyNX8eZCWd/+WVkKpo4FLe73k5NX0P7mpKL
	Midipm2N1hyDo+8UIZiExhWwsvbkSTB3HZQME027xixFkWlzpl2aBHwfUIGU6muUUL1Au7FOF+ziH
	MELv8nxh6clnNRQ++Hz5bYgDYkxjhpY6Wd2ARdiEzShomdgnx6c7iLYQN0ueF4+B7+x2K6jg0BYHi
	KxSfkRq+4nO/F83klTXOrZX5/IL4wziRlTM2vBqCAjFhoTw8luuGhFWRbUx91OoRs76XF5gj7a1SK
	pC239r9bpCirFjluk3JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTReZ-00019J-I9; Tue, 28 Apr 2020 14:56:07 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTRdg-0007cw-8C
 for linux-mediatek@lists.infradead.org; Tue, 28 Apr 2020 14:55:16 +0000
Received: by mail-wm1-x344.google.com with SMTP id v4so2562157wme.1
 for <linux-mediatek@lists.infradead.org>; Tue, 28 Apr 2020 07:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=6jFGKnF82v8suNis8fMuokycBjbhGzKZuUKxIPnz6aU=;
 b=BZjH9ieYve/gpLatbRDZvJ5mYMgq6YUzTeqo/oWKI+CvmthCFiA2MHvBErEm7R56zX
 yGznMbgkGKeZ+H/WGkmuaje2vBjRkQceSGF3pHEBbC5mX9V583N7EswiLWe5KsmKjLY1
 7ME8A6V8IBT7cX79iEnfogPbJkUN3SvScH9Gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=6jFGKnF82v8suNis8fMuokycBjbhGzKZuUKxIPnz6aU=;
 b=h1S0Wj2/iFfKjkIq3cDscMkodTxydT5meckIV/i3giqx2f/wZiu9WqsQkr1uRmgUaZ
 TFNMJ2YL21KTeHZdGn9Xa7yEwZt64ckDsbPmYlY3pHKMVfBkPlL1eO2Z6tHImWVEufsc
 L9qQ/BcbzBrYpO1JYj057ZBIWkWrcWXxc7lR1YxeuSSUZ4unJYw6rPknr5VILNPz+atK
 mHNYDenY7o+7QoO+iZCQHzx7a815xiLigFp4e0y5PtPhheFnmQ8A0qUx+MqWJ8z+N/dy
 j3ULzWtZHJRlmor2G8iWKMqo3NGBy3Kkaw9tw/ZhODgmESDyA1rPfd3FF1kltWAFRm3F
 2w1Q==
X-Gm-Message-State: AGi0Pua9TKRKL88Iu+JKGPTCiemiLnhmr0tPvCO/FVrInscCr+wcpDyE
 1oSTD3hpfNY5lR3XQ2E6KDxd/Q==
X-Google-Smtp-Source: APiQypLVWUTBQ/2GQLWlB4vZEl5cImSOrQr/pNFn43Y9nr0LlTg+bI/kjjQbJ752mXJz4e4Gw8vG/Q==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr4825208wmj.169.1588085709816; 
 Tue, 28 Apr 2020 07:55:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p190sm3680671wmp.38.2020.04.28.07.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 07:55:09 -0700 (PDT)
Date: Tue, 28 Apr 2020 16:55:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH -next] drm/mediatek: Fix Kconfig warning
Message-ID: <20200428145507.GQ3456981@phenom.ffwll.local>
Mail-Followup-To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
References: <20200420135045.27984-1-yuehaibing@huawei.com>
 <CAAOTY__km=QZQACp8g-Qr+aWZ4r0Yp7O5j7u8ZTpDpTXXfUdNw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAOTY__km=QZQACp8g-Qr+aWZ4r0Yp7O5j7u8ZTpDpTXXfUdNw@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_075512_532544_7DF002AF 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 YueHaibing <yuehaibing@huawei.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBBcHIgMjYsIDIwMjAgYXQgMDQ6MjA6MzlQTSArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3
cm90ZToKPiBIaSwgWXVlSGFpYmluZzoKPiAKPiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdl
aS5jb20+IOaWvCAyMDIw5bm0NOaciDIw5pelIOmAseS4gCDkuIvljYgxMDowNOWvq+mBk++8mgo+
ID4KPiA+IFdBUk5JTkc6IHVubWV0IGRpcmVjdCBkZXBlbmRlbmNpZXMgZGV0ZWN0ZWQgZm9yIE1U
S19NTVNZUwo+ID4gICBEZXBlbmRzIG9uIFtuXTogKEFSQ0hfTUVESUFURUsgWz15XSB8fCBDT01Q
SUxFX1RFU1QgWz1uXSkgJiYgQ09NTU9OX0NMS19NVDgxNzNfTU1TWVMgWz1uXQo+ID4gICBTZWxl
Y3RlZCBieSBbeV06Cj4gPiAgIC0gRFJNX01FRElBVEVLIFs9eV0gJiYgSEFTX0lPTUVNIFs9eV0g
JiYgRFJNIFs9eV0gJiYgKEFSQ0hfTUVESUFURUsgWz15XSB8fCBBUk0gJiYgQ09NUElMRV9URVNU
IFs9bl0pICYmIENPTU1PTl9DTEsgWz15XSAmJiBIQVZFX0FSTV9TTUNDQyBbPXldICYmIE9GIFs9
eV0KPiA+Cj4gPiBBZGQgbWlzc2luZyBkZXBlbmRjeSBDT01NT05fQ0xLX01UODE3M19NTVNZUyB0
byBmaXggdGhpcy4KPiAKPiBGcm9tIHRoZSBjb2RlIHJlbGF0aW9uc2hpcCwgbWVkaWF0ZWsgZHJt
IGhhcyByZWxhdGlvbiB3aXRoIG1lZGlhdGVrCj4gbW1zeXMsIGFuZCBtZWRpYXRlayBtbXN5cyBo
YXMgcmVsYXRpb24gd2l0aCBtZWRhaXRlayBjbG9jay4KPiBTbyBJIHRoaW5rIGl0J3MgYmV0dGVy
IHRoYXQgQ09ORklHX01US19NTVNZUyBzZWxlY3QKPiBDT05GSUdfQ09NTU9OX0NMS19NVDgxNzNf
TU1TWVMuCgpzZWxlY3QgaXMgdmVyeSBzdHJvbmdseSBkaXNjb3VyYWdlZCBhbmQgc2hvdWxkIG9u
bHkgYmUgdXNlZCBmb3IgS2NvbmZpZwpzeW1ib2xzIG5vdCB2aXNpYmxlIHRvIHVzZXJzLgotRGFu
aWVsCgo+IAo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPiAKPiA+Cj4gPiBGaXhlczogMmM3NThl
MzAxZWQ5ICgic29jIC8gZHJtOiBtZWRpYXRlazogTW92ZSByb3V0aW5nIGNvbnRyb2wgdG8gbW1z
eXMgZGV2aWNlIikKPiA+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVh
d2VpLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnIHwg
MSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL0tjb25maWcKPiA+IGluZGV4IGM0MjBmNWEzZDMzYi4uNGQ5YjU1NDBkZTY4IDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcKPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnCj4gPiBAQCAtNiw2ICs2LDcgQEAgY29uZmln
IERSTV9NRURJQVRFSwo+ID4gICAgICAgICBkZXBlbmRzIG9uIENPTU1PTl9DTEsKPiA+ICAgICAg
ICAgZGVwZW5kcyBvbiBIQVZFX0FSTV9TTUNDQwo+ID4gICAgICAgICBkZXBlbmRzIG9uIE9GCj4g
PiArICAgICAgIGRlcGVuZHMgb24gQ09NTU9OX0NMS19NVDgxNzNfTU1TWVMKPiA+ICAgICAgICAg
c2VsZWN0IERSTV9HRU1fQ01BX0hFTFBFUgo+ID4gICAgICAgICBzZWxlY3QgRFJNX0tNU19IRUxQ
RVIKPiA+ICAgICAgICAgc2VsZWN0IERSTV9NSVBJX0RTSQo+ID4gLS0KPiA+IDIuMTcuMQo+ID4K
PiA+CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
