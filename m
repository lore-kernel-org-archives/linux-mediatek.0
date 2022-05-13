Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7FDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 16:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hAu5gw8pYgk2F/LIqsg36f3GBgzerjeKiGgLip+qv/I=; b=u1R4QdiCuAB97w
	7pWid6hesKG9tSeJT1AwPgO/yLAVRErX3zOhbKtrT/oXmzZxuPY6AXwd4T3svu8bfc/ejTiZoB/SU
	8kACFjDgvdAustPXdYxrtoVmCQi9JwjSN7Y4xMu2oEFU1LC/grMqxSU2rwpr+fyDkrqaocyLglUTP
	jPEZiHMejpxdO3JBcgXhaP3ahyVgISkDX0uSLZcW2whwrzc8lpJsdZ2Qu9dZJCDsMRPy4ROSXB4Dk
	RUUEEH6Aihq9u3l9Yd1qY+qtPIto7qhXXcP3SxYksP1XPrjfBH0wSHjXH3A8qYyN0Z5K2INYBUFtF
	9gTendUpdC9PCI7iircw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npXxD-00GobI-HN; Fri, 13 May 2022 16:15:47 +0000
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npXx9-00GoZK-LH
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 16:15:45 +0000
Received: from [192.168.1.18] ([86.243.180.246]) by smtp.orange.fr with ESMTPA
 id pXwwnXNx8WQHjpXwwnRPHc; Fri, 13 May 2022 18:15:34 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 13 May 2022 18:15:34 +0200
X-ME-IP: 86.243.180.246
Message-ID: <0fa271ed-e61e-4415-a78f-b2dee74b2f98@wanadoo.fr>
Date: Fri, 13 May 2022 18:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH -next 1/2] i2c: mt7621: fix missing
 clk_disable_unprepare() on error in mtk_i2c_probe()
Content-Language: fr
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Cc: matthias.bgg@gmail.com, sr@denx.de, wsa@the-dreams.de
References: <20220513100819.2711845-1-yangyingliang@huawei.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220513100819.2711845-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_091543_855289_AB39B7DC 
X-CRM114-Status: GOOD (  16.50  )
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

TGUgMTMvMDUvMjAyMiDDoCAxMjowOCwgWWFuZyBZaW5nbGlhbmcgYSDDqWNyaXTCoDoKPiBGaXgg
dGhlIG1pc3NpbmcgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgYmVmb3JlIHJldHVybgo+IGZyb20g
bXRrX2kyY19wcm9iZSgpIGluIHRoZSBlcnJvciBoYW5kbGluZyBjYXNlLgo+IAo+IEZpeGVzOiBk
MDQ5MTNlYzVmODkgKCJpMmM6IG10NzYyMTogQWRkIE1lZGlhVGVrIE1UNzYyMS83NjI4Lzc2ODgg
STJDIGRyaXZlciIpCj4gU2lnbmVkLW9mZi1ieTogWWFuZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlh
bmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ3NjIxLmMg
fCA4ICsrKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NzYyMS5j
IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDc2MjEuYwo+IGluZGV4IDQ1ZmU0YTdmZTBjMC4u
ZjExN2MzZDljYTE5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ3NjIx
LmMKPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NzYyMS5jCj4gQEAgLTMwNCw3ICsz
MDQsOCBAQCBzdGF0aWMgaW50IG10a19pMmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiAgIAo+ICAgCWlmIChpMmMtPmJ1c19mcmVxID09IDApIHsKPiAgIAkJZGV2X3dhcm4o
aTJjLT5kZXYsICJjbG9jay1mcmVxdWVuY3kgMCBub3Qgc3VwcG9ydGVkXG4iKTsKPiAtCQlyZXR1
cm4gLUVJTlZBTDsKPiArCQlyZXQgPSAtRUlOVkFMOwo+ICsJCWdvdG8gZXJyX2Rpc2FibGVfY2xr
Owo+ICAgCX0KPiAgIAo+ICAgCWFkYXAgPSAmaTJjLT5hZGFwOwo+IEBAIC0zMjIsMTAgKzMyMywx
MyBAQCBzdGF0aWMgaW50IG10a19pMmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgIAo+ICAgCXJldCA9IGkyY19hZGRfYWRhcHRlcihhZGFwKTsKPiAgIAlpZiAocmV0IDwg
MCkKPiAtCQlyZXR1cm4gcmV0Owo+ICsJCWdvdG8gZXJyX2Rpc2FibGVfY2xrOwo+ICAgCj4gICAJ
ZGV2X2luZm8oJnBkZXYtPmRldiwgImNsb2NrICV1IGtIelxuIiwgaTJjLT5idXNfZnJlcSAvIDEw
MDApOwoKSGksCgpzaG91bGQnbnQgd2UgaGF2ZSBhOgoJcmV0dXJuIDA7CmhlcmU/CgpvdGhlcndp
c2Ugd2Ugd2lsbCBjYWxsIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpIGV2ZW4gb24gdGhlIG5vcm1h
bCBwYXRoLgoKQ0oKCj4gICAKPiArZXJyX2Rpc2FibGVfY2xrOgo+ICsJY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKGkyYy0+Y2xrKTsKPiArCj4gICAJcmV0dXJuIHJldDsKPiAgIH0KPiAgIAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
