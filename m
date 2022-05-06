Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78046C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 15:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vv+N8bSwaABaj2x3Ye0NryVPRvcyCGCujV5zQIFOpuw=; b=J0SF3fPyBOBT5L
	P5rfz7A1M5fZ0EkEKRtRH+y/64JK+wn9pgv+rbNGtU0eyw5kWgwzuvD5QPA7/lNPAZybwO1QBinr4
	ymeWYUa2uKhwbEg6f9zxHVMtVK4uYOpiB5EctmEG/F36AP8fJRolac8QR+Et5FQJiOBfInlCsyDkm
	3JKNfMeX3aGIT9WKcKAo2WxSvHIvzIFk1XzvRH3TFB8P2CL62rv1I0cBu5QD3vsOy6bwd3HlAVK8z
	7gW31SD/MYflqNXBFyjjsoW9XIq5BPoRSJns9dOWAkcXeWmLMvrsvcBJcTARhZD00MZM7DJGrBEOv
	T3WkENtJbVKBjHwuyngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn01Q-0047l6-H3; Fri, 06 May 2022 15:37:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmzwl-0045XP-Qt; Fri, 06 May 2022 15:32:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AAFC61F46B21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651851166;
 bh=E9l9sl9XPbOxjAAJCEpY1wi9N4oVvcnWNoaRqxjeKaE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HwsVlLDRN+mPeE5XOJN9SrgZViyD4n7jTBgI133jgiTtJ270+gEcI1KTmgBO2nVJp
 3u8Bp/fL1gHcs78xMzxhXbjEyc+93iodMXlCkSyRzsoRN8nLT2Kud6tJazN0Z6a5vA
 MR39o257cBNwLSvC+emqdRhejNEplfY8ZpWfWg+9r8PQkFiS4Vk0N+V/DE9IIdJDEO
 g7VRMQA2n2nrR+yiUKFzJBYpjjFT4BS6x/tA7Pm17vjx15zCbbOT7NGz8T8u/dXtYJ
 bIMHDexQomhLGVOax3oXVaA1tt5TUdieOSAPxgM0fmGAXmURGW8ewY7Pni3UGDUuOO
 lQhGxClbKNJOg==
Message-ID: <22c1aa6b-d785-9bb3-354f-0d747e2392a1@collabora.com>
Date: Fri, 6 May 2022 17:32:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 00/16] Introduce support for MediaTek MT8192 Google
 Chromebooks
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Luca Weiss <luca@z3ntu.xyz>, Maxim Kutnij <gtk3@inbox.ru>,
 Rob Herring <robh+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220505194550.3094656-1-nfraprado@collabora.com>
 <CAGXv+5Hk2u+1zkVjNEt7wdwAJyoB+-PMAuh7UKWEkDeYxp5zUQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Hk2u+1zkVjNEt7wdwAJyoB+-PMAuh7UKWEkDeYxp5zUQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_083248_071977_9A244564 
X-CRM114-Status: GOOD (  23.50  )
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

SWwgMDYvMDUvMjIgMTM6NDEsIENoZW4tWXUgVHNhaSBoYSBzY3JpdHRvOgo+IE9uIEZyaSwgTWF5
IDYsIDIwMjIgYXQgMzo0NiBBTSBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbwo+IDxuZnJhcHJhZG9A
Y29sbGFib3JhLmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+IFRoaXMgc2VyaWVzIGludHJvZHVjZXMgRGV2
aWNldHJlZXMgZm9yIHRoZSBNVDgxOTItYmFzZWQgQXN1cmFkYSBwbGF0Zm9ybQo+PiBhcyB3ZWxs
IGFzIEFzdXJhZGEgU3BoZXJpb24gYW5kIEFzdXJhZGEgSGF5YXRvIGJvYXJkcy4KPj4KPj4gU3Vw
cG9ydCBmb3IgdGhlIGJvYXJkcyBpcyBhZGRlZCB0byB0aGUgZXh0ZW50IHRoYXQgaXMgY3VycmVu
dGx5IGVuYWJsZWQKPj4gaW4gdGhlIG10ODE5Mi5kdHNpLCBhcyB0byBub3QgYWRkIGFueSBkZXBl
bmRlbmNpZXMgdG8gdGhpcyBzZXJpZXMuCj4+Cj4+IEJlc2lkZXMgdGhlIG90aGVyIGR0LWJpbmRp
bmcgZml4ZXMgYWxyZWFkeSBvbiBsaW51eC1uZXh0IHRvIGF2b2lkIG5ldwo+PiB3YXJuaW5ncyBi
eSB0aGlzIHNlcmllcywgWzFdIGlzIGFscmVhZHkgbWVyZ2VkIGJ1dCBub3Qgb24gbmV4dCB5ZXQu
Cj4+Cj4+IFRoaXMgc2VyaWVzIHdhcyBwZWVyLXJldmlld2VkIGludGVybmFsbHkgYmVmb3JlIHN1
Ym1pc3Npb24uCj4+Cj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA0Mjky
MDEzMjUuMjIwNTc5OS0xLW5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tLwo+Pgo+PiB2MTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwMzE2MTUxMzI3LjU2NDIxNC0xLW5mcmFwcmFkb0Bj
b2xsYWJvcmEuY29tLwo+Pgo+PiBDaGFuZ2VzIGluIHYyOgo+PiAtIEFkZGVkIHBhdGNoZXMgMS0y
IGZvciBNZWRpYXRlayBib2FyZCBkdC1iaW5kaW5ncwo+PiAtIEFkZGVkIHBhdGNoZXMgMTMtMTYg
ZW5hYmxpbmcgaGFyZHdhcmUgZm9yIEFzdXJhZGEgdGhhdCBoYXMgc2luY2UgYmVlbgo+PiAgICBl
bmFibGVkIG9uIG10ODE5Mi5kdHNpCj4+Cj4+IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvICgxNik6
Cj4+ICAgIGR0LWJpbmRpbmdzOiBhcm02NDogZHRzOiBtZWRpYXRlazogQWRkIG10ODE5Mi1hc3Vy
YWRhLXNwaGVyaW9uCj4+ICAgIGR0LWJpbmRpbmdzOiBhcm02NDogZHRzOiBtZWRpYXRlazogQWRk
IG10ODE5Mi1hc3VyYWRhLWhheWF0bwo+PiAgICBhcm02NDogZHRzOiBtZWRpYXRlazogSW50cm9k
dWNlIE1UODE5Mi1iYXNlZCBBc3VyYWRhIGJvYXJkIGZhbWlseQo+PiAgICBhcm02NDogZHRzOiBt
ZWRpYXRlazogYXN1cmFkYTogRG9jdW1lbnQgR1BJTyBuYW1lcwo+PiAgICBhcm02NDogZHRzOiBt
ZWRpYXRlazogYXN1cmFkYTogQWRkIHN5c3RlbS13aWRlIHBvd2VyIHN1cHBsaWVzCj4+ICAgIGFy
bTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRhOiBFbmFibGUgYW5kIGNvbmZpZ3VyZSBJMkMgYW5k
IFNQSSBidXNzZXMKPj4gICAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IGFzdXJhZGE6IEFkZCBDaHJv
bWVPUyBFQwo+PiAgICBhcm02NDogZHRzOiBtZWRpYXRlazogYXN1cmFkYTogQWRkIGtleWJvYXJk
IG1hcHBpbmcgZm9yIHRoZSB0b3Agcm93Cj4+ICAgIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhc3Vy
YWRhOiBBZGQgQ3I1MCBUUE0KPj4gICAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IGFzdXJhZGE6IEFk
ZCBFbGFuIGVLVEgzMDAwIEkyQyB0cmFja3BhZAo+PiAgICBhcm02NDogZHRzOiBtZWRpYXRlazog
YXN1cmFkYTogQWRkIEkyQyB0b3VjaHNjcmVlbgo+PiAgICBhcm02NDogZHRzOiBtZWRpYXRlazog
c3BoZXJpb246IEFkZCBrZXlib2FyZCBiYWNrbGlnaHQKPj4gICAgYXJtNjQ6IGR0czogbWVkaWF0
ZWs6IGFzdXJhZGE6IEVuYWJsZSBYSENJCj4+ICAgIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhc3Vy
YWRhOiBFbmFibGUgUENJZSBhbmQgYWRkIFdpRmkKPj4gICAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6
IGFzdXJhZGE6IEFkZCBNVDYzNTkgUE1JQwo+PiAgICBhcm02NDogZHRzOiBtZWRpYXRlazogYXN1
cmFkYTogQWRkIFNQTUkgcmVndWxhdG9ycwo+IAo+IFRlc3RlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3
ZW5zdEBjaHJvbWl1bS5vcmc+Cj4gCj4gSSB0ZXN0ZWQgYWxsIHRoZSBleHRlcm5hbCBwZXJpcGhl
cmFscywgaW5jbHVkaW5nIHRvdWNocGFkLCB0b3VjaHNjcmVlbiwKPiBrZXlib2FyZCAod2hpY2gg
bmVlZHMgYSBmaXgpLCBVU0IsIFdpRmkgb24gYm90aCBtb2RlbHMsIGFuZCB0aGUga2V5Ym9hcmQK
PiBiYWNrbGlnaHQgYW5kIChVU0ItYmFzZWQpIEJsdWV0b290aCBvbiBTcGhlcmlvbi4KPiAKPiBD
b3VsZCB5b3UgYWxzbyBlbmFibGUgdGhlIFNDUD8gT3RoZXJ3aXNlIHRoZSB2Y29kZWMgZ2VuZXJh
dGVzIGJpZyB3YXJuaW5ncwo+IHdoZW4gaXQgcHJvYmVzLgo+IAo+IEFuZCBhbHNvIHdvdWxkIGxp
a2UgdG8gc2VlIE1NQy4gOikKPiAKPiAKPiBUaGFua3MKPiBDaGVuWXUKCkhlbGxvIENoZW5ZdSwK
CndlIGF2b2lkZWQgZW5hYmxpbmcgdGhlIFNDUCBhbmQgdGhlIE1NQyBiZWNhdXNlIG9mIHNvbWUg
dGhpbmdzIHRoYXQgaGF2ZSB0byBiZQphc3Nlc3NlZCBhbmQgZml4ZWQgb24gb3VyIHNpZGUuCkZv
ciB0aGUgU0NQLCB3ZSBoYXZlIHNvbWUgaXNzdWVzIGFib3V0IGxvYWRpbmcgdGhlIGZpcm13YXJl
LCB3ZSBzdXNwZWN0IHRoYXQgdGhlCmJpbmFyeSB0aGF0IGlzIGluIGxpbnV4LWZpcm13YXJlIG5l
ZWRzIGRpZmZlcmVudCBhbmQvb3IgbGFyZ2VyIGNhcnZlb3V0czsKRm9yIHRoZSBNTUMsIHdlIGhh
dmUgc29tZSBpc3N1ZXMgd2l0aCB0aGUgcGluIGNvbmZpZ3VyYXRpb24gcmVnYXJkaW5nIHRoZSBw
aW5zCmRyaXZlIHN0cmVuZ3RoOiB0aGlzIHNob3VsZCBiZSBzb2x2ZWQsIGJ1dCB3ZSB3YW50IHRv
IG1ha2Ugc3VyZSB0aGF0IG1vcmUgdGVzdGluZwpnZXRzIGRvbmUgYmVmb3JlIHdlIHB1c2ggdGhh
dCB1cHN0cmVhbS4KCldlJ3JlIHRyeWluZyB0byB1cHN0cmVhbSB0aGUgQXN1cmFkYSBwbGF0Zm9y
bSBzdGVwIGJ5IHN0ZXAgYXMgdG8gc2VlIHRoZXNlCm1hY2hpbmVzIHByZXNlbnQgb24gdXBzdHJl
YW0gYXMgc29vbiBhcyBwb3NzaWJsZSwgd2l0aCBmdW5jdGlvbmFsaXR5IHRoYXQgaXMKd2VsbCB0
ZXN0ZWQgYW5kIGNsZWFuLCBzbyB0aGF0IGl0IHdvdWxkIG1ha2Ugbm8gc2Vuc2UgdG8gbW9kaWZ5
IHRoZW0gYWdhaW4gaW4KdGhlIG5lYXIgZnV0dXJlLgoKQXMgdGhpcyBzZXJpZXMgZ2V0cyBwaWNr
ZWQgKGhvcGVmdWxseSkgYnkgdGhlIG1haW50YWluZXIsIHdlIHdpbGwgdGhlbiBtYWtlIHN1cmUK
dG8gc2VuZCBvbmUgKG9yIG1vcmUsIGRlcGVuZGluZyBvbiB2YXJpb3VzIGZhY3RvcnMpIGZvbGxv
d3VwIHNlcmllcyBlbmFibGluZyBtb3JlCmFuZCBtb3JlIGZ1bmN0aW9uYWxpdHksIHVudGlsIHRo
ZSBwbGF0Zm9ybSBpbnRlZ3JhdGlvbiByZWFjaGVzIDEwMCUgY29tcGxldGlvbi4KCkF0IGxlYXN0
LCB0aGF0J3MgdGhlIHBsYW4gOi0pCgpDaGVlcnMsCkFuZ2VsbwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
