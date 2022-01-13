Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8366FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uz21l/39q3FLlC1+v4ac50xjoljxWoES3EwbYCZzRSs=; b=bfa6Nv31EwXmsuGw3lnBtrnoeN
	tkz+fqzwRJm+jmE8NfSfXnFM6rqAt6a9wcO+6lwjf7zNZJC0HAck21iiWRYFolfeUbN37GuK0C6bE
	LU/ZoXLd3peF0rJIhHH/6le+DT/nKkpnXaw3CdapPAdzP85sA4jO6yfUp6QOh4nQmvLFuPFYJANdo
	Uo39ljrqs54rf9tjq2n+Lg/ndPR4x6F1uy3qJEh+eotImBmdRy80TwsmprW8DD9PNFwe745UtK6mL
	oPrz3qXQ304y1U4+P9Jo2Sekft8Cr8G1lPy7radF3AUxXIxKQwubCVVkjYCRHdVulZfDC/5ftgYXm
	5TU/DFCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7wxG-005LwE-3y; Thu, 13 Jan 2022 10:03:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7wwq-005Lln-AG; Thu, 13 Jan 2022 10:03:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C5C941F4585A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642068189;
 bh=hb/R6US81LTa1t2TGkbgA8tWMlH58p732cTuKIWvdk4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UZR6x5Z78fHITIWr6PrsdCNWdFS8PEi6UmHuwhvEfyUHly6ER+uH7jldZC5q3kUoI
 QCClQsZZN1Wvo+509NMUoBH3vhkWaY/rw3rxkNNs8XyubZeSUZncG6qq56VeAI2Nhl
 EecHxZzNyoTn25Jh7N3lwuv7RQaSArAcTM3NDJQ5+IwHVFZgSjko6t2YsuDVX7VDQI
 8Pup239z9US7XJnYDo9AFqtZtGIT1gGk+G/9bQ6KsQO82M3kyw+L6seMqihOmgJUUF
 aZH4jY9GMUTacMGuJwJv4HZ1LIVjnuomg3qmtyeGJJ+e+h46CWtIw/2CatMvV6J95e
 u7Jgjpe//MKaA==
Subject: Re: [PATCH v4 4/5] arm64: dts: mediatek: Correct I2C clock of MT8192
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
 <20220113065822.11809-5-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <b9068bf4-5019-f322-24e6-3869ab36ec90@collabora.com>
Date: Thu, 13 Jan 2022 11:03:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220113065822.11809-5-allen-kh.cheng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_020312_572196_E024CDD8 
X-CRM114-Status: GOOD (  13.77  )
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
ODE5Mgo+IGNsb2NrIGNvbnRyb2xsZXJzIiksIGZpeCB0aGUgSTJDIGNsb2NrIHByb3BlcnR5IHRv
IHBvaW50IHRvIHRoZSBhY3R1YWwKPiBjbG9jay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGxlbi1L
SCBDaGVuZyA8QWxsZW4tS0guQ2hlbmdAbWVkaWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5OiBOw61j
b2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+CgpSZXZpZXdlZC1i
eTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9A
Y29sbGFib3JhLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
