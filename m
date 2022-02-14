Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75965C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 13:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ptDrQeISvq2xbv/kEfVoM229f2ntH2mpgKchP6xNlQ=; b=eGZbmns7z6+glT
	V6eMNjyGOaJB053LNKpq3S+R3BxYEpED/r3oNV4ce26TgohwprWnxOj1jXSlgNhH/HuUEZkK+xcnN
	nDqyRymRSJcmHnaAQDE8lmmtJm6/HOCRQdXTF20bJekh5cjHhevI5ZbA1C649nQxIpK9dmD1uCVTj
	K4xqBYoJI/kcN2nDJgoOMQuTsOQrkFopAexBoGr/+/6TIa4bbxh4G9dKTB2913Le4PizVH8ciE0uF
	lSqSSaBZ6uhfs6cvhPpzFmc/OM4kc9CvNs0qi5zq4jNTpeAyJneQeUkr6j8By79fkllWIRgBwAsxm
	C1+y3KlKT4NSjwSCgLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJbkn-00FUOD-F9; Mon, 14 Feb 2022 13:50:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJbkb-00FULl-Ce; Mon, 14 Feb 2022 13:50:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4EC2D1F43191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644846643;
 bh=D1yJWGWIImkvAowJ8h80nIsI2GRf98oHfJsbzrHCL5g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eLg4rcGuTVLJAuon8acnkWwPvbOhy4FVYhIKInQOCvtyvTikzf5hUlnBvRFdAN8Hq
 FgIYU1Gv9y3Drl/bDFKTDtZ2VwJ0vsMAb0mUeLKIq8xUgLqoD2dXCKieLkARXz+VOJ
 Ks8qubUZszIdLBApWCiWCotADcPCPMlXKjGszPNeydLeBxCMqKOWuRugnEvuVuR09h
 UdbSVhAc6MXkkCRaF18xUmSktuzBNg5XZ2GVFtVpRMo+6ifYLTZxQcAXnH9km5eKvZ
 jBHFz5yJPLVS8Zue/MGlkkg6R4OEYkmEyLy1/u48A7oYluYVSo9VPHhrwPLIA6E1bV
 XynkDc/ZUQP8Q==
Message-ID: <bb79e52c-bf82-5966-1814-ba23f4b6dcf5@collabora.com>
Date: Mon, 14 Feb 2022 14:50:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/2] pwm: pwm-mediatek: Simplify error handling with
 dev_err_probe()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: thierry.reding@gmail.com, lee.jones@linaro.org, matthias.bgg@gmail.com,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20220214113038.79130-1-angelogioacchino.delregno@collabora.com>
 <20220214134850.aqmd7wjxjsjyuwz7@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220214134850.aqmd7wjxjsjyuwz7@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_055045_584949_DA145075 
X-CRM114-Status: GOOD (  16.95  )
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

SWwgMTQvMDIvMjIgMTQ6NDgsIFV3ZSBLbGVpbmUtS8O2bmlnIGhhIHNjcml0dG86Cj4gT24gTW9u
LCBGZWIgMTQsIDIwMjIgYXQgMTI6MzA6MzdQTSArMDEwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwg
UmVnbm8gd3JvdGU6Cj4+IFVzZSBkZXZfZXJyX3Byb2JlKCkgdG8gc2ltcGxpZnkgaGFuZGxpbmcg
ZXJyb3JzIGluIHB3bV9tZWRpYXRla19wcm9iZSgpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL3B3bS9wd20tbWVkaWF0ZWsuYyB8IDMwICsrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspLCAxOSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3
bS1tZWRpYXRlay5jIGIvZHJpdmVycy9wd20vcHdtLW1lZGlhdGVrLmMKPj4gaW5kZXggMGQ0ZGQ4
MGU5ZjA3Li5jN2Q1Y2EwOWE2ODQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZWRp
YXRlay5jCj4+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZWRpYXRlay5jCj4+IEBAIC0yMjcsMTgg
KzIyNywxNCBAQCBzdGF0aWMgaW50IHB3bV9tZWRpYXRla19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+PiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4+ICAgCj4+ICAgCXBjLT5jbGtf
dG9wID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsICJ0b3AiKTsKPj4gLQlpZiAoSVNfRVJSKHBj
LT5jbGtfdG9wKSkgewo+PiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJjbG9jazogdG9wIGZhaWw6
ICVsZFxuIiwKPj4gLQkJCVBUUl9FUlIocGMtPmNsa190b3ApKTsKPj4gLQkJcmV0dXJuIFBUUl9F
UlIocGMtPmNsa190b3ApOwo+PiAtCX0KPj4gKwlpZiAoSVNfRVJSKHBjLT5jbGtfdG9wKSkKPj4g
KwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgUFRSX0VSUihwYy0+Y2xrX3RvcCks
Cj4+ICsJCQkJICAgICAiY2xvY2s6IHRvcCBmYWlsZWRcbiIpOwo+IAo+IFRoZSBjaGFuZ2UgbG9v
a3Mgc3RyYWlnaHQgZm9yd2FyZC4gSSB3b25kZXIgaWYgd2Ugc2hvdWxkIGltcHJvdmUgdGhlCj4g
ZXJyb3IgbWVzc2FnZSBvbiB0aGlzIG9jY2FzaW9uLiBFLmcuCj4gCj4gCSJGYWlsZWQgdG8gZ2V0
IHRvcCBjbG9ja1xuIgo+IAoKSSBjYW4gcHVzaCBhbm90aGVyIGNvbW1pdCBvbiB0b3AgdGhhdCBp
bXByb3ZlcyB0aGUgbWVzc2FnZXMsIGlmIGRlc2lyZWQhCgpSZWdhcmRzLApBbmdlbG8KCj4gPyBE
aXR0byBiZWxvdy4KPiAKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKPiAKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
