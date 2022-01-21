Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F8BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 11:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYJJ2h2WlgEhQYjJTfjug0ibblVtFaor70erQtk06rI=; b=NnOm3VSG3epxe7W8YTnEvhuNVS
	APCkiwBazTlhupKNnboE/urvRuhWXuySXTWG+FTC3R9a0a7nfzu/2VkxSKMeH+Jl8NoyFIBRQs1rA
	o7DHjEnn/yWgnH/WpIFa3sjHNLJUTHO1nBrNGhqe8HjYOGITpsQjN6pzC6NcUraDcdzcbxBMzC3BK
	ENzQ4EwjQVzkKaXe6SqSyX0hP/cy7KkCYDIFegTtAROIWvjFFBSFrv9VFv9YPfNQFDRinVaGJ9pvW
	MfsJh2oy9ceHHv9B8q5lap3qsvCj44IdjqaOoqfv5K3ay7NS+wiog15Zqgr/mU2RHh4sG55S5GD5G
	rQXKOjlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAsNI-00EpcB-R0; Fri, 21 Jan 2022 11:46:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAsN7-00EpaJ-Bd; Fri, 21 Jan 2022 11:46:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E4FBD1F45D2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642765581;
 bh=BaeBPWQQLy8TR0zWndGX80fxT+ee71mjcJucVO2+uYQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fQxyUyYCryV+CGfTGU3W68Ul5GIQKr6bHvhHFOeFLcsg9vNn/6pOzSE2uRN0P47eV
 YgnXTN94rEfrWlUzpR9WrHA9afTXl7VvbTqF+xWtVA7bl3W9Zd9tVuWnI7v6S0FNJV
 waDZzay12MA1d6KoD6CKeZbcHl3A4n1V30Z187YQ0seGtLaBRaTFSo34JlXptlMXgR
 K4ki/3NDpwcta9IL/MBY9nt35zJPb+Ez+8ZbF7wbZopU2AXvO0HT9dzGXqzeBpGCcq
 CstVgUC0Zxgj2UgOhfnzLByHzude5vxdNzYPbc96r8WxtuZjcLidunmeUnddLMjSDr
 gBdtgO+gsmQzQ==
Subject: Re: [PATCH] arm64: dts: mt8183: jacuzzi: Fix bus properties in anx's
 DSI endpoint
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Xin Ji <xji@analogixsemi.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20220120224204.773117-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <29069a98-a839-4fb6-5b83-7877402aaf30@collabora.com>
Date: Fri, 21 Jan 2022 12:46:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220120224204.773117-1-nfraprado@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_034625_559888_1863904A 
X-CRM114-Status: GOOD (  20.46  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SWwgMjAvMDEvMjIgMjM6NDIsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
bXQ4MTgzLWt1a3VpLWphY3V6emkgaGFzIGFuIGFueDc2MjUgYnJpZGdlIGNvbm5lY3RlZCB0byB0
aGUgb3V0cHV0IG9mCj4gaXRzIERTSSBob3N0LiBIb3dldmVyLCBhZnRlciBmZDAzMTBiNmZlN2Qg
KCJkcm0vYnJpZGdlOiBhbng3NjI1OiBhZGQKPiBNSVBJIERQSSBpbnB1dCBmZWF0dXJlIiksIGEg
YnVzLXR5cGUgcHJvcGVydHkgc3RhcnRlZCBiZWluZyByZXF1aXJlZCBpbgo+IHRoZSBlbmRwb2lu
dCBub2RlIGJ5IHRoZSBkcml2ZXIgdG8gaW5kaWNhdGUgd2hldGhlciBpdCBpcyBEU0kgb3IgRFBJ
Lgo+IAo+IEFkZCB0aGUgbWlzc2luZyBidXMtdHlwZSBwcm9wZXJ0eSBhbmQgc2V0IGl0IHRvIDUK
PiAoVjRMMl9GV05PREVfQlVTX1RZUEVfUEFSQUxMRUwpIHNvIHRoYXQgdGhlIGRyaXZlciBoYXMg
aXRzIGlucHV0Cj4gY29uZmlndXJlZCB0byBEU0kgYW5kIHRoZSBkaXNwbGF5IHBpcGVsaW5lIGNh
biBwcm9iZSBjb3JyZWN0bHkuCj4gCj4gV2hpbGUgYXQgaXQsIGFsc28gc2V0IHRoZSBkYXRhLWxh
bmVzIHByb3BlcnR5IHRoYXQgd2FzIGFsc28gaW50cm9kdWNlZAo+IGluIHRoYXQgc2FtZSBjb21t
aXQsIHNvIHRoYXQgd2UgZG9uJ3QgcmVseSBvbiB0aGUgZGVmYXVsdCB2YWx1ZS4KPiAKPiBGaXhl
czogZmQwMzEwYjZmZTdkICgiZHJtL2JyaWRnZTogYW54NzYyNTogYWRkIE1JUEkgRFBJIGlucHV0
IGZlYXR1cmUiKQo+IFNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJh
cHJhZG9AY29sbGFib3JhLmNvbT4KClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgoKPiAtLS0KPiAg
IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWt1a3VpLWphY3V6emkuZHRzaSB8
IDIgKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWktamFjdXp6aS5kdHNp
IGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWktamFjdXp6aS5kdHNp
Cj4gaW5kZXggOGY3YmYzM2Y2MDdkLi5lOGYxMzNkYzk2YjkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWktamFjdXp6aS5kdHNpCj4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWktamFjdXp6aS5kdHNpCj4g
QEAgLTE3MSw2ICsxNzEsOCBAQCBwb3J0QDAgewo+ICAgCj4gICAJCQlhbng3NjI1X2luOiBlbmRw
b2ludCB7Cj4gICAJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZkc2lfb3V0PjsKPiArCQkJCWJ1cy10
eXBlID0gPDU+Owo+ICsJCQkJZGF0YS1sYW5lcyA9IDwwIDEgMiAzPjsKPiAgIAkJCX07Cj4gICAJ
CX07Cj4gICAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
