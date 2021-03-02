Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC600C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 20:49:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7274C64EF4
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 20:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7274C64EF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jzbb5pPcOxeBpTUzZIj3IwbXO0JD4nEQSblH4QICW1A=; b=kHPOZpckkDB5sh2tY6644nezU
	hiEozVlVSQnDOaKFfYDxITK+y61DU+NVnS1/GwtQzWAXUCZh3y639oasxQ+QH01vDwx8eqqcM4ASM
	G4uvWCPAYK+Yngx/wtTyIszoMdxiEBlvcuAohtkI5eJNn69g+9v6HtdUdZtyEF7Adl8/2hGXjV13B
	zBanY2wvLPUfc6WNEchsZM3c3mJVDCz9BG0MyBc+xYCr74YAsfqBSKQwCcJ2nrqIoQ/eS6D1tia3R
	mP71m3mSb5E/MEObPpzvemTbX67JmUlZsvB93Xsvc/xuMKpQWehjmLzXERQkgjcmJT9JsBqGq6df0
	H6wWmBwNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHYRF-006Tzw-Sp; Wed, 03 Mar 2021 20:49:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT72-005JHC-GW
 for linux-mediatek@desiato.infradead.org; Wed, 03 Mar 2021 15:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=NgErhWjVYS40cse08ZsXc39yhag5uGkh43eRrKni6lg=; b=hbw76Y9ngXuWE/qrRHwweesyk1
 qdYja0OakiFRUzBX3tZJ7sPtS8REFA4V1zVbwpMtp+ATf87PrW1TdKQ77Uh29zxwy6IZqep4XG2rn
 kue7cvYzazTByT77yqYF/YHo8wktEeOTXxbkZuFqbxioq+FPH/0e32ekfGDHY7qzfh68qulDrYydj
 mfzXHAugLnPVOkwxnjzpxjNOqLAUYX2Xb5MQE/q7V5Yken6w/WlVNl/dm6PN3CWkJHol+52iYqmXO
 r+Gmto4kanXODxov5qmhH9cuaji3uYcVXEUvGOHx7n+NhK+qeDPOHPmxD6rpdSGf75WpxmhhGSU4c
 6arg5txg==;
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8zs-00HZ70-BY
 for linux-mediatek@lists.infradead.org; Tue, 02 Mar 2021 17:39:51 +0000
Received: by mail-qt1-x830.google.com with SMTP id w1so15383559qto.2
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Mar 2021 09:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=NgErhWjVYS40cse08ZsXc39yhag5uGkh43eRrKni6lg=;
 b=ur8sCkRb3FMUhgW+QJadn9dMy4JISPa7I7yRBZGwGimMjGgjJvScQD944W2s39N1KK
 5ZwY/Uref8JP5Hz0AoZk7uJej9PkNpVO5lnBNAd1BNMQLDR3FeLf5o3O2/Nl9o52Jz6c
 Mkl8fwYqr2OqxRunNzd9U2N5r/AG1omvgceB2aliRb5FS4hQJJHBiTYgLL9O1hr5jyqH
 0mVCAU7VU9tlR+GoEy4FhWqk4WtQr03iwT7iAhKCfE+b/QojvK4/Na3r+NROo6aI6Rqg
 ZcitjEHBOZg2knRRNRzkoZxcHDVvk3aPSYJBewyYgbapyQ4VkDGgyFlqgXTcEheiJK9j
 rlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=NgErhWjVYS40cse08ZsXc39yhag5uGkh43eRrKni6lg=;
 b=bjmaRkLHOTTONlvR4DnjdgnHHRO3GfgPYAFDr5jCATKwNhz6x+dW1E0RDVFdvlS7mU
 rFicsCojjIr8G3S69Zes72N0pgzioaBcrwHDLeanMU0BPAa6vr41LZ3yaioCSqUkytal
 gHYTJmkR34YLpYBHiYX88VBvMj3wwrnmMQBUY6CQ8sqOdTCHRtls2cw553z3EyRMmZd8
 3ZG6zgnk4gryCVe+pkLK+uGSvTm3g5Za++OrMMa/ioqieFxmxmuQcdoJFuslbzQ6wZjH
 BJ3jDfsESM1mKFNlU7ioFwPajwzrfnq186a27T4WTFeWPT3M520JFfOH4F/NRFatdTTV
 s30g==
X-Gm-Message-State: AOAM5315s6UhGbfVx5HoIwyQ7cwn/ZigqT3TayX6I9FZ4LpxFgA+37JR
 9oGO/ZcvhCjvWMowBfUAFiLulA==
X-Google-Smtp-Source: ABdhPJzEX9/PYCZJ0v5bnw+DU56A+H6y1W46NuNaqvaLGR+HDtIUxBzjsqJkyYMBHNTVe1V5W92Okg==
X-Received: by 2002:ac8:4249:: with SMTP id r9mr18127959qtm.285.1614706718945; 
 Tue, 02 Mar 2021 09:38:38 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168])
 by smtp.gmail.com with ESMTPSA id t6sm15339867qkd.127.2021.03.02.09.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:38:38 -0800 (PST)
Message-ID: <4cb93f828695f7f6307077da466a58ba478c9824.camel@ndufresne.ca>
Subject: Re: [PATCH v2 3/8] media: add Mediatek's MM21 format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Alexandre Courbot <acourbot@chromium.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Tue, 02 Mar 2021 12:38:37 -0500
In-Reply-To: <20210225101612.2832444-4-acourbot@chromium.org>
References: <20210225101612.2832444-1-acourbot@chromium.org>
 <20210225101612.2832444-4-acourbot@chromium.org>
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_173951_171605_CC862EE8 
X-CRM114-Status: GOOD (  17.86  )
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

TGUgamV1ZGkgMjUgZsOpdnJpZXIgMjAyMSDDoCAxOToxNiArMDkwMCwgQWxleGFuZHJlIENvdXJi
b3QgYSDDqWNyaXTCoDoKPiBBZGQgTWVkaWF0ZWsncyBub24tY29tcHJlc3NlZCA4IGJpdCBibG9j
ayB2aWRlbyBtb2RlLiBUaGlzIGZvcm1hdCBpcwo+IHByb2R1Y2VkIGJ5IHRoZSBNVDgxODMgY29k
ZWMgYW5kIGNhbiBiZSBjb252ZXJ0ZWQgdG8gYSBub24tcHJvcHJpZXRhcnkKPiBmb3JtYXQgYnkg
dGhlIE1EUDMgY29tcG9uZW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90
IDxhY291cmJvdEBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gwqBEb2N1bWVudGF0aW9uL3VzZXJzcGFj
ZS1hcGkvbWVkaWEvdjRsL3BpeGZtdC1yZXNlcnZlZC5yc3QgfCA3ICsrKysrKysKPiDCoGRyaXZl
cnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDEgKwo+IMKgaW5jbHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5o
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MSArCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL3BpeGZtdC1yZXNlcnZlZC5y
c3QKPiBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvcGl4Zm10LXJlc2Vy
dmVkLnJzdAo+IGluZGV4IGM5MjMxZTE4ODU5Yi4uMTg3ZWE4OWY3YTI1IDEwMDY0NAo+IC0tLSBh
L0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvcGl4Zm10LXJlc2VydmVkLnJz
dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvcGl4Zm10LXJl
c2VydmVkLnJzdAo+IEBAIC0yNDIsNiArMjQyLDEzIEBAIHBsZWFzZSBtYWtlIGEgcHJvcG9zYWwg
b24gdGhlIGxpbnV4LW1lZGlhIG1haWxpbmcgbGlzdC4KPiDCoMKgwqDCoMKgwqDCoMKgSXQgaXMg
YW4gb3BhcXVlIGludGVybWVkaWF0ZSBmb3JtYXQgYW5kIHRoZSBNRFAgaGFyZHdhcmUgbXVzdCBi
ZQo+IMKgwqDCoMKgwqDCoMKgwqB1c2VkIHRvIGNvbnZlcnQgYGBWNEwyX1BJWF9GTVRfTVQyMUNg
YCB0byBgYFY0TDJfUElYX0ZNVF9OVjEyTWBgLAo+IMKgwqDCoMKgwqDCoMKgwqBgYFY0TDJfUElY
X0ZNVF9ZVVY0MjBNYGAgb3IgYGBWNEwyX1BJWF9GTVRfWVZVNDIwYGAuCj4gK8KgwqDCoCAqIC4u
IF9WNEwyLVBJWC1GTVQtTU0yMToKPiArCj4gK8KgwqDCoMKgwqAgLSBgYFY0TDJfUElYX0ZNVF9N
TTIxYGAKPiArwqDCoMKgwqDCoCAtICdNTTIxJwo+ICvCoMKgwqDCoMKgIC0gTm9uLWNvbXByZXNz
ZWQsIHRpbGVkIHR3by1wbGFuYXIgZm9ybWF0IHVzZWQgYnkgTWVkaWF0ZWsgTVQ4MTgzLgo+ICvC
oMKgwqDCoMKgwqDCoFRoaXMgaXMgYW4gb3BhcXVlIGludGVybWVkaWF0ZSBmb3JtYXQgYW5kIHRo
ZSBNRFAzIGhhcmR3YXJlIGNhbiBiZQo+ICvCoMKgwqDCoMKgwqDCoHVzZWQgdG8gY29udmVydCBp
dCB0byBvdGhlciBmb3JtYXRzLgo+IMKgwqDCoMKgICogLi4gX1Y0TDItUElYLUZNVC1TVU5YSS1U
SUxFRC1OVjEyOgoKVGhlIFNVTlhJIG9uZSB3YXMgYSBtaXN0YWtlLCAgaXQncyBsaW5lYXIgbGF5
b3V0IDMyeDMyIHRpbGVzLiBUaGUgcHJvYmxlbSB3aXRoCmNhbGxpbmcgdGhpcyBhIHZlbmRvciBm
b3JtYXQsIGlzIHRoYXQgb3RoZXIgdmVuZG9yIG1pZ2h0IGJlIHVzaW5nIGl0IHRvby4gQnV0CnRo
ZXkgd29uJ3Qga25vdyBhbmQgdGhlIGZvcm1hdCBtaWdodCBlbmR1cCBkdXBsaWNhdGVkLCBldmVu
IGlmIGl0J3MgdGhlIHNhbWUKb25lLgoKU28gaGVyZSdzIG15IHJlcXVlc3QsIGhhdmUgeW91IHRy
aWVkIHRvIHVuZGVyc3RhbmQgYSBiaXQgbW9yZSB3aGF0IHRoZSB0aWxpbmcKbGF5b3V0IGlzID8g
Q291bGQgYmUgdGlsZWQgKyBTQU5ELCBjb3VsZCB1c2UgemlnemFnIGxheW91dCBsaWtlIFNhbXN1
bmcgZG8uIEkKdGhpbmsgaWYgd2UgY2FuIGF2b2lkIHZlbmRvciBmb3JtYXRzLCB3ZSBjYW4gcHJl
c2VydmUgdGhlIHBpeGVsIGZvcm1hdCBsaXN0CnNhbml0eSBoZXJlLiBNb3N0IG9mIHRoZSBIVyBJ
J3ZlIGVuY291dGVyZWQgd2FzIHZlcnkgZWFzeSB0byByZXZlcnNlLCBldmVuIGlmCnVuZG9jdW1l
bnRlZCAoZXhjZXB0IHRoZSBjb21wcmVzc2VkIG9uZSkuCgpJZiBub3QgcG9zc2libGUsIEkgd291
bGQgbGlrZSB0byBzdWdnZXN0OgoKICBWNEwyX1BJWF9GTVRfTVRLX05WMjEKClRoZSBpbXBvcnRh
bnQgcGFydCBpcyB0byBhZGQgYSBjbGVhciBzZXBlcmF0aW9uIGZvciB0aGUgdmVuZG9yIG5hbWUs
IGl0IGVhc3kgdG8KcmVjb2duaXplIHRoZW4uCgo+IMKgCj4gwqDCoMKgwqDCoMKgIC0gYGBWNEwy
X1BJWF9GTVRfU1VOWElfVElMRURfTlYxMmBgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
djRsMi1jb3JlL3Y0bDItaW9jdGwuYyBiL2RyaXZlcnMvbWVkaWEvdjRsMi0KPiBjb3JlL3Y0bDIt
aW9jdGwuYwo+IGluZGV4IDMxZDEzNDJlNjFlOC4uMGI4NWIyYmJjNjI4IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYwo+ICsrKyBiL2RyaXZlcnMvbWVk
aWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYwo+IEBAIC0xMzg0LDYgKzEzODQsNyBAQCBzdGF0aWMg
dm9pZCB2NGxfZmlsbF9mbXRkZXNjKHN0cnVjdCB2NGwyX2ZtdGRlc2MgKmZtdCkKPiDCoMKgwqDC
oMKgwqDCoMKgY2FzZSBWNEwyX1BJWF9GTVRfVE02MDAwOsKgwqDCoMKgwqDCoMKgZGVzY3IgPSAi
QS9WICsgVkJJIE11eCBQYWNrZXQiOyBicmVhazsKPiDCoMKgwqDCoMKgwqDCoMKgY2FzZSBWNEwy
X1BJWF9GTVRfQ0lUX1lZVllVWTrCoMKgwqBkZXNjciA9ICJHU1BDQSBDSVQgWVlWWVVZIjsgYnJl
YWs7Cj4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgVjRMMl9QSVhfRk1UX0tPTklDQTQyMDrCoMKgwqDC
oGRlc2NyID0gIkdTUENBIEtPTklDQTQyMCI7IGJyZWFrOwo+ICvCoMKgwqDCoMKgwqDCoGNhc2Ug
VjRMMl9QSVhfRk1UX01NMjE6wqDCoMKgwqDCoMKgwqDCoMKgZGVzY3IgPSAiTWVkaWF0ZWsgOC1i
aXQgYmxvY2sgZm9ybWF0IjsKPiBicmVhazsKPiDCoMKgwqDCoMKgwqDCoMKgY2FzZSBWNEwyX1BJ
WF9GTVRfSFNWMjQ6wqDCoMKgwqDCoMKgwqDCoGRlc2NyID0gIjI0LWJpdCBIU1YgOC04LTgiOyBi
cmVhazsKPiDCoMKgwqDCoMKgwqDCoMKgY2FzZSBWNEwyX1BJWF9GTVRfSFNWMzI6wqDCoMKgwqDC
oMKgwqDCoGRlc2NyID0gIjMyLWJpdCBYSFNWIDgtOC04LTgiOyBicmVhazsKPiDCoMKgwqDCoMKg
wqDCoMKgY2FzZSBWNEwyX1NEUl9GTVRfQ1U4OsKgwqDCoMKgwqDCoMKgwqDCoMKgZGVzY3IgPSAi
Q29tcGxleCBVOCI7IGJyZWFrOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmlk
ZW9kZXYyLmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgKPiBpbmRleCA3OWRiZGUz
YmNmOGQuLmU2ODkwZGFlNzZlYyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmlk
ZW9kZXYyLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgKPiBAQCAtNzMx
LDYgKzczMSw3IEBAIHN0cnVjdCB2NGwyX3BpeF9mb3JtYXQgewo+IMKgI2RlZmluZSBWNEwyX1BJ
WF9GTVRfWTEyScKgwqDCoMKgIHY0bDJfZm91cmNjKCdZJywgJzEnLCAnMicsICdJJykgLyogR3Jl
eXNjYWxlCj4gMTItYml0IEwvUiBpbnRlcmxlYXZlZCAqLwo+IMKgI2RlZmluZSBWNEwyX1BJWF9G
TVRfWjE2wqDCoMKgwqDCoCB2NGwyX2ZvdXJjYygnWicsICcxJywgJzYnLCAnICcpIC8qIERlcHRo
IGRhdGEKPiAxNi1iaXQgKi8KPiDCoCNkZWZpbmUgVjRMMl9QSVhfRk1UX01UMjFDwqDCoMKgIHY0
bDJfZm91cmNjKCdNJywgJ1QnLCAnMicsICcxJykgLyogTWVkaWF0ZWsKPiBjb21wcmVzc2VkIGJs
b2NrIG1vZGXCoCAqLwo+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9NTTIxwqDCoMKgwqAgdjRsMl9m
b3VyY2MoJ00nLCAnTScsICcyJywgJzEnKSAvKiBNZWRpYXRlayA4LQo+IGJpdCBibG9jayBtb2Rl
LCB0d28gbm9uLWNvbnRpZ3VvdXMgcGxhbmVzICovCj4gwqAjZGVmaW5lIFY0TDJfUElYX0ZNVF9J
TlpJwqDCoMKgwqAgdjRsMl9mb3VyY2MoJ0knLCAnTicsICdaJywgJ0knKSAvKiBJbnRlbCBQbGFu
YXIKPiBHcmV5c2NhbGUgMTAtYml0IGFuZCBEZXB0aCAxNi1iaXQgKi8KPiDCoCNkZWZpbmUgVjRM
Ml9QSVhfRk1UX1NVTlhJX1RJTEVEX05WMTIgdjRsMl9mb3VyY2MoJ1MnLCAnVCcsICcxJywgJzIn
KSAvKgo+IFN1bnhpIFRpbGVkIE5WMTIgRm9ybWF0ICovCj4gwqAjZGVmaW5lIFY0TDJfUElYX0ZN
VF9DTkY0wqDCoMKgwqAgdjRsMl9mb3VyY2MoJ0MnLCAnTicsICdGJywgJzQnKSAvKiBJbnRlbCA0
LWJpdAo+IHBhY2tlZCBkZXB0aCBjb25maWRlbmNlIGluZm9ybWF0aW9uICovCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
