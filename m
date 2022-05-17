Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5FFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOw04jt+JjVK3znPYvgaLzYpkHUmShlrTfPS6615k+E=; b=RxGKAXeTdWiEUq
	7TWwweo+CM5r/StiM1uAgjeOADll/PEvB9kqM8lW/bMvj3SYj8BmEK0Dm3L7jPhesVoFKXpSxbX81
	SMx1lcoiw5NiI52vM5NK5EMpXgX39tPgm44aSP4vKoZ/XMH5thH8zuAl5aQVQVi4Sluiq+NvXjXfL
	6G61NqNJlpBK/MDVqfdYR6N5tdjNZTzBucyrs169tJ5VoE1NVqPRkngSCVdhZVnBrM0Dgh+D+VvfO
	Q3UuameY6bG2CqzO6090PoHHckM0/H2sBAfmCaA3G7scACe5hFeQegYpXUWmr+mAVC4TyF3/Q/g06
	kcYqroPYCI1Cx2C27JPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquYe-00D8cV-RB; Tue, 17 May 2022 10:36:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nquYR-00D8Vw-Ih; Tue, 17 May 2022 10:35:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CE2101F44492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652783750;
 bh=wpmWddblxYyDkBmT+shBpq8yfbqgog90VUPSoVh9U78=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QV0ki/Z8y09yodZ2xxdyb0epnntinN05WbfPtvPW7os5p9uqkYFgi10FEYcuA2AhF
 LR4xSTOcpw5+u7037yRzO622+rc+TqcXTxWRPGTGfFDYBqYVp7Eo2Ry62RMydmeVnM
 hD++8l2KKSLzi5F9sWqcc9w7N+lDX0DAvEye/kt0NPVWTtrCOifeJR2ME74hJt6FIV
 GJ2RQLsWuorKNkNWhfKLwTC++Ikb/W3emy6hBJHRZ9mY/YITDykiVUzjpvfmBC+4cb
 GqkIUWiV3qz4gFxVi+g7nT1kAMX9dSdXIVYngBVY3KCpx4afYMxtfKJGmB23DcpeTZ
 m20C0aYGtQQ0A==
Message-ID: <7f4f12ef-4fda-2092-1129-d0be498c7b20@collabora.com>
Date: Tue, 17 May 2022 12:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 3/5] soc: mediatek: pwrap: Move and check return value
 of platform_get_irq()
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 rex-bc.chen@mediatek.com, zhiyong.tao@mediatek.com
References: <20220516124659.69484-1-angelogioacchino.delregno@collabora.com>
 <20220516124659.69484-4-angelogioacchino.delregno@collabora.com>
 <ad736290-2e01-f867-d2ec-867a4385005a@gmail.com>
 <03ac9b18-cb5d-5ff6-d220-f2f4062cea7e@collabora.com>
 <bb1aea80-a926-8545-646e-bb526bc5cb84@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <bb1aea80-a926-8545-646e-bb526bc5cb84@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_033551_788945_26CD0180 
X-CRM114-Status: GOOD (  23.41  )
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

SWwgMTcvMDUvMjIgMTE6NDksIE1hdHRoaWFzIEJydWdnZXIgaGEgc2NyaXR0bzoKPiAKPiAKPiBP
biAxNy8wNS8yMDIyIDExOjM0LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToKPj4g
SWwgMTcvMDUvMjIgMTE6MTgsIE1hdHRoaWFzIEJydWdnZXIgaGEgc2NyaXR0bzoKPj4+Cj4+Pgo+
Pj4gT24gMTYvMDUvMjAyMiAxNDo0NiwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6
Cj4+Pj4gTW92ZSB0aGUgY2FsbCB0byBwbGF0Zm9ybV9nZXRfaXJxKCkgZWFybGllciBpbiB0aGUg
cHJvYmUgZnVuY3Rpb24KPj4+PiBhbmQgY2hlY2sgZm9yIGl0cyByZXR1cm4gdmFsdWU6IGlmIG5v
IGludGVycnVwdCBpcyBzcGVjaWZpZWQsIGl0Cj4+Pj4gd291bGRuJ3QgbWFrZSBzZW5zZSB0byB0
cnkgdG8gY2FsbCBkZXZtX3JlcXVlc3RfaXJxKCkgc28sIGluIHRoYXQKPj4+PiBjYXNlLCB3ZSBj
YW4gc2ltcGx5IHJldHVybiBlYXJseS4KPj4+Pgo+Pj4+IE1vdmluZyB0aGUgcGxhdGZvcm1fZ2V0
X2lycSgpIGNhbGwgYWxzbyBtYWtlcyBpdCBwb3NzaWJsZSB0byB1c2UKPj4+PiBvbmUgbGVzcyBn
b3RvLCBhcyBjbG9ja3MgYXJlbid0IHJlcXVpcmVkIGF0IHRoYXQgc3RhZ2UuCj4+Pj4KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyAKPj4+PiA8YW5nZWxvZ2lv
YWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+Pj4+IFJldmlld2VkLWJ5OiBOw61jb2xh
cyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Cj4+Pj4gVGVzdGVkLWJ5
OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Cj4+Pj4g
LS0tCj4+Pj4gwqAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtaWMtd3JhcC5jIHwgNSArKysr
LQo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG1pYy13cmFw
LmMgCj4+Pj4gYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG1pYy13cmFwLmMKPj4+PiBpbmRl
eCA4NTI1MTQzNjZmMWYuLjMzMmNiY2FiYzI5OSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL3Nv
Yy9tZWRpYXRlay9tdGstcG1pYy13cmFwLmMKPj4+PiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRl
ay9tdGstcG1pYy13cmFwLmMKPj4+PiBAQCAtMjIwNCw2ICsyMjA0LDEwIEBAIHN0YXRpYyBpbnQg
cHdyYXBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+PiDCoMKgwqDCoMKg
IGlmICghd3JwKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4+PiAr
wqDCoMKgIGlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4+Pj4gK8KgwqDCoCBpZiAo
aXJxIDwgMCkKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGlycTsKPj4+PiArCj4+Pj4gwqDC
oMKgwqDCoCBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCB3cnApOwo+Pj4+IMKgwqDCoMKgwqAg
d3JwLT5tYXN0ZXIgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRldik7Cj4+Pj4g
QEAgLTIzMTYsNyArMjMyMCw2IEBAIHN0YXRpYyBpbnQgcHdyYXBfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPj4+PiDCoMKgwqDCoMKgIGlmIChIQVNfQ0FQKHdycC0+bWFzdGVy
LT5jYXBzLCBQV1JBUF9DQVBfSU5UMV9FTikpCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHB3cmFw
X3dyaXRlbCh3cnAsIHdycC0+bWFzdGVyLT5pbnQxX2VuX2FsbCwgUFdSQVBfSU5UMV9FTik7Cj4+
Pj4gLcKgwqDCoCBpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+Pj4KPj4+IEZvciBi
ZXR0ZXIgcmVhZGFiaWxpdHkgb2YgdGhlIGNvZGUgSSdkIHByZWZlciB0byBrZWVwIHBsYXRmb3Jt
X2dldF9pcnEgbmV4dCB0byAKPj4+IGRldm1fcmVxdWVzdF9pcnEuIEkgdW5kZXJzdGFuZCB0aGF0
IHlvdSBkaWQgdGhpcyBjaGFuZ2Ugc28gdGhhdCB5b3UgZG9uJ3QgaGF2ZSAKPj4+IHRvIGNvZGUK
Pj4+IGlmIChpcnEgPCAwKSB7Cj4+PiDCoMKgwqDCoCByZXQgPSBpcnE7Cj4+PiDCoMKgwqDCoCBn
b3RvIGVycl9vdXQyOwo+Pj4gfQo+Pj4KPj4+IE9yIGRvIEkgbWlzcyBzb21ldGhpbmc/Cj4+Pgo+
Pgo+PiBUaGF0J3MgZm9yIHRoZSBzYWtlIG9mIHJlZHVjaW5nIGdvdG9zIGluIHRoZSBjb2RlLi4u
IGJ1dCB0aGVyZSdzIGEgYmlnZ2VyCj4+IHBpY3R1cmUgdGhhdCBJIGhhdmVuJ3QgZXhwbGFpbmVk
IGluIHRoaXMgY29tbWl0IGFuZCB0aGF0IHdpbGwgY29tZSBsYXRlcgo+PiBiZWNhdXNlIEkgY3Vy
cmVudGx5IGRvbid0IGhhdmUgdGhlIG5lY2Vzc2FyeSB0aW1lIHRvIHBlcmZvcm0gYSAiZGVjZW50
Igo+PiB0ZXN0aW5nLgo+Pgo+PiBBcyBJIHdhcyBleHBsYWluaW5nIC0gdGhlIGJpZ2dlciBwaWN0
dXJlcyBpbXBsaWVzIGFkZGluZyBhIG5ldyBmdW5jdGlvbiBmb3IKPj4gY2xvY2sgdGVhcmRvd24s
IHRoYXQgd2Ugd2lsbCBhZGQgYXMgYSBkZXZtIGFjdGlvbjoKPj4KPj4gZGV2bV9hZGRfYWN0aW9u
X29yX3Jlc2V0KCZwZGV2LT5kZXYsIHB3cmFwX2Nsa19kaXNhYmxlX3VucHJlcGFyZSwgd3JwKQo+
Pgo+PiAuLi5zbyB0aGF0IHdlIHdpbGwgYmUgYWJsZSB0byByZW1vdmUgKmFsbCogZ290b3MgZnJv
bSB0aGUgcHJvYmUgZnVuY3Rpb24uCj4+Cj4+IFNvdW5kcyBnb29kPwo+Pgo+IAo+IFNvdW5kcyBn
b29kLCBidXQgdGhhdCBtZWFucyB3ZSBjb3VsZCBnZXQgcmlkIG9mIHRoZSBnb3RvIGFzIHdlbGwu
IEFueXdheSBJIHByZWZlciAKPiB0byBoYXZlIHBsYXRmb3JtX2dldF9pcnEgbmV4dCB0byBkZXZt
X3JlcXVlc3RfaXJxLiBJZiB3ZSBjYW4gZ2V0IHJpZCBvZiB0aGUgZ290byBpbiAKPiB0aGUgZnV0
dXJlLCBncmVhdC4KCk9raSwgdGhlbiBJJ2xsIHNlbmQgYSB2NCBhbmQgYXZvaWQgdG8gbW92ZSB0
aGF0IG9uZSBlbHNld2hlcmUgLSB3aWxsIGtlZXAgdGhlIGdvdG8KYXMgd2VsbC4KCkxvb2tpbmcg
YmFjayBhdCBpdCwgZWZmZWN0aXZlbHksIGl0IGRvZXNuJ3QgcmVhbGx5IG1ha2Ugc2Vuc2UgdG8g
bW92ZSB0aGF0IGNhbGwhCgpDaGVlcnMsCkFuZ2VsbwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
