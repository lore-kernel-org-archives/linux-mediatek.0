Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56166C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 17:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24V4A1ZKJq++u3Fpi9HA1QFvp9pmD0vW/90DOXObsIc=; b=MK1P/ovNI5VLrZ
	J0nazAzqnP6jg65xGhTP4F7ACsuwg07zVMZj93QdetUNngU5kIpReuoAkS3NfPwzHmRqNIGxr76YI
	LUoL2L3T8vaGvmd2aG/b6Hz9JP4PxcCaUJB9RzmF0kBBc2C98N/6JqOTaZLsEBiRKOWZbccFT1nw2
	uTouS/zFJCo0qIbDPnOa/9Ci/PxN1Zgk2OKpNAdxDM9Sx9GeRKr+LxIBvJhxc93+zkrKboLf76OaJ
	hWTDmZW10lMOAITpvC8RYnq1ax36Fu/1lSNvJAt9KWDpZsPkoVEMMnnyvAnrn7k+wYBUlXT9kwqby
	uN2Mo12CDGceyklgzRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngrsc-005PfL-HM; Tue, 19 Apr 2022 17:43:10 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngrmd-005N5D-Lv
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 17:37:01 +0000
Received: by mail-qt1-x834.google.com with SMTP id x24so4369751qtq.11
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=drE3Vvgc/V+fnpihrYOc9KMqNg1xdJOT7Hgu1lLOYXU=;
 b=VNn55YznefnmFxbiHeFybFRRx10q4N3WTgm8faUA9fqMHT+kESq+EtXlHOqGO7ztG7
 rfE/DMNA86nYIOWkCHqeYgSCZmxu2D41dL5JKAGJcEmSTzQHh/35AuzT+sCBnH+DWsUD
 lBlNCL65a0dorLVD6Oy4LUMbr++3kxyIWjC8OxiGBuDWf8X9OXJ3/BdnDWPAxr/MjnN6
 QB1dvv6lyaJgcQRpfZnvj0ZWkalUqHvHQy+JLy6VrQnnjrxy0+WsLkVeLOGHR1TRjl3n
 +u02J2wpzF5x9MQk3tj2enbSMxmhyl7W6LIeBRYsloK1+gPSKB5TjzMDUXefmph2Js//
 sOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=drE3Vvgc/V+fnpihrYOc9KMqNg1xdJOT7Hgu1lLOYXU=;
 b=oq1MriKZqpZfO8CrImgFKj5X7M1yUtsqMC4evuO2xWI6hDyUrTqMZ+L9X3iU6M1npl
 8ayYvYwBFqHgTHmhAaVcs+jpr4AevxlEIJCd2QtTT4LGs9WtKoUVG7G/JZ/XADkks11x
 yz2h13+BeU1tme/BbT8+BCyIHZ3ZFuYykfygWlY5aqKuuO0Qras2PoqX42+BvvyHD0ml
 Vm1NF945/Yk5XUxudfRAM7Tl3qAWx7PKZ7qvFFn3vfzSpzFa+y8RbB/K3QsGVz3DG17D
 5Owtct2+NH6wKvmwKwkqOrcjHUqONY/nf0jSSONiwZnXwsfkN74ARbhEdluj3F/Cnxrd
 bLig==
X-Gm-Message-State: AOAM533+ICeWeMuttlsEk46assBa9aGpU8uBpLjDSENtbC8rAsI9v43t
 0YXxWr0MrKOu2SpeamjbRIACmA==
X-Google-Smtp-Source: ABdhPJxnMU9m4mjCO6v+7IT7ueE/RLpN6eOxn8O3dDrOEvFY/F3Y84Lri4r/GTIDQkSg80Gu/bD0cQ==
X-Received: by 2002:a05:622a:408f:b0:2ed:12b7:2e9c with SMTP id
 cg15-20020a05622a408f00b002ed12b72e9cmr11075993qtb.309.1650389814938; 
 Tue, 19 Apr 2022 10:36:54 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 s17-20020a05620a16b100b0069eb1eb06b7sm290943qkj.131.2022.04.19.10.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 10:36:54 -0700 (PDT)
Message-ID: <4b6b65e72b3f3cd74af5a3f0069838c86a6725e9.camel@ndufresne.ca>
Subject: Re: [PATCH v3] media: usb: uvc: Add UVC_GUID_FORMAT_H265
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ricardo Ribalda <ribalda@chromium.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Cc: James_Lin <Ping-lei.Lin@mediatek.com>, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>,  Arnd Bergmann <arnd@arndb.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Alexandre Courbot
 <acourbot@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, sherlock.chang@mediatek.com, 
 lecopzer.chen@mediatek.com, max.yan@mediatek.com, tm.wu@mediatek.com
Date: Tue, 19 Apr 2022 13:36:53 -0400
In-Reply-To: <CANiDSCv0BA5C8ijO-T_3c2rxGD_yC0LGuG77THkC7_52GZ-dtA@mail.gmail.com>
References: <20220418090652.3156-1-Ping-lei.Lin@mediatek.com>
 <CANiDSCvLb785H7qyAzSfTSBRpO2eM-oJFF5SgVHXdL1O-GusLA@mail.gmail.com>
 <Yl6oYlv+t63+5dVP@pendragon.ideasonboard.com>
 <CANiDSCv0BA5C8ijO-T_3c2rxGD_yC0LGuG77THkC7_52GZ-dtA@mail.gmail.com>
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_103659_989438_B575114F 
X-CRM114-Status: GOOD (  30.10  )
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

TGUgbWFyZGkgMTkgYXZyaWwgMjAyMiDDoCAxNDoxOCArMDIwMCwgUmljYXJkbyBSaWJhbGRhIGEg
w6ljcml0wqA6Cj4gT24gVHVlLCAxOSBBcHIgMjAyMiBhdCAxNDoxNywgTGF1cmVudCBQaW5jaGFy
dAo+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+ID4gCj4gPiBI
ZWxsbywKPiA+IAo+ID4gT24gVHVlLCBBcHIgMTksIDIwMjIgYXQgMDE6NDY6MTVQTSArMDIwMCwg
UmljYXJkbyBSaWJhbGRhIHdyb3RlOgo+ID4gPiBPbiBNb24sIDE4IEFwciAyMDIyIGF0IDExOjA3
LCBKYW1lc19MaW4gPFBpbmctbGVpLkxpbkBtZWRpYXRlay5jb20+IHdyb3RlOgo+ID4gPiA+IAo+
ID4gPiA+IFRoaXMgcGF0Y2ggYWltcyB0byBhZGQgVVZDX0dVSURfRk9STUFUX0gyNjUKPiA+ID4g
PiBIaWdoIEVmZmljaWVuY3kgVmlkZW8gQ29kaW5nIChIRVZDKSwgYWxzbyBrbm93biBhcyBILjI2
NSBhbmQgTVBFRy1IIFBhcnQgMi4KPiA+ID4gPiBUaGV5IGRlc2NyaWJlIHRoZSBzYW1lIHZpZGVv
IGVuY29kaW5nIG1ldGhvZC4KPiA+ID4gPiBTbyBmb3IgaGFuZGxpbmcgdGhlaXIgYmVoYXZpb3Ig
aXMgdGhlIHNhbWUuCj4gPiA+ID4gSG93ZXZlciwgd2hlbiBleHRlcm5hbCBjYW1lcmEgZGV2aWNl
IGRlc2NyaWJlcyB0aGlzIGVuY29kaW5nIG1ldGhvZCwKPiA+ID4gPiBzb21lIHVzZSBoZXZjLCBz
b21lIHVzZSBoMjY1Lgo+ID4gPiA+IFRoZXJlIGlzIG5vIHVuaWZvcm0gc3BlY2lmaWNhdGlvbiB0
byBkZXNjcmliZSB0aGlzIGVuY29kaW5nIG1ldGhvZC4KPiA+ID4gPiBTbyBpZiBhbiBleHRlcm5h
bCBjYW1lcmEgZGV2aWNlIHVzZSBoMjY1IHRvIGRlc2NyaWJlIHRoaXMgZW5jb2RpbmcgbWV0aG9k
LAo+ID4gPiA+IGRyaXZlciB3aWxsIG5vdCByZWNvZ25pemUgaXQuCj4gPiA+ID4gVGhlcmVmb3Jl
LCB0aGlzIHBhdGNoIGlzIHRvIGVuYWJsZSBkcml2ZXIgdG8gcmVhZCBIRVZDL0gyNjUKPiA+ID4g
PiBhbmQgY29udmVydCBpdCB0byBWNEwyX1BJWF9GTVRfSEVWQy4KPiA+ID4gPiAKPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBKYW1lc19MaW4gPFBpbmctbGVpLkxpbkBtZWRpYXRlay5jb20+Cj4gPiA+
IAo+ID4gPiBSZXZpZXdlZC1ieTogUmljYXJkbyBSaWJhbGRhIDxyaWJhbGRhQGNocm9taXVtLm9y
Zz4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9tZWRpYS91c2IvdXZjL3V2Y19kcml2ZXIu
YyB8IDUgKysrKysKPiA+ID4gPiAgZHJpdmVycy9tZWRpYS91c2IvdXZjL3V2Y3ZpZGVvLmggICB8
IDMgKysrCj4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gPiA+ID4g
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfZHJpdmVyLmMg
Yi9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX2RyaXZlci5jCj4gPiA+ID4gaW5kZXggZGRhMGYw
YWE3OGI4Li5lNDM3ZTlmOTU4OTAgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS91
c2IvdXZjL3V2Y19kcml2ZXIuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91
dmNfZHJpdmVyLmMKPiA+ID4gPiBAQCAtMTU0LDYgKzE1NCwxMSBAQCBzdGF0aWMgc3RydWN0IHV2
Y19mb3JtYXRfZGVzYyB1dmNfZm10c1tdID0gewo+ID4gPiA+ICAgICAgICAgICAgICAgICAuZ3Vp
ZCAgICAgICAgICAgPSBVVkNfR1VJRF9GT1JNQVRfSDI2NCwKPiA+ID4gPiAgICAgICAgICAgICAg
ICAgLmZjYyAgICAgICAgICAgID0gVjRMMl9QSVhfRk1UX0gyNjQsCj4gPiA+ID4gICAgICAgICB9
LAo+ID4gPiAKPiA+ID4gTWF5YmUgSSB3b3VsZCBhZGQgYSBjb21tZW50IGhlcmUgc2F5aW5nIHRo
YXQgc29tZSBjYW1lcmFzIHJlcHJlc2VudAo+ID4gPiBoZXZjIGFzIGgyNjUuCj4gPiAKPiA+IEkg
d2lzaCB0aGVyZSB3b3VsZCBiZSBhIDRDQyBhbmQgR1VJRCBzdGFuZGFyZCB3aXRoIGEgY2VudHJh
bGl6ZWQKPiA+IHJlZ2lzdHJ5Li4uCj4gCj4gVGhvdWdodCB0aGF0IHdhcyB0aGUga2VybmVsIGNv
ZGViYXNlIDopCgpZb3UnbGwgZmluZCBtdWx0aXBsZSBmb3VyY2MgZm9yIHRoZSBzYW1lIHRoaW5n
IGluIHRoZSBsaW51eCBrZXJuZWwgOy1QCgo+IAo+ID4gCj4gPiBSZXZpZXdlZC1ieTogTGF1cmVu
dCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gCj4gPiA+
ID4gKyAgICAgICB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIC5uYW1lICAgICAgICAgICA9ICJI
LjI2NSIsCj4gPiA+ID4gKyAgICAgICAgICAgICAgIC5ndWlkICAgICAgICAgICA9IFVWQ19HVUlE
X0ZPUk1BVF9IMjY1LAo+ID4gPiA+ICsgICAgICAgICAgICAgICAuZmNjICAgICAgICAgICAgPSBW
NEwyX1BJWF9GTVRfSEVWQywKPiA+ID4gPiArICAgICAgIH0sCj4gPiA+ID4gICAgICAgICB7Cj4g
PiA+ID4gICAgICAgICAgICAgICAgIC5uYW1lICAgICAgICAgICA9ICJHcmV5c2NhbGUgOCBML1Ig
KFk4SSkiLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAuZ3VpZCAgICAgICAgICAgPSBVVkNfR1VJ
RF9GT1JNQVRfWThJLAo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3VzYi91dmMv
dXZjdmlkZW8uaCBiL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmN2aWRlby5oCj4gPiA+ID4gaW5k
ZXggMTQzMjMwYjMyNzViLi40MWY0ZDhjMzNmMmEgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVy
cy9tZWRpYS91c2IvdXZjL3V2Y3ZpZGVvLmgKPiA+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL3Vz
Yi91dmMvdXZjdmlkZW8uaAo+ID4gPiA+IEBAIC0xMzksNiArMTM5LDkgQEAKPiA+ID4gPiAgI2Rl
ZmluZSBVVkNfR1VJRF9GT1JNQVRfSDI2NCBcCj4gPiA+ID4gICAgICAgICB7ICdIJywgICcyJywg
ICc2JywgICc0JywgMHgwMCwgMHgwMCwgMHgxMCwgMHgwMCwgXAo+ID4gPiA+ICAgICAgICAgIDB4
ODAsIDB4MDAsIDB4MDAsIDB4YWEsIDB4MDAsIDB4MzgsIDB4OWIsIDB4NzF9Cj4gPiA+ID4gKyNk
ZWZpbmUgVVZDX0dVSURfRk9STUFUX0gyNjUgXAo+ID4gPiA+ICsgICAgICAgeyAnSCcsICAnMics
ICAnNicsICAnNScsIDB4MDAsIDB4MDAsIDB4MTAsIDB4MDAsIFwKPiA+ID4gPiArICAgICAgICAw
eDgwLCAweDAwLCAweDAwLCAweGFhLCAweDAwLCAweDM4LCAweDliLCAweDcxfQo+ID4gPiA+ICAj
ZGVmaW5lIFVWQ19HVUlEX0ZPUk1BVF9ZOEkgXAo+ID4gPiA+ICAgICAgICAgeyAnWScsICAnOCcs
ICAnSScsICAnICcsIDB4MDAsIDB4MDAsIDB4MTAsIDB4MDAsIFwKPiA+ID4gPiAgICAgICAgICAw
eDgwLCAweDAwLCAweDAwLCAweGFhLCAweDAwLCAweDM4LCAweDliLCAweDcxfQo+ID4gCj4gPiAt
LQo+ID4gUmVnYXJkcywKPiA+IAo+ID4gTGF1cmVudCBQaW5jaGFydAo+IAo+IAo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
