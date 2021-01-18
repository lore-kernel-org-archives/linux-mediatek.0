Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86556C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 14:56:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4874122C9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 14:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4874122C9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6x4vLriBiND6W/hPLcwYpOezx9zKUFde57JSaIoalqU=; b=e3aub22r8xFyADZuQ6ZIXIbx1
	lXdE+xT2w5deN3isSn0Ky+VMfejrw3h2QQnTMKPRa3AJ7TY5cN7rcSBjrBNf/H52Ywwr+/irZcgwd
	CZyNyIkkemrA5ofayCqQTSqMhLdJYUxovl6CN020jt3tnS8Ttrfp8JYtfEhgWLY4OombVn3N5CYOM
	BGvff3ooqCOixoBNHd+w5ZjJ96HqLhfoy+W2Joq1vMnZJ2yqRlbhDt8iaQZriKaiLEbmEAgZcgtU2
	4ew2DsDRu0Vyc7UylwSi04DTj/GSj0UdOueIc9eEqq0+KCdV33hnuOSBPxua+jag66k5b60BZ4O3Y
	5Xk8K9xYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1VxW-0001DZ-Kd; Mon, 18 Jan 2021 14:56:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1VxQ-0001An-UM; Mon, 18 Jan 2021 14:56:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 088CA22C9D;
 Mon, 18 Jan 2021 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610981799;
 bh=Han/yBiP7YCv1DXxaRT5BucStPwaHvat3bP/RRDdIcU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=avLtiyDQmnR9BLa+wtOvaFsMFXNbe1OmFAoxgLQkXH0IEdgaE75ZVyjzlyMov/hQ7
 W2qi1DcjEyu/UvCF3CNjQ+truPkhUjN2RBEExIROxXkqy5XCa0kC1z5Nvw7j5/wCle
 hVEiqpdTgj3qSrL3Nl7umSk+NETXx8QVdf8qIck/dc6q3fk7kOrlOhJ4G/N4/bOzqD
 uZY3Bw3s9+FIJVgFValBTrFZcA+gvjo/O95OBgs7rA9ExusVsBbvwR+vy5CzrLa++q
 JA3gF6hT9ZZ+uKbh+fM+ZskKfu1j+pGh7cvaedstV0rV7zw3fOhJObJILZRmUCAQ1n
 C2UMHnJ7kHpTA==
Received: by mail-ej1-f48.google.com with SMTP id a10so7446718ejg.10;
 Mon, 18 Jan 2021 06:56:38 -0800 (PST)
X-Gm-Message-State: AOAM532OCvue0zYzQ5HMA0+ddkk0azV+0mVfVdPyxWH7bb8H65vAQKwu
 3YZSMK+q8yNjnyn51/3xw/8BIxkd6XVUSZQlvg==
X-Google-Smtp-Source: ABdhPJzQmiS9/MsRXPQe1QLclHpEy2erv8VURiXmHTwJ59O6sI9r4nQ58rZnC7a+vUSVQmEFf565IppWMasuz6EtwSo=
X-Received: by 2002:a17:906:35c9:: with SMTP id p9mr77562ejb.310.1610981797653; 
 Mon, 18 Jan 2021 06:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
 <20210116090656.11752-3-chunfeng.yun@mediatek.com>
In-Reply-To: <20210116090656.11752-3-chunfeng.yun@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 18 Jan 2021 22:56:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8FV87MTSi_Mc2MA3uWzCUBcpCC5Sne2Wc6X1R57EiCkw@mail.gmail.com>
Message-ID: <CAAOTY_8FV87MTSi_Mc2MA3uWzCUBcpCC5Sne2Wc6X1R57EiCkw@mail.gmail.com>
Subject: Re: [PATCH next 03/15] dt-bindings: phy: mediatek: dsi-phy: modify
 compatible dependence
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_095641_106141_69D55CF5 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 DTML <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIENodW5mZW5nOgoKQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMeW5tDHmnIgxNuaXpSDpgLHlha0g5LiL5Y2INTowN+Wvq+mBk++8mgo+Cj4gVGhlIGNv
bXBhdGlsYmUgIm1lZGlhdGVrLG10NzYyMy1taXBpLXR4IiBpcyBub3Qgc3VwcG9ydGVkIGluIGRy
aXZlciwKPiBhbmQgaW4gZmFjdCB1c2VzICJtZWRpYXRlayxtdDI3MDEtbWlwaS10eCIgaW5zdGVh
ZCBvbiBNVDc2MjMsIHNvIGNoYW5nZXMKPiB0aGUgY29tcGF0aWJsZSBpdGVtcyB0byBtYWtlIGRl
cGVuZGVuY2UgY2xlYXIuCj4KPiBBbmQgYWRkIGFuIG9wdGlvbmFsICJjbG9jay1uYW1lcyIgcHJv
cGVydHksIGl0J3Mgbm90IHVzZWQgdG8gZ2V0IHRoZSBjbG9jaywKPiBidXQgc29tZSBEVFMgZmls
ZXMgcHJvdmlkZSBpdC4KClNlcGFyYXRlIHRoZSBjbG9jayBwYXJ0IHRvIGFub3RoZXIgcGF0Y2gu
CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IENjOiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4KPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5k
ZT4KPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5j
b20+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sICAgICAg
ICAgIHwgMTcgKysrKysrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFtbAo+IGluZGV4IDcx
ZDRhY2VhMWY2Ni4uYWY2ZTU1NGM1YjY5IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sCj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwKPiBA
QCAtMTksMTEgKzE5LDE0IEBAIHByb3BlcnRpZXM6Cj4gICAgICBwYXR0ZXJuOiAiXmRzaS1waHlA
WzAtOWEtZl0rJCIKPgo+ICAgIGNvbXBhdGlibGU6Cj4gLSAgICBlbnVtOgo+IC0gICAgICAtIG1l
ZGlhdGVrLG10MjcwMS1taXBpLXR4Cj4gLSAgICAgIC0gbWVkaWF0ZWssbXQ3NjIzLW1pcGktdHgK
PiAtICAgICAgLSBtZWRpYXRlayxtdDgxNzMtbWlwaS10eAo+IC0gICAgICAtIG1lZGlhdGVrLG10
ODE4My1taXBpLXR4Cj4gKyAgICBvbmVPZjoKPiArICAgICAgLSBpdGVtczoKPiArICAgICAgICAg
IC0gZW51bToKPiArICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10NzYyMy1taXBpLXR4Cj4gKyAg
ICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDI3MDEtbWlwaS10eAo+ICsgICAgICAtIGNvbnN0
OiBtZWRpYXRlayxtdDI3MDEtbWlwaS10eAo+ICsgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgx
NzMtbWlwaS10eAo+ICsgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxODMtbWlwaS10eAo+Cj4g
ICAgcmVnOgo+ICAgICAgbWF4SXRlbXM6IDEKPiBAQCAtMzIsNiArMzUsMTAgQEAgcHJvcGVydGll
czoKPiAgICAgIGl0ZW1zOgo+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBQTEwgcmVmZXJlbmNlIGNs
b2NrCj4KPiArICBjbG9jay1uYW1lczoKPiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGNvbnN0OiBy
ZWYKPiArCj4gICAgY2xvY2stb3V0cHV0LW5hbWVzOgo+ICAgICAgbWF4SXRlbXM6IDEKPgo+IC0t
Cj4gMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
