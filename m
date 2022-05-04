Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7078C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 20:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8TVH7H+9S3Arg2idy1fSj0olGnqhAokCEejtf/7zgvk=; b=Dw478oihO36cBt
	HQID5cJRbdJJE5WOMrcPDIN6iIYcYglkILJYE875bQKmsMzem8gvTzr68HscBXq7eR31vKiEyJbYf
	X9CPGZP6DoWO++faXyKSTX/sBHDlN5mWUaqmRvkztAQXAto6XrzGJ2qa6HXGuCmsZE7z3ReVbAgQt
	95GRbmzVK7hGBcgtZ5VBfl/JCVUqekuh/yc2oE+OraPiNWvxo0Y1a0KvZ5a5q0ak4wKbwSe0lYhs7
	sjjg40hSirU1rOFow1WmB+KPpdeYXFZrhCJmDCPCbI++6qz7j8svniTMbb7bFwfEAkYZ6SFWRVGju
	GtNW08GxePORHYrh8A9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLka-00CbWt-Sa; Wed, 04 May 2022 20:37:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLkF-00CbIz-PK; Wed, 04 May 2022 20:37:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 185D3617A8;
 Wed,  4 May 2022 20:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3457AC385A5;
 Wed,  4 May 2022 20:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651696630;
 bh=rvGFtzDUMdxkwhX/QNE/Ypl5Aws2l6MReGUI5o+GqFA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YL9ninoW5G4S5NnKRM9YU5i27m74E5PiA2pszB2EL6uBlt6P2nVSpYeBYXHj+FLFf
 c+TThsNBYtNJHD+kMnhIp065fv5jj3hslWi65PUVqyhJfUTJSqXfK+kMt3WKETZhun
 joDcYqFo53p6fPcLvbCKD96laCXHRZcCUMD4oZiyH9Wv9qvKPGH8VxgKdSnR1ssSVI
 F1YvdOrHi4wGcgSUMCY4MZLKiVSjny6i/8X8oewxMdxsjt1/1RMyrbolAqk73T0SOG
 o4cgehrMTC0MoL3dczTmu/aC6AI0muCUm/t7lndLCY/yBxEKWvxN5WboQ9AKLUA1y/
 1LhhsxWdtKkEQ==
From: Mark Brown <broonie@kernel.org>
To: nfraprado@collabora.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 hsin-hsiung.wang@mediatek.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, kernel@collabora.com, linux-mediatek@lists.infradead.org,
 lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220429201325.2205799-1-nfraprado@collabora.com>
References: <20220429201325.2205799-1-nfraprado@collabora.com>
Subject: Re: [PATCH] dt-bindings: regulator: mt6315: Enforce
 regulator-compatible, not name
Message-Id: <165169662791.1744767.17732308037249256443.b4-ty@kernel.org>
Date: Wed, 04 May 2022 21:37:07 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_133711_907081_3925BD57 
X-CRM114-Status: GOOD (  13.85  )
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

T24gRnJpLCAyOSBBcHIgMjAyMiAxNjoxMzoyNCAtMDQwMCwgTsOtY29sYXMgRi4gUi4gQS4gUHJh
ZG8gd3JvdGU6Cj4gVGhlIE1UNjMxNSBQTUlDIGR0LWJpbmRpbmcgc2hvdWxkIGVuZm9yY2UgdGhh
dCBvbmUgb2YgdGhlIHZhbGlkCj4gcmVndWxhdG9yLWNvbXBhdGlibGUgaXMgc2V0IGluIGVhY2gg
cmVndWxhdG9yIG5vZGUuIEhvd2V2ZXIgaXQgd2FzCj4gbWlzdGFrZW5seSBtYXRjaGluZyBhZ2Fp
bnN0IHJlZ3VsYXRvci1uYW1lIGluc3RlYWQuCj4gCj4gRml4IHRoZSB0eXBvLiBUaGlzIG5vdCBv
bmx5IGZpeGVzIHRoZSBjb21wYXRpYmxlIHZlcmlmaWNhdGlvbiwgYnV0IGFsc28KPiBsaWZ0cyB0
aGUgcmVndWxhdG9yLW5hbWUgcmVzdHJpY3Rpb24sIHNvIHRoYXQgbW9yZSBtZWFuaW5nZnVsIG5h
bWVzIGNhbgo+IGJlIHNldCBmb3IgZWFjaCBwbGF0Zm9ybS4KPiAKPiBbLi4uXQoKQXBwbGllZCB0
bwoKICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJv
b25pZS9yZWd1bGF0b3IuZ2l0IGZvci1uZXh0CgpUaGFua3MhCgpbMS8xXSBkdC1iaW5kaW5nczog
cmVndWxhdG9yOiBtdDYzMTU6IEVuZm9yY2UgcmVndWxhdG9yLWNvbXBhdGlibGUsIG5vdCBuYW1l
CiAgICAgIGNvbW1pdDogNmQ0MzVhOTRiYTViYjRmMmFkMzgxYzA4MjhmYmFlODljNjZiNTBmZQoK
QWxsIGJlaW5nIHdlbGwgdGhpcyBtZWFucyB0aGF0IGl0IHdpbGwgYmUgaW50ZWdyYXRlZCBpbnRv
IHRoZSBsaW51eC1uZXh0CnRyZWUgKHVzdWFsbHkgc29tZXRpbWUgaW4gdGhlIG5leHQgMjQgaG91
cnMpIGFuZCBzZW50IHRvIExpbnVzIGR1cmluZwp0aGUgbmV4dCBtZXJnZSB3aW5kb3cgKG9yIHNv
b25lciBpZiBpdCBpcyBhIGJ1ZyBmaXgpLCBob3dldmVyIGlmCnByb2JsZW1zIGFyZSBkaXNjb3Zl
cmVkIHRoZW4gdGhlIHBhdGNoIG1heSBiZSBkcm9wcGVkIG9yIHJldmVydGVkLgoKWW91IG1heSBn
ZXQgZnVydGhlciBlLW1haWxzIHJlc3VsdGluZyBmcm9tIGF1dG9tYXRlZCBvciBtYW51YWwgdGVz
dGluZwphbmQgcmV2aWV3IG9mIHRoZSB0cmVlLCBwbGVhc2UgZW5nYWdlIHdpdGggcGVvcGxlIHJl
cG9ydGluZyBwcm9ibGVtcyBhbmQKc2VuZCBmb2xsb3d1cCBwYXRjaGVzIGFkZHJlc3NpbmcgYW55
IGlzc3VlcyB0aGF0IGFyZSByZXBvcnRlZCBpZiBuZWVkZWQuCgpJZiBhbnkgdXBkYXRlcyBhcmUg
cmVxdWlyZWQgb3IgeW91IGFyZSBzdWJtaXR0aW5nIGZ1cnRoZXIgY2hhbmdlcyB0aGV5CnNob3Vs
ZCBiZSBzZW50IGFzIGluY3JlbWVudGFsIHVwZGF0ZXMgYWdhaW5zdCBjdXJyZW50IGdpdCwgZXhp
c3RpbmcKcGF0Y2hlcyB3aWxsIG5vdCBiZSByZXBsYWNlZC4KClBsZWFzZSBhZGQgYW55IHJlbGV2
YW50IGxpc3RzIGFuZCBtYWludGFpbmVycyB0byB0aGUgQ0NzIHdoZW4gcmVwbHlpbmcKdG8gdGhp
cyBtYWlsLgoKVGhhbmtzLApNYXJrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
