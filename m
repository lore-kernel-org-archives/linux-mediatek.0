Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEF2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 21:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UM1NPAIdtLjMWTEcL71wlMekDalVAHyzxDuDiM1BiNE=; b=gSk9okz7Ioi5pX
	v/XZ+ld3PrnktckQkR9v4vDbHMKaRWsozwPo0jYCm6OtZ+pzJ1wK7FSNjnZV7ee7VGKX9V+5av6Wf
	aRbzIQuZmY4ea0Cq9cShBaf250CeIHwE+iqk1R/IL3raaF4IoEHbfenM9VZsHjy2bDRnhml/kKWIK
	L7NPYvYqEdOSzceVaDxQH6JX+ODHKPSLD2mFbA186/nq0svJuXS8+p8l/Pp16SJCl3CtKfQv6ulms
	FrSABxaHZUz6lQffWmQzzM/wyvwqN+nqi4LkepzvG4zW1DsC3k5uCzzBay3RU5AQ9tdNMYl3RKk4c
	Yt+9tHDGhlzcVEccjTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXUsR-000Hvi-88; Thu, 24 Mar 2022 21:20:15 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXUsE-000HtE-Oc; Thu, 24 Mar 2022 21:20:04 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 o20-20020a9d7194000000b005cb20cf4f1bso4195652otj.7; 
 Thu, 24 Mar 2022 14:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nZWBFSxF5EcD/7zsReIxioOFi/XH9lIHO9AjBk+DuYQ=;
 b=pBlfwNXGBDvm3AM980CpXsSpHC7ceKvdBwOXHhfi6FrEHbrEGKugpwrRMSJFzEK7up
 U3XJg6xcH5uAL5sun0y0SfFdt3fIPjOGSkh1G8EhzmCJQeyO1GbbzK5QF2WY1PA0LssY
 Q7VVa6Qa7B9Si4uaDCL/fB9HZgyKBdAcOfpQD/1oCGKoJnIh5oGRC+yLnRh0lRMT1jdy
 Movt1a01v3H0HbYqQ0GYkEh2nIEF7M/O4jqWqna7U3mDhrFB1YDHL3eK4Bxp8ViCmYnr
 dRlbXGPjfomcIc84lCdiz95m3VlOfIfvrA99jiagvEaNAt5g0TN+m5WMenpyWx+v3I2P
 fGUg==
X-Gm-Message-State: AOAM533dr9GBypxXGOibh+Wkw19L2dIcNxZrVFwEw0bLIcF3fYTyjSfE
 tBROzBAmOKP7D6jR4n/dPw==
X-Google-Smtp-Source: ABdhPJyODYrocQIME0OAE9G5smC2auk9j+xSOw5TB2oty2nbpPQU2zFSF3ULc0wpM/GONsqTcT7sJw==
X-Received: by 2002:a9d:7319:0:b0:5cd:121e:e11 with SMTP id
 e25-20020a9d7319000000b005cd121e0e11mr3043744otk.148.1648156801286; 
 Thu, 24 Mar 2022 14:20:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t10-20020a056830224a00b005cd9db03fabsm1806726otd.78.2022.03.24.14.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 14:20:00 -0700 (PDT)
Received: (nullmailer pid 2592144 invoked by uid 1000);
 Thu, 24 Mar 2022 21:19:59 -0000
Date: Thu, 24 Mar 2022 16:19:59 -0500
From: Rob Herring <robh@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 0/4] Fix MediaTek display dt-bindings issues
Message-ID: <Yjzgf10zAhrkpYde@robh.at.kernel.org>
References: <20220309134702.9942-1-jason-jh.lin@mediatek.com>
 <CAL_Jsq+=hTKTjB8rR77_uQYKDWHzLyTdeU7zbixSCZCNrdmNvg@mail.gmail.com>
 <CAAOTY__kzL8YuGo-oKct4c_bL-Ch5rW8wBpkhOXkK+a10gNXVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAOTY__kzL8YuGo-oKct4c_bL-Ch5rW8wBpkhOXkK+a10gNXVg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_142002_831594_1E77380A 
X-CRM114-Status: GOOD (  21.52  )
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
Cc: David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 DTML <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXIgMjQsIDIwMjIgYXQgMDk6MjU6NDRQTSArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3
cm90ZToKPiBIaSwgUm9iOgo+IAo+IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IOaWvCAy
MDIy5bm0M+aciDIz5pelIOmAseS4iSDkuIvljYgxMDoxMOWvq+mBk++8mgo+ID4KPiA+IE9uIFdl
ZCwgTWFyIDksIDIwMjIgYXQgNzo0NyBBTSBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRp
YXRlay5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBUaGUgdmRvc3lzMCBzZXJpZXMgY2FycmllZCBh
IG5pY2UgZHQtYmluZGluZ3MgY29udmVyc2lvbiBvZiB0aGUgb2xkCj4gPiA+IHR4dCBkb2N1bWVu
dGF0aW9uIGZvciB0aGUgZW50aXJlIG1lZGlhdGVrLWRybSBkcml2ZXIsIGJ1dCBzb21lIG9mCj4g
PiA+IHRoZSBpc3N1ZXMgaW4gdGhlcmUgd2VyZW4ndCBzZWVuLgo+ID4gPgo+ID4gPiBUaGlzIHNl
cmllcyBpcyBmaXhpbmcgYWxsIG9mIHRoZSBpc3N1ZXMgcG9pbnRlZCBvdXQgYnkgYQo+ID4gPiBg
ZHRfYmluZGluZ19jaGVja2AgcnVuLCBmb2xsb3dlZCBieSBgZHRic19jaGVja2AuCj4gPiA+Cj4g
PiA+IENoYW5nZSBpbiB2MjoKPiA+ID4gLSByZW1vdmUgbWVkaWF0ZWssZXRoZHIueWFtbCBmaWxl
Cj4gPiA+IC0gY2hhbmdlIGluY2x1ZGUgaGVhZGVyIG9mIG1lZGlhdGVrLG92bC0ybC55YW1sIGZy
b20gbXQ4MTczIHRvIG10ODE4Mwo+ID4gPgo+ID4gPiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdu
byAoMyk6Cj4gPiA+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrLCBtdXRleDogRml4
IG1lZGlhdGVrLCBnY2UtZXZlbnRzIHR5cGUKPiA+ID4gICBkdC1iaW5kaW5nczogZGlzcGxheTog
bWVkaWF0ZWssIG92bDogRml4ICdpb21tdScgcmVxdWlyZWQgcHJvcGVydHkKPiA+ID4gICAgIHR5
cG8KPiA+ID4gICBkdC1iaW5kaW5nczogZGlzcGxheTogbWVkaWF0ZWs6IEZpeCBleGFtcGxlcyBv
biBuZXcgYmluZGluZ3MKPiA+ID4KPiA+ID4gamFzb24tamgubGluICgxKToKPiA+ID4gICBSZXZl
cnQgImR0LWJpbmRpbmdzOiBkaXNwbGF5OiBtZWRpYXRlazogYWRkIGV0aGRyIGRlZmluaXRpb24g
Zm9yCj4gPiA+ICAgICBtdDgxOTUiCj4gPgo+ID4gQ2FuIHRoaXMgc2VyaWVzIGdldCBhcHBsaWVk
IHNvb24/IGxpbnV4LW5leHQgaXMgc3RpbGwgYnJva2VuLgo+ID4KPiA+IElmIGl0IGhpdHMgTGlu
dXMnIHRyZWUsIEkgd2lsbCBiZSBhcHBseWluZyB0aGVtLgo+IAo+IEkndmUgYXBwbGllZCB0aGlz
IHNlcmllcyB0byBteSB0cmVlIFsxXSwgYnV0IG5vdyBpcyBtZXJnZSB3aW5kb3csIHNvIEkKPiBw
bGFuIHRvIHNlbmQgdGhpcyBzZXJpZXMgdGhyb3VnaCBEYXZlJ3MgdHJlZSBhZnRlciA1LjE4LXJj
MS4gV291bGQKPiB0aGlzIGJlIHRvbyBsYXRlIGZvciB5b3U/CgpZZXMsIHBlb3BsZSBiYXNlIHRo
ZWlyIGRldmVsb3BtZW50IG9uIC1yYzEgYW5kIGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSAKYSBm
dW5jdGlvbmFsIHRyZWUuCgpUaGVyZSdzIG5vdCByZWFsbHkgYW55IG5lZWQgdG8gd2FpdCB0byBz
ZW5kIGZpeGVzLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
