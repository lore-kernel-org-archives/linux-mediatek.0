Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D0AC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:37:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52A592072D
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:37:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TXPtaioL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEp+3KyF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52A592072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nm3bQUpD4yriZ1bA1oh3wwvc4h3sVL9skqycw2j53kM=; b=TXPtaioLHdXv72z6LfNM8eSH4
	/qNwKjrZ6b89n8IMxU7j/O64L99oEs+AOM6pDXFBw9ue59rucCPD5HOBz5EhTGoXkmEJu7U/+JvcY
	tHrMqEG1lURLT1Rzl6j5DaOtUwbPTfyypOK2W/YaK37o4kYWo5Vq0ia3FGqSwYEOWY3hkp77Lj/gY
	tb/A1BJ1NeuEZpjL1Txs3p+PK7KBdoYB4w4T2w+AFudzu2R1ZJhL19M3MS38AbeWzaX7aiopTgRux
	MsRHqb7sYskM4qBVgUP8tWbIRhLIMmSf3mlH85xNUhFm4Q7j5UplIOwQBs2KDnIzKrDF7F/GAV2Os
	HueHLq0kA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8u79-0003Y1-36; Thu, 20 Aug 2020 23:36:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8u73-0003Vl-9K; Thu, 20 Aug 2020 23:36:54 +0000
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 54AA320FC3;
 Thu, 20 Aug 2020 23:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597966612;
 bh=zu6dDzfaquWSp2uUIMe35Em3fehg9+BJA+WpR/RQhd4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VEp+3KyFjIwmu94z64ixA9Rrr71Jh6bFYApt+fq5Yn83IVa6pSFmfxSjLg27DtpYJ
 MtH+SJNf7631QI2iX7KMdCBfLWPWfyLokEuxCHD0w6eZ4iZ0Yl2x3yudQogSPs6cwO
 QV3wWok7jElKGlv57eg1w/yIaeNreCgJiIoli6cE=
Received: by mail-ed1-f48.google.com with SMTP id l23so2986699edv.11;
 Thu, 20 Aug 2020 16:36:52 -0700 (PDT)
X-Gm-Message-State: AOAM532B7RztG/vU2jUcyH5UsJurNa2Mzw1tGKxZ8w3WFG8N3Z3S4csu
 EshQ6yz5UHB4nn11q5dDxPb3vg+TOjRPNDS0dw==
X-Google-Smtp-Source: ABdhPJyBSJx3TcHZvu2J+XPfgaFyiT8RjUUAgdQ/KuzhMeixYVHxkITA+AkOph4jNHOhS8/2MYeaprdPdiaDkfm4vDY=
X-Received: by 2002:a05:6402:2037:: with SMTP id
 ay23mr309611edb.48.1597966610947; 
 Thu, 20 Aug 2020 16:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
 <1597903458-8055-6-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1597903458-8055-6-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:36:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8rqu4_yVPVCCpyQjognDP0jK=wTr2rFw0WjjY=dzkHHg@mail.gmail.com>
Message-ID: <CAAOTY_8rqu4_yVPVCCpyQjognDP0jK=wTr2rFw0WjjY=dzkHHg@mail.gmail.com>
Subject: Re: [PATCH v1 05/21] mtk-mmsys: add ovl mout on support
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_193653_462250_2F855DDE 
X-CRM114-Status: GOOD (  23.87  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
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
PiDmlrwgMjAyMOW5tDjmnIgyMOaXpSDpgLHlm5sg5LiL5Y2IMjoxNuWvq+mBk++8mgo+Cj4gYWRk
IG92bCBtb3V0IG9uIHN1cHBvcnQKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlv
bmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9t
bXN5cy9tdDgxOTItbW1zeXMuYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZl
cnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jICAgICAgICAgIHwgIDggKysrKysrKysKPiAgaW5j
bHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmggICAgfCAgMyArKysKPiAgMyBmaWxl
cyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvbW1zeXMvbXQ4MTkyLW1tc3lzLmMgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tbXN5
cy9tdDgxOTItbW1zeXMuYwo+IGluZGV4IDAwNmQ0MWQuLjA2MDgwYWQgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9zb2MvbWVkaWF0ZWsvbW1zeXMvbXQ4MTkyLW1tc3lzLmMKPiArKysgYi9kcml2ZXJz
L3NvYy9tZWRpYXRlay9tbXN5cy9tdDgxOTItbW1zeXMuYwo+IEBAIC0xMzQsMTAgKzEzNCwzMyBA
QCBzdGF0aWMgdm9pZCBtdGtfbW1zeXNfZGRwX3NvdXRfc2VsKHZvaWQgX19pb21lbSAqY29uZmln
X3JlZ3MsCj4gICAgICAgICB9Cj4gIH0KPgo+ICtzdGF0aWMgaW50IG10a19tbXN5c19vdmxfbW91
dF9lbihlbnVtIG10a19kZHBfY29tcF9pZCBjdXIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZW51bSBtdGtfZGRwX2NvbXBfaWQgbmV4dCwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmFkZHIpCj4gK3sKPiArICAgICAgIGludCB2YWx1
ZSA9IC0xOwo+ICsKPiArICAgICAgICphZGRyID0gTVQ4MTkyX01NU1lTX09WTF9NT1VUX0VOOwo+
ICsKPiArICAgICAgIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9PVkwwICYmIG5leHQgPT0gRERQ
X0NPTVBPTkVOVF9PVkxfMkwwKQo+ICsgICAgICAgICAgICAgICB2YWx1ZSA9IERJU1BfT1ZMMF9H
T19CRzsKPiArICAgICAgIGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX09WTF8yTDAgJiYg
bmV4dCA9PSBERFBfQ09NUE9ORU5UX09WTDApCj4gKyAgICAgICAgICAgICAgIHZhbHVlID0gRElT
UF9PVkwwXzJMX0dPX0JHOwo+ICsgICAgICAgZWxzZSBpZiAoY3VyID09IEREUF9DT01QT05FTlRf
T1ZMMCkKPiArICAgICAgICAgICAgICAgdmFsdWUgPSBESVNQX09WTDBfR09fQkxFTkQ7Cj4gKyAg
ICAgICBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9PVkxfMkwwKQo+ICsgICAgICAgICAg
ICAgICB2YWx1ZSA9IERJU1BfT1ZMMF8yTF9HT19CTEVORDsKPiArICAgICAgIGVsc2UKPiArICAg
ICAgICAgICAgICAgdmFsdWUgPSAtMTsKPiArCj4gKyAgICAgICByZXR1cm4gdmFsdWU7Cj4gK30K
PiArCj4gIHN0YXRpYyBzdHJ1Y3QgbXRrX21tc3lzX2Nvbm5fZnVuY3MgbW1zeXNfZnVuY3MgPSB7
Cj4gICAgICAgICAubW91dF9lbiA9IG10a19tbXN5c19kZHBfbW91dF9lbiwKPiAgICAgICAgIC5z
ZWxfaW4gPSBtdGtfbW1zeXNfZGRwX3NlbF9pbiwKPiAgICAgICAgIC5zb3V0X3NlbCA9IG10a19t
bXN5c19kZHBfc291dF9zZWwsCj4gKyAgICAgICAub3ZsX21vdXRfZW4gPSBtdGtfbW1zeXNfb3Zs
X21vdXRfZW4sCj4gIH07Cj4KPiAgc3RhdGljIGludCBtbXN5c19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGst
bW1zeXMuYyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jCj4gaW5kZXggODI4ZDU5
ZS4uMTM2MmQwMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMu
Ywo+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jCj4gQEAgLTc2LDYgKzc2
LDE0IEBAIHZvaWQgbXRrX21tc3lzX2RkcF9jb25uZWN0KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAg
ICAgICAgICAgICAgICAgcmVnID0gcmVhZGxfcmVsYXhlZChjb25maWdfcmVncyArIGFkZHIpIHwg
dmFsdWU7Cj4gICAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKHJlZywgY29uZmlnX3JlZ3Mg
KyBhZGRyKTsKPiAgICAgICAgIH0KPiArCj4gKyAgICAgICBpZiAocHJpdl9mdW5jcy0+b3ZsX21v
dXRfZW4pIHsKPiArICAgICAgICAgICAgICAgdmFsdWUgPSBwcml2X2Z1bmNzLT5vdmxfbW91dF9l
bihjdXIsIG5leHQsICZhZGRyKTsKPiArICAgICAgICAgICAgICAgaWYgKHZhbHVlID49IDApIHsK
PiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSByZWFkbF9yZWxheGVkKGNvbmZpZ19yZWdz
ICsgYWRkcikgfCB2YWx1ZTsKPiArICAgICAgICAgICAgICAgICAgICAgICB3cml0ZWxfcmVsYXhl
ZChyZWcsIGNvbmZpZ19yZWdzICsgYWRkcik7Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAg
IH0KCkkgd291bGQgbGlrZSB0byBkbyByb3V0aW5nIGNvbnRyb2wgbGlrZSBbMV0uCgpbMV0gaHR0
cHM6Ly9jaHJvbWl1bS1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2Nocm9taXVtb3MvdGhpcmRf
cGFydHkva2VybmVsLysvMjM0NTE4NgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gIH0KPiAgRVhQ
T1JUX1NZTUJPTF9HUEwobXRrX21tc3lzX2RkcF9jb25uZWN0KTsKPgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaCBiL2luY2x1ZGUvbGludXgvc29j
L21lZGlhdGVrL210ay1tbXN5cy5oCj4gaW5kZXggOGVmM2VhYS4uZWVmYzdiMSAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaAo+ICsrKyBiL2luY2x1
ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oCj4gQEAgLTU1LDYgKzU1LDkgQEAgc3Ry
dWN0IG10a19tbXN5c19jb25uX2Z1bmNzIHsKPiAgICAgICAgIHZvaWQgKCpzb3V0X3NlbCkodm9p
ZCBfX2lvbWVtICpjb25maWdfcmVncywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBt
dGtfZGRwX2NvbXBfaWQgY3VyLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIG10a19k
ZHBfY29tcF9pZCBuZXh0KTsKPiArICAgICAgIGludCAoKm92bF9tb3V0X2VuKShlbnVtIG10a19k
ZHBfY29tcF9pZCBjdXIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBtdGtfZGRw
X2NvbXBfaWQgbmV4dCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
KmFkZHIpOwo+ICB9Owo+Cj4gIHZvaWQgbXRrX21tc3lzX3JlZ2lzdGVyX2Nvbm5fZnVuY3Moc3Ry
dWN0IGRldmljZSAqZGV2LAo+IC0tCj4gMS44LjEuMS5kaXJ0eQo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
