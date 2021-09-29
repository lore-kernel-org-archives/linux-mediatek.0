Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92ECC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 14:54:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 993F96108F
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 14:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 993F96108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMvlgMbYtuchcFkPMBuLMwGTzdgN7/nNUsyV+RDgS3A=; b=0LW5ehrEGrB9GG
	3MjeuKmaI0/z4P4ujmbBsQOSCoFp+Km9WsCWrYl3Tl0Jk1oTfwqo4ByoYaNxCV5H3dpPdtC4vRB6r
	vQLabba28Rp9HT5iRwhVYWnLNdW7aYXHN3zoBRJdkGhW7sPjHZksV9/AEqZVS2oPOcWNZrdkVc8vX
	A5JQWR8L+mJBpf04Nlcpwy67hWh592A7CIkCjxDUM098t2/JhGjG0Qw9emBC+I8A6/EcOAFHtcmA+
	F4nGdTcuGnVtLh+7OstvYkK3RSXgPzOwb4+5WQwo4UA24rsltooyudczT2U74v9jU/HRMfhdRSn1J
	cxtUxpBebN0K09gJDzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVayq-00BPkp-I0; Wed, 29 Sep 2021 14:54:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVayZ-00BPeZ-7q; Wed, 29 Sep 2021 14:54:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7E3261452;
 Wed, 29 Sep 2021 14:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632927266;
 bh=VvAbMG+fnKitKsMFsoHEqUuGjgvoQuGWlE5pTALcwRU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P4ruQA5nbcfDRRmJkNKY1KvcXoqvhkO/sH3BSmPBF8NoklFYvIz0Y/f1db9jNL1iu
 hRVZi2DUyBq04ev3dsiqZCrQgt6tE2BkkRJgmMcBpL329s/zSFx3jny0ChX6E8Y7+R
 oQzEiBK8HvHxfH+ZFM98n0OnyVZ8E2xr6a4oO9IpaFgow9FL2KiaYnqz9RbcFg0X3w
 Ugy9IOH8pPky1c3bZFhyTw/L1MFPzJ8aTRTsTh0xkvDE3rIHJNjJS2ZjWPN0I8Mgaq
 OLgHrcsdG6OSE7ox2Jucu2ia5fhsraQyvBl9P71KxXY1TJoUTSaHue2y8GlDh88b5L
 0SomAneZKMgcA==
Received: by mail-ed1-f47.google.com with SMTP id r18so9586723edv.12;
 Wed, 29 Sep 2021 07:54:26 -0700 (PDT)
X-Gm-Message-State: AOAM530qCYluNSYEyeTfug4KVNfopkQ72oXAbb5kw9Sh1WBJBElb0K9h
 bgs0OFDRBqCDPzzwjqA58uRDXEmDT85U/lF4RA==
X-Google-Smtp-Source: ABdhPJxUSpbJLxQv4xE6xnQIWtVbavNuyeUJ/gUHQHcBU+8qpTIcmGcbrpQ1Dk83xyFI/d19Nw9/AJPtJhmghkTX2hU=
X-Received: by 2002:a17:907:3e21:: with SMTP id
 hp33mr121802ejc.205.1632927200231; 
 Wed, 29 Sep 2021 07:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210929070235.4290-1-jason-jh.lin@mediatek.com>
 <20210929070235.4290-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20210929070235.4290-3-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Sep 2021 22:53:08 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9uEACFCT6k9FaDqu4WN+e2CiJqWXOb20sWa1jXbCfc_A@mail.gmail.com>
Message-ID: <CAAOTY_9uEACFCT6k9FaDqu4WN+e2CiJqWXOb20sWa1jXbCfc_A@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/mediatek: Fix pkt buf alloc once but free many
 times
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 fshao@chromium.org, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_075427_329823_21E80F08 
X-CRM114-Status: GOOD (  18.31  )
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDnmnIgyOeaXpSDpgLHkuIkg5LiL5Y2IMzowMuWvq+mBk++8mgo+Cj4gQmVjYXVzZSBt
dGtfZHJtX2NydF9jbWRxX3BrdF9jcmVhdGUgaXMgY2FsbGVkIG9uY2UKPiBpbiBtdGtfZHJtX2Ny
dGNfY3JlYXRlLCB0aGUgcGt0IHNob3VsZCBub3QgYmUgZGVzdHJveQo+IGF0IGRkcF9jbWRxX2Ni
Lgo+Cj4gU28gbW92ZSBtdGtfZHJtX2NydGNfcGt0X2Rlc3Ryb3kgdG8gbXRrX2RybV9jcnRjX2Rl
c3Ryb3kuCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5v
cmc+Cgo+Cj4gRml4ZXM6IGJjOTI0MWJlNzNkOSAoImRybS9tZWRpYXRlazogQWRkIGNtZHFfaGFu
ZGxlIGluIG10a19jcnRjIikKPiBTaWduZWQtb2ZmLWJ5OiBqYXNvbi1qaC5saW4gPGphc29uLWpo
LmxpbkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2NydGMuYyB8IDI5ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+IGluZGV4IGU5ODg3MWE4Yzk2MS4uMDYzNDJkZjJhMGJl
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+IEBAIC0xMDgs
MTIgKzEwOCwzMCBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2ZpbmlzaF9wYWdlX2ZsaXAoc3RydWN0
IG10a19kcm1fY3J0YyAqbXRrX2NydGMpCj4gICAgICAgICB9Cj4gIH0KPgo+ICsjaWYgSVNfUkVB
Q0hBQkxFKENPTkZJR19NVEtfQ01EUSkKPiArc3RhdGljIHZvaWQgbXRrX2RybV9jbWRxX3BrdF9k
ZXN0cm95KHN0cnVjdCBjbWRxX3BrdCAqcGt0KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgY21kcV9j
bGllbnQgKmNsaWVudCA9IChzdHJ1Y3QgY21kcV9jbGllbnQgKilwa3QtPmNsOwo+ICsKPiArICAg
ICAgIGRtYV91bm1hcF9zaW5nbGUoY2xpZW50LT5jaGFuLT5tYm94LT5kZXYsIHBrdC0+cGFfYmFz
ZSwgcGt0LT5idWZfc2l6ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgRE1BX1RPX0RFVklD
RSk7Cj4gKyAgICAgICBrZnJlZShwa3QtPnZhX2Jhc2UpOwo+ICsgICAgICAga2ZyZWUocGt0KTsK
PiArfQo+ICsjZW5kaWYKPiArCj4gIHN0YXRpYyB2b2lkIG10a19kcm1fY3J0Y19kZXN0cm95KHN0
cnVjdCBkcm1fY3J0YyAqY3J0YykKPiAgewo+ICAgICAgICAgc3RydWN0IG10a19kcm1fY3J0YyAq
bXRrX2NydGMgPSB0b19tdGtfY3J0YyhjcnRjKTsKPgo+ICAgICAgICAgbXRrX211dGV4X3B1dCht
dGtfY3J0Yy0+bXV0ZXgpOwo+ICsjaWYgSVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkKPiAr
ICAgICAgIG10a19kcm1fY21kcV9wa3RfZGVzdHJveSgmbXRrX2NydGMtPmNtZHFfaGFuZGxlKTsK
Pgo+ICsgICAgICAgaWYgKG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFuKQo+ICsgICAgICAgICAg
ICAgICBtYm94X2ZyZWVfY2hhbm5lbChtdGtfY3J0Yy0+Y21kcV9jbGllbnQuY2hhbik7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFu
ID0gTlVMTDsKPiArI2VuZGlmCj4gICAgICAgICBkcm1fY3J0Y19jbGVhbnVwKGNydGMpOwo+ICB9
Cj4KPiBAQCAtMjU1LDE2ICsyNzMsNiBAQCBzdGF0aWMgaW50IG10a19kcm1fY21kcV9wa3RfY3Jl
YXRlKHN0cnVjdCBjbWRxX2NsaWVudCAqY2xpZW50LCBzdHJ1Y3QgY21kcV9wa3QgKgo+ICAgICAg
ICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC1zdGF0aWMgdm9pZCBtdGtfZHJtX2NtZHFfcGt0X2Rlc3Ry
b3koc3RydWN0IGNtZHFfcGt0ICpwa3QpCj4gLXsKPiAtICAgICAgIHN0cnVjdCBjbWRxX2NsaWVu
dCAqY2xpZW50ID0gKHN0cnVjdCBjbWRxX2NsaWVudCAqKXBrdC0+Y2w7Cj4gLQo+IC0gICAgICAg
ZG1hX3VubWFwX3NpbmdsZShjbGllbnQtPmNoYW4tPm1ib3gtPmRldiwgcGt0LT5wYV9iYXNlLCBw
a3QtPmJ1Zl9zaXplLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICBETUFfVE9fREVWSUNFKTsK
PiAtICAgICAgIGtmcmVlKHBrdC0+dmFfYmFzZSk7Cj4gLSAgICAgICBrZnJlZShwa3QpOwo+IC19
Cj4gLQo+ICBzdGF0aWMgdm9pZCBkZHBfY21kcV9jYihzdHJ1Y3QgbWJveF9jbGllbnQgKmNsLCB2
b2lkICptc3NnKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgY21kcV9jYl9kYXRhICpkYXRhID0gbXNz
ZzsKPiBAQCAtMzAyLDcgKzMxMCw2IEBAIHN0YXRpYyB2b2lkIGRkcF9jbWRxX2NiKHN0cnVjdCBt
Ym94X2NsaWVudCAqY2wsIHZvaWQgKm1zc2cpCj4gICAgICAgICB9Cj4KPiAgICAgICAgIG10a19j
cnRjLT5jbWRxX3ZibGFua19jbnQgPSAwOwo+IC0gICAgICAgbXRrX2RybV9jbWRxX3BrdF9kZXN0
cm95KHBrdCk7Cj4gIH0KPiAgI2VuZGlmCj4KPiAtLQo+IDIuMTguMAo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
