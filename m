Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CADC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 10:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwQ0+GyVB7jhXpTyJbmcZ+vZcE/454gDgmZL9WNawJ0=; b=rm++IUhky8KBSo1IHPSL8vto9C
	E+ZJx4IlMjkDGm/Emxi78BAtTtkjCXMD7ElAAlBkxwC29zEK5pdvW0f9yMlWoA0hxZK4u14mxKBR5
	MogUuWO6Q4Dl7fRc8HhWwRBj+j1qVCjCtz2w4issBnVaXmP5InlOBri1V6kJwdX8smhlKknMIAjYV
	hdx/jkS2sfIZG9IVhQMSpoZBtW962lL+e+oQLeQ7JcctmxxjlIGoUsJuKk8LXtJgYA/ULnitmmcF+
	6AE2ytY1hUyNwCksjmZsVHjp9s7IpDv/BHnRo5EXZTqGO4qtPYeo+X336zC7Pq8lvqdVyNeDbceVW
	a+SpWdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7wx4-005LtD-Gf; Thu, 13 Jan 2022 10:03:26 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7wwq-005Llj-AM; Thu, 13 Jan 2022 10:03:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 812D71F45859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642068189;
 bh=5ieh+AI9nLafp/BCA/vxAMNQqRDFiZ9V6lcGw3F7r9Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mtRZidLzCsunTl6BiP4P0m1w3+IEE5orE/aFNHE7C/ZjM9lf/d0o4l2aiGhKi1ORJ
 RFxhHSeNXnd2BisTbr9OnxwPKYoI5rQXmUN4VtGhaf/1phRyM2vCYgfrRjGxF3mN/I
 qMixpjZa6euybAK9yOJXEVy4cMHnGGwCxf8BzfcbzRbVVU7KXU5rVZ5IycYRjtcnXp
 7bKOh+e6Y0FVElSm06A8LApFyxO8MFZBKFmZMQOCFQx7FH+68dtbDrO89Exdver9fr
 V7s7M1RLDnWq1mmN+2DqAgUVO+uJ2KGlMPVyqbgTZoeXvOvHNA/KOP8Z/8PMzyomYL
 fyplk4HfWeovg==
Subject: Re: [PATCH v4 5/5] arm64: dts: mediatek: Correct system timer clock
 of MT8192
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 chun-jie.chen@mediatek.com, devicetree@vger.kernel.org,
 drinkcat@chromium.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>,
 Ryder Lee <ryder.lee@kernel.org>
References: <20220113065822.11809-1-allen-kh.cheng@mediatek.com>
 <20220113065822.11809-6-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <963c8993-a63e-2282-66e3-415ac897bded@collabora.com>
Date: Thu, 13 Jan 2022 11:03:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220113065822.11809-6-allen-kh.cheng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_020312_571897_136A8334 
X-CRM114-Status: GOOD (  13.66  )
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

SWwgMTMvMDEvMjIgMDc6NTgsIGFsbGVuLWtoLmNoZW5nIGhhIHNjcml0dG86Cj4gRnJvbTogQWxs
ZW4tS0ggQ2hlbmcgPEFsbGVuLUtILkNoZW5nQG1lZGlhdGVrLmNvbT4KPiAKPiBXaGVuIHRoZSBp
bml0aWFsIGRldmljZXRyZWUgZm9yIG10ODE5MiB3YXMgYWRkZWQgaW4gNDg0ODk5ODBlMjdlICgi
YXJtNjQ6Cj4gZHRzOiBBZGQgTWVkaWF0ZWsgU29DIE1UODE5MiBhbmQgZXZhbHVhdGlvbiBib2Fy
ZCBkdHMgYW5kIE1ha2VmaWxlIiksIHRoZQo+IGNsb2NrIGRyaXZlciBmb3IgbXQ4MTkyIHdhcyBu
b3QgeWV0IHVwc3RyZWFtLCBzbyB0aGUgY2xvY2sgcHJvcGVydHkgbm9kZXMKPiB3ZXJlIHNldCB0
byB0aGUgY2xrMjZtIGNsb2NrIGFzIGEgcGxhY2Vob2xkZXIuCj4gCj4gR2l2ZW4gdGhhdCB0aGUg
Y2xvY2sgZHJpdmVyIGhhcyBzaW5jZSBiZWVuIGFkZGVkIHRocm91Z2ggNzEwNTczZGVlMzFiICgi
Y2xrOgo+IG1lZGlhdGVrOiBBZGQgTVQ4MTkyIGJhc2ljIGNsb2NrcyBzdXBwb3J0IiksIGFzIHdl
bGwgYXMgaXRzIGR0LWJpbmRpbmdzCj4gdGhyb3VnaCBmMzVmMWEyM2UwZTEgKCJjbGs6IG1lZGlh
dGVrOiBBZGQgZHQtYmluZGluZ3Mgb2YgTVQ4MTkyIGNsb2NrcyIpIGFuZAo+IGRldmljZXRyZWUg
bm9kZXMgdGhyb3VnaCA1ZDJiODk3YmM2ZjUgKCJhcm02NDogZHRzOiBtZWRpYXRlazogQWRkIG10
ODE5Mgo+IGNsb2NrIGNvbnRyb2xsZXJzIiksIGZpeCB0aGUgc3lzdGltZXIgY2xvY2sgcHJvcGVy
dHkgdG8gcG9pbnQgdG8gdGhlIGFjdHVhbAo+IGNsb2NrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFs
bGVuLUtIIENoZW5nIDxBbGxlbi1LSC5DaGVuZ0BtZWRpYXRlay5jb20+Cj4gUmV2aWV3ZWQtYnk6
IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KClJldmll
d2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxy
ZWdub0Bjb2xsYWJvcmEuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
