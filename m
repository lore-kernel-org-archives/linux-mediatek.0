Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA738C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 11:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0rxswbQyA6QIt7PMYMqnyF8gxRrZhysYM1zYh63V/Y=; b=q3ZtnrYJ5kNN9H
	tqdhXGT5Z/Rkr5kv8iX2XA4WLswux9RNHUweEr875HtcvfOqOIfCCiSRztXRBCj+7v94uIItpXMNI
	LtJQli7Z2iSf1w2/8QUJdZnF4z6mLPmrKZ5LcwoYrmiJcmVzzAmkCeSyaM5yiU6EFGSopgT8HR7IE
	4L796suAzHaDBuMBSpI0tWZYxrfiHfPfLoGowzkm01x+dDhH+31ElRQ+NYB1R0sJHH+oejfGhfDs8
	m62G3uca/OVEetxShb2HMsZWsbulnU47tEBKKZ4XNxESmQNEeqqHlkUvrlxk+ZYsTyQxbgsgsf8re
	tK67keCF2Q0bToR5duoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNYUU-004cjy-EQ; Fri, 25 Feb 2022 11:10:26 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNYUC-004ceO-V6
 for linux-mediatek@lists.infradead.org; Fri, 25 Feb 2022 11:10:10 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id
 r41-20020a4a966c000000b0031bf85a4124so5867084ooi.0
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Feb 2022 03:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=uCe/+8iKUxzMUiuInd3yAhEeQs4vdxnzQkm5bIEbNEw=;
 b=3quStgJE4CNplUYYKndunJnY4NULD271ISTymr6In2H9wvWQ46ynTFUwPSh3NKVoKO
 XO4uix0XDRtyEYj7qkgyNbao0VNsn/v9DyTp5E6MeOCrYZ7UHnrZSG25ljWcwzNZXWtM
 CK25RXGKu7gtNKH69yAXi2/cmw/9laIfo+AIvEyQXQO0M+yNR7o7LR3kCYQ0GhecodX3
 0Yf39evCS/HIrNRyUizqYBNSZK0dgtE8NmgJi1WqVMQsdFuWPWRcekxxZDZoDZzegsrZ
 eGdZk0yx/7/PS7SJ3+IWqErs4rB+57192rbUR/75nCEiwVLsRQAgfLPhmb5NU7fcOvcj
 rAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=uCe/+8iKUxzMUiuInd3yAhEeQs4vdxnzQkm5bIEbNEw=;
 b=2iMXs5+0vdAWp0CJUYev7YWv2nqTYKjjCBSanDo9hcDVW7y/58nxz+azyy/jhfmfYk
 aHoz60sI5X78Y+hM5hVrCci0TWLdkRax680ynS9sXys+xBBF8Wr80jZJe2PjnchR5mNe
 M/C7bOizjQfZC0uhLxIJqZFc422feFLsExuLitTzb1RHxGix7kOmyY6odNakNN9bbG32
 i7nDXDnWuBk/ms+Kv+3f+/7M4s27Vf5A4g408ysne81JHG/oDy2RN73BnCbqI6apjHMR
 gwFgbt2F2rCix6kcbTEedfnx6Q4psZg9NQcuCz4ONKSdfVh8j7eLRhQQubc9OSdze0pg
 3sGg==
X-Gm-Message-State: AOAM533wgDrvXFMyktcXjsxaqKPzej6fu+pg1ZIP07R1c/TR3pQlZqR+
 e/jSx6sCl62pBdFFaujxz0LKwHZDXzB01FEA530evA==
X-Google-Smtp-Source: ABdhPJxQVXm0aOfETMn/jYI9liemPaFUC9qpKMV22X3YKscJ2KB1O1xhKAWhMyhOXCXayIJus//3i7D2cxvCV3+EqA4=
X-Received: by 2002:a05:6870:3112:b0:ce:c0c9:62b with SMTP id
 v18-20020a056870311200b000cec0c9062bmr1047419oaa.125.1645787404480; Fri, 25
 Feb 2022 03:10:04 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 03:10:03 -0800
MIME-Version: 1.0
In-Reply-To: <CAAOTY_9cOLJnTK0tSqfzyK4tUn_LUAywRPa+z7tTCOSien2j1Q@mail.gmail.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-11-granquet@baylibre.com>
 <CAAOTY_9cOLJnTK0tSqfzyK4tUn_LUAywRPa+z7tTCOSien2j1Q@mail.gmail.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 03:10:03 -0800
Message-ID: <CABnWg9secW5CO=wfo68mA9Z+v=iB50uZRUQGjm=jrGiS379nJA@mail.gmail.com>
Subject: Re: [PATCH v8 10/19] drm/mediatek: dpi: move swap_shift to board
 config
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 deller@gmx.de, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_031009_016252_E6231FB4 
X-CRM114-Status: GOOD (  14.52  )
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

UXVvdGluZyBDaHVuLUt1YW5nIEh1ICgyMDIyLTAyLTIxIDA0OjI0OjMyKQo+IEhpLCBHdWlsbGF1
bWU6Cj4KPiBHdWlsbGF1bWUgUmFucXVldCA8Z3JhbnF1ZXRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MuW5tDLmnIgxOOaXpSDpgLHkupQg5LiL5Y2IMTA6NTblr6vpgZPvvJoKPiA+Cj4gPiBBZGQgZmxl
eGliaWxpdHkgYnkgbW92aW5nIHRoZSBzd2FwIHNoaWZ0IHZhbHVlIHRvIGJvYXJkIGNvbmZpZwo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1aWxsYXVtZSBSYW5xdWV0IDxncmFucXVldEBiYXlsaWJy
ZS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIHwg
OCArKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiA+IGluZGV4IDBkM2Fj
ZDA4ZWEzNTguLmVjMjIxZTI0ZTBmZWUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RwaS5jCj4gPiBAQCAtMTMxLDYgKzEzMSw3IEBAIHN0cnVjdCBtdGtfZHBpX2NvbmYgewo+ID4g
ICAgICAgICB1MzIgZGltZW5zaW9uX21hc2s7Cj4gPiAgICAgICAgIC8vIE1hc2sgdXNlZCBmb3Ig
SFNJWkUgYW5kIFZTSVpFIChubyBzaGlmdCkKPiA+ICAgICAgICAgdTMyIGh2c2l6ZV9tYXNrOwo+
ID4gKyAgICAgICB1MzIgY2hhbm5lbF9zd2FwX3NoaWZ0Owo+ID4gICAgICAgICBjb25zdCBzdHJ1
Y3QgbXRrX2RwaV95Y19saW1pdCAqbGltaXQ7Cj4gPiAgfTsKPiA+Cj4gPiBAQCAtMzQ5LDcgKzM1
MCw4IEBAIHN0YXRpYyB2b2lkIG10a19kcGlfY29uZmlnX2NoYW5uZWxfc3dhcChzdHJ1Y3QgbXRr
X2RwaSAqZHBpLAo+ID4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAgICAgICB9Cj4gPgo+
ID4gLSAgICAgICBtdGtfZHBpX21hc2soZHBpLCBEUElfT1VUUFVUX1NFVFRJTkcsIHZhbCA8PCBD
SF9TV0FQLCBDSF9TV0FQX01BU0spOwo+ID4gKyAgICAgICBtdGtfZHBpX21hc2soZHBpLCBEUElf
T1VUUFVUX1NFVFRJTkcsIHZhbCA8PCBDSF9TV0FQLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
Q0hfU1dBUF9NQVNLIDw8IGRwaS0+Y29uZi0+Y2hhbm5lbF9zd2FwX3NoaWZ0KTsKPgo+IFRoaXMg
bWF5IGJlIHdyb25nIGJlY2F1c2Ugb2YgdGhlc2UgZGVmaW5pdGlvbjoKPgo+ICNkZWZpbmUgRFBJ
TlRGX0NIX1NXQVAgQklUKDEpCj4gI2RlZmluZSBEUElOVEZfQ0hfU1dBUF9NQVNLICgweDcgPDwg
MSkKPgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPgoKWW91IGFyZSByaWdodCwgRFBJTlRGX0NI
X1NXQVBfTUFTSyBpcyB1bnVzZWQsIHdoaWNoIGlzIHdyb25nIG9uIG11bHRpcGxlIGxldmVscy4K
Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgdm9pZCBtdGtfZHBpX2NvbmZpZ195dXY0MjJfZW5hYmxl
KHN0cnVjdCBtdGtfZHBpICpkcGksIGJvb2wgZW5hYmxlKQo+ID4gQEAgLTgyMSw2ICs4MjMsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDgxNzNfY29uZiA9IHsKPiA+ICAg
ICAgICAgLnN3YXBfaW5wdXRfc3VwcG9ydCA9IHRydWUsCj4gPiAgICAgICAgIC5kaW1lbnNpb25f
bWFzayA9IEhQV19NQVNLLAo+ID4gICAgICAgICAuaHZzaXplX21hc2sgPSBIU0laRV9NQVNLLAo+
ID4gKyAgICAgICAuY2hhbm5lbF9zd2FwX3NoaWZ0ID0gQ0hfU1dBUCwKPiA+ICAgICAgICAgLmxp
bWl0ID0gJm10a19kcGlfbGltaXQsCj4gPiAgfTsKPiA+Cj4gPiBAQCAtODM1LDYgKzgzOCw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10MjcwMV9jb25mID0gewo+ID4gICAg
ICAgICAuc3dhcF9pbnB1dF9zdXBwb3J0ID0gdHJ1ZSwKPiA+ICAgICAgICAgLmRpbWVuc2lvbl9t
YXNrID0gSFBXX01BU0ssCj4gPiAgICAgICAgIC5odnNpemVfbWFzayA9IEhTSVpFX01BU0ssCj4g
PiArICAgICAgIC5jaGFubmVsX3N3YXBfc2hpZnQgPSBDSF9TV0FQLAo+ID4gICAgICAgICAubGlt
aXQgPSAmbXRrX2RwaV9saW1pdCwKPiA+ICB9Owo+ID4KPiA+IEBAIC04NDgsNiArODUyLDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTgzX2NvbmYgPSB7Cj4gPiAgICAg
ICAgIC5zd2FwX2lucHV0X3N1cHBvcnQgPSB0cnVlLAo+ID4gICAgICAgICAuZGltZW5zaW9uX21h
c2sgPSBIUFdfTUFTSywKPiA+ICAgICAgICAgLmh2c2l6ZV9tYXNrID0gSFNJWkVfTUFTSywKPiA+
ICsgICAgICAgLmNoYW5uZWxfc3dhcF9zaGlmdCA9IENIX1NXQVAsCj4gPiAgICAgICAgIC5saW1p
dCA9ICZtdGtfZHBpX2xpbWl0LAo+ID4gIH07Cj4gPgo+ID4gQEAgLTg2MSw2ICs4NjYsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDgxOTJfY29uZiA9IHsKPiA+ICAgICAg
ICAgLnN3YXBfaW5wdXRfc3VwcG9ydCA9IHRydWUsCj4gPiAgICAgICAgIC5kaW1lbnNpb25fbWFz
ayA9IEhQV19NQVNLLAo+ID4gICAgICAgICAuaHZzaXplX21hc2sgPSBIU0laRV9NQVNLLAo+ID4g
KyAgICAgICAuY2hhbm5lbF9zd2FwX3NoaWZ0ID0gQ0hfU1dBUCwKPiA+ICAgICAgICAgLmxpbWl0
ID0gJm10a19kcGlfbGltaXQsCj4gPiAgfTsKPiA+Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
