Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EDEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 10:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJtB/MZSTpVHxnsBM++svXURtvkjvk7q70PaNdVyWLA=; b=WLQToK82BgO7wmMkhvUu2EReBk
	JkB4QltnFevTAFwX36+HxEwnBOesBBWRr2JhX7bvRUSnUPfWepZkE+hob+jsPhl1/wWA7DO5IhEpW
	NU9d/7C28M2AnVZCuzD+fHW9sHg5hAO+32jXdEDuJimd+P8xV1P8QMv8brrMfr4M+bRXDxSXUpXdV
	bRRXQ2dwj0owPko/zijgQG2mnnTyjd4NlTAk4a/9FP+E/KnMSCKC6xYtbtNU71sIYsSGvnQGPNP2j
	qD4ArC/8DO2kzWXkY0ZE6V1NDi+KkQNfhmiAyr9M9/VczMd7ywExL57aSqaVWJYKlOE87AG7U34NK
	C0QrvlXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7wy0-005MKT-8u; Thu, 13 Jan 2022 10:04:24 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7wwt-005Lnr-6v; Thu, 13 Jan 2022 10:03:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1C4741F4585C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642068193;
 bh=z6Fpv+ojSruJtKvGcPH7kOYeobLJWz00NiG70Q+tJBQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=H6rciqMQ+aIyqB7yph7vl+C/moxOxZT3EWo6xzZ1kyXmcfvIHLOexyV/uy7GKUJ0l
 uN3lMkyv6piipk/ZpY7mpYjDIlGujep1CcLX4qFrN7cPyvTBN+8W8VZRY7PmR1iXfn
 K2r9BAo/1qJTHIz0KyV8RUKt+6lwbfe3OSgHOJg9gkDrmXQeYnEhpGo2dcR2tQCXYK
 +xQNuvxohNSN84bhfQ1JYJ9Gyjc4QnxEqEIqBgIQvgWSACN3UBjKVErUMjYvPHFEc+
 T/gLU5fSYLcvGxPM5Rh6u/LjesuDOnvZvnkns5Tm4YKreimqKWD0xbVoSjEzCHNQ/9
 K2guIAsxypswQ==
Subject: Re: [PATCH v4 1/5] arm64: dts: mediatek: Correct uart clock of MT8192
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
 <20220113065822.11809-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <3eeea0ce-0551-1186-7011-9bda27d62b98@collabora.com>
Date: Thu, 13 Jan 2022 11:03:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220113065822.11809-2-allen-kh.cheng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_020315_456186_63809FC6 
X-CRM114-Status: GOOD (  13.87  )
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
ODE5Mgo+IGNsb2NrIGNvbnRyb2xsZXJzIiksIGZpeCB0aGUgdWFydCBjbG9jayBwcm9wZXJ0eSB0
byBwb2ludCB0byB0aGUgYWN0dWFsCj4gY2xvY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxsZW4t
S0ggQ2hlbmcgPEFsbGVuLUtILkNoZW5nQG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogTsOt
Y29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgoKUmV2aWV3ZWQt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25v
QGNvbGxhYm9yYS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
