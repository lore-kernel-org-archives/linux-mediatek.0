Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785C7C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 11:38:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C4E161002
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 11:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C4E161002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7WFFifBLFEoMlm2acHaMjeXZpDofEBl5dWFr7BotzU=; b=naFeiN3/9Ol9Wtg7X0AQ7EDme3
	wTlQyVUvgyfzHi0mFm6wCGXMwWkBSOvVgXTr52CT9TOckRlGEz5ugJLqXkLP7kTlPNyHzVrB5AT76
	CLZXavrOdupYGeJqh9LUPouFBp7/1cF+daXvkP/+YmK16oNmeB2keBBEJx2hGodD2nMsjfaa6hbSy
	Uoss9vwPLFYf/IJJiDVsoMo/VvdI3zhReKuaHlZdYjK5u6XCxsNVPH2oVqU4fcCdqwv2D/JmPXJZl
	fE4MrAIYbx1AazAQIBOxCrtt3g3llsgUhKO2s45kCSIHhyHlI3GDfkHvUOYA8Rn79MJqyZ1cp/YE9
	BhXZSusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYRil-00H8C8-4r; Thu, 07 Oct 2021 11:37:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYRiX-00H87y-TM; Thu, 07 Oct 2021 11:37:43 +0000
Received: from [IPv6:2a01:e0a:4cb:a870:f328:d7c8:496e:3dd] (unknown
 [IPv6:2a01:e0a:4cb:a870:f328:d7c8:496e:3dd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F076B1F44FA3;
 Thu,  7 Oct 2021 12:37:36 +0100 (BST)
Subject: Re: [PATCH v6, 12/15] media: mtk-vcodec: Support 34bits dma address
 for vdec
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <20210901083215.25984-13-yunfei.dong@mediatek.com>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <09ce48f4-a785-97d9-2920-eacb39c59573@collabora.com>
Date: Thu, 7 Oct 2021 13:37:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901083215.25984-13-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_043742_109380_B961A4D4 
X-CRM114-Status: GOOD (  20.36  )
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

CkxlIDAxLzA5LzIwMjEgw6AgMTA6MzIsIFl1bmZlaSBEb25nIGEgw6ljcml0wqA6Cj4gVXNlIHRo
ZSBkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50IGhlbHBlciB0byBzZXQgdmRlYwo+IERNQSBiaXQg
bWFzayB0byBzdXBwb3J0IDM0Yml0cyBpb3ZhIHNwYWNlKDE2R0IpIHRoYXQKPiB0aGUgbXQ4MTky
IGlvbW11IEhXIHN1cHBvcnQuCj4KPiBXaG9sZSB0aGUgaW92YSByYW5nZSBzZXBhcmF0ZSB0byAw
fjRHLzRHfjhHLzhHfjEyRy8xMkd+MTZHLAo+IHJlZ2FyZGluZyB3aGljaCBpb3ZhIHJhbmdlIFZE
RUMgYWN0dWFsbHkgbG9jYXRlLCBpdAo+IGRlcGVuZHMgb24gdGhlIGRtYS1yYW5nZXMgcHJvcGVy
dHkgb2YgdmRlYyBkdHNpIG5vZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdW5mZWkgRG9uZyA8eXVu
ZmVpLmRvbmdAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jIHwgMyArKysKPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMKPiBpbmRleCAwMDIzNTJmY2Y4ZGUuLjFh
OGQ5MzA4MzI3ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29k
ZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMKPiBAQCAtNDE3LDYgKzQxNyw5IEBAIHN0YXRp
YyBpbnQgbXRrX3Zjb2RlY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAg
CQl9Cj4gICAJfQo+ICAgCj4gKwlpZiAob2ZfZ2V0X3Byb3BlcnR5KHBkZXYtPmRldi5vZl9ub2Rl
LCAiZG1hLXJhbmdlcyIsIE5VTEwpKQo+ICsJCWRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQoJnBk
ZXYtPmRldiwgRE1BX0JJVF9NQVNLKDM0KSk7Cj4gKwoKSGkgWXVuZmVpLAoKRG9lcyBhbGwgU29D
IHN1cHBvcnQgMzRiaXRzIGlvdmEgc3BhY2UgPwpJZiBub3QgeW91IG5lZWQgdG8gYWxzbyBjaGVj
ayBTb0MgdmVyc2lvbiBiZWZvcmUgc2V0dGluZyBkbWEgbWFzay4KClJlZ2FyZHMsCkJlbmphbWlu
Cgo+ICAgCWZvciAoaSA9IDA7IGkgPCBNVEtfVkRFQ19IV19NQVg7IGkrKykKPiAgIAkJbXV0ZXhf
aW5pdCgmZGV2LT5kZWNfbXV0ZXhbaV0pOwo+ICAgCXNwaW5fbG9ja19pbml0KCZkZXYtPmlycWxv
Y2spOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
