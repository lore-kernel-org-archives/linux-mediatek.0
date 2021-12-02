Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0EAC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 23:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VFSpdIgoXPrI+vE4sBC+JmgSQZYRBq8J0iW1ZOR6jo=; b=bh4aFntbpmJh4Q
	zFGcMYwrTcAur18qSHPZFN3R7rLzPq1LWzY4WVm49ZPW7z+vdhK0lsRtJTtWoUBtbhgVlez69DUoe
	7Ol9k0S1EOU4mPvLMUROm2asbhNDGYSibNgW/nuC4s691taubAz5OBvoTACwNol63NfJi++P4ftEU
	G54lCZBibxNc6bLSHWOPSCvfnZcaFk7GpQ+MuJW5xn+SgmpEQcRl3WUTv7F6mb4OTvvL8JnjmE9s/
	TH19JEsbDUDFZGlG/HqesBRcKPnbL3TvNg5KPfqDCGdQtgxZDmUmXa8At4pM0utPXqptP08HQkwEF
	XtoVkXEo3NsxNiUZp/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msvVq-00DguM-PH; Thu, 02 Dec 2021 23:29:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msvVe-00Dgrd-Aw; Thu, 02 Dec 2021 23:29:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C6CE628E5;
 Thu,  2 Dec 2021 23:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77885C56748;
 Thu,  2 Dec 2021 23:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638487740;
 bh=x9+AHUkQCOiqghjiOuxg43GrGaB2yXrjutnjOZ/BKZk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FB38vPcPhJtDAa7gwR7nCg9gVW4IOC4J9u+qm9uo/hDxAlVU+p780+uh2TnJVtymc
 YtNtt/fctp+SCzb5LulUvrJGDUuLHf1BfP1lVlWQAYfrHvvK5HZjnhxEH73Nxm3REg
 4uBQMaEtxHzF9A7YR6mLSWDdt1WM200z2CkXPT7KvPAWVCk5j3355A8/X7HspIdoug
 YNSP0gVU4oahjz+k6sTy4yXcenRX+gax5mJKtye9lv1WUYMaXcJQKJkD9qtEfR1fqw
 2RgmjZjNAXbc2TfZDrO+1lBC58BGEofVsJUfs5AstgogD/zevUo3fkx5F/dVlN2hEd
 2NJYQVfKG7wjQ==
Received: by mail-ed1-f52.google.com with SMTP id o20so4189570eds.10;
 Thu, 02 Dec 2021 15:29:00 -0800 (PST)
X-Gm-Message-State: AOAM532GmBxZWf8Rj9zZ93L9S7n0R6XDwGycQGb6PdzM4B/gf/kv2A4r
 O/EsqN7/dWOmOB5HIsNhPUGCev0Gqo23mH5PFg==
X-Google-Smtp-Source: ABdhPJzchGTC1yIIjWQs99ltF4+dCQ5spTXhXM3s94zaW+OhpNqLXMKcwrQubvNqWrkA5EisVV/cVqs7ewp8qqNCFKk=
X-Received: by 2002:a05:6402:1e93:: with SMTP id
 f19mr22106395edf.60.1638487738419; 
 Thu, 02 Dec 2021 15:28:58 -0800 (PST)
MIME-Version: 1.0
References: <20211202064039.20797-1-jason-jh.lin@mediatek.com>
 <20211202064039.20797-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20211202064039.20797-3-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 3 Dec 2021 07:28:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8CYuLZbyPWyitVZkc_5C-63seevLP=gCMNkg_+rDJZdw@mail.gmail.com>
Message-ID: <CAAOTY_8CYuLZbyPWyitVZkc_5C-63seevLP=gCMNkg_+rDJZdw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/mediatek: add devlink to cmdq dev
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, tzungbi@google.com, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fei Shao <fshao@chromium.org>, Nancy Lin <nancy.lin@mediatek.com>,
 singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_152902_486157_96B18640 
X-CRM114-Status: GOOD (  21.52  )
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
MjAyMeW5tDEy5pyIMuaXpSDpgLHlm5sg5LiL5Y2IMjo0MeWvq+mBk++8mgo+Cj4gQWRkIGRldmxp
bmsgdG8gY21kcSB0byBtYWtlIHN1cmUgdGhlIG9yZGVyIG9mIHN1c3BlbmQgYW5kIHJlc3VtZQo+
IGlzIGNvcnJlY3QuCj4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVA
a2VybmVsLm9yZz4KCj4gU2lnbmVkLW9mZi1ieTogamFzb24tamgubGluIDxqYXNvbi1qaC5saW5A
bWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9j
cnRjLmMgfCA0MyArKysrKysrKysrKysrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
MSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9jcnRjLmMKPiBpbmRleCAwYjQwMTIzMzVlN2EuLjYxMmQxZDY5YzE2YyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBAQCAtNjAsNiArNjAs
NyBAQCBzdHJ1Y3QgbXRrX2RybV9jcnRjIHsKPiAgI2VuZGlmCj4KPiAgICAgICAgIHN0cnVjdCBk
ZXZpY2UgICAgICAgICAgICAgICAgICAgKm1tc3lzX2RldjsKPiArICAgICAgIHN0cnVjdCBkZXZp
Y2UgICAgICAgICAgICAgICAgICAgKmRybV9kZXY7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX211dGV4
ICAgICAgICAgICAgICAgICptdXRleDsKPiAgICAgICAgIHVuc2lnbmVkIGludCAgICAgICAgICAg
ICAgICAgICAgZGRwX2NvbXBfbnI7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2RkcF9jb21wICAgICAg
ICAgICAgICoqZGRwX2NvbXA7Cj4gQEAgLTE1OSw2ICsxNjAsNyBAQCBzdGF0aWMgdm9pZCBtdGtf
ZHJtX2NydGNfZGVzdHJveShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4gICAgICAgICBtdGtfZHJt
X2NtZHFfcGt0X2Rlc3Ryb3koJm10a19jcnRjLT5jbWRxX2hhbmRsZSk7Cj4KPiAgICAgICAgIGlm
IChtdGtfY3J0Yy0+Y21kcV9jbGllbnQuY2hhbikgewo+ICsgICAgICAgICAgICAgICBkZXZpY2Vf
bGlua19yZW1vdmUobXRrX2NydGMtPmRybV9kZXYsIG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFu
LT5tYm94LT5kZXYpOwo+ICAgICAgICAgICAgICAgICBtYm94X2ZyZWVfY2hhbm5lbChtdGtfY3J0
Yy0+Y21kcV9jbGllbnQuY2hhbik7Cj4gICAgICAgICAgICAgICAgIG10a19jcnRjLT5jbWRxX2Ns
aWVudC5jaGFuID0gTlVMTDsKPiAgICAgICAgIH0KPiBAQCAtOTAyLDYgKzkwNCw3IEBAIGludCBt
dGtfZHJtX2NydGNfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2LAo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gLUVOT01FTTsKPgo+ICAgICAgICAgbXRrX2NydGMtPm1tc3lzX2RldiA9
IHByaXYtPm1tc3lzX2RldjsKPiArICAgICAgIG10a19jcnRjLT5kcm1fZGV2ID0gcHJpdi0+ZGV2
Owo+ICAgICAgICAgbXRrX2NydGMtPmRkcF9jb21wX25yID0gcGF0aF9sZW47Cj4gICAgICAgICBt
dGtfY3J0Yy0+ZGRwX2NvbXAgPSBkZXZtX2ttYWxsb2NfYXJyYXkoZGV2LCBtdGtfY3J0Yy0+ZGRw
X2NvbXBfbnIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2l6ZW9mKCptdGtfY3J0Yy0+ZGRwX2NvbXApLAo+IEBAIC05NjksNiArOTcyLDE4IEBAIGlu
dCBtdGtfZHJtX2NydGNfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2LAo+ICAgICAg
ICAgfQo+Cj4gICAgICAgICBpZiAobXRrX2NydGMtPmNtZHFfY2xpZW50LmNoYW4pIHsKPiArICAg
ICAgICAgICAgICAgc3RydWN0IGRldmljZV9saW5rICpsaW5rOwo+ICsKPiArICAgICAgICAgICAg
ICAgLyogYWRkIGRldmxpbmsgdG8gY21kcSBkZXYgdG8gbWFrZSBzdXJlIHN1c3BlbmQvcmVzdW1l
IG9yZGVyIGlzIGNvcnJlY3QgKi8KPiArICAgICAgICAgICAgICAgbGluayA9IGRldmljZV9saW5r
X2FkZChwcml2LT5kZXYsIG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFuLT5tYm94LT5kZXYsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRExfRkxBR19QTV9SVU5USU1F
IHwgRExfRkxBR19TVEFURUxFU1MpOwo+ICsgICAgICAgICAgICAgICBpZiAoIWxpbmspIHsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKHByaXYtPmRldiwgIlVuYWJsZSB0byBsaW5r
IGRldj0lc1xuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9uYW1lKG10
a19jcnRjLT5jbWRxX2NsaWVudC5jaGFuLT5tYm94LT5kZXYpKTsKPiArICAgICAgICAgICAgICAg
ICAgICAgICByZXQgPSAtRU5PREVWOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gY21k
cV9lcnI7Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4gICAgICAgICAgICAgICAgIHJldCA9IG9m
X3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KHByaXYtPm11dGV4X25vZGUsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJtZWRpYXRlayxnY2UtZXZlbnRz
IiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaSwK
PiBAQCAtOTc2LDIyICs5OTEsMjYgQEAgaW50IG10a19kcm1fY3J0Y19jcmVhdGUoc3RydWN0IGRy
bV9kZXZpY2UgKmRybV9kZXYsCj4gICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBkZXZfZGJnKGRldiwgIm10a19jcnRjICVkIGZhaWxlZCB0byBnZXQg
bWVkaWF0ZWssZ2NlLWV2ZW50cyBwcm9wZXJ0eVxuIiwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGRybV9jcnRjX2luZGV4KCZtdGtfY3J0Yy0+YmFzZSkpOwo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIG1ib3hfZnJlZV9jaGFubmVsKG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFu
KTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBtdGtfY3J0Yy0+Y21kcV9jbGllbnQuY2hhbiA9
IE5VTEw7Cj4gLSAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgcmV0ID0gbXRrX2RybV9jbWRxX3BrdF9jcmVhdGUoJm10a19jcnRjLT5jbWRxX2NsaWVudCwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
bXRrX2NydGMtPmNtZHFfaGFuZGxlLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFBBR0VfU0laRSk7Cj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgaWYgKHJldCkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2RiZyhk
ZXYsICJtdGtfY3J0YyAlZCBmYWlsZWQgdG8gY3JlYXRlIGNtZHEgcGFja2V0XG4iLAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fY3J0Y19pbmRleCgmbXRrX2Ny
dGMtPmJhc2UpKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1ib3hfZnJlZV9j
aGFubmVsKG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFuKTsKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFuID0gTlVMTDsKPiAtICAgICAg
ICAgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBjbWRxX2Vy
cjsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgcmV0ID0gbXRrX2Ry
bV9jbWRxX3BrdF9jcmVhdGUoJm10a19jcnRjLT5jbWRxX2NsaWVudCwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJm10a19jcnRjLT5jbWRxX2hhbmRsZSwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFHRV9TSVpF
KTsKPiArICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGRldl9kYmcoZGV2LCAibXRrX2NydGMgJWQgZmFpbGVkIHRvIGNyZWF0ZSBjbWRxIHBhY2tldFxu
IiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9jcnRjX2luZGV4KCZtdGtf
Y3J0Yy0+YmFzZSkpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gY21kcV9lcnI7Cj4g
ICAgICAgICAgICAgICAgIH0KPgo+ICAgICAgICAgICAgICAgICAvKiBmb3Igc2VuZGluZyBibG9j
a2luZyBjbWQgaW4gY3J0YyBkaXNhYmxlICovCj4gICAgICAgICAgICAgICAgIGluaXRfd2FpdHF1
ZXVlX2hlYWQoJm10a19jcnRjLT5jYl9ibG9ja2luZ19xdWV1ZSk7Cj4gKwo+ICtjbWRxX2VycjoK
PiArICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIG1i
b3hfZnJlZV9jaGFubmVsKG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFuKTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICBtdGtfY3J0Yy0+Y21kcV9jbGllbnQuY2hhbiA9IE5VTEw7Cj4gKyAgICAg
ICAgICAgICAgIH0KPiAgICAgICAgIH0KPiAgI2VuZGlmCj4gICAgICAgICByZXR1cm4gMDsKPiAt
LQo+IDIuMTguMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
