Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C14C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 12:04:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF17460273
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 12:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF17460273
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7Eio2JE3/Kzq11jfHQbq15of/FKotpAkvBh9Z19TsY=; b=16uA2Ndfa6CTPv1ngoJO39jbUj
	7vCBo86G2FuVjwD7t6DYn6Eu/RZvm6ar0B8vbRESoGv/TopGkBtaCjbXMViSVMN9iMjDCZscNQnbp
	xxmG31nIfjeBmNdXtw9mMFtvK+URpEPWTSUlJ6fcrPbbpq5jbUQt/YbQ32oMARQ9w8pMP3P9i/+ed
	7+OGVOR/T+EiQeRrHGBx68C82mjn+vzBLeM00gRRcGg4j5rzCZlCYlwxjrAT407A/sIcBh5dWuetT
	FmR0KqFCoF/Ymy9BqTpiOq+PPxHYgv0cl7WYHFoupCSbwgbfSW8n50CF/DZvN4tG61zI4u9fGSEkS
	/nbzx9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maczd-00GRvi-SE; Wed, 13 Oct 2021 12:04:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mabuy-00G81D-IV; Wed, 13 Oct 2021 10:55:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 376CE1F4415E
Subject: Re: [PATCH v7, 00/15] Support multi hardware decode using
 of_platform_populate
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <73f83f00-5d49-ba77-f46d-9c0855dc5268@collabora.com>
 <11498cb8b7f1754f6134ce8143bd4f81272d0ffc.camel@mediatek.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <e62baef3-3fa6-5dd4-cbd0-026227b4cf7c@collabora.com>
Date: Wed, 13 Oct 2021 12:55:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <11498cb8b7f1754f6134ce8143bd4f81272d0ffc.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_035528_788124_1DC12CB0 
X-CRM114-Status: GOOD (  18.38  )
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

SGksCgpXIGRuaXUgMTMuMTAuMjAyMSBvwqAwMzowOCwgeXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29t
IHBpc3plOgo+IEhpIEFuZHJ6ZWosCj4gCj4gCj4gT24gVHVlLCAyMDIxLTEwLTEyIGF0IDE2OjI3
ICswMjAwLCBBbmRyemVqIFBpZXRyYXNpZXdpY3ogd3JvdGU6Cj4+IEhpIFl1bmZlaSBEb25nLAo+
Pgo+PiBXIGRuaXUgMTEuMTAuMjAyMSBvIDA5OjAyLCBZdW5mZWkgRG9uZyBwaXN6ZToKPj4+IFRo
aXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgbXVsdGkgaGFyZHdhcmUgZGVjb2RlIGludG8gbXRr
LXZjb2RlYywKPj4+IGJ5IGZpcnN0Cj4+PiBhZGRpbmcgdXNlIG9mX3BsYXRmb3JtX3BvcHVsYXRl
IHRvIG1hbmFnZSBlYWNoIGhhcmR3YXJlCj4+PiBpbmZvcm1hdGlvbjogaW50ZXJydXB0LAo+Pj4g
Y2xvY2ssIHJlZ2lzdGVyIGJhc2VzIGFuZCBwb3dlci4gU2Vjb25kbHkgYWRkIGNvcmUgdGhyZWFk
IHRvIGRlYWwKPj4+IHdpdGggY29yZQo+Pj4gaGFyZHdhcmUgbWVzc2FnZSwgYXQgdGhlIHNhbWUg
dGltZSwgYWRkIG1zZyBxdWV1ZSBmb3IgZGlmZmVyZW50Cj4+PiBoYXJkd2FyZQo+Pj4gc2hhcmUg
bWVzc2FnZXMuIExhc3RseSwgdGhlIGFyY2hpdGVjdHVyZSBvZiBkaWZmZXJlbnQgc3BlY3MgYXJl
IG5vdAo+Pj4gdGhlIHNhbWUsCj4+PiB1c2luZyBzcGVjcyB0eXBlIHRvIHNlcGFyYXRlIHRoZW0u
Cj4+Pgo+Pj4gVGhpcyBzZXJpZXMgaGFzIGJlZW4gdGVzdGVkIHdpdGggYm90aCBNVDgxODMgYW5k
IE1UODE3My4gRGVjb2RpbmcKPj4+IHdhcyB3b3JraW5nCj4+PiBmb3IgYm90aCBjaGlwcy4KPj4+
Cj4+PiBQYXRjaGVzIDF+MyByZXdyaXRlIGdldCByZWdpc3RlciBiYXNlcyBhbmQgcG93ZXIgb24v
b2ZmIGludGVyZmFjZS4KPj4+Cj4+PiBQYXRjaCA0IGFkZCB0byBzdXBwb3J0IG11bHRpIGhhcmR3
YXJlLgo+Pj4KPj4+IFBhdGNoIDUgc2VwYXJhdGUgdmlkZW8gZW5jb2RlciBhbmQgZGVjb2RlciBk
b2N1bWVudAo+Pj4KPj4+IFBhdGNoZXMgNi0xNSBhZGQgaW50ZXJmYWNlcyB0byBzdXBwb3J0IGNv
cmUgaGFyZHdhcmUuCj4+Cj4+IFdoaWNoIHRyZWUgZG9lcyB0aGUgc2VyaWVzIGFwcGx5IHRvPwo+
IAo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB5b3VyIG1lYW4gY2xlYXJseS4gTWVkaWEgdHJlZT8KPiAK
PiBZb3UgY2FuIGdldCB0aGUgcGF0Y2hlcyBmcm9tIHRoaXMgbGluazoKPiAKPiBodHRwczovL3Bh
dGNod29yay5saW51eHR2Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhL2NvdmVyLzIwMjExMDExMDcw
MjQ3Ljc5Mi0xLXl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbS8KPiAKCkhlcmUncyB3aGF0IEkgZ2V0
OgoKJCBnaXQgcmVtb3RlIHVwZGF0ZSBtZWRpYV90cmVlCkZldGNoaW5nIG1lZGlhX3RyZWUKCiQg
Z2l0IGJyYW5jaAogICBtYXN0ZXIKKiBtZWRpYV90cmVlCiAgIG1lZGlhdGVrLW1hc3RlcgoKJCBn
aXQtcHcgLS1zZXJ2ZXIgaHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvYXBpLzEuMSAtLXBy
b2plY3QgbGludXgtbWVkaWEgCnNlcmllcyBhcHBseSA2NDY1IC0zCkZhaWxlZCB0byBhcHBseSBw
YXRjaDoKQXBwbHlpbmc6IG1lZGlhOiBtdGstdmNvZGVjOiBHZXQgbnVtYmVycyBvZiByZWdpc3Rl
ciBiYXNlcyBmcm9tIERUCkFwcGx5aW5nOiBtZWRpYTogbXRrLXZjb2RlYzogQWxpZ24gdmNvZGVj
IHdha2UgdXAgaW50ZXJydXB0IGludGVyZmFjZQpBcHBseWluZzogbWVkaWE6IG10ay12Y29kZWM6
IFJlZmFjdG9yIHZjb2RlYyBwbSBpbnRlcmZhY2UKQXBwbHlpbmc6IG1lZGlhOiBtdGstdmNvZGVj
OiBNYW5hZ2UgbXVsdGkgaGFyZHdhcmUgaW5mb3JtYXRpb24KZXJyb3I6IHNoYTEgaW5mb3JtYXRp
b24gaXMgbGFja2luZyBvciB1c2VsZXNzIAooZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNv
ZGVjL210a192Y29kZWNfZGVjX2Rydi5jKS4KZXJyb3I6IGNvdWxkIG5vdCBidWlsZCBmYWtlIGFu
Y2VzdG9yClBhdGNoIGZhaWxlZCBhdCAwMDA0IG1lZGlhOiBtdGstdmNvZGVjOiBNYW5hZ2UgbXVs
dGkgaGFyZHdhcmUgaW5mb3JtYXRpb24KVXNlICdnaXQgYW0gLS1zaG93LWN1cnJlbnQtcGF0Y2gn
IHRvIHNlZSB0aGUgZmFpbGVkIHBhdGNoCldoZW4geW91IGhhdmUgcmVzb2x2ZWQgdGhpcyBwcm9i
bGVtLCBydW4gImdpdCBhbSAtLWNvbnRpbnVlIi4KSWYgeW91IHByZWZlciB0byBza2lwIHRoaXMg
cGF0Y2gsIHJ1biAiZ2l0IGFtIC0tc2tpcCIgaW5zdGVhZC4KVG8gcmVzdG9yZSB0aGUgb3JpZ2lu
YWwgYnJhbmNoIGFuZCBzdG9wIHBhdGNoaW5nLCBydW4gImdpdCBhbSAtLWFib3J0Ii4KClJlZ2Fy
ZHMsCgpBbmRyemVqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
