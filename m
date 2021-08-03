Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EFDC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 10:29:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCB3860F58
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 10:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCB3860F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kc7cSvOGGcWoeASYLCxOuEr3UbD4dz8zN/gO+gAUNOo=; b=AwLfFebA5J793c
	ugWbcR3eVccerCeTC/UotWryyXBZauMYD6Poy2K/rAVmOT1zGtRq1f9LEXfE4jq1VA+YxiwNjozqX
	jcf+PH9MzTkVfCq+IY/OsA/WEJr4V4VLt9+/YgWUAWA0mWQWJvR574pItdvr0KJsK/dQ8VV9yZpP7
	KiJUQZe1s6IP/j60QD5p0Xpp9kH1tUjA8dJ12jyFOLnhF7gGdygMDO4CaYn1Vju1sZP+wEKvTv5sU
	zB90ewN0tjRUunyU3cBQmyeh05Np5X44kNVeYhsnC5uzFWgVER3UXshIoryaSLHPAPKcjopSO/T69
	0ONdwNLb1aIt94KSGnvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mArfe-0021dH-FC; Tue, 03 Aug 2021 10:29:14 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mArdq-0020iJ-VW; Tue, 03 Aug 2021 10:27:24 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 o2-20020a9d22020000b0290462f0ab0800so20217636ota.11; 
 Tue, 03 Aug 2021 03:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CD6neHzHPjoDd8dxdauboHpEOxJG+rtfwmy3RnpVYAU=;
 b=uKUH4atrDaR/JLojmmlOzgdhs3uX7Xv1tWVjAphKOQTwBs1kRHG6w6vQ3s2Dy4fEUr
 pbGynpcDWghu7obBLK4CxNguJbd5M12Ru8nwqerBvZwZ0x8QlJMHCR+JiWboOLFCRwEj
 DkCb49Ctv6zeaHbqugStnotGm9JAoouNVa0zrQHDRTS2NZT/YB8Nl4IF2XJY/LxjZtxp
 lxhaopguCHFv0VGbhRXa9GPtb22/fridJfBe/JzlVjIWgqSmoJ1mnvFQBFFpFRvxlfJI
 cP41oz3ynRNhVSuqcOEZG7MQBGu8olId15ykPWeDBKp2EZQvQCbXkpW1yHtV0pUFrz7Q
 ml2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CD6neHzHPjoDd8dxdauboHpEOxJG+rtfwmy3RnpVYAU=;
 b=Q73mfVeN/srctpfXvNe2cSqmH1C/08xQl4RvdukrIUSngdZKv3niwD73BpKxN2SST0
 XSZCcUzGfc1IJQFsMj6Hk9o3ehicM+G6HTL0bXzG+Q1+rgbuHCZs9EHq49uU3updAabh
 Kndrnuwdx0L2Ta0Dz3dcqc0vB0XVHI75Z35dZCKXuYT8mOcCvxYIKf+23ZGte2q1eXtd
 iWt4ZCHaQ5PsK5E1ywaNc6Vr9jHWF33VmVHNv3YXM7w27J9gNpIFP3PS0Lhxeheg9kAS
 +7mwIbg9DZ3eIprIl8L3VhgBFX+J3lWR4jpcS0shkXCFKp2aHVKS6tO/PN25Xd6fanbm
 Yxlg==
X-Gm-Message-State: AOAM530RgufQCwHny32bAzNrGoLqfGfasBAVZZXqP6XQcfbnA05JgJYR
 gK7dlZ0f7jJXqhxVSHRpvehgqe2/7G7QP/lTMao=
X-Google-Smtp-Source: ABdhPJzSf7Z3GXEQbh0IMHTfaFgu9OXz6HWXN6vP8pmf4x9H4XgdAHEeJ9E76OyLEBAAectp3pUCaIqOxX3fnlWsOr4=
X-Received: by 2002:a9d:6490:: with SMTP id g16mr14922669otl.184.1627986441719; 
 Tue, 03 Aug 2021 03:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.6.Ie4214d2cc73ab276dd7c41d4f63c98e011fb42d4@changeid>
In-Reply-To: <20210802220943.v6.6.Ie4214d2cc73ab276dd7c41d4f63c98e011fb42d4@changeid>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 3 Aug 2021 12:27:07 +0200
Message-ID: <CAFqH_51Vn1VSbL8BU=J0gpOm9c7zevX2o6qWf=-hFp1tbeN-Aw@mail.gmail.com>
Subject: Re: [PATCH v6 6/9] soc: mediatek: mmsys: instantiate mdp virtual
 device from mmsys
To: Eizan Miyamoto <eizan@chromium.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, 
 Houlong Wei <houlong.wei@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 devicetree <devicetree@vger.kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_032723_139153_EC4331E4 
X-CRM114-Status: GOOD (  21.73  )
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

SGkgRWl6YW4sCgpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guCgpNaXNzYXRnZSBkZSBFaXphbiBN
aXlhbW90byA8ZWl6YW5AY2hyb21pdW0ub3JnPiBkZWwgZGlhIGRsLiwgMiBk4oCZYWcuCjIwMjEg
YSBsZXMgMTQ6MTQ6Cj4KPiBBIHZpcnR1YWwgZGV2aWNlIHRoYXQgaXMgcHJvYmVkIGJ5IHRoZSBt
dGtfbWRwX2NvcmUgZHJpdmVyIGlzCj4gaW5zdGFudGlhdGVkIGJ5IHRoZSBtdGtfbW1zeXMgZHJp
dmVyLgo+Cj4gVGhpcyBiZXR0ZXIgcmVmbGVjdHMgdGhlIGxvZ2ljYWwgb3JnYW5pemF0aW9uIG9m
IHRoZSBoYXJkd2FyZSBhbmQKPiBkcml2ZXI6IHRoZXJlIGFyZSBhIG51bWJlciBvZiBoYXJkd2Fy
ZSBibG9ja3MgdGhhdCBhcmUgdXNlZCBieSB0aGUgTURQCj4gdGhhdCBoYXZlIG5vIHN0cmljdCBo
aWVyYXJjaHksIGFuZCB0aGUgc29mdHdhcmUgZHJpdmVyIGlzIHJlc3BvbnNpYmxlCj4gZm9yIGRy
aXZpbmcgdGhlbSBwcm9wZXJseS4KPgo+IFNpZ25lZC1vZmYtYnk6IEVpemFuIE1peWFtb3RvIDxl
aXphbkBjaHJvbWl1bS5vcmc+CgpSZXZpZXdlZC1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8
ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KCgo+IC0tLQo+Cj4gKG5vIGNoYW5nZXMgc2lu
Y2UgdjEpCj4KPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMgfCAyMCArKysrKysr
KysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5j
IGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMKPiBpbmRleCAwODA2NjBlZjExYmYu
LmU2ODEwMjlmZTgwNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1z
eXMuYwo+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jCj4gQEAgLTk3LDYg
Kzk3LDcgQEAgc3RhdGljIGludCBtdGtfbW1zeXNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPiAgICAgICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmNsa3M7Cj4gICAgICAg
ICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkcm07Cj4gICAgICAgICBzdHJ1Y3QgbXRrX21tc3lz
ICptbXN5czsKPiArICAgICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm1kcDsKPiAgICAgICAg
IGludCByZXQ7Cj4KPiAgICAgICAgIG1tc3lzID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpt
bXN5cyksIEdGUF9LRVJORUwpOwo+IEBAIC0xMjIsMTAgKzEyMywyNyBAQCBzdGF0aWMgaW50IG10
a19tbXN5c19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUExBVEZPUk1fREVWSURfQVVUTywgTlVM
TCwgMCk7Cj4gICAgICAgICBpZiAoSVNfRVJSKGRybSkpIHsKPiAgICAgICAgICAgICAgICAgcGxh
dGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIoY2xrcyk7Cj4gLSAgICAgICAgICAgICAgIHJldHVybiBQ
VFJfRVJSKGRybSk7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoZHJtKTsKPiArICAg
ICAgICAgICAgICAgZ290byBlcnJfZHJtOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIG1kcCA9
IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9kYXRhKCZwZGV2LT5kZXYsICJtdGstbWRwIiwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBMQVRGT1JNX0RFVklE
X0FVVE8sIE5VTEwsIDApOwo+ICsgICAgICAgaWYgKElTX0VSUihtZHApKSB7Cj4gKyAgICAgICAg
ICAgICAgIHJldCA9IFBUUl9FUlIobWRwKTsKPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYs
ICJGYWlsZWQgdG8gcmVnaXN0ZXIgbWRwOiAlZFxuIiwgcmV0KTsKPiArICAgICAgICAgICAgICAg
Z290byBlcnJfbWRwOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICByZXR1cm4gMDsKPiArCj4gK2Vy
cl9tZHA6Cj4gKyAgICAgICBwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3Rlcihkcm0pOwo+ICsKPiAr
ZXJyX2RybToKPiArICAgICAgIHBsYXRmb3JtX2RldmljZV91bnJlZ2lzdGVyKGNsa3MpOwo+ICsK
PiArICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBvZl9tYXRjaF9tdGtfbW1zeXNbXSA9IHsKPiAtLQo+IDIuMzIuMC41NTQuZ2UxYjMy
NzA2ZDgtZ29vZwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
