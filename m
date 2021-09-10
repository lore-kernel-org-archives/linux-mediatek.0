Return-Path: <SRS0=J3PH=OA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D818C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 02:30:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A80360231
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 02:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A80360231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1O3StG8ayBmJPmXNKVpM0Yspyv8RcDer6RJi5iWazWY=; b=ZP4ZBJsAgeDQ5g
	F62mzViQGk25WyyvefdZcm9MiyN+6ztHQoSJUV5lw4e4IzCLIjg/8aP5qowRcIOpaLjSfZ1fctCiC
	Jy+REY8aPmZmU1n9BkR8V4IPTJdfRoJAJRjU0aAZh7kQUSzJP3MNhnkubFPKiB3dUB56YOLlyHvas
	utScc+PvVeDwBLadiXMd5IVQBfPEwbON0hc/yDNz36SPJOdLr95RDlJCgJkPVtc2D96nAy8bPX2wv
	T5nrP01kaXOQ5lH7XZhUdyxTmnBHCvThj3BwC4yhpvujo4zLZyt+xjHwfZF9rcYTMBnyBVSs/e0pn
	gpyoaktT2BfXzQ8OsqiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOWIv-00BaWZ-OL; Fri, 10 Sep 2021 02:30:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOWIh-00BaV1-FI; Fri, 10 Sep 2021 02:30:01 +0000
X-UUID: a5a2786c413a45ad980f88b0f1957455-20210909
X-UUID: a5a2786c413a45ad980f88b0f1957455-20210909
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 259542197; Thu, 09 Sep 2021 19:29:55 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Sep 2021 19:29:53 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Sep 2021 10:29:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Sep 2021 10:29:51 +0800
Message-ID: <f47decf6d1fa0f1b375a531dc44736a0ca63b2d4.camel@mediatek.com>
Subject: Re: [PATCH v7 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
From: moudy ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, Jernej Skrabec
 <jernej.skrabec@siol.net>, Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>, Ping-Hsun Wu
 <ping-hsun.wu@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>, "Nicolas
 Boichat" <drinkcat@chromium.org>, Alexandre Courbot <acourbot@chromium.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, <menghui.lin@mediatek.com>, Sj Huang
 =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?= <sj.huang@mediatek.com>,
 <ben.lok@mediatek.com>, <randy.wu@mediatek.com>, srv_heupstream
 <srv_heupstream@mediatek.com>, Hsin-Yi Wang <hsinyi@google.com>
Date: Fri, 10 Sep 2021 10:29:51 +0800
In-Reply-To: <CAAOTY_8GFP0utAVSw1JY6=y9hsJTbf8mtiKCnUmTcG2e9Zwdxg@mail.gmail.com>
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
 <20210824100027.25989-4-moudy.ho@mediatek.com>
 <CAAOTY_8GFP0utAVSw1JY6=y9hsJTbf8mtiKCnUmTcG2e9Zwdxg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_192959_544552_6BCE6CC9 
X-CRM114-Status: GOOD (  24.67  )
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

T24gVHVlLCAyMDIxLTA5LTA3IGF0IDA4OjExICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+
IEhpLCBNb3VkeToKPiAKPiBNb3VkeSBIbyA8bW91ZHkuaG9AbWVkaWF0ZWsuY29tPiDmlrwgMjAy
MeW5tDjmnIgyNOaXpSDpgLHkuowg5LiL5Y2INjowMuWvq+mBk++8mgo+ID4gCj4gPiBUaGlzIHBh
dGNoIGFkZHMgRFQgYmluZGluZyBkb2N1bWVudCBmb3IgTWVkaWEgRGF0YSBQYXRoIDMgKE1EUDMp
Cj4gPiBhIHVuaXQgaW4gbXVsdGltZWRpYSBzeXN0ZW0gdXNlZCBmb3Igc2NhbGluZyBhbmQgY29s
b3IgZm9ybWF0Cj4gPiBjb252ZXJ0Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNb3VkeSBIbyA8
bW91ZHkuaG9AbWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL21l
ZGlhdGVrLG1kcDMtY2NvcnIueWFtbCAgIHwgIDU3ICsrKysrCj4gPiAgLi4uL2JpbmRpbmdzL21l
ZGlhL21lZGlhdGVrLG1kcDMtcmRtYS55YW1sICAgIHwgMjA3Cj4gPiArKysrKysrKysrKysrKysr
KysKPiA+ICAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1yc3oueWFtbCAgICAgfCAg
NjUgKysrKysrCj4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtd2RtYS55YW1s
ICAgIHwgIDcxICsrKysrKwo+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXdy
b3QueWFtbCAgICB8ICA3MSArKysrKysKPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDQ3MSBpbnNlcnRp
b25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1jY29yci55YW1sCj4gCj4gSSd2ZSBjb21w
YXJlZCBjY29yciBkcml2ZXIgaW4gZGlzcGxheSBbMV0gYW5kIGNjb3JyIGluIG1kcCBbMl0sIGJv
dGgKPiBhcmUgc2ltaWxhci4gU28gSSB3b3VsZCBsaWtlIGJvdGggYmluZGluZyBkb2N1bWVudCBh
cmUgcGxhY2VkCj4gdG9nZXRoZXIuIEluIGRpc3BsYXkgZm9sZGVyPyBJbiBtZHAgZm9sZGVyPyBJ
biBTb0MgZm9sZGVyPyBJJ3ZlIG5vCj4gaWRlYSB3aGljaCBvbmUgaXMgYmV0dGVyLiBBdCBsZWFz
ZSBwdXQgdG9nZXRoZXIuCj4gCj4gWzFdIAo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19o
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvdHJlZS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY2NvcnIuYz9o
PXY1LjE0X187ISFDVFJOS0E5d01nMEFSYncheE9ZZDhTYWlEU1J2SkJncGFRcEx6TXhxUE9Bc3RN
WDdjR1hraEVudVlhMVdiM0VNaWlFbE5FUGV5Y1BfazJJUSQKPiAgCj4gWzJdIAo+IGh0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
bGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMTA4MjQxMDAwMjcuMjU5ODktNi1tb3VkeS5ob0BtZWRp
YXRlay5jb20vX187ISFDVFJOS0E5d01nMEFSYncheE9ZZDhTYWlEU1J2SkJncGFRcEx6TXhxUE9B
c3RNWDdjR1hraEVudVlhMVdiM0VNaWlFbE5FUGV5VHdqejRVVSQKPiAgCj4gCj4gUmVnYXJkcywK
PiBDaHVuLUt1YW5nLgoKSGkgQ2h1bi1LdWFuZywKClRoYW5rIHlvdSBmb3IgeW91ciByZWNvbW1l
bmRhdGlvbi4KSSB3aWxsIGludGVncmF0ZSB0aGUgc2FtZSBjb21wb25lbnQgYmluZGluZyBmaWxl
cyBpbiBNRFAgYW5kIERJU1AsIGFuZApwbGFjZSB0aGVtIGluIHRoZSBmb2xkZXIgc2FtZSB3aXRo
IE1NU1lTIGluc3RlYWQuCigKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy55YW1sCikKVGhlIGZpcnN0IHZl
cnNpb24gb2YgUkRNQSwgQ0NPUlIsIEFBTCwgQ09MT1IgYW5kIFdETUEgd2lsbCBiZSBwcm92aWRl
ZApieSBNRFAgYW5kIHRoZW4gRElTUCBhZGQgaXQgb3duIHByb3BlcnR5IGxhdGVyLgoKVGhhbmtz
ICYgUmVnYXJkcywKTW91ZHkgSG8KPiAKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQKPiA+IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXJkbWEueWFt
bAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtcnN6LnlhbWwKPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQKPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxt
ZHAzLXdkbWEueWFtbAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtd3JvdC55YW1sCj4gPiAKPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVk
aWF0ZWssbWRwMy0KPiA+IGNjb3JyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy0KPiA+IGNjb3JyLnlhbWwKPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjU5ZmQ2OGI0NjAyMgo+ID4gLS0tIC9k
ZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L21lZGlhdGVrLG1kcDMtCj4gPiBjY29yci55YW1sCj4gPiBAQCAtMCwwICsxLDU3IEBACj4gPiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2Up
Cj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiArJGlkOiAKPiA+IGh0dHBzOi8vdXJsZGVmZW5z
ZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRpYS9tZWRpYXRlayxt
ZHAzLWNjb3JyLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyF4T1lkOFNhaURTUnZKQmdwYVFw
THpNeHFQT0FzdE1YN2NHWGtoRW51WWExV2IzRU1paUVsTkVQZXlXNE1tWFVZJAo+ID4gIAo+ID4g
KyRzY2hlbWE6IAo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYncheE9Z
ZDhTYWlEU1J2SkJncGFRcEx6TXhxUE9Bc3RNWDdjR1hraEVudVlhMVdiM0VNaWlFbE5FUGV5ZHdY
MGdTeSQKPiA+ICAKPiA+ICsKPiA+ICt0aXRsZTogTWVkaWF0ZWsgTWVkaWEgRGF0YSBQYXRoIDMg
Q0NPUlIgRGV2aWNlIFRyZWUgQmluZGluZ3MKPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsg
IC0gRGFveXVhbiBIdWFuZyA8ZGFveXVhbi5odWFuZ0BtZWRpYXRlay5jb20+Cj4gPiArICAtIE1v
dWR5IEhvIDxtb3VkeS5ob0BtZWRpYXRlay5jb20+Cj4gPiArCj4gPiArZGVzY3JpcHRpb246IHwK
PiA+ICsgIE9uZSBvZiBNZWRpYSBEYXRhIFBhdGggMyAoTURQMykgY29tcG9uZW50cyB1c2VkIHRv
IGRvIGNvbG9yCj4gPiBjb3JyZWN0aW9uIHdpdGggM1gzIG1hdHJpeC4KPiA+ICsKPiA+ICtwcm9w
ZXJ0aWVzOgo+ID4gKyAgY29tcGF0aWJsZToKPiA+ICsgICAgaXRlbXM6Cj4gPiArICAgICAgLSBl
bnVtOgo+ID4gKyAgICAgICAgLSBtZWRpYXRlayxtdDgxODMtbWRwMy1jY29ycgo+ID4gKwo+ID4g
KyAgbWVkaWF0ZWssbWRwMy1pZDoKPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMv
ZGVmaW5pdGlvbnMvdWludDMyCj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiArICAgIGRlc2NyaXB0
aW9uOiB8Cj4gPiArICAgICAgSFcgaW5kZXggdG8gZGlzdGluZ3Vpc2ggc2FtZSBmdW5jdGlvbmFs
aXR5IG1vZHVsZXMuCj4gPiArCj4gPiArICByZWc6Cj4gPiArICAgIGRlc2NyaXB0aW9uOiB8Cj4g
PiArICAgICAgUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhlIGZ1bmN0aW9u
IGJsb2NrCj4gPiArICAgICAgcmVnaXN0ZXIgc3BhY2UsIHRoZSBudW1iZXIgYWxpZ25zIHdpdGgg
dGhlIGNvbXBvbmVudAo+ID4gKyAgICAgIGFuZCBpdHMgb3duIHN1YmNvbXBvbmVudC4KPiA+ICsK
PiA+ICsgIG1lZGlhdGVrLGdjZS1jbGllbnQtcmVnOgo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5Cj4gPiArICAgIGRlc2NyaXB0aW9u
OiB8Cj4gPiArICAgICAgc3ViLXN5c3RlbSBpZCBjb3JyZXNwb25kaW5nIHRvIHRoZSBnbG9iYWwg
Y29tbWFuZCBlbmdpbmUKPiA+IChHQ0UpCj4gPiArICAgICAgcmVnaXN0ZXIgYWRkcmVzcy4KPiA+
ICsgICAgICAkcmVmOiAvc2NoZW1hcy9tYWlsYm94L210ay1nY2UudHh0Cj4gPiArCj4gPiArICBj
bG9ja3M6Cj4gPiArICAgIG1pbkl0ZW1zOiAxCj4gPiArCj4gPiArYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlCj4gPiArCj4gPiArZXhhbXBsZXM6Cj4gPiArICAtIHwKPiA+ICsgICAgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL210ODE4My1jbGsuaD4KPiA+ICsgICAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2djZS9tdDgxODMtZ2NlLmg+Cj4gPiArCj4gPiArICAgIG1kcDNfY2NvcnI6IG1k
cDNfY2NvcnJAMTQwMWMwMDAgewo+ID4gKyAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTgzLW1kcDMtY2NvcnIiOwo+ID4gKyAgICAgIG1lZGlhdGVrLG1kcDMtaWQgPSA8MD47Cj4gPiAr
ICAgICAgcmVnID0gPDB4MTQwMWMwMDAgMHgxMDAwPjsKPiA+ICsgICAgICBtZWRpYXRlayxnY2Ut
Y2xpZW50LXJlZyA9IDwmZ2NlIFNVQlNZU18xNDAxWFhYWCAweGMwMDAKPiA+IDB4MTAwMD47Cj4g
PiArICAgICAgY2xvY2tzID0gPCZtbXN5cyBDTEtfTU1fTURQX0NDT1JSPjsKPiA+ICsgICAgfTsK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
