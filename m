Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AA4C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 02:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHEvm257vvFYIhNxP1YgCE2pnHDcr/rLlAD8qCmei+E=; b=BiiWM5qXAhYyW3
	80hmG+tPBNZqvTgxrxpwJuDHDh+xY46bVjevmk4eZqjwnA99iZXpC5iABWOHSILTgonfhPPtBQR8z
	QouFdp3MF1SBn/7Joc9AkqsPNocarEjhNhbvw3eca5PqprafMlDfWiSr3mGs5WzllAfpCi5OLrN2q
	wT/adsO33CDEgEjtEovmX97EapF0yhVOOtlWaiBI5nWqswAbzd4YLGK6zPRiVqaPI9fbQN/m4Hsmh
	w820gEdZZK6tB5q+rQfb4erbUuZzJYYz0UhdL+9Xc+qDNNjd/baGUnNVVXwRtvUOIRvFENbsLmrM8
	bEuB7GvgOTZTrWLMfagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLyeo-0035gQ-TY; Mon, 21 Feb 2022 02:42:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLyeY-0035YP-6C; Mon, 21 Feb 2022 02:42:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B2000B80E3B;
 Mon, 21 Feb 2022 02:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B97C340F1;
 Mon, 21 Feb 2022 02:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645411335;
 bh=UoHRsl3ZRU96P18QpcHnKzchZjXnC/+CtpXF8Fb9d9M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TvEfk/DJshewSDRHr+mPkPbV5Xz09ioUMe64CpUYz62fFQk5AmGG5IEjAsKPhKkbc
 vGNT+98FEBhkOQBPc2LHU6lIHJa4WjSHJ3+LVcTj1mKceOF+e/+kIjiiTp2xVmXbmF
 MKo4QUlKS3g9N2jyCcZkM1Sq40G/NM9o9y5L3GFw/vmyXAedvoRRrtQuihl+4SxUoN
 igmCYbLLlOXfOBHviflgix2yh8tUZ6HasKD2ZwFll0efa7Wq+NqltIFXR3rbXJyOPl
 Hl6lcyw/2J9XTKGBTrVnCJFYHRCJ6QliVP8qEWFQdaTD3nhaaZtz1Y4KBKtG115UA7
 0hELCQD3xeaZQ==
Received: by mail-ed1-f44.google.com with SMTP id q17so26492889edd.4;
 Sun, 20 Feb 2022 18:42:15 -0800 (PST)
X-Gm-Message-State: AOAM532BIyohJidlvYpVk1sKigl0YXKvMgXK85nJCkGODzgaaX1gUOLp
 Yqg0c+JhJetNojQmbjRGO+d6EDyUWHHSmYQUCQ==
X-Google-Smtp-Source: ABdhPJwyhQ8g6xId+nP3ywHJC4Vyf7eb8yCWYnRKPDN4W18Y6Mb3ube6YcGgaWJ1wL9cRdkzuByPNaa5ERA+yGBQhSw=
X-Received: by 2002:a05:6402:5194:b0:409:97ec:3bdc with SMTP id
 q20-20020a056402519400b0040997ec3bdcmr19568718edd.314.1645411333805; Sun, 20
 Feb 2022 18:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-9-granquet@baylibre.com>
 <CAAOTY_8V91XH4sKeRfSz6hRPhXm15GBkQ76LWtfBBU5cAtWMqA@mail.gmail.com>
In-Reply-To: <CAAOTY_8V91XH4sKeRfSz6hRPhXm15GBkQ76LWtfBBU5cAtWMqA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 10:42:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9cmJn1CzYMqWwidwMavhoEX24muNuoWT+ZbQWUirqEFA@mail.gmail.com>
Message-ID: <CAAOTY_9cmJn1CzYMqWwidwMavhoEX24muNuoWT+ZbQWUirqEFA@mail.gmail.com>
Subject: Re: [PATCH v8 08/19] drm/mediatek: dpi: move dimension mask to board
 config
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Guillaume Ranquet <granquet@baylibre.com>,
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
X-CRM114-CacheID: sfid-20220220_184218_560530_A594AB46 
X-CRM114-Status: GOOD (  17.09  )
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

SGksIEd1aWxsYXVtZToKCkNodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiDm
lrwgMjAyMuW5tDLmnIgyMeaXpSDpgLHkuIAg5LiK5Y2IMTA6NDDlr6vpgZPvvJoKPgo+IEhJLCBH
dWlsbGF1bWU6Cj4KPiBHdWlsbGF1bWUgUmFucXVldCA8Z3JhbnF1ZXRAYmF5bGlicmUuY29tPiDm
lrwgMjAyMuW5tDLmnIgxOOaXpSDpgLHkupQg5LiL5Y2IMTA6NTblr6vpgZPvvJoKPiA+Cj4gPiBB
ZGQgZmxleGliaWxpdHkgYnkgbW92aW5nIHRoZSBkaW1lbnNpb24gbWFzayB0byB0aGUgYm9hcmQg
Y29uZmlnCj4KPiBBZnRlciBjaGFuZ2UgJ2JvYXJkJyB0byAnU29DJywKPgo+IFJldmlld2VkLWJ5
OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEd1aWxsYXVtZSBSYW5xdWV0IDxncmFucXVldEBiYXlsaWJyZS5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIHwgMjYgKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gPiBp
bmRleCA0NTRmODU2M2VmYWU0Li44Y2EzNDU1ZWQ2NGVlIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcGkuYwo+ID4gQEAgLTEyNyw2ICsxMjcsOCBAQCBzdHJ1Y3QgbXRrX2RwaV9j
b25mIHsKPiA+ICAgICAgICAgdTMyIG51bV9vdXRwdXRfZm10czsKPiA+ICAgICAgICAgYm9vbCBp
c19ja19kZV9wb2w7Cj4gPiAgICAgICAgIGJvb2wgc3dhcF9pbnB1dF9zdXBwb3J0Owo+ID4gKyAg
ICAgICAvLyBNYXNrIHVzZWQgZm9yIEhXSURUSCwgSFBPUkNILCBWU1lOQ19XSURUSCBhbmQgVlNZ
TkNfUE9SQ0ggKG5vIHNoaWZ0KQoKU29ycnksIHRoaXMgc2hvdWxkIGJlIC8qIC4uLiAqLwoKUmVn
YXJkcywKQ2h1bi1LdWFuZy4KCj4gPiArICAgICAgIHUzMiBkaW1lbnNpb25fbWFzazsKPiA+ICAg
ICAgICAgY29uc3Qgc3RydWN0IG10a19kcGlfeWNfbGltaXQgKmxpbWl0Owo+ID4gIH07Cj4gPgo+
ID4gQEAgLTE1NiwzMCArMTU4LDMwIEBAIHN0YXRpYyB2b2lkIG10a19kcGlfZGlzYWJsZShzdHJ1
Y3QgbXRrX2RwaSAqZHBpKQo+ID4gIHN0YXRpYyB2b2lkIG10a19kcGlfY29uZmlnX2hzeW5jKHN0
cnVjdCBtdGtfZHBpICpkcGksCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgbXRrX2RwaV9zeW5jX3BhcmFtICpzeW5jKQo+ID4gIHsKPiA+IC0gICAgICAgbXRrX2Rw
aV9tYXNrKGRwaSwgRFBJX1RHRU5fSFdJRFRILAo+ID4gLSAgICAgICAgICAgICAgICAgICAgc3lu
Yy0+c3luY193aWR0aCA8PCBIUFcsIEhQV19NQVNLKTsKPiA+IC0gICAgICAgbXRrX2RwaV9tYXNr
KGRwaSwgRFBJX1RHRU5fSFBPUkNILAo+ID4gLSAgICAgICAgICAgICAgICAgICAgc3luYy0+YmFj
a19wb3JjaCA8PCBIQlAsIEhCUF9NQVNLKTsKPiA+ICsgICAgICAgbXRrX2RwaV9tYXNrKGRwaSwg
RFBJX1RHRU5fSFdJRFRILCBzeW5jLT5zeW5jX3dpZHRoIDw8IEhQVywKPiA+ICsgICAgICAgICAg
ICAgICAgICAgIGRwaS0+Y29uZi0+ZGltZW5zaW9uX21hc2sgPDwgSFBXKTsKPiA+ICsgICAgICAg
bXRrX2RwaV9tYXNrKGRwaSwgRFBJX1RHRU5fSFBPUkNILCBzeW5jLT5iYWNrX3BvcmNoIDw8IEhC
UCwKPiA+ICsgICAgICAgICAgICAgICAgICAgIGRwaS0+Y29uZi0+ZGltZW5zaW9uX21hc2sgPDwg
SEJQKTsKPiA+ICAgICAgICAgbXRrX2RwaV9tYXNrKGRwaSwgRFBJX1RHRU5fSFBPUkNILCBzeW5j
LT5mcm9udF9wb3JjaCA8PCBIRlAsCj4gPiAtICAgICAgICAgICAgICAgICAgICBIRlBfTUFTSyk7
Cj4gPiArICAgICAgICAgICAgICAgICAgICBkcGktPmNvbmYtPmRpbWVuc2lvbl9tYXNrIDw8IEhG
UCk7Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgdm9pZCBtdGtfZHBpX2NvbmZpZ192c3luYyhzdHJ1
Y3QgbXRrX2RwaSAqZHBpLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IG10a19kcGlfc3luY19wYXJhbSAqc3luYywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHUzMiB3aWR0aF9hZGRyLCB1MzIgcG9yY2hfYWRkcikKPiA+ICB7Cj4gPiAtICAg
ICAgIG10a19kcGlfbWFzayhkcGksIHdpZHRoX2FkZHIsCj4gPiAtICAgICAgICAgICAgICAgICAg
ICBzeW5jLT5zeW5jX3dpZHRoIDw8IFZTWU5DX1dJRFRIX1NISUZULAo+ID4gLSAgICAgICAgICAg
ICAgICAgICAgVlNZTkNfV0lEVEhfTUFTSyk7Cj4gPiAgICAgICAgIG10a19kcGlfbWFzayhkcGks
IHdpZHRoX2FkZHIsCj4gPiAgICAgICAgICAgICAgICAgICAgICBzeW5jLT5zaGlmdF9oYWxmX2xp
bmUgPDwgVlNZTkNfSEFMRl9MSU5FX1NISUZULAo+ID4gICAgICAgICAgICAgICAgICAgICAgVlNZ
TkNfSEFMRl9MSU5FX01BU0spOwo+ID4gKyAgICAgICBtdGtfZHBpX21hc2soZHBpLCB3aWR0aF9h
ZGRyLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgc3luYy0+c3luY193aWR0aCA8PCBWU1lOQ19X
SURUSF9TSElGVCwKPiA+ICsgICAgICAgICAgICAgICAgICAgIGRwaS0+Y29uZi0+ZGltZW5zaW9u
X21hc2sgPDwgVlNZTkNfV0lEVEhfU0hJRlQpOwo+ID4gICAgICAgICBtdGtfZHBpX21hc2soZHBp
LCBwb3JjaF9hZGRyLAo+ID4gICAgICAgICAgICAgICAgICAgICAgc3luYy0+YmFja19wb3JjaCA8
PCBWU1lOQ19CQUNLX1BPUkNIX1NISUZULAo+ID4gLSAgICAgICAgICAgICAgICAgICAgVlNZTkNf
QkFDS19QT1JDSF9NQVNLKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgIGRwaS0+Y29uZi0+ZGlt
ZW5zaW9uX21hc2sgPDwgVlNZTkNfQkFDS19QT1JDSF9TSElGVCk7Cj4gPiAgICAgICAgIG10a19k
cGlfbWFzayhkcGksIHBvcmNoX2FkZHIsCj4gPiAgICAgICAgICAgICAgICAgICAgICBzeW5jLT5m
cm9udF9wb3JjaCA8PCBWU1lOQ19GUk9OVF9QT1JDSF9TSElGVCwKPiA+IC0gICAgICAgICAgICAg
ICAgICAgIFZTWU5DX0ZST05UX1BPUkNIX01BU0spOwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ZHBpLT5jb25mLT5kaW1lbnNpb25fbWFzayA8PCBWU1lOQ19GUk9OVF9QT1JDSF9TSElGVCk7Cj4g
PiAgfQo+ID4KPiA+ICBzdGF0aWMgdm9pZCBtdGtfZHBpX2NvbmZpZ192c3luY19sb2RkKHN0cnVj
dCBtdGtfZHBpICpkcGksCj4gPiBAQCAtODEzLDYgKzgxNSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgbXRrX2RwaV9jb25mIG10ODE3M19jb25mID0gewo+ID4gICAgICAgICAubnVtX291dHB1dF9m
bXRzID0gQVJSQVlfU0laRShtdDgxNzNfb3V0cHV0X2ZtdHMpLAo+ID4gICAgICAgICAuaXNfY2tf
ZGVfcG9sID0gdHJ1ZSwKPiA+ICAgICAgICAgLnN3YXBfaW5wdXRfc3VwcG9ydCA9IHRydWUsCj4g
PiArICAgICAgIC5kaW1lbnNpb25fbWFzayA9IEhQV19NQVNLLAo+ID4gICAgICAgICAubGltaXQg
PSAmbXRrX2RwaV9saW1pdCwKPiA+ICB9Owo+ID4KPiA+IEBAIC04MjUsNiArODI4LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQyNzAxX2NvbmYgPSB7Cj4gPiAgICAgICAg
IC5udW1fb3V0cHV0X2ZtdHMgPSBBUlJBWV9TSVpFKG10ODE3M19vdXRwdXRfZm10cyksCj4gPiAg
ICAgICAgIC5pc19ja19kZV9wb2wgPSB0cnVlLAo+ID4gICAgICAgICAuc3dhcF9pbnB1dF9zdXBw
b3J0ID0gdHJ1ZSwKPiA+ICsgICAgICAgLmRpbWVuc2lvbl9tYXNrID0gSFBXX01BU0ssCj4gPiAg
ICAgICAgIC5saW1pdCA9ICZtdGtfZHBpX2xpbWl0LAo+ID4gIH07Cj4gPgo+ID4gQEAgLTgzNiw2
ICs4NDAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDgxODNfY29uZiA9
IHsKPiA+ICAgICAgICAgLm51bV9vdXRwdXRfZm10cyA9IEFSUkFZX1NJWkUobXQ4MTgzX291dHB1
dF9mbXRzKSwKPiA+ICAgICAgICAgLmlzX2NrX2RlX3BvbCA9IHRydWUsCj4gPiAgICAgICAgIC5z
d2FwX2lucHV0X3N1cHBvcnQgPSB0cnVlLAo+ID4gKyAgICAgICAuZGltZW5zaW9uX21hc2sgPSBI
UFdfTUFTSywKPiA+ICAgICAgICAgLmxpbWl0ID0gJm10a19kcGlfbGltaXQsCj4gPiAgfTsKPiA+
Cj4gPiBAQCAtODQ3LDYgKzg1Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25m
IG10ODE5Ml9jb25mID0gewo+ID4gICAgICAgICAubnVtX291dHB1dF9mbXRzID0gQVJSQVlfU0la
RShtdDgxNzNfb3V0cHV0X2ZtdHMpLAo+ID4gICAgICAgICAuaXNfY2tfZGVfcG9sID0gdHJ1ZSwK
PiA+ICAgICAgICAgLnN3YXBfaW5wdXRfc3VwcG9ydCA9IHRydWUsCj4gPiArICAgICAgIC5kaW1l
bnNpb25fbWFzayA9IEhQV19NQVNLLAo+ID4gICAgICAgICAubGltaXQgPSAmbXRrX2RwaV9saW1p
dCwKPiA+ICB9Owo+ID4KPiA+IC0tCj4gPiAyLjM0LjEKPiA+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
