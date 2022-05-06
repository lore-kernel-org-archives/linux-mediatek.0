Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552E4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 11:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnPQ6vBcpdpT2F7q6ahfeKgY9yKbihaC5kmBd6tf3KU=; b=AXmA43NeetrvZ9
	zSlUHyMcK4ri7Epyul+FXFhEmThjbvDegvGljc7OcPwhjpGDPBpwgYvR9BaLnoZq24bwVBGYV/Nko
	WvvnJSL9ZAOxGZWtFgnqTqXLbE9YYMwCOKM+4nYgWuhF90gRyYCrWB7WntmubatgMkKJhgNVvQ3KR
	/Hd0QlGaMtLrXiCa869OzjbYEWaHd8gMdYSqzCar00BB6Myn4VZZaW8p1qVsk+3/6QDynu+Dze5vV
	46XFKjf++toOqk8/6k75vF1l7Nw6eqczwpKW/lbWeg2TeTkoBhC6UywRBECw2hUv5RlQBqX3A01m4
	uUTDnkVU2ZzAoZD3XD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmwL9-002xSq-RB; Fri, 06 May 2022 11:41:43 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmwKy-002xOS-OE
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 11:41:34 +0000
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2f7c424c66cso78380437b3.1
 for <linux-mediatek@lists.infradead.org>; Fri, 06 May 2022 04:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l0caGRAl6tw98ep9A0EoSsPJFbAnWVPHA21Iq4Niy6I=;
 b=SmlsDeNuaHifgGa++k4eP2Y4cdx/p/7EZIENJ+7s92pwcvF2WjC3gxgdsF54R5R5DC
 4PH4Ea/RXCuBKQE7XpREllSwlcRgOF8zh6Mq2T8oFE7nkIJkmgaxbgo0tcPsqfbw8sIY
 cqqw8+SzX/McYAnngsSqWYYMUKuAfyaXUfjnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l0caGRAl6tw98ep9A0EoSsPJFbAnWVPHA21Iq4Niy6I=;
 b=qEhDu8D8ixys7JKlklOwfsyUmAhIaameo5RpHiaefENVVezMXMBwzKvNJfljUXedTU
 VdR4LpMYOS3TxGi8I0pXuxOV42vQgZ5VB8NAD4f2NB6fzBrI7+jQCCZiZWhlFtDN5o5K
 bO9ujB8ZMKv9w0VS0slTEY336ZASde4Cc+K6STxAIAtAhvlIl5uS/CsRD6CjJjRv6QRZ
 hbJux539Ak58SjaJrG99gQvfcmiH5sFfcZ02aek+ipuLQDXU62FagY6cgP6VLs1I69di
 hNI4/ambPbUuMPBQKBuj4ExN7yGdpoXvQzIdjB/zOVjwdzOOytlB5fc9KO5QJlnKdfh6
 ZraQ==
X-Gm-Message-State: AOAM531ms85YQRugj6ceVYa5C6ZC/rpqYv8NhZ8yevgxbWIcyCFJ2CXj
 bRIzYDivBwti/rpEWidc967X72t8BqoXruyMl6DOfw==
X-Google-Smtp-Source: ABdhPJzbQ+rVlJvom3mfGzvQGXbWH7u6TQrd+Edczzu9Qcicwk8aE3ctLPVfCmRvvhVM+kMa2a1e2gMRNjVctbIkgO4=
X-Received: by 2002:a05:690c:110:b0:2ec:2d79:eee1 with SMTP id
 bd16-20020a05690c011000b002ec2d79eee1mr2266620ywb.21.1651837290727; Fri, 06
 May 2022 04:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220505194550.3094656-1-nfraprado@collabora.com>
In-Reply-To: <20220505194550.3094656-1-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 6 May 2022 19:41:19 +0800
Message-ID: <CAGXv+5Hk2u+1zkVjNEt7wdwAJyoB+-PMAuh7UKWEkDeYxp5zUQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] Introduce support for MediaTek MT8192 Google
 Chromebooks
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Luca Weiss <luca@z3ntu.xyz>, 
 Maxim Kutnij <gtk3@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_044132_815765_8AE8F1A3 
X-CRM114-Status: GOOD (  15.63  )
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

T24gRnJpLCBNYXkgNiwgMjAyMiBhdCAzOjQ2IEFNIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvCjxu
ZnJhcHJhZG9AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPgo+IFRoaXMgc2VyaWVzIGludHJvZHVj
ZXMgRGV2aWNldHJlZXMgZm9yIHRoZSBNVDgxOTItYmFzZWQgQXN1cmFkYSBwbGF0Zm9ybQo+IGFz
IHdlbGwgYXMgQXN1cmFkYSBTcGhlcmlvbiBhbmQgQXN1cmFkYSBIYXlhdG8gYm9hcmRzLgo+Cj4g
U3VwcG9ydCBmb3IgdGhlIGJvYXJkcyBpcyBhZGRlZCB0byB0aGUgZXh0ZW50IHRoYXQgaXMgY3Vy
cmVudGx5IGVuYWJsZWQKPiBpbiB0aGUgbXQ4MTkyLmR0c2ksIGFzIHRvIG5vdCBhZGQgYW55IGRl
cGVuZGVuY2llcyB0byB0aGlzIHNlcmllcy4KPgo+IEJlc2lkZXMgdGhlIG90aGVyIGR0LWJpbmRp
bmcgZml4ZXMgYWxyZWFkeSBvbiBsaW51eC1uZXh0IHRvIGF2b2lkIG5ldwo+IHdhcm5pbmdzIGJ5
IHRoaXMgc2VyaWVzLCBbMV0gaXMgYWxyZWFkeSBtZXJnZWQgYnV0IG5vdCBvbiBuZXh0IHlldC4K
Pgo+IFRoaXMgc2VyaWVzIHdhcyBwZWVyLXJldmlld2VkIGludGVybmFsbHkgYmVmb3JlIHN1Ym1p
c3Npb24uCj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNDI5MjAxMzI1
LjIyMDU3OTktMS1uZnJhcHJhZG9AY29sbGFib3JhLmNvbS8KPgo+IHYxOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyMjAzMTYxNTEzMjcuNTY0MjE0LTEtbmZyYXByYWRvQGNvbGxhYm9y
YS5jb20vCj4KPiBDaGFuZ2VzIGluIHYyOgo+IC0gQWRkZWQgcGF0Y2hlcyAxLTIgZm9yIE1lZGlh
dGVrIGJvYXJkIGR0LWJpbmRpbmdzCj4gLSBBZGRlZCBwYXRjaGVzIDEzLTE2IGVuYWJsaW5nIGhh
cmR3YXJlIGZvciBBc3VyYWRhIHRoYXQgaGFzIHNpbmNlIGJlZW4KPiAgIGVuYWJsZWQgb24gbXQ4
MTkyLmR0c2kKPgo+IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvICgxNik6Cj4gICBkdC1iaW5kaW5n
czogYXJtNjQ6IGR0czogbWVkaWF0ZWs6IEFkZCBtdDgxOTItYXN1cmFkYS1zcGhlcmlvbgo+ICAg
ZHQtYmluZGluZ3M6IGFybTY0OiBkdHM6IG1lZGlhdGVrOiBBZGQgbXQ4MTkyLWFzdXJhZGEtaGF5
YXRvCj4gICBhcm02NDogZHRzOiBtZWRpYXRlazogSW50cm9kdWNlIE1UODE5Mi1iYXNlZCBBc3Vy
YWRhIGJvYXJkIGZhbWlseQo+ICAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IGFzdXJhZGE6IERvY3Vt
ZW50IEdQSU8gbmFtZXMKPiAgIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRhOiBBZGQgc3lz
dGVtLXdpZGUgcG93ZXIgc3VwcGxpZXMKPiAgIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRh
OiBFbmFibGUgYW5kIGNvbmZpZ3VyZSBJMkMgYW5kIFNQSSBidXNzZXMKPiAgIGFybTY0OiBkdHM6
IG1lZGlhdGVrOiBhc3VyYWRhOiBBZGQgQ2hyb21lT1MgRUMKPiAgIGFybTY0OiBkdHM6IG1lZGlh
dGVrOiBhc3VyYWRhOiBBZGQga2V5Ym9hcmQgbWFwcGluZyBmb3IgdGhlIHRvcCByb3cKPiAgIGFy
bTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRhOiBBZGQgQ3I1MCBUUE0KPiAgIGFybTY0OiBkdHM6
IG1lZGlhdGVrOiBhc3VyYWRhOiBBZGQgRWxhbiBlS1RIMzAwMCBJMkMgdHJhY2twYWQKPiAgIGFy
bTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRhOiBBZGQgSTJDIHRvdWNoc2NyZWVuCj4gICBhcm02
NDogZHRzOiBtZWRpYXRlazogc3BoZXJpb246IEFkZCBrZXlib2FyZCBiYWNrbGlnaHQKPiAgIGFy
bTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRhOiBFbmFibGUgWEhDSQo+ICAgYXJtNjQ6IGR0czog
bWVkaWF0ZWs6IGFzdXJhZGE6IEVuYWJsZSBQQ0llIGFuZCBhZGQgV2lGaQo+ICAgYXJtNjQ6IGR0
czogbWVkaWF0ZWs6IGFzdXJhZGE6IEFkZCBNVDYzNTkgUE1JQwo+ICAgYXJtNjQ6IGR0czogbWVk
aWF0ZWs6IGFzdXJhZGE6IEFkZCBTUE1JIHJlZ3VsYXRvcnMKClRlc3RlZC1ieTogQ2hlbi1ZdSBU
c2FpIDx3ZW5zdEBjaHJvbWl1bS5vcmc+CgpJIHRlc3RlZCBhbGwgdGhlIGV4dGVybmFsIHBlcmlw
aGVyYWxzLCBpbmNsdWRpbmcgdG91Y2hwYWQsIHRvdWNoc2NyZWVuLAprZXlib2FyZCAod2hpY2gg
bmVlZHMgYSBmaXgpLCBVU0IsIFdpRmkgb24gYm90aCBtb2RlbHMsIGFuZCB0aGUga2V5Ym9hcmQK
YmFja2xpZ2h0IGFuZCAoVVNCLWJhc2VkKSBCbHVldG9vdGggb24gU3BoZXJpb24uCgpDb3VsZCB5
b3UgYWxzbyBlbmFibGUgdGhlIFNDUD8gT3RoZXJ3aXNlIHRoZSB2Y29kZWMgZ2VuZXJhdGVzIGJp
ZyB3YXJuaW5ncwp3aGVuIGl0IHByb2Jlcy4KCkFuZCBhbHNvIHdvdWxkIGxpa2UgdG8gc2VlIE1N
Qy4gOikKCgpUaGFua3MKQ2hlbll1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
