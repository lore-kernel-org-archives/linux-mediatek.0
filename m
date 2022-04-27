Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5595CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fa+NssJbMqFZSxdn+uhmcQ6y+tk99BJmWHvHZMAJNFk=; b=uXNbHT1vslxiHV
	umPJX3oRbuusKtb96u2YN12rYEYfudC1QOhxG3YZpnchGLyegnv/dEoss1lWch12gI5kApWwEQiHF
	OpeWxtylLSEXXqvJyKmzM2BKUcmpJuZPGj7vuz/r69DwB4sv6ELPf6jaXGiaM04sUplYMMhVUYYxf
	Iqq/hn8l8CIgr8Rr1GvNy8CEBxC2LjgMoLSnZg7A9dm3+mEvQNS49O7GELqNw1V4XRDX06QuMGUEn
	tEI6OMgRxfobt+uBQnAq/xTc+hEU2pS09b9qbT4hISStpNuCqKiuM0D8I1lKPi+qeG6abSY02/Eu5
	va3W6aYCfDMNTq2z+ACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njcLM-000MoC-Ep; Wed, 27 Apr 2022 07:44:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njcLA-000MlF-V0; Wed, 27 Apr 2022 07:44:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 73F92B824AA;
 Wed, 27 Apr 2022 07:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACF2C385A9;
 Wed, 27 Apr 2022 07:43:55 +0000 (UTC)
Message-ID: <98a01f46-7fb0-6201-c9db-14e15d7e30c4@xs4all.nl>
Date: Wed, 27 Apr 2022 09:43:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] dt-bindings: media: mtk-vcodec: Adds encoder power
 domain property
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, allen-kh.cheng@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220427033130.18497-1-irui.wang@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220427033130.18497-1-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_004401_161259_7F8BE6BA 
X-CRM114-Status: GOOD (  18.06  )
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

SGkgSXJ1aSwKCkknbSBtZXJnaW5nIHRoaXMgcGF0Y2ggZnJvbSBOw61jb2xhcyBGLiBSLiBBLiBQ
cmFkbywgd2hpY2ggaGFzIGFscmVhZHkgYmVlbiBBY2tlZCBieSBSb2I6CgpodHRwczovL3BhdGNo
d29yay5saW51eHR2Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhL3BhdGNoLzIwMjIwMjI1MjI1ODU0
LjgxMDM4LTQtbmZyYXByYWRvQGNvbGxhYm9yYS5jb20vCgpJZiB5b3Ugc3RpbGwgd2FudCB0aGUg
b3RoZXIgY2hhbmdlcyB5b3UgbWFkZSBpbiB0aGlzIHBhdGNoIG1lcmdlZCwgdGhlbiBwbGVhc2Ug
bWFrZQphIHYzIG9uIHRvcCBvZiBOw61jb2xhcycgcGF0Y2guCgpSZWdhcmRzLAoKCUhhbnMKCk9u
IDI3LzA0LzIwMjIgMDU6MzEsIElydWkgV2FuZyB3cm90ZToKPiBBZGRzIGVuY29kZXIgcG93ZXIg
ZG9tYWluIHByb3BlcnR5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IElydWkgV2FuZyA8aXJ1aS53YW5n
QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiBjaGFuZ2VzIGNvbXBhcmVkIHdpdGggdjE6Cj4gLSBzZXQg
InBvd2VyLWRvbWFpbnMiIGFzIGEgbm9uLXJlcXVpcmVkIHByb3BlcnR5Cj4gCj4gVGhlICdtYWtl
IGR0YnNfY2hlY2snIHdhcm5pbmdzKCdtZWRpYXRlayxsYXJiJykgY2FuIGJlIGZpeGVkIGJ5IHBh
dGNoOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRl
ay9saXN0Lz9zZXJpZXM9NjMzOTkzCj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL21lZGlhdGVrLHZjb2RlYy1lbmNvZGVyLnlhbWwgIHwgNiArKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNvZGVjLWVuY29kZXIueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtZW5j
b2Rlci55YW1sCj4gaW5kZXggZGViNWI2NTdhMmQ1Li4yZDFlMGM5YmQ2ZWUgMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2Rl
Yy1lbmNvZGVyLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEvbWVkaWF0ZWssdmNvZGVjLWVuY29kZXIueWFtbAo+IEBAIC00MSw2ICs0MSw5IEBAIHBy
b3BlcnRpZXM6Cj4gIAo+ICAgIGFzc2lnbmVkLWNsb2NrLXBhcmVudHM6IHRydWUKPiAgCj4gKyAg
cG93ZXItZG9tYWluczoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICAgIGlvbW11czoKPiAgICAg
IG1pbkl0ZW1zOiAxCj4gICAgICBtYXhJdGVtczogMzIKPiBAQCAtMTMyLDYgKzEzNSw3IEBAIGV4
YW1wbGVzOgo+ICAgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL210ODE3My1jbGsuaD4K
PiAgICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9tZW1vcnkvbXQ4MTczLWxhcmItcG9ydC5oPgo+
ICAgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgo+
ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL210ODE3My1wb3dlci5oPgo+ICAKPiAg
ICAgIHZjb2RlY19lbmNfYXZjOiB2Y29kZWNAMTgwMDIwMDAgewo+ICAgICAgICBjb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE3My12Y29kZWMtZW5jIjsKPiBAQCAtMTUzLDYgKzE1Nyw3IEBAIGV4
YW1wbGVzOgo+ICAgICAgICBjbG9jay1uYW1lcyA9ICJ2ZW5jX3NlbCI7Cj4gICAgICAgIGFzc2ln
bmVkLWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9WRU5DX1NFTD47Cj4gICAgICAgIGFzc2ln
bmVkLWNsb2NrLXBhcmVudHMgPSA8JnRvcGNrZ2VuIENMS19UT1BfVkNPREVDUExMPjsKPiArICAg
ICAgcG93ZXItZG9tYWlucyA9IDwmc2Nwc3lzIE1UODE3M19QT1dFUl9ET01BSU5fVkVOQz47Cj4g
ICAgICB9Owo+ICAKPiAgICAgIHZjb2RlY19lbmNfdnA4OiB2Y29kZWNAMTkwMDIwMDAgewo+IEBA
IC0xNzMsNCArMTc4LDUgQEAgZXhhbXBsZXM6Cj4gICAgICAgIGNsb2NrLW5hbWVzID0gInZlbmNf
bHRfc2VsIjsKPiAgICAgICAgYXNzaWduZWQtY2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtfVE9QX1ZF
TkNfTFRfU0VMPjsKPiAgICAgICAgYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmdG9wY2tnZW4g
Q0xLX1RPUF9WQ09ERUNQTExfMzcwUDU+Owo+ICsgICAgICBwb3dlci1kb21haW5zID0gPCZzY3Bz
eXMgTVQ4MTczX1BPV0VSX0RPTUFJTl9WRU5DX0xUPjsKPiAgICAgIH07CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
