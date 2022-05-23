Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779BDC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FU1ZLf1n+CL4B+3IGEEXy41UAV5DrD2E287aRkU19PE=; b=TTM83hbhMm1Lig
	92GoA9VwSGfqIFEqat99TeJL1OfWMGLyo9QtwmKVq7Fh7uwt+SEDzoZh5n35L02nccHFr1+yQMWF3
	+p+w/qogNSfVkDPfs8xwHsTEUUPCGz1dD5+qE15f0MN/6GEBOwLW3xqM34ZrBDrwUiP09dAbOF45R
	R7TMAbrs3OysNzqGJgqQ8MBhr9t3ERQYi0uVlpiYi0MBk7fJM/Vxj9cMC3ORZeqLXFxzuTKj1KMuU
	/g9/3L/9MJsJoOH9M2CSBAtqK39KPrZe+eiAtZ8Oj+UTxpEDMhVxbNEd78JH25olozS2cWPAMnMkX
	laUQYSDF7hEyo1Vjp8zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4nO-0031XE-Q0; Mon, 23 May 2022 09:56:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2pu-002A7b-EZ; Mon, 23 May 2022 07:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=f2ylFBj4CpFRjrA16KivYoZoe8PgZnLhm+UQwCsLkVE=; b=S4KXf/2HYOsmNzDArsMebJPpYE
 XVeu1NSIlhN/6yAduC2LXPH3i0KPH0mi5Iex3WI8fojFoy37fc7VhZC54jPf1qgPL6B2t5M/h7YFa
 h/kF6syblY+XGjpVHU1trJIgvB8ziTQrJb9vvpc2ogukAUoJaunZ2XvG72ohZBHyZ4bqDJcd9+j+5
 3lFDlZcBZSHu/113Yu/2SM2DPQH3OnZatOezVCcs6rdw3K3nOqO/X9e34+Lthsi5MSpFog6DUtXk7
 y9cWBLK6+JytVquICsCn9PddcBot7yR3Xgq66GA1cAvW8RGwX9eqvNeo2AEiseQDziHOD1Zd1Msv5
 e99eBwUQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt0On-000qjo-6i; Mon, 23 May 2022 05:14:36 +0000
X-UUID: 4667e2f31ed540048f5feb0ccdad2bd1-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:258cc0f6-a3fb-4ff1-8923-be32647469cc, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:6b953c7a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 4667e2f31ed540048f5feb0ccdad2bd1-20220522
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 79082951; Sun, 22 May 2022 22:14:09 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 22:14:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 13:14:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 May 2022 13:14:06 +0800
Message-ID: <93464881d214501851eafd55fdb25b69b6bf77e9.camel@mediatek.com>
Subject: Re: [PATCH v7 13/19] dt-bindings: reset: mediatek: Add infra_ao
 reset index for MT8192/MT8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, Chun-Jie Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=B5=9A=E6=A1=80=29?= <Chun-Jie.Chen@mediatek.com>,
 Runyang Chen =?UTF-8?Q?=28=E9=99=88=E6=B6=A6=E6=B4=8B=29?=
 <Runyang.Chen@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 23 May 2022 13:14:06 +0800
In-Reply-To: <20220521042323.BA60AC385A5@smtp.kernel.org>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
 <20220519125527.18544-14-rex-bc.chen@mediatek.com>
 <3f39777a225fac66f01858262defcc11c6135bb2.camel@mediatek.com>
 <CAGXv+5Ee3QvpHqWeSOFJYmq+P3POFSTB45JM42UNF8pn4b4T9A@mail.gmail.com>
 <20220521042323.BA60AC385A5@smtp.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_061434_372680_14DCB64E 
X-CRM114-Status: GOOD (  22.58  )
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

T24gU2F0LCAyMDIyLTA1LTIxIGF0IDEyOjIzICswODAwLCBTdGVwaGVuIEJveWQgd3JvdGU6Cj4g
UXVvdGluZyBDaGVuLVl1IFRzYWkgKDIwMjItMDUtMTkgMjA6MTA6MzUpCj4gPiBPbiBGcmksIE1h
eSAyMCwgMjAyMiBhdCAxMDo1OCBBTSBSZXgtQkMgQ2hlbiA8Cj4gPiByZXgtYmMuY2hlbkBtZWRp
YXRlay5jb20+IHdyb3RlOgo+ID4gPiAKPiA+ID4gCj4gPiA+IEhlbGxvIFN0ZXBoZW4sCj4gPiA+
IAo+ID4gPiB0aGlzIHBhdGNoIHdpbGwgaGF2ZSBjb25mbGljdCB3aXRoIE1hdHRoaWFzJ3MgY29t
bWl0IGJyYW5jaCBmb3IKPiA+ID4gaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxOTItcmVz
ZXRzLmguCj4gPiA+IAo+ID4gPiBJdCdzIG9uIGxpbnV4LW5leHQuCj4gPiA+IAo+ID4gPiBJIGhh
dmUgZml4IGl0IGluIHRoaXMgdmVyc2lvbiwgYnV0IEkgdGhpbmsgdGhlcmUgd2lsbCBiZSBhIG1l
cmdlCj4gPiA+IGNvbmZsaWN0IGlmIHlvdSBwaWNrIG15IHNlcmllcyBpbiB0aGlzIHJ1bi4KPiA+
ID4gCj4gPiA+IApodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC9jb21taXQv
aW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxOTItcmVzZXRzLmg/aD1uZXh0LTIwMjIwNTE5
JmlkPTE5YzY2MjE5ZTRkNWI4MTNlYmJkMjg2MjFjZmU5YzQ1MDY1OWRlZDdfXzshIUNUUk5LQTl3
TWcwQVJidyF4RmZSeE9XUkF2aFFNem9LeHFSdTh4RnNNWkxwVlpFb0swV1pCS2VNT29lUkdCaktw
aFNMMnRveC04eldsUnd5dGp0RUltVG8xVkIxZjM4d3dqOFhTbHlLSXckCj4gPiA+ICAKPiA+IAo+
ID4gVGhlIGNvbW1pdCBpbiBxdWVzdGlvbiBpcyBpbiBNYXR0aGlhcydzIHY1LjE4LW5leHQvZHRz
NjQgYnJhbmNoLAo+ID4gd2hpY2ggYWxzbwo+ID4gaGFzIHRoZSB2NS4xOC1uZXh0LWR0czY0IHRh
Zy4gVGhlIFBSIGZvciB0aGlzIHRhZyB3YXMgYWxyZWFkeQo+ID4gcGlja2VkIHVwCj4gPiBieSB0
aGUgc29jIG1haW50YWluZXJzLCBzbyBJIGd1ZXNzIHdlIGNvdWxkIGNvbnNpZGVyIGl0IHN0YWJs
ZS4KPiA+IAo+ID4gTWF0dGhpYXMsIHdoYXQgZG8geW91IHRoaW5rPyBHaXZlIGFuIGFjayBmb3Ig
dGhlIHBhdGNoIHRvIGdvCj4gPiB0aHJvdWdoIHRoZQo+ID4gY2xrIHRyZWUgd2l0aCB0aGUgdGFn
IG1lcmdlZCBpbiBhcyBkZXBlbmRlbmN5PyBUaGVyZSdzIGEgY29tcGlsZQo+ID4gdGltZQo+ID4g
ZGVwZW5kZW5jeSBiZXR3ZWVuIHRoaXMgYW5kIHRoZSBuZXh0IHBhdGNoIHNvIHdlIGNhbid0IGp1
c3Qgc3BsaXQKPiA+IHRoZW0KPiA+IGludG8gZGlmZmVyZW50IHRyZWVzLgo+ID4gCj4gCj4gSXQn
cyBwcmV0dHkgbGF0ZSB0byBsYW5kIHNvbWV0aGluZyB0aGF0IGhhcyBjcm9zcyB0cmVlIGRlcGVu
ZGVuY2llcwo+IGxpa2UKPiB0aGF0IHNvIEkgZ3Vlc3Mgd2UnbGwganVzdCB0YWtlIHVwIHRoaXMg
cGF0Y2ggc2VyaWVzIGFmdGVyIHRoZSBtZXJnZQo+IHdpbmRvdyBjbG9zZXMuCgpIZWxsbyBTdGVw
aGVuLAoKVGhhbmtzIGZvciB5b3VyIGJpZyBoZWxwIQpJIHdpbGwgc2VuZCB2OCB0byBtb2RpZnkg
Y29tbWVudHMgZnJvbSBOw61jb2xhcy4KCkJScywKUmV4CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
