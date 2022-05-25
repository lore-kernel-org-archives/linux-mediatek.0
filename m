Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FB1C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JW6gNzF3SSyjevHIfGvd7ecb5kEK0636viR+vz7kQYs=; b=LsZJQSp+8cWlfd
	KV6KitrdP+3G37HrmLcaj9y0sMrHpEq6DRSCYWpK2QKs3gbfV4sRtL0uerfTXA7v9Y4vfsgvNJqSK
	TEEV9fgOpLiCjQkSYsLMFIjuOHwg8CVVB8H6YlYcg1UUWZAFQSrNA9O48n/Q3B/aw9M7W4dBcEYAe
	+yuTVv5jNjWdn+tVPshTiKr91Ws2md0p6o/hCzR5/tnW34rrybE0DIAdgvz1Vh0iIGXIhyl5/M8dJ
	Qhhg1z/jxDiD5757pNfhs1ulkZ5t0WMZQZqDHTtvE/CGCnAOyBer6e+3+NpCKgKv+PuFqSDaU3SVO
	qOZ7AyafaTiIw9QDSw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntoSp-00AkGX-Tt; Wed, 25 May 2022 10:42:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntoSd-00AkDO-H1; Wed, 25 May 2022 10:41:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 2683B1F448AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653475310;
	bh=xXH5hN96WvbdMWEtdR67xyJ1Nu1XNE5YBoILGq7ZbpQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=GPVM261LD27yCOCRgYPXMlzrkHAEPhQ89rHcxGYniANEaVsJsymLMyx1CwnD76jpo
	 DKUEjtN2qnR1ESBC9BhZ91Cz3avwwyzhdQOKDeGAN4ErtgF4V+kDIVXQ509uW/hWRT
	 0xQOmuokQ8lvqgdR4sbjbkYIZ8Cu5dSj3RiGucUWNhQsjZ7fApWtBR45VVX974yrkO
	 B198tAeJ+Bi6SVYt0liqgvPrEnbkDwhSSA0CytvrGumQjHCVw9Wwn1rMA6IW28wSr3
	 vD9MSPkDBGuwCPyg6z0PbGGA9aMIGw4IP34+jTqIjCM2bphQ1dFtp6er0RXBtnZCy9
	 Kfk2xShk+Gj8Q==
Message-ID: <ae47e12b-396c-a5a0-2da2-2010237fbbc2@collabora.com>
Date: Wed, 25 May 2022 12:41:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 1/1] firmware: mediatek: add adsp ipc protocol
 interface
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, tzungbi@google.com,
 Chen-Yu Tsai <wenst@chromium.org>, cujomalainey@google.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
References: <20220407130338.28939-1-allen-kh.cheng@mediatek.com>
 <20220407130338.28939-2-allen-kh.cheng@mediatek.com>
 <54d6c0ff-d93c-0506-4db9-3852c69211ab@collabora.com>
In-Reply-To: <54d6c0ff-d93c-0506-4db9-3852c69211ab@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_034151_755093_42BE55EF 
X-CRM114-Status: GOOD (  15.85  )
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

SWwgMjUvMDUvMjIgMTI6MzksIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIGhhIHNjcml0dG86
Cj4gSWwgMDcvMDQvMjIgMTU6MDMsIEFsbGVuLUtIIENoZW5nIGhhIHNjcml0dG86Cj4+IEZyb206
IEFsbGVuLUtIIENoZW5nIDxBbGxlbi1LSC5DaGVuZ0BtZWRpYXRlay5jb20+Cj4+Cj4+IFNvbWUg
b2YgbWVkaWF0ZWsgcHJvY2Vzc29ycyBjb250YWluCj4+IHRoZSBUZW5zaWxpY2EgSGlGaXggRFNQ
IGZvciBhdWRpbyBwcm9jZXNzaW5nLgo+Pgo+PiBUaGUgY29tbXVuaWNhdGlvbiBiZXR3ZWVuIEhv
c3QgQ1BVIGFuZCBEU1AgZmlybXdhcmUgaXMKPj4gdGFraW5nIHBsYWNlIHVzaW5nIGEgc2hhcmVk
IG1lbW9yeSBhcmVhIGZvciBtZXNzYWdlIHBhc3NpbmcuCj4+Cj4+IEFEU1AgSVBDIHByb3RvY29s
IG9mZmVycyAoc2VuZC9yZWN2KSBpbnRlcmZhY2VzIHVzaW5nCj4+IG1lZGlhdGVrLW1haWxib3gg
QVBJcy4KPj4KPj4gV2UgdXNlIHR3byBtYm94IGNoYW5uZWxzIHRvIGltcGxlbWVudCBhIHJlcXVl
c3QtcmVwbHkgcHJvdG9jb2wuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFsbGVuLUtIIENoZW5nIDxh
bGxlbi1raC5jaGVuZ0BtZWRpYXRlay5jb20+Cj4+IFJldmlld2VkLWJ5OiBQaWVycmUtTG91aXMg
Qm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPgo+PiBSZXZpZXdl
ZC1ieTogQ3VydGlzIE1hbGFpbmV5IDxjdWpvbWFsYWluZXlAY2hyb21pdW0ub3JnPgo+PiBSZXZp
ZXdlZC1ieTogVHp1bmctQmkgU2hpaCA8dHp1bmdiaUBnb29nbGUuY29tPgo+PiBSZXZpZXdlZC1i
eTogWUMgSHVuZyA8eWMuaHVuZ0BtZWRpYXRlay5jb20+Cj4+IFJldmlld2VkLWJ5OiBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEu
Y29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9maXJtd2FyZS9LY29uZmlnwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+PiDCoCBkcml2ZXJzL2Zpcm13
YXJlL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oCAxICsKPj4gwqAgZHJpdmVycy9maXJtd2FyZS9tZWRpYXRlay9LY29uZmlnwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDkgKwo+PiDCoCBkcml2ZXJzL2Zpcm13YXJlL21lZGlhdGVrL01h
a2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICsKPj4gwqAgZHJpdmVycy9maXJt
d2FyZS9tZWRpYXRlay9tdGstYWRzcC1pcGMuY8KgwqDCoMKgwqAgfCAxNjEgKysrKysrKysrKysr
KysrKysrCj4+IMKgIC4uLi9saW51eC9maXJtd2FyZS9tZWRpYXRlay9tdGstYWRzcC1pcGMuaMKg
wqDCoCB8wqAgNjUgKysrKysrKwo+PiDCoCA2IGZpbGVzIGNoYW5nZWQsIDIzOSBpbnNlcnRpb25z
KCspCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Zpcm13YXJlL21lZGlhdGVrL0tj
b25maWcKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0ZWsv
TWFrZWZpbGUKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUvbWVkaWF0
ZWsvbXRrLWFkc3AtaXBjLmMKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgv
ZmlybXdhcmUvbWVkaWF0ZWsvbXRrLWFkc3AtaXBjLmgKPj4KPiAKPiBHZW50bGUgcGluZyBmb3Ig
dGhpcyBvbmUsIGFzIGl0J3MgZ2V0dGluZyBzdGFsZS4uLiBhbmQgaXQncyByZWFkeS4KPiAKPiBU
byBhZGQgY29udGV4dCwgdGhpcyBkcml2ZXIgaXMgKnJlYWxseSogbmVjZXNzYXJ5LCBhcyBzdXBw
b3J0IGZvciBpdAo+IGlzIGFkZGVkIGluIHRoZSBNVDgxOTUgQVNvQyBTT0YgZHJpdmVyIGFzIGEg
cGxhdGZvcm0gZGV2aWNlIFsxXSwgYW5kIHRoZQo+IG5lY2Vzc2FyeSBtZW1vcnkgcmVnaW9ucyBh
cmUgY29taW5nIGZyb20gdGhlIG1lZGlhdGVrLG10ODE5NS1kc3AgWzJdIGRyaXZlci4KPiAKPiBb
MV06IAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25l
eHQvbGludXgtbmV4dC5naXQvdHJlZS9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgx
OTUuYz9oPW5leHQtMjAyMjA1MjUjbjM4OSAKPiAKPiAKPiBbMl06IAo+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvdHJl
ZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZHNwL21lZGlhdGVrLG10ODE5NS1k
c3AueWFtbD9oPW5leHQtMjAyMjA1MjUjbjYxIAo+IAo+IAo+IENoZWVycywKPiBBbmdlbG8KCgpJ
J20gc29ycnksIGlnbm9yZSBtZSwgYW5vdGhlciB2ZXJzaW9uIG9mIHRoaXMgb25lIHdhcyBhbHJl
YWR5IG1lcmdlZC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
