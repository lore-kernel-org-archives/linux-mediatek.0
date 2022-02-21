Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9845AC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 02:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e0Pii29XddyqUz7M7xJw9/XrazQ8j5VJPtVcPtsZBHY=; b=tM4nr+xuiAjgwK
	/1aU1hz/H23OGbVNo3UqTBakChg5KqrP4eGVtCVXm3CziHKO7hjybD/lIQGOk3T/FjnX53yCm/eiB
	77qvwqz70AZeplDfArH/ng3ueGMcxY4Tu/4nEjYcUIc/n4S+3Aet6mG9m42fy0DCA7MEYLMG2eTSk
	5ZVNtL68mBRDuhQRAD1gj3PaIeDazOrV1pJEwatQ9N/PvRKig4zvdRwn6Ao8KeBhWT1l7cmvEMfJB
	X4UwDxmElmDfavqRsr52PGs0IsIJ/+/D8DswoTENnLJcQSic2M1V+mz+HNCOuQDjGU1Vpf8nO2P9S
	kjR4dCcoQAv442bH6E9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLyDq-002yp8-5i; Mon, 21 Feb 2022 02:14:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLyDT-002yhG-8z; Mon, 21 Feb 2022 02:14:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C4907B80DA9;
 Mon, 21 Feb 2022 02:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93041C340F6;
 Mon, 21 Feb 2022 02:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645409656;
 bh=pV8SFKuHUgpAlxXGX/qRMPIw+Kd4bEx8SviHAJcdS/Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YiyRpZrPApxVaNDYIvavOjHmK/p4DUAeK7+Tqr9SzP0O7Yfgnjvuyw8qO1REi2RDD
 Phy4Kuly9XfumICficyiVzBcfe/DaRvSiBTX5u/ENtDXdOdFwDWa5ljj6iof4IHs9j
 PwvNupG/A7W8SaN6+pszjxxkNm8ps6klra5cJ94zW1ndONy6OZGOcI6eRR5GkCd54r
 TBwzSdQ+0+zHV/LZEIDpRdVda2/o8kkRB4Cb6OrQhSlr/rV2QP+6PSS21vq1KntrxN
 8YPmtWnLOQQeZjWZ9WtmB9BjdwBDBZ2IFScLqyyer+sDrFL3TwFAkQb64Wcof6TbnV
 Xijrjmx0NtcSg==
Received: by mail-ej1-f45.google.com with SMTP id qx21so29136783ejb.13;
 Sun, 20 Feb 2022 18:14:16 -0800 (PST)
X-Gm-Message-State: AOAM5326ExKJNFnbTp8X28Bs6QSec6VmOzX+LfDEam5MKeVYZi+GOEEx
 Eqa5pqf+KHk35AWdJV0fOuyvQPwPBxQP8xheIw==
X-Google-Smtp-Source: ABdhPJzuzbcKzGVGYsB6r6h/Y3EsbKgrTgOGjhQohSFx5+ar+PHYzw42VipVTgZDJCfjawuEm8YsH/Nvkb+0+E4tzns=
X-Received: by 2002:a17:906:a20c:b0:6ce:a87e:5013 with SMTP id
 r12-20020a170906a20c00b006cea87e5013mr13673365ejy.379.1645409654814; Sun, 20
 Feb 2022 18:14:14 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-7-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-7-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 10:14:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY__AgD_Rc_5TS4v+sBDeN-nd0DbwuERhW=OsvsbMWSsxsA@mail.gmail.com>
Message-ID: <CAAOTY__AgD_Rc_5TS4v+sBDeN-nd0DbwuERhW=OsvsbMWSsxsA@mail.gmail.com>
Subject: Re: [PATCH v8 06/19] drm/mediatek: dpi: implement a CK/DE pol toggle
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
X-CRM114-CacheID: sfid-20220220_181419_647869_E8D0995E 
X-CRM114-Status: GOOD (  19.93  )
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

SEksIEd1aWxsYXVtZToKCkd1aWxsYXVtZSBSYW5xdWV0IDxncmFucXVldEBiYXlsaWJyZS5jb20+
IOaWvCAyMDIy5bm0MuaciDE45pelIOmAseS6lCDkuIvljYgxMDo1NuWvq+mBk++8mgo+Cj4gQWRk
cyBhIGJpdCBvZiBmbGV4aWJpbGl0eSB0byBzdXBwb3J0IGJvYXJkcyB3aXRob3V0IENLL0RFIHBv
bCBzdXBwb3J0CgpJJ20gbm90IHN1cmUgd2hhdCB0aGUgdGVybSAnYm9hcmQnIG1lYW4uIERvIHlv
dSBtZWFuIGRpZmZlcmVudCBib2FyZAp3aXRoIGRpZmZlcmVudCBwYW5lbCBidXQgYWxsIHdpdGgg
bXQ4MTk1LWRwaW50Zj8gSWYgc28sIHlvdSBzaG91bGQgZ2V0CkNLL0RFIHN1cHBvcnQgZnJvbSBw
YW5lbCBkcml2ZXIgbm90IGZpeCB0aGlzIGluZm9ybWF0aW9uIGluIGRwaQpkcml2ZXIuCgpSZWdh
cmRzLApDaHVuLUt1YW5nLgoKPgo+IFNpZ25lZC1vZmYtYnk6IEd1aWxsYXVtZSBSYW5xdWV0IDxn
cmFucXVldEBiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHBpLmMgfCAyMiArKysrKysrKysrKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
NyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RwaS5jCj4gaW5kZXggNDc0NmViMzQyNTY3NC4uNTQ1YTEzMzdjYzg5OSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcGkuYwo+IEBAIC0xMjUsNiArMTI1LDcgQEAgc3RydWN0IG10a19k
cGlfY29uZiB7Cj4gICAgICAgICBib29sIGVkZ2Vfc2VsX2VuOwo+ICAgICAgICAgY29uc3QgdTMy
ICpvdXRwdXRfZm10czsKPiAgICAgICAgIHUzMiBudW1fb3V0cHV0X2ZtdHM7Cj4gKyAgICAgICBi
b29sIGlzX2NrX2RlX3BvbDsKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZHBpX3ljX2xpbWl0
ICpsaW1pdDsKPiAgfTsKPgo+IEBAIC0yMTEsMTMgKzIxMiwyMCBAQCBzdGF0aWMgdm9pZCBtdGtf
ZHBpX2NvbmZpZ19wb2woc3RydWN0IG10a19kcGkgKmRwaSwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IG10a19kcGlfcG9sYXJpdGllcyAqZHBpX3BvbCkKPiAgewo+ICAg
ICAgICAgdW5zaWduZWQgaW50IHBvbDsKPiArICAgICAgIHVuc2lnbmVkIGludCBtYXNrOwo+Cj4g
LSAgICAgICBwb2wgPSAoZHBpX3BvbC0+Y2tfcG9sID09IE1US19EUElfUE9MQVJJVFlfUklTSU5H
ID8gMCA6IENLX1BPTCkgfAo+IC0gICAgICAgICAgICAgKGRwaV9wb2wtPmRlX3BvbCA9PSBNVEtf
RFBJX1BPTEFSSVRZX1JJU0lORyA/IDAgOiBERV9QT0wpIHwKPiAtICAgICAgICAgICAgIChkcGlf
cG9sLT5oc3luY19wb2wgPT0gTVRLX0RQSV9QT0xBUklUWV9SSVNJTkcgPyAwIDogSFNZTkNfUE9M
KSB8Cj4gKyAgICAgICBtYXNrID0gSFNZTkNfUE9MIHwgVlNZTkNfUE9MOwo+ICsgICAgICAgcG9s
ID0gKGRwaV9wb2wtPmhzeW5jX3BvbCA9PSBNVEtfRFBJX1BPTEFSSVRZX1JJU0lORyA/IDAgOiBI
U1lOQ19QT0wpIHwKPiAgICAgICAgICAgICAgIChkcGlfcG9sLT52c3luY19wb2wgPT0gTVRLX0RQ
SV9QT0xBUklUWV9SSVNJTkcgPyAwIDogVlNZTkNfUE9MKTsKPiAtICAgICAgIG10a19kcGlfbWFz
ayhkcGksIERQSV9PVVRQVVRfU0VUVElORywgcG9sLAo+IC0gICAgICAgICAgICAgICAgICAgIENL
X1BPTCB8IERFX1BPTCB8IEhTWU5DX1BPTCB8IFZTWU5DX1BPTCk7Cj4gKyAgICAgICBpZiAoZHBp
LT5jb25mLT5pc19ja19kZV9wb2wpIHsKPiArICAgICAgICAgICAgICAgbWFzayB8PSBDS19QT0wg
fCBERV9QT0w7Cj4gKyAgICAgICAgICAgICAgIHBvbCB8PSAoZHBpX3BvbC0+Y2tfcG9sID09IE1U
S19EUElfUE9MQVJJVFlfUklTSU5HID8KPiArICAgICAgICAgICAgICAgICAgICAgICAwIDogQ0tf
UE9MKSB8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAoZHBpX3BvbC0+ZGVfcG9sID09IE1US19E
UElfUE9MQVJJVFlfUklTSU5HID8KPiArICAgICAgICAgICAgICAgICAgICAgICAwIDogREVfUE9M
KTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBtdGtfZHBpX21hc2soZHBpLCBEUElfT1VUUFVU
X1NFVFRJTkcsIHBvbCwgbWFzayk7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBtdGtfZHBpX2NvbmZp
Z18zZChzdHJ1Y3QgbXRrX2RwaSAqZHBpLCBib29sIGVuXzNkKQo+IEBAIC03OTksNiArODA3LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTczX2NvbmYgPSB7Cj4gICAg
ICAgICAubWF4X2Nsb2NrX2toeiA9IDMwMDAwMCwKPiAgICAgICAgIC5vdXRwdXRfZm10cyA9IG10
ODE3M19vdXRwdXRfZm10cywKPiAgICAgICAgIC5udW1fb3V0cHV0X2ZtdHMgPSBBUlJBWV9TSVpF
KG10ODE3M19vdXRwdXRfZm10cyksCj4gKyAgICAgICAuaXNfY2tfZGVfcG9sID0gdHJ1ZSwKPiAg
ICAgICAgIC5saW1pdCA9ICZtdGtfZHBpX2xpbWl0LAo+ICB9Owo+Cj4gQEAgLTgwOSw2ICs4MTgs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDI3MDFfY29uZiA9IHsKPiAg
ICAgICAgIC5tYXhfY2xvY2tfa2h6ID0gMTUwMDAwLAo+ICAgICAgICAgLm91dHB1dF9mbXRzID0g
bXQ4MTczX291dHB1dF9mbXRzLAo+ICAgICAgICAgLm51bV9vdXRwdXRfZm10cyA9IEFSUkFZX1NJ
WkUobXQ4MTczX291dHB1dF9mbXRzKSwKPiArICAgICAgIC5pc19ja19kZV9wb2wgPSB0cnVlLAo+
ICAgICAgICAgLmxpbWl0ID0gJm10a19kcGlfbGltaXQsCj4gIH07Cj4KPiBAQCAtODE4LDYgKzgy
OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE4M19jb25mID0gewo+
ICAgICAgICAgLm1heF9jbG9ja19raHogPSAxMDAwMDAsCj4gICAgICAgICAub3V0cHV0X2ZtdHMg
PSBtdDgxODNfb3V0cHV0X2ZtdHMsCj4gICAgICAgICAubnVtX291dHB1dF9mbXRzID0gQVJSQVlf
U0laRShtdDgxODNfb3V0cHV0X2ZtdHMpLAo+ICsgICAgICAgLmlzX2NrX2RlX3BvbCA9IHRydWUs
Cj4gICAgICAgICAubGltaXQgPSAmbXRrX2RwaV9saW1pdCwKPiAgfTsKPgo+IEBAIC04MjcsNiAr
ODM4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTkyX2NvbmYgPSB7
Cj4gICAgICAgICAubWF4X2Nsb2NrX2toeiA9IDE1MDAwMCwKPiAgICAgICAgIC5vdXRwdXRfZm10
cyA9IG10ODE3M19vdXRwdXRfZm10cywKPiAgICAgICAgIC5udW1fb3V0cHV0X2ZtdHMgPSBBUlJB
WV9TSVpFKG10ODE3M19vdXRwdXRfZm10cyksCj4gKyAgICAgICAuaXNfY2tfZGVfcG9sID0gdHJ1
ZSwKPiAgICAgICAgIC5saW1pdCA9ICZtdGtfZHBpX2xpbWl0LAo+ICB9Owo+Cj4gLS0KPiAyLjM0
LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
