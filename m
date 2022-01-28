Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD754C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 16:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfuuRtW8J7mOb/HCN/vIG0/ovWEfVCl8kC/Jr+MUtKs=; b=dFwGnrDEBPuwGj
	yUltwo/kJPyQw6csoXNtmRZo64UgcsxNKTsod1LwKkCVMHAHvnzJHPmq/CwigBud046zObYR3fS85
	g8TjcRICL/xtDofEBN+Cwq2eDKV10igH9StyaKt4cgax/RTnQM0tSSLvToICq4JnVkNsl0SBQjRPu
	KhGn/VScWN77QF/GfpnSFun6wud4h+2DSdcHq5hSEZpbeSbx0L7OS8jCkK2LJC5YgnXyr6f/lqAQB
	kuOj+KrLZnlkuG6VMsePH/6632Xcxq11g15Z1zH7njSTBZt4AoEU7KuWJU+7ofrW88bFsBlgSRmaf
	uOk91Yhku2EWz8AaEt/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDTyG-002wGR-8d; Fri, 28 Jan 2022 16:19:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDTwI-002vTs-EQ; Fri, 28 Jan 2022 16:17:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A729B82421;
 Fri, 28 Jan 2022 16:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BB6C340F1;
 Fri, 28 Jan 2022 16:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643386647;
 bh=nxlbZsy8Q2SWe4ga/LjTbDUaRa0eP0r7WRbq2+PkVTY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RuD7sdvoMr8QES3FX3rcpoeDNwdSeUFh+KgUSLBbBnwUafMuhGbKt4ORG1zA2Jhc5
 tRlHNjal9W7TDfURiSmz/y13RRHv62GwB5XUc0+XpkUzlYQ+0w3OIGF1DiD09fAfuu
 H7+0LKem2Abml7fczXH9hmZpi7XOX5HhLaD+3hRaXrHk5/jqNnsIURjaALX42JyY/1
 5kwGuByVxdOWIi/TO59MBMrxbSmpJ/SYJetO3WYE6tk77vDVU3oMsWVfj8gIwywmLN
 jpdxHNTvz1+dRBNPqF6QooLBCDaOtnqYvxknH/4bAgebDaZq6hF+MLlxBhmgupZESO
 InfSyk+Huhipg==
Received: by mail-ej1-f53.google.com with SMTP id ka4so17534722ejc.11;
 Fri, 28 Jan 2022 08:17:27 -0800 (PST)
X-Gm-Message-State: AOAM533l7IxfQBQHkFemdOpfk+pwaSU8GvNso78LRmM/XuMLM1peX+YR
 dm9bCrbL2XDFpEicVBcwTuANsfROr/WSMQka+w==
X-Google-Smtp-Source: ABdhPJzz/zS18PKPnGfN2lJ5LGsaFhGr63+K2uD0+MpyUIjLiLR/MhzdXve5JhwlZTgH8V40vRYcpsvrvhSVcEIyRXs=
X-Received: by 2002:a17:907:a089:: with SMTP id
 hu9mr7611025ejc.680.1643386645417; 
 Fri, 28 Jan 2022 08:17:25 -0800 (PST)
MIME-Version: 1.0
References: <20220128120718.30545-1-yongqiang.niu@mediatek.com>
 <20220128120718.30545-3-yongqiang.niu@mediatek.com>
In-Reply-To: <20220128120718.30545-3-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 29 Jan 2022 00:17:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-qXrE+5ej2YUFCqrMmuNvRzcQtnyJPoSUD5O9N5fgs1A@mail.gmail.com>
Message-ID: <CAAOTY_-qXrE+5ej2YUFCqrMmuNvRzcQtnyJPoSUD5O9N5fgs1A@mail.gmail.com>
Subject: Re: [PATCH v1, 2/4] soc: mediatek: add mtk mutex support for MT8186
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_081730_802925_F714FD05 
X-CRM114-Status: GOOD (  16.78  )
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

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMuW5tDHmnIgyOOaXpSDpgLHkupQg5LiL5Y2IODowN+Wvq+mBk++8mgo+Cj4gQWRk
IG10ayBtdXRleCBzdXBwb3J0IGZvciBNVDgxODYgU29DLgo+Cj4gU2lnbmVkLW9mZi1ieTogWW9u
Z3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
c29jL21lZGlhdGVrL210ay1tdXRleC5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbXV0ZXguYyBiL2RyaXZlcnMvc29jL21lZGlhdGVr
L210ay1tdXRleC5jCj4gaW5kZXggMmNhNTViYjVhOGJlLi5lYmQ5NWZkMGYzNmUgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW11dGV4LmMKPiArKysgYi9kcml2ZXJzL3Nv
Yy9tZWRpYXRlay9tdGstbXV0ZXguYwo+IEBAIC0yNiw2ICsyNiwyMyBAQAo+Cj4gICNkZWZpbmUg
SU5UX01VVEVYICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDEpCj4KPiArI2RlZmlu
ZSBNVDgxODZfTVVURVhfTU9EX0RJU1BfT1ZMMCAgICAgICAgICAgICAwCj4gKyNkZWZpbmUgTVQ4
MTg2X01VVEVYX01PRF9ESVNQX09WTDBfMkwgICAgICAgICAgMQo+ICsjZGVmaW5lIE1UODE4Nl9N
VVRFWF9NT0RfRElTUF9SRE1BMCAgICAgICAgICAgIDIKPiArI2RlZmluZSBNVDgxODZfTVVURVhf
TU9EX0RJU1BfQ09MT1IwICAgICAgICAgICA0Cj4gKyNkZWZpbmUgTVQ4MTg2X01VVEVYX01PRF9E
SVNQX0NDT1JSMCAgICAgICAgICAgNQo+ICsjZGVmaW5lIE1UODE4Nl9NVVRFWF9NT0RfRElTUF9B
QUwwICAgICAgICAgICAgIDcKPiArI2RlZmluZSBNVDgxODZfTVVURVhfTU9EX0RJU1BfR0FNTUEw
ICAgICAgICAgICA4Cj4gKyNkZWZpbmUgTVQ4MTg2X01VVEVYX01PRF9ESVNQX1BPU1RNQVNLMCAg
ICAgICAgICAgICAgICA5Cj4gKyNkZWZpbmUgTVQ4MTg2X01VVEVYX01PRF9ESVNQX0RJVEhFUjAg
ICAgICAgICAgMTAKPiArI2RlZmluZSBNVDgxODZfTVVURVhfTU9EX0RJU1BfUkRNQTEgICAgICAg
ICAgICAxNwo+ICsKPiArI2RlZmluZSBNVDgxODZfTVVURVhfU09GX1NJTkdMRV9NT0RFIDAKPiAr
I2RlZmluZSBNVDgxODZfTVVURVhfU09GX0RTSTAgMQo+ICsjZGVmaW5lIE1UODE4Nl9NVVRFWF9T
T0ZfRFBJMCAyCj4gKyNkZWZpbmUgTVQ4MTg2X01VVEVYX0VPRl9EU0kwIChNVDgxODZfTVVURVhf
U09GX0RTSTAgPDwgNikKPiArI2RlZmluZSBNVDgxODZfTVVURVhfRU9GX0RQSTAgKE1UODE4Nl9N
VVRFWF9TT0ZfRFBJMCA8PCA2KQo+ICsKPiAgI2RlZmluZSBNVDgxNjdfTVVURVhfTU9EX0RJU1Bf
UFdNICAgICAgICAgICAgICAxCj4gICNkZWZpbmUgTVQ4MTY3X01VVEVYX01PRF9ESVNQX09WTDAg
ICAgICAgICAgICAgNgo+ICAjZGVmaW5lIE1UODE2N19NVVRFWF9NT0RfRElTUF9PVkwxICAgICAg
ICAgICAgIDcKPiBAQCAtMjI2LDYgKzI0MywxOSBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50
IG10ODE4M19tdXRleF9tb2RbRERQX0NPTVBPTkVOVF9JRF9NQVhdID0gewo+ICAgICAgICAgW0RE
UF9DT01QT05FTlRfV0RNQTBdID0gTVQ4MTgzX01VVEVYX01PRF9ESVNQX1dETUEwLAo+ICB9Owo+
Cj4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgbXQ4MTg2X211dGV4X21vZFtERFBfQ09NUE9O
RU5UX0lEX01BWF0gPSB7Cj4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9BQUwwXSA9IE1UODE4Nl9N
VVRFWF9NT0RfRElTUF9BQUwwLAo+ICsgICAgICAgW0REUF9DT01QT05FTlRfQ0NPUlJdID0gTVQ4
MTg2X01VVEVYX01PRF9ESVNQX0NDT1JSMCwKPiArICAgICAgIFtERFBfQ09NUE9ORU5UX0NPTE9S
MF0gPSBNVDgxODZfTVVURVhfTU9EX0RJU1BfQ09MT1IwLAo+ICsgICAgICAgW0REUF9DT01QT05F
TlRfRElUSEVSXSA9IE1UODE4Nl9NVVRFWF9NT0RfRElTUF9ESVRIRVIwLAo+ICsgICAgICAgW0RE
UF9DT01QT05FTlRfR0FNTUFdID0gTVQ4MTg2X01VVEVYX01PRF9ESVNQX0dBTU1BMCwKPiArICAg
ICAgIFtERFBfQ09NUE9ORU5UX09WTDBdID0gTVQ4MTg2X01VVEVYX01PRF9ESVNQX09WTDAsCj4g
KyAgICAgICBbRERQX0NPTVBPTkVOVF9PVkxfMkwwXSA9IE1UODE4Nl9NVVRFWF9NT0RfRElTUF9P
VkwwXzJMLAo+ICsgICAgICAgW0REUF9DT01QT05FTlRfUE9TVE1BU0swXSA9IE1UODE4Nl9NVVRF
WF9NT0RfRElTUF9QT1NUTUFTSzAsCj4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9SRE1BMF0gPSBN
VDgxODZfTVVURVhfTU9EX0RJU1BfUkRNQTAsCj4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9SRE1B
MV0gPSBNVDgxODZfTVVURVhfTU9EX0RJU1BfUkRNQTEsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29u
c3QgdW5zaWduZWQgaW50IG10ODE5Ml9tdXRleF9tb2RbRERQX0NPTVBPTkVOVF9JRF9NQVhdID0g
ewo+ICAgICAgICAgW0REUF9DT01QT05FTlRfQUFMMF0gPSBNVDgxOTJfTVVURVhfTU9EX0RJU1Bf
QUFMMCwKPiAgICAgICAgIFtERFBfQ09NUE9ORU5UX0NDT1JSXSA9IE1UODE5Ml9NVVRFWF9NT0Rf
RElTUF9DQ09SUjAsCj4gQEAgLTI2NCw2ICsyOTQsMTIgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVk
IGludCBtdDgxODNfbXV0ZXhfc29mW01VVEVYX1NPRl9EU0kzICsgMV0gPSB7Cj4gICAgICAgICBb
TVVURVhfU09GX0RQSTBdID0gTVQ4MTgzX01VVEVYX1NPRl9EUEkwIHwgTVQ4MTgzX01VVEVYX0VP
Rl9EUEkwLAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgbXQ4MTg2X211dGV4
X3NvZltNVVRFWF9TT0ZfRFNJMyArIDFdID0gewo+ICsgICAgICAgW01VVEVYX1NPRl9TSU5HTEVf
TU9ERV0gPSBNVVRFWF9TT0ZfU0lOR0xFX01PREUsCj4gKyAgICAgICBbTVVURVhfU09GX0RTSTBd
ID0gTVQ4MTg2X01VVEVYX1NPRl9EU0kwIHwgTVQ4MTg2X01VVEVYX0VPRl9EU0kwLAo+ICsgICAg
ICAgW01VVEVYX1NPRl9EUEkwXSA9IE1UODE4Nl9NVVRFWF9TT0ZfRFBJMCB8IE1UODE4Nl9NVVRF
WF9FT0ZfRFBJMCwKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX211dGV4X2Rh
dGEgbXQyNzAxX211dGV4X2RyaXZlcl9kYXRhID0gewo+ICAgICAgICAgLm11dGV4X21vZCA9IG10
MjcwMV9tdXRleF9tb2QsCj4gICAgICAgICAubXV0ZXhfc29mID0gbXQyNzEyX211dGV4X3NvZiwK
PiBAQCAtMzAxLDYgKzMzNywxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19tdXRleF9kYXRh
IG10ODE4M19tdXRleF9kcml2ZXJfZGF0YSA9IHsKPiAgICAgICAgIC5ub19jbGsgPSB0cnVlLAo+
ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX211dGV4X2RhdGEgbXQ4MTg2X211dGV4
X2RyaXZlcl9kYXRhID0gewo+ICsgICAgICAgLm11dGV4X21vZCA9IG10ODE4Nl9tdXRleF9tb2Qs
Cj4gKyAgICAgICAubXV0ZXhfc29mID0gbXQ4MTg2X211dGV4X3NvZiwKPiArICAgICAgIC5tdXRl
eF9tb2RfcmVnID0gTVQ4MTgzX01VVEVYMF9NT0QwLAo+ICsgICAgICAgLm11dGV4X3NvZl9yZWcg
PSBNVDgxODNfTVVURVgwX1NPRjAsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10
a19tdXRleF9kYXRhIG10ODE5Ml9tdXRleF9kcml2ZXJfZGF0YSA9IHsKPiAgICAgICAgIC5tdXRl
eF9tb2QgPSBtdDgxOTJfbXV0ZXhfbW9kLAo+ICAgICAgICAgLm11dGV4X3NvZiA9IG10ODE4M19t
dXRleF9zb2YsCj4gQEAgLTU0MCw2ICs1ODMsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBtdXRleF9kcml2ZXJfZHRfbWF0Y2hbXSA9IHsKPiAgICAgICAgICAgLmRhdGEgPSAm
bXQ4MTczX211dGV4X2RyaXZlcl9kYXRhfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ4MTgzLWRpc3AtbXV0ZXgiLAo+ICAgICAgICAgICAuZGF0YSA9ICZtdDgxODNfbXV0
ZXhfZHJpdmVyX2RhdGF9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
ODYtZGlzcC1tdXRleCIsCgpBZGQgIm1lZGlhdGVrLG10ODE4Ni1kaXNwLW11dGV4IiB0byBiaW5k
aW5nIGRvY3VtZW50LgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gKyAgICAgICAuZGF0YSA9ICZt
dDgxODZfbXV0ZXhfZHJpdmVyX2RhdGF9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDgxOTItZGlzcC1tdXRleCIsCj4gICAgICAgICAgIC5kYXRhID0gJm10ODE5Ml9tdXRl
eF9kcml2ZXJfZGF0YX0sCj4gICAgICAgICB7fSwKPiAtLQo+IDIuMjUuMQo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
