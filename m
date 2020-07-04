Return-Path: <SRS0=EBBG=AP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99663C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 23:43:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6990D20772
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 23:43:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EK7+OyNo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOTnF7WF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6990D20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d5q293wkQsiVdoy4ng/efh5/WB11QweAaBcjEENxeTk=; b=EK7+OyNo/SnjahjOtL06RCpoe
	4wvtvpizoTMkAiJdbli04bf8CE6Rw1MB3mSyjmAuHBihvCts3l/0PVCyoNhIFlDKtVm6LjRt2DITg
	LxWPKBRyCsDDHrS/H6cw0z8aO9W1EUF/YV11kCclyIQ1Qak3crokLtIbTGciTf3/6jJh6i8gHDznO
	sssd8VqkGylvVThfWFcGqttMVwRzJ58a8dB4VFoIaIuWIi86wsz5SbXAYIk6yjWpEuKE35xg5dXMu
	eYrcEX1KeNkeEqo7QAKE5WDCCzZ1cDPBQuVukJ5iYy8WfKeaMiDnKS5y2hnN9yBUhFVWW6q1VESTX
	SPpgdQ9uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrrnz-0005j6-Ub; Sat, 04 Jul 2020 23:42:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrrns-0005i6-Rn; Sat, 04 Jul 2020 23:42:41 +0000
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B8C6520870;
 Sat,  4 Jul 2020 23:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593906160;
 bh=tKeXckq/cljxhi5PiM5Dr9pzZi/BIbGaNVQdbwe/LTw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XOTnF7WFbN+I3+4XbpNUfQdU9F2XN8kWx2sQS96lM0g+xtAJffleOtqFCHmgYwUyw
 8mmAP1WBG857Srm8CXxA6AQXXLRl+bAa+Cek+IuM9wmJz8JvEUGQYHKSM7KUshNJ6j
 N4X77ofJAoIvqifk6YTo2zEE5epKUYsfe2G1PyoQ=
Received: by mail-ej1-f44.google.com with SMTP id a1so38603000ejg.12;
 Sat, 04 Jul 2020 16:42:39 -0700 (PDT)
X-Gm-Message-State: AOAM531lMXSWCtbW3kexMb3MRRmw6huCeLIYVK76Se+bu+RYF/mXT027
 b7Z+iUbds8DOa161CdHjU/o7tPwNEWIsfxDPRw==
X-Google-Smtp-Source: ABdhPJwfuIFm+ZpQSysHQPpOfHT3QfoveqSeIAFpPPao09rGA3nmGZIPzTn+hkhaV5sDiarPLt0IrUMCan35uDuvI3A=
X-Received: by 2002:a17:906:1e83:: with SMTP id
 e3mr23048914ejj.7.1593906158358; 
 Sat, 04 Jul 2020 16:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200615203108.786083-1-enric.balletbo@collabora.com>
 <20200615203108.786083-6-enric.balletbo@collabora.com>
In-Reply-To: <20200615203108.786083-6-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Jul 2020 07:42:27 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9pLOMSx+8YzP6YQFJM+rqjoaJUzg3Y8xf3+GqYJCCf7Q@mail.gmail.com>
Message-ID: <CAAOTY_9pLOMSx+8YzP6YQFJM+rqjoaJUzg3Y8xf3+GqYJCCf7Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 5/7] drm/mediatek: mtk_dsi: Use simple encoder
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200704_194241_074304_6006C948 
X-CRM114-Status: GOOD (  16.81  )
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
 Nicolas Boichat <drinkcat@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ25pyIMTbml6Ug6YCx5LqMIOS4iuWNiDQ6MzHlr6vpgZPvvJoK
Pgo+IFRoZSBtdGtfZHNpIGRyaXZlciB1c2VzIGFuIGVtcHR5IGltcGxlbWVudGF0aW9uIGZvciBp
dHMgZW5jb2Rlci4gUmVwbGFjZQo+IHRoZSBjb2RlIHdpdGggdGhlIGdlbmVyaWMgc2ltcGxlIGVu
Y29kZXIuCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5o
dS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5n
LgoKPgo+IFNpZ25lZC1vZmYtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxl
dGJvQGNvbGxhYm9yYS5jb20+Cj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4KPiAtLS0KPgo+IENoYW5nZXMgaW4gdjQ6IE5vbmUKPiBDaGFuZ2VzIGlu
IHYzOiBOb25lCj4gQ2hhbmdlcyBpbiB2MjogTm9uZQo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMgfCAxMyArKy0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jCj4gaW5kZXggNzU5YTViMzdmYjRkMi4uZTAyZDE2YTA4NmFjMCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYwo+IEBAIC03ODksMTUgKzc4OSw2IEBAIHN0YXRpYyB2b2lkIG10
a19vdXRwdXRfZHNpX2Rpc2FibGUoc3RydWN0IG10a19kc2kgKmRzaSkKPiAgICAgICAgIGRzaS0+
ZW5hYmxlZCA9IGZhbHNlOwo+ICB9Cj4KPiAtc3RhdGljIHZvaWQgbXRrX2RzaV9lbmNvZGVyX2Rl
c3Ryb3koc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQo+IC17Cj4gLSAgICAgICBkcm1fZW5j
b2Rlcl9jbGVhbnVwKGVuY29kZXIpOwo+IC19Cj4gLQo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9lbmNvZGVyX2Z1bmNzIG10a19kc2lfZW5jb2Rlcl9mdW5jcyA9IHsKPiAtICAgICAgIC5kZXN0
cm95ID0gbXRrX2RzaV9lbmNvZGVyX2Rlc3Ryb3ksCj4gLX07Cj4gLQo+ICBzdGF0aWMgaW50IG10
a19kc2lfY3JlYXRlX2Nvbm5fZW5jKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCBtdGtf
ZHNpICpkc2kpOwo+ICBzdGF0aWMgdm9pZCBtdGtfZHNpX2Rlc3Ryb3lfY29ubl9lbmMoc3RydWN0
IG10a19kc2kgKmRzaSk7Cj4KPiBAQCAtMTEyNyw4ICsxMTE4LDggQEAgc3RhdGljIGludCBtdGtf
ZHNpX2VuY29kZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgbXRrX2RzaSAq
ZHNpKQo+ICB7Cj4gICAgICAgICBpbnQgcmV0Owo+Cj4gLSAgICAgICByZXQgPSBkcm1fZW5jb2Rl
cl9pbml0KGRybSwgJmRzaS0+ZW5jb2RlciwgJm10a19kc2lfZW5jb2Rlcl9mdW5jcywKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX01PREVfRU5DT0RFUl9EU0ksIE5VTEwpOwo+
ICsgICAgICAgcmV0ID0gZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoZHJtLCAmZHNpLT5lbmNvZGVy
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX01PREVfRU5DT0RF
Ul9EU0kpOwo+ICAgICAgICAgaWYgKHJldCkgewo+ICAgICAgICAgICAgICAgICBEUk1fRVJST1Io
IkZhaWxlZCB0byBlbmNvZGVyIGluaXQgdG8gZHJtXG4iKTsKPiAgICAgICAgICAgICAgICAgcmV0
dXJuIHJldDsKPiAtLQo+IDIuMjcuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
