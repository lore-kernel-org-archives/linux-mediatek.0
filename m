Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBE5C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 09:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSBEs58PH9valEjp0XqhDTgBcBPScx0EJ3bd2ezrGCk=; b=iQtTT46te497Mt
	7aC7bWg/Hlufyh7hDrfp2ZVjBF2z3WPtGmNwASu6cXza9g7gNKU0PFggZZ1MQSgySaTL+21Qylyks
	XpFo9lHYLstjJu0SDYSV/uDwjVEeN3MKc6Wb5g16yS/vR3g8gc82y/R3uFk3Ok5kpCNNNooDaBlqX
	1Li/M2R/2w2a7POxGz4oDlFDg/5xPQMwZXfVDHaYT6KHWeEVrUHK/zEPFFh0VgPUYF0EnMERijxLV
	akbqmnVXnhTjHiZCRmtk7GZhCNahLjTqgxVeXjajia1iuUJm5TjYr8HSFSiWjZWzKGCaQL24tKbK8
	cws2h3J0mY6tNmevu0wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPLlr-002Br0-Jt; Wed, 02 Mar 2022 09:59:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPLld-002BkN-2Y; Wed, 02 Mar 2022 09:59:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso899578wmr.1; 
 Wed, 02 Mar 2022 01:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bqn15CLszH8tgeYVXPDyS9PDZ9V24xOYhyZEU0cziCU=;
 b=KLHxpiGmD+04NGOjMBe6yOlM94zblYrTamClh0LbnsP5jkc9u1g7CSCSgFsvmQsdh9
 rYhEy0QAYYPsKcAZ7JiaQQdkByAkQB0VnHFbVu7duCCpZx+xQTGbbb41PCB+Qbe+L96Q
 mJOm7oIUiqlzWKo5888GlAF8x6ukCruimuRmcXP+nwrnW0wGR66rhDGF+IP5ahEZb7ld
 sOFRaaG1AuvKKxQAqfNao0dLczLwP7CD8liF5JkQ1ebJv5bbTaAOR96bjX/5olk9wg0a
 k/n1p68zpRtldT4j/gUStEy9kRxdlsy9SuUJ/827EHh5kgWAJuEroI9VsulyYBLvuJMP
 Bb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bqn15CLszH8tgeYVXPDyS9PDZ9V24xOYhyZEU0cziCU=;
 b=sv4OcJueBbdR41YH9BNvFZtHf9YZaHoudKD04MTuBie2STN49HPNWhWLEJxVzgm4/P
 hUoZ/7PP+3s+W16rwxj8veKhwhJO/BsNvMsE5tQii0KxSlqV7PNBfSptk5AM+uM09Mni
 93PVqO/CJugHERWjVYaErv/yQiyP49B/WMr3QweP+Qkimo4e+BloGXfZ7vR/FKTxr/V0
 orB2mWIK24j288cIQXLKN5k+XyRWFWx3DU3lJWz8tjwOiLtlQ9Q4Lj2sjsQaiukGp8cP
 ay8AMSyaB0z1B6kdBxftGgcDGFfEQO1PTLhHpHumX0ztfZqecY8o3TnnPm3aqVq9HV4i
 kaLA==
X-Gm-Message-State: AOAM532Vt+KDmf/H8viTFoaI7cf/EpWdlFVMlYU5PaFHRZEltCkEsIwD
 c+EEN3ukKNKHq3LBBcyMYPWeFePzIAyFzA==
X-Google-Smtp-Source: ABdhPJw99nTjEa0dXu0eyoXNDI7VMBV+HKjmZwzeXg3DgKKLpyej0dWV7jQr5um9TpsLlKMVGOWV1g==
X-Received: by 2002:a05:600c:a06:b0:37b:fdd8:4f8 with SMTP id
 z6-20020a05600c0a0600b0037bfdd804f8mr20490626wmp.41.1646215170531; 
 Wed, 02 Mar 2022 01:59:30 -0800 (PST)
Received: from [192.168.0.14] (static-63-182-85-188.ipcom.comunitel.net.
 [188.85.182.63]) by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm6844599wmp.44.2022.03.02.01.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 01:59:30 -0800 (PST)
Message-ID: <00c646de-053c-d84f-cb70-e33060264d40@gmail.com>
Date: Wed, 2 Mar 2022 10:59:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] arm: dts: mediatek: Format mediatek,larbs as an
 array of phandles
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220301203147.1143782-1-nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220301203147.1143782-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_015933_149778_FD8782AA 
X-CRM114-Status: GOOD (  19.07  )
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

CgpPbiAwMS8wMy8yMDIyIDIxOjMxLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyB3cm90ZToKPiBD
b21taXQgMzliZDJiNmEzNzgzICgiZHQtYmluZGluZ3M6IEltcHJvdmUgcGhhbmRsZS1hcnJheSBz
Y2hlbWFzIikKPiB1cGRhdGVkIHRoZSBtZWRpYXRlayxsYXJicyBwcm9wZXJ0eSBpbiB0aGUgbWVk
aWF0ZWssaW9tbXUueWFtbAo+IGR0LWJpbmRpbmcgdG8gbWFrZSBpdCBjbGVhcmVyIHRoYXQgdGhl
IHBoYW5kbGVzIHBhc3NlZCB0byB0aGUgcHJvcGVydHkKPiBhcmUgaW5kZXBlbmRlbnQsIHJhdGhl
ciB0aGFuIHN1YnNlcXVlbnQgYXJndW1lbnRzIHRvIHRoZSBmaXJzdCBwaGFuZGxlLgo+IAo+IFVw
ZGF0ZSB0aGUgbWVkaWF0ZWssbGFyYnMgcHJvcGVydHkgaW4gdGhlIGFybSBEZXZpY2V0cmVlcyB0
byB1c2UgdGhlCj4gc2FtZSBmb3JtYXR0aW5nLiBUaGlzIGNoYW5nZSBkb2Vzbid0IGltcGFjdCBh
bnkgYmVoYXZpb3I6IHRoZSBjb21waWxlZAo+IGR0YiBpcyBleGFjdGx5IHRoZSBzYW1lLiBJdCBk
b2VzIGhvd2V2ZXIgZml4IHRoZSB3YXJuaW5ncyBnZW5lcmF0ZWQgYnkKPiBkdGJzX2NoZWNrLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29s
bGFib3JhLmNvbT4KPiAKCkFwcGxpZWQsIHRoYW5rcyEKCk1hdHRoaWFzCgo+IC0tLQo+IHYxOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYXRlay8yMDIyMDIyNTIyNTMxNS44MDIy
MC0xLW5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tLwo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBTcGxp
dCBhcm0gYW5kIGFybTY0IGNoYW5nZXMgaW50byBzZXBhcmF0ZSBjb21taXRzCj4gCj4gICBhcmNo
L2FybS9ib290L2R0cy9tdDI3MDEuZHRzaSAgfCAyICstCj4gICBhcmNoL2FybS9ib290L2R0cy9t
dDc2MjNuLmR0c2kgfCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQyNzAx
LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaQo+IGluZGV4IDQ3NzZmODVkNmQ1
Yi4uNjQ3MjIyODUyMjhjIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5k
dHNpCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbXQyNzAxLmR0c2kKPiBAQCAtMjIyLDcgKzIy
Miw3IEBAIGlvbW11OiBtbXN5c19pb21tdUAxMDIwNTAwMCB7Cj4gICAJCWludGVycnVwdHMgPSA8
R0lDX1NQSSAxMDYgSVJRX1RZUEVfTEVWRUxfTE9XPjsKPiAgIAkJY2xvY2tzID0gPCZpbmZyYWNm
ZyBDTEtfSU5GUkFfTTRVPjsKPiAgIAkJY2xvY2stbmFtZXMgPSAiYmNsayI7Cj4gLQkJbWVkaWF0
ZWssbGFyYnMgPSA8JmxhcmIwICZsYXJiMSAmbGFyYjI+Owo+ICsJCW1lZGlhdGVrLGxhcmJzID0g
PCZsYXJiMD4sIDwmbGFyYjE+LCA8JmxhcmIyPjsKPiAgIAkJI2lvbW11LWNlbGxzID0gPDE+Owo+
ICAgCX07Cj4gICAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzbi5kdHNp
IGIvYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzbi5kdHNpCj4gaW5kZXggYmNiMDg0NmUyOWZkLi5m
OWUwMzE2MjFjODAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzbi5kdHNp
Cj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzbi5kdHNpCj4gQEAgLTEwNyw3ICsxMDcs
NyBAQCBpb21tdTogbW1zeXNfaW9tbXVAMTAyMDUwMDAgewo+ICAgCQlpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgMTA2IElSUV9UWVBFX0xFVkVMX0xPVz47Cj4gICAJCWNsb2NrcyA9IDwmaW5mcmFjZmcg
Q0xLX0lORlJBX000VT47Cj4gICAJCWNsb2NrLW5hbWVzID0gImJjbGsiOwo+IC0JCW1lZGlhdGVr
LGxhcmJzID0gPCZsYXJiMCAmbGFyYjEgJmxhcmIyPjsKPiArCQltZWRpYXRlayxsYXJicyA9IDwm
bGFyYjA+LCA8JmxhcmIxPiwgPCZsYXJiMj47Cj4gICAJCSNpb21tdS1jZWxscyA9IDwxPjsKPiAg
IAl9Owo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
