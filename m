Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9566C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6QzMhc4R9mC7T+OzLOsRFZYHxoKoud84VorsnwIF+4=; b=dnJEfOoLtkzBiw
	1gZHGZnZ1W2RWehSBaoIHvll9opDgywxVnPKhJSSyDGWYNXsxuuumHv7fGq/NnIW8PWUjoMvEoCcM
	+pw1ks/IDLcf35ioxCNjSWRaLKGCxK60Tbimel2e/7vUOk7/QHTZBbbe/m44X+TMeRdT5bJrgYqF6
	aomM1DdoWznDy6eL3O0Y6JAV+aOlQpeoqjLYtRHo6O+TkB/gsQhhDeAzxCG8eJdPvZvLiGPnnUC0M
	Acz8SG+KscMN2PRzNN9S3S4NgvYopA8imwRYkW/AvQ0VTp0rIGpSM87vr9iKZx8OngmRtP5h9lNhC
	x7wsl68rwuObiH+mec6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4iU-002zM4-Im; Mon, 23 May 2022 09:51:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2q2-002AAA-Vj; Mon, 23 May 2022 07:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=eaxYDTmkzq+Z+jpwFpVYCGEY1zMr0AC7IEwqDrCgoyE=; b=JqNVvjHLD6sAk0F6ZJmthGotrd
 bRAoSqAZXgXWg2NqPQmA1KQ8ybermko5GHmgw+TjHo24cwuBB4xYlqcVEmlOVC/DK1jBu7NKULi8m
 PEQe7IoXfSXllgNPR5p1HITXLXWq7SdcX030b9/c6MK9PNXLxG9Z8vTsM6Wfh4U0okD4vc/pDh+WP
 9lnV3+aMkHDHENgmyYhIz8MY4ZsMUTgEIo9L2O4aUqmyA5yfHDI4f+x57DcWfYv3PHIznQ6n9xAiZ
 JOi+0SMwI5zXNshBFrY7sLSeFhizfJ+B5voDZodJEDBxwIccahT342gtNp9LCyRhoER44i5Egg4yT
 7JbskA0A==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt0Ly-000qef-0K; Mon, 23 May 2022 05:11:41 +0000
X-UUID: 9e497e6271ba4f4ab7434f7a09a4ee2c-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:9967d2d4-8b28-4e6c-93e8-4ef484b4b21b, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:ef782ce3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 9e497e6271ba4f4ab7434f7a09a4ee2c-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1905653623; Sun, 22 May 2022 22:11:04 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 22:11:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 13:11:01 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 May 2022 13:11:01 +0800
Message-ID: <39132f3173df651ea0e2d7ea399008b9ba8d1892.camel@mediatek.com>
Subject: Re: [PATCH v7 16/19] arm64: dts: mediatek: Add infra #reset-cells
 property for MT8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, Chun-Jie Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=B5=9A=E6=A1=80=29?= <Chun-Jie.Chen@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>, Runyang Chen
 =?UTF-8?Q?=28=E9=99=88=E6=B6=A6=E6=B4=8B=29?= <Runyang.Chen@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 23 May 2022 13:11:01 +0800
In-Reply-To: <20220520153034.v4dvh4bn2pon6nnr@notapiano>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
 <20220519125527.18544-17-rex-bc.chen@mediatek.com>
 <20220520153034.v4dvh4bn2pon6nnr@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_061138_735680_840DD394 
X-CRM114-Status: GOOD (  21.68  )
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

T24gRnJpLCAyMDIyLTA1LTIwIGF0IDIzOjMwICswODAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBIaSBSZXgsCj4gCj4gT24gVGh1LCBNYXkgMTksIDIwMjIgYXQgMDg6NTU6MjRQ
TSArMDgwMCwgUmV4LUJDIENoZW4gd3JvdGU6Cj4gPiBXZSB3aWxsIHVzZSBtZWRpYXRlayBjbG9j
ayByZXNldCBhcyBpbmZyYWNmZ19hbyByZXNldCBpbnN0ZWFkIG9mCj4gPiB0aS1zeXNjb24uIFRv
IHN1cHBvcnQgdGhpcywgcmVtb3ZlIHByb3BlcnR5IG9mIHRpIHJlc2V0IGFuZCBhZGQKPiA+IHBy
b3BlcnR5IG9mICNyZXNldC1jZWxscyBmb3IgbWVkaWF0ZWsgY2xvY2sgcmVzZXQuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+Cj4g
PiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPAo+ID4gYW5nZWxvZ2lv
YWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRzaSB8IDEzICstLS0tLS0tLS0tLS0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRzaQo+ID4gYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS5kdHNpCj4gPiBpbmRleCBiNTdlNjIw
YzJjNzIuLjhlNWFjMTFiMTlmMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTk1LmR0c2kKPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTk1LmR0c2kKPiA+IEBAIC0xMCw3ICsxMCw2IEBACj4gPiAgI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgo+ID4gICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9waHkvcGh5Lmg+Cj4gPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvbXQ4MTk1
LXBpbmZ1bmMuaD4KPiA+IC0jaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQvdGktc3lzY29uLmg+
Cj4gPiAgCj4gPiAgLyB7Cj4gPiAgCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1IjsKPiA+
IEBAIC0yOTUsMTcgKzI5NCw3IEBACj4gPiAgCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
OTUtaW5mcmFjZmdfYW8iLAo+ID4gInN5c2NvbiIsICJzaW1wbGUtbWZkIjsKPiAKPiBJIGJlbGll
dmUgdGhlICdzaW1wbGUtbWZkJyBjb21wYXRpYmxlIHdhcyBhZGRlZCBvbmx5IHRvIG1ha2UgdGhl
Cj4gcmVzZXQtY29udHJvbGxlciBzdWJub2RlIHByb2JlIChhdCBsZWFzdCB0aGlzIHdhcyB0aGUg
Y2FzZSBmb3IKPiBtdDgxOTIpLCBzbyBpdAo+IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8gZHJvcCBpdCBo
ZXJlIGFzIHdlbGwuCj4gCj4gVGhhbmtzLAo+IE7DrWNvbGFzCj4gCgpIZWxsbyBOw61jb2xhcywK
b2ssIEkgd2lsbCBkcm9wICdzaW1wbGUtbWZkJyBpbiBuZXh0IHZlcnNpb24uCgpCUnMsClJleAoK
PiA+ICAJCQlyZWcgPSA8MCAweDEwMDAxMDAwIDAgMHgxMDAwPjsKPiA+ICAJCQkjY2xvY2stY2Vs
bHMgPSA8MT47Cj4gPiAtCj4gPiAtCQkJaW5mcmFjZmdfcnN0OiByZXNldC1jb250cm9sbGVyIHsK
PiA+IC0JCQkJY29tcGF0aWJsZSA9ICJ0aSxzeXNjb24tcmVzZXQiOwo+ID4gLQkJCQkjcmVzZXQt
Y2VsbHMgPSA8MT47Cj4gPiAtCQkJCXRpLHJlc2V0LWJpdHMgPSA8Cj4gPiAtCQkJCQkweDE0MCAx
OCAweDE0NCAxOCAwIDAKPiA+IChBU1NFUlRfU0VUIHwgREVBU1NFUlRfU0VUIHwgU1RBVFVTX05P
TkUpIC8qIHBjaWUgKi8KPiA+IC0JCQkJCTB4MTIwIDAgIDB4MTI0IDAgIDAgMAo+ID4gKEFTU0VS
VF9TRVQgfCBERUFTU0VSVF9TRVQgfCBTVEFUVVNfTk9ORSkgLyogdGhlcm1hbCAqLwo+ID4gLQkJ
CQkJMHg3MzAgMTAgMHg3MzQgMTAgMCAwCj4gPiAoQVNTRVJUX1NFVCB8IERFQVNTRVJUX1NFVCB8
IFNUQVRVU19OT05FKSAvKiB0aGVybWFsICovCj4gPiAtCQkJCQkweDE1MCA1ICAweDE1NCA1ICAw
IDAKPiA+IChBU1NFUlRfU0VUIHwgREVBU1NFUlRfU0VUIHwgU1RBVFVTX05PTkUpIC8qIHN2cyBn
cHUgKi8KPiA+IC0JCQkJPjsKPiA+IC0JCQl9Owo+ID4gKwkJCSNyZXNldC1jZWxscyA9IDwxPjsK
PiA+ICAJCX07Cj4gPiAgCj4gPiAgCQlwZXJpY2ZnOiBzeXNjb25AMTAwMDMwMDAgewo+ID4gLS0g
Cj4gPiAyLjE4LjAKPiA+IAo+ID4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
