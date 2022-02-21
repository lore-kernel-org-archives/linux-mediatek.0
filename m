Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1C2C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 02:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJoO+iXISpSmBOxiaJJ3i1YeZwgXIJ7nhjgAIUfrRbo=; b=yp89YiAmP8xk/7
	+EUT0VgF5h74axmjfwaoDVbT7Uex8qfazhqkhZkm/r7P/Aykqr6yWnb7Fg+dz/qXybM0UjTEvi032
	VeZhGbHBtmD6Td1Hhi62s+Fwfmdj3L573BaHdwvwX/LMDMyJyQxqTU4PUged7/WH9yGYS7nV8dLel
	eWtCT3AyjvUB0S5ZATLXPqIZn/ph1EdlZv3VcRKNgTliO+f5/26nBU+mUNqJ/00GQFk0UvCMcg0lh
	83K2oO5SzPb6cG8Ax9H7B+MUS1AgQwAIY4ErSL+qmH6sZJzG0XzIN4iz5y8GV0KK32MVHn/bMzpUu
	f78dsr9IChQndT7xCa8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLyVb-0032xY-4I; Mon, 21 Feb 2022 02:33:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLyVN-0032st-Hp; Mon, 21 Feb 2022 02:32:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7DC61B80E4C;
 Mon, 21 Feb 2022 02:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26756C340F1;
 Mon, 21 Feb 2022 02:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645410766;
 bh=0jsRD7cxJXC7LM6Gajfxrs8QV4QjeNnPnIXPYuhllT8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FBn02HELnb62R3PHfzhqu3w2/puH9BB71lmp1+JbMtBTQK4iXpp5Gptu5EwUi318o
 axZsZkzxdbnzyd9f4uv7KJJI7MLzGyVAyCThWAj/0SFLgpq6o50spxLTs50HPIqYLg
 CvQbZJmL25f+qYa3avYEiu/660iUkBWV1kHsbiyqJJ2JhkjhUPKuj5zosFy+97WMff
 P6aLZHJVws3yYjudmyiqb1GQ1qSRD6d57rdpB3oM1WSIBmRH3Kwq4MnycwPUnw/KVm
 VMrHL9g31epieHaV/9oDCKO/NSnvsd4+PuPoAmoK85dyjnFTA/6Kca+R7jwh8IHbLa
 yXON4TfoDr1Gg==
Received: by mail-ej1-f46.google.com with SMTP id gb39so29346426ejc.1;
 Sun, 20 Feb 2022 18:32:46 -0800 (PST)
X-Gm-Message-State: AOAM530K2KeCCHaLfdLYV8vcHiQwSQHD+MOexrDJ74wkFoYgRgBPI4gV
 s+UAASFnllRCZ4fh+pcC9YL552wcccdbXyEffg==
X-Google-Smtp-Source: ABdhPJz2uuAFArWvpdO16hER5PM32Ny9J4D8AGVlqgdAATHBKDTbcCog+Sa1GoLGAIMj8A8YCPDI1915gwsrWyH6h64=
X-Received: by 2002:a17:906:2a11:b0:69f:286a:66a7 with SMTP id
 j17-20020a1709062a1100b0069f286a66a7mr14222076eje.680.1645410764208; Sun, 20
 Feb 2022 18:32:44 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-8-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-8-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 10:32:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-5g4fXVTOETDxbn2Cp3MVjFs-Sh9NT1NepfEXUhdJQEw@mail.gmail.com>
Message-ID: <CAAOTY_-5g4fXVTOETDxbn2Cp3MVjFs-Sh9NT1NepfEXUhdJQEw@mail.gmail.com>
Subject: Re: [PATCH v8 07/19] drm/mediatek: dpi: implement a swap_input toggle
 in board config
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 deller@gmx.de, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_183249_910984_4675E81D 
X-CRM114-Status: GOOD (  18.91  )
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

SGksIEd1aWxsYXVtZToKCkd1aWxsYXVtZSBSYW5xdWV0IDxncmFucXVldEBiYXlsaWJyZS5jb20+
IOaWvCAyMDIy5bm0MuaciDE45pelIOmAseS6lCDkuIvljYgxMDo1NuWvq+mBk++8mgo+Cj4gQWRk
cyBhIGJpdCBvZiBmbGV4aWJpbGl0eSB0byBzdXBwb3J0IGJvYXJkcyB3aXRob3V0IHN3YXBfaW5w
dXQgc3VwcG9ydAo+Cj4gU2lnbmVkLW9mZi1ieTogR3VpbGxhdW1lIFJhbnF1ZXQgPGdyYW5xdWV0
QGJheWxpYnJlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGku
YyB8IDE0ICsrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gaW5kZXgg
NTQ1YTEzMzdjYzg5OS4uNDU0Zjg1NjNlZmFlNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYwo+IEBAIC0xMjYsNiArMTI2LDcgQEAgc3RydWN0IG10a19kcGlfY29uZiB7Cj4gICAg
ICAgICBjb25zdCB1MzIgKm91dHB1dF9mbXRzOwo+ICAgICAgICAgdTMyIG51bV9vdXRwdXRfZm10
czsKPiAgICAgICAgIGJvb2wgaXNfY2tfZGVfcG9sOwo+ICsgICAgICAgYm9vbCBzd2FwX2lucHV0
X3N1cHBvcnQ7Cj4gICAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX2RwaV95Y19saW1pdCAqbGltaXQ7
Cj4gIH07Cj4KPiBAQCAtMzc4LDE4ICszNzksMjEgQEAgc3RhdGljIHZvaWQgbXRrX2RwaV9jb25m
aWdfY29sb3JfZm9ybWF0KHN0cnVjdCBtdGtfZHBpICpkcGksCj4gICAgICAgICAgICAgKGZvcm1h
dCA9PSBNVEtfRFBJX0NPTE9SX0ZPUk1BVF9ZQ0JDUl80NDRfRlVMTCkpIHsKPiAgICAgICAgICAg
ICAgICAgbXRrX2RwaV9jb25maWdfeXV2NDIyX2VuYWJsZShkcGksIGZhbHNlKTsKPiAgICAgICAg
ICAgICAgICAgbXRrX2RwaV9jb25maWdfY3NjX2VuYWJsZShkcGksIHRydWUpOwo+IC0gICAgICAg
ICAgICAgICBtdGtfZHBpX2NvbmZpZ19zd2FwX2lucHV0KGRwaSwgZmFsc2UpOwo+ICsgICAgICAg
ICAgICAgICBpZiAoZHBpLT5jb25mLT5zd2FwX2lucHV0X3N1cHBvcnQpCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgbXRrX2RwaV9jb25maWdfc3dhcF9pbnB1dChkcGksIGZhbHNlKTsKPiAgICAg
ICAgICAgICAgICAgbXRrX2RwaV9jb25maWdfY2hhbm5lbF9zd2FwKGRwaSwgTVRLX0RQSV9PVVRf
Q0hBTk5FTF9TV0FQX0JHUik7Cj4gICAgICAgICB9IGVsc2UgaWYgKChmb3JtYXQgPT0gTVRLX0RQ
SV9DT0xPUl9GT1JNQVRfWUNCQ1JfNDIyKSB8fAo+ICAgICAgICAgICAgICAgICAgICAoZm9ybWF0
ID09IE1US19EUElfQ09MT1JfRk9STUFUX1lDQkNSXzQyMl9GVUxMKSkgewo+ICAgICAgICAgICAg
ICAgICBtdGtfZHBpX2NvbmZpZ195dXY0MjJfZW5hYmxlKGRwaSwgdHJ1ZSk7Cj4gICAgICAgICAg
ICAgICAgIG10a19kcGlfY29uZmlnX2NzY19lbmFibGUoZHBpLCB0cnVlKTsKPiAtICAgICAgICAg
ICAgICAgbXRrX2RwaV9jb25maWdfc3dhcF9pbnB1dChkcGksIHRydWUpOwo+ICsgICAgICAgICAg
ICAgICBpZiAoZHBpLT5jb25mLT5zd2FwX2lucHV0X3N1cHBvcnQpCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgbXRrX2RwaV9jb25maWdfc3dhcF9pbnB1dChkcGksIHRydWUpOwoKSW4gTVQ4MTcz
LCBNVDI3MDEsIE1UODE4MywgTVQ4MTkyLCBZQ0JDUl80NDQgd291bGQgbm90IHN3YXAgYnV0CllD
QkNSXzQyMiB3b3VsZCBzd2FwLiBCdXQgSW4gTVQ4MTk1LCBib3RoIFlDQkNSXzQ0NCBhbmQgWUNC
Q1JfNDIyCndvdWxkIG5vdCBzd2FwLCBTbyBJIHRoaW5rIG9uZSBvZiB0aGVzZSBmb3JtYXQgd291
bGQgYmUgYWJub3JtYWwgaW4KTVQ4MTk1LCByaWdodD8gT3Igd291bGQgeW91IHByb3ZpZGUgbW9y
ZSBpbmZvcm1hdGlvbiBhYm91dCBob3cgdGhpcwpzd2FwIHdvcms/CgpSZWdhcmRzLApDaHVuLUt1
YW5nLgoKPiAgICAgICAgICAgICAgICAgbXRrX2RwaV9jb25maWdfY2hhbm5lbF9zd2FwKGRwaSwg
TVRLX0RQSV9PVVRfQ0hBTk5FTF9TV0FQX1JHQik7Cj4gICAgICAgICB9IGVsc2Ugewo+ICAgICAg
ICAgICAgICAgICBtdGtfZHBpX2NvbmZpZ195dXY0MjJfZW5hYmxlKGRwaSwgZmFsc2UpOwo+ICAg
ICAgICAgICAgICAgICBtdGtfZHBpX2NvbmZpZ19jc2NfZW5hYmxlKGRwaSwgZmFsc2UpOwo+IC0g
ICAgICAgICAgICAgICBtdGtfZHBpX2NvbmZpZ19zd2FwX2lucHV0KGRwaSwgZmFsc2UpOwo+ICsg
ICAgICAgICAgICAgICBpZiAoZHBpLT5jb25mLT5zd2FwX2lucHV0X3N1cHBvcnQpCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgbXRrX2RwaV9jb25maWdfc3dhcF9pbnB1dChkcGksIGZhbHNlKTsK
PiAgICAgICAgICAgICAgICAgbXRrX2RwaV9jb25maWdfY2hhbm5lbF9zd2FwKGRwaSwgTVRLX0RQ
SV9PVVRfQ0hBTk5FTF9TV0FQX1JHQik7Cj4gICAgICAgICB9Cj4gIH0KPiBAQCAtODA4LDYgKzgx
Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE3M19jb25mID0gewo+
ICAgICAgICAgLm91dHB1dF9mbXRzID0gbXQ4MTczX291dHB1dF9mbXRzLAo+ICAgICAgICAgLm51
bV9vdXRwdXRfZm10cyA9IEFSUkFZX1NJWkUobXQ4MTczX291dHB1dF9mbXRzKSwKPiAgICAgICAg
IC5pc19ja19kZV9wb2wgPSB0cnVlLAo+ICsgICAgICAgLnN3YXBfaW5wdXRfc3VwcG9ydCA9IHRy
dWUsCj4gICAgICAgICAubGltaXQgPSAmbXRrX2RwaV9saW1pdCwKPiAgfTsKPgo+IEBAIC04MTks
NiArODI0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQyNzAxX2NvbmYg
PSB7Cj4gICAgICAgICAub3V0cHV0X2ZtdHMgPSBtdDgxNzNfb3V0cHV0X2ZtdHMsCj4gICAgICAg
ICAubnVtX291dHB1dF9mbXRzID0gQVJSQVlfU0laRShtdDgxNzNfb3V0cHV0X2ZtdHMpLAo+ICAg
ICAgICAgLmlzX2NrX2RlX3BvbCA9IHRydWUsCj4gKyAgICAgICAuc3dhcF9pbnB1dF9zdXBwb3J0
ID0gdHJ1ZSwKPiAgICAgICAgIC5saW1pdCA9ICZtdGtfZHBpX2xpbWl0LAo+ICB9Owo+Cj4gQEAg
LTgyOSw2ICs4MzUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDgxODNf
Y29uZiA9IHsKPiAgICAgICAgIC5vdXRwdXRfZm10cyA9IG10ODE4M19vdXRwdXRfZm10cywKPiAg
ICAgICAgIC5udW1fb3V0cHV0X2ZtdHMgPSBBUlJBWV9TSVpFKG10ODE4M19vdXRwdXRfZm10cyks
Cj4gICAgICAgICAuaXNfY2tfZGVfcG9sID0gdHJ1ZSwKPiArICAgICAgIC5zd2FwX2lucHV0X3N1
cHBvcnQgPSB0cnVlLAo+ICAgICAgICAgLmxpbWl0ID0gJm10a19kcGlfbGltaXQsCj4gIH07Cj4K
PiBAQCAtODM5LDYgKzg0Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10
ODE5Ml9jb25mID0gewo+ICAgICAgICAgLm91dHB1dF9mbXRzID0gbXQ4MTczX291dHB1dF9mbXRz
LAo+ICAgICAgICAgLm51bV9vdXRwdXRfZm10cyA9IEFSUkFZX1NJWkUobXQ4MTczX291dHB1dF9m
bXRzKSwKPiAgICAgICAgIC5pc19ja19kZV9wb2wgPSB0cnVlLAo+ICsgICAgICAgLnN3YXBfaW5w
dXRfc3VwcG9ydCA9IHRydWUsCj4gICAgICAgICAubGltaXQgPSAmbXRrX2RwaV9saW1pdCwKPiAg
fTsKPgo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
