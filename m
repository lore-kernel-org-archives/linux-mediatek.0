Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9E2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 10:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aa/g1HHNmavsLmyRy7Gbx4Bm+24OZ3NH0PTCAcKyurk=; b=Dv7o4JCZO75n1v2mCTXavSWyuF
	Gwhx8fsa7Q1RzhUe7MT4dd98LWjKPCMG6hNko6qZwkX1Wy2DUCMrVNBHcus6DTr8J39Ndj3dtMG6/
	yBUMOJ1oXBcuXVRpvIUVPaZOVbAml6NfN8TBfS8BQxJGp8yzca0h3Cp8iEt/xH31t5Ys67gk30oM/
	3g5KG+9WIMPfZqvbhYmANa2phevWfRfsYvpPO+FeKp6kbKaRWqOEj8PZkzGYRr9q7v8SkMrDtJtxB
	NhZ+oVG6Sawc4nC2lG4+XUv9seeIvEMdB8+gqwsumtDjeY5y0K1sp67miI6309FIDimRcVOsTCCJG
	sWJF8cIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7wxf-005M84-4F; Thu, 13 Jan 2022 10:04:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7wwr-005Lmh-Fs; Thu, 13 Jan 2022 10:03:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9FC3D1F4585D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642068192;
 bh=JPJag9JK3MQ3c4xlKJZAf8E7rayQ+kRRDS8487QYRLg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=aS71GyDR7xM3gmlMLnS1F71+vz/6Q9DT1mlGAenxB2DmyL/1EUrWyxTVJnQULzfBY
 NKzS1pv4vszuUVWBPF9pmpF0kO/ZFo3bs3eHdERJAjAm1jMpqxYLK4//2RF16QR/if
 1Lg1FBKIuuPWWFXHGuNe9t61gWTGtW5ra4/RZz0REVUsydkE3Lc8VcjBfjWerRZun/
 qfYyaltlef3VdRqd73lIwGyayaWzTpcQzhha8cwUDn1n+g0DrNhNQ8UWljag6x04Hv
 VInSU5Qitg8Waqo6LP6ItLb12HUM++LVT0xaRot8mbMBGIny8Wd8c7qGv7cf0zDgrH
 Od8LOGaNgS88Q==
Subject: Re: [PATCH v4 2/5] arm64: dts: mediatek: Correct SPI clock of MT8192
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
 <20220113065822.11809-3-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <2eab99dd-07a9-65b1-b662-9d45538ce898@collabora.com>
Date: Thu, 13 Jan 2022 11:03:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220113065822.11809-3-allen-kh.cheng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_020313_684109_A14597B9 
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
ODE5Mgo+IGNsb2NrIGNvbnRyb2xsZXJzIiksIGZpeCB0aGUgU1BJIGNsb2NrIHByb3BlcnR5IHRv
IHBvaW50IHRvIHRoZSBhY3R1YWwKPiBjbG9jay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGxlbi1L
SCBDaGVuZyA8QWxsZW4tS0guQ2hlbmdAbWVkaWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5OiBOw61j
b2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+CgpSZXZpZXdlZC1i
eTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9A
Y29sbGFib3JhLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
