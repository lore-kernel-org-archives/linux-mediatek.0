Return-Path: <SRS0=YyAn=5V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01F1C2BA15
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 14:53:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D4E4206C3
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 14:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cbgRqk+f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="UhA6bMM9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D4E4206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bw7VgtdOugj2wRPcxaCwUpWZPhaJ4dU35+M4wUu9hqI=; b=cbgRqk+fD+TG7w
	qtAWufYqWl8zNR9fPlnjuNlEG0/rcfDVzlKlNNEiTknKy1z2C2WGwoXx8bo254Av+fPX+exTZomTY
	NC5JC5n+T3XYmENtcY23ofGRdTKJ5mlvX2GQYCjPYHb9+9JY8gpitBGZWEKxqc/GeS9pyQKHy4gGE
	ONCUvN7JPp/+LZya45G8ANSYlhspOWES7KS0Rg1jHQUIDLvRlFcBWgHJvLyjcoKTVwRbz3qa3ERkI
	PrlMuSvxoxP63Pt1LIoAPOaZ6jhYu+k8IyeRTmNdJ1+VWcVoRoqxCwqdyrNrg+JEqQOUfCnfRjaTP
	v1ZgLnReEQ1lPDgSo7bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jL6eV-0005SX-RC; Sun, 05 Apr 2020 14:53:35 +0000
Received: from mout.web.de ([212.227.17.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jL6eP-0005Ld-3G; Sun, 05 Apr 2020 14:53:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586098377;
 bh=IWmjjEUL/Po3O0D2P7+8NcxxH3nBfKDYaqcRWyNJMrM=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=UhA6bMM9VsnLGvDzXw1NLgZl+F/Mqy6qLaOGHYSrdDafRxgzMaB1f2oFjNg7uspat
 yVtLguCZ2al8TR4EBBzNOunaxMaTZLaA0DC3sMG+PWF8kIqq/ONKyiErYhrjZjfYrj
 /I9A5mb9m2/jhis+6ETSn5Gnn8L19QUiFirRnsto=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.131.99.70]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MV4bp-1joQHF43Ab-00YNPH; Sun, 05
 Apr 2020 16:52:57 +0200
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>,
 Kalle Valo <kvalo@codeaurora.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roy Luo <royluo@google.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] mt7615: Delete an error message in mt7622_wmac_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <0b236ef3-45cb-b6bf-a3ca-fbe4fa4185da@web.de>
Date: Sun, 5 Apr 2020 16:52:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:4CIYD6qtluiIAwHgLtajt+xvxrAO9x7zNuFZyEBoG683vdNnJZz
 7lXXfuAxfvYwp1UqMehK+qb5gpV36uRLHwGmG6SAddGn0fpO+CunIF/PaCv6KuStdaiUN/e
 VaWbGgxngP5OH6aaZH1pr9aziNft51Nbg/SPM5ui40rJSLKfSmX+x/TnI429y+KESujfooC
 jMw4XdUoRRyGwMthmZ0wA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qCrWWl4L1ok=:ig3rLi2RPTVORwuPEDzpMF
 tvT/rRrmhOqo/lG7v9vjQQIXYJYMVtYkd6I43i6LOZqTuJ+3oO8EguUBJDJY8Xxjz1qKiupVg
 QkxpIw0a2GUAtsJ7PtZWa1X6POnUGxYzJ2eXpVmqMfd7nHMl6f3FhLzwO/RQ8fczVuSjQvrOU
 rRRVFcina73x7uUQCqImfq89OIQVjZgaACTVAw55ITVirr3F1f9aTQK9uTgRkmNJCRkLltfX/
 piyBqKEWW47+FVz4xpmjcT0Q69d2LhziXwcaP6kZU7koJgoepF6KpxzLtS+cZXf9/x4VpOpU8
 cYA7BjtrDSIdeSF2sUwqgMaes5FGwv0Er7rEi8J5ugaEAxRNJdyeXMX/VbIi+nqKiIWVK+mXI
 tgH0XeysJfSz55ytuSTbBA9MsA/UW2/9YaHQiMUogPAlgfFTl5nraUdaDE/991Pyk6Xqp+fGQ
 7wPqQ2Z2XqHBMEQ/rqamysegpUXpQuVwhanS6Clm2NX10JSwcp5PwSEyNGl/eSD0SwPda6peM
 rvXxN/y8ZXxg9KmhnBq0dKvr9EqCalbkVqq4h6iWXbCyEH+0hKh5rHLWggR+nGpjL4eifI1zd
 kYZ777n70jmQWbui71zg1JrF+m0Cff54LilaN10oonVP2eW8mfH88S1YMqQOFyBlyz8eKc/kS
 JHO2IBT+76fAvYzQwzdTBYX8TCb3309GQGpQCiu/q3ZPnPK5ajPq1jeRYnuIPYLpHqGJ1rrKy
 HnHyiK+Rij8ruTjJuRYIgvUFX0bKYLL8EzwEVHRWJBQM6DIwlCfpvu+EjKAkWuggPpz4eCBkr
 est+r+0Gcgv/3a4uENvlXTUnPcG+HrcYBWxKYIO+ci52o240NqMsR+vXZ2mhfBTWoI54H+52o
 AISr4jMnTlX1ZZriGjGDj1vJa8Dgu0EpIkWYVF5Bn8a7TwffnnQE1bJQpST8Dk4U6rmlY4o1A
 mC0xqXSuCP4Hb2FtoNsmOhM96lSLtJCUpPx4lQDpN2sowUX90KCQ3rRxg2mKVQ4jM5st66f3t
 VVizkOTOLejgRhHXywWAanrV8Crbi7RCYMlBKzE+oi18q0qj+MjfmecHUp2H3WJOqgJhpE+UT
 nc/UIddM31JxSgLruad+1FRi5Q/qmk0f4kMZepa5beQgAf30vDpDOE9wq5vc1g5nt5qbhut2S
 sIrH8GA3ALge6s8BTM3VVHokVybE+26NSE43VDwdEWguquvs4X2OG9jJ8T5ea5oPKoK8A97Ns
 TmMz3IWjzBMkW7BGv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200405_075329_477967_E40BC0B6 
X-CRM114-Status: GOOD (  11.15  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBTdW4sIDUgQXByIDIwMjAgMTY6NDU6NDggKzAyMDAKClRoZSBmdW5jdGlvbiDigJxwbGF0Zm9y
bV9nZXRfaXJx4oCdIGNhbiBsb2cgYW4gZXJyb3IgYWxyZWFkeS4KVGh1cyBvbWl0IGEgcmVkdW5k
YW50IG1lc3NhZ2UgZm9yIHRoZSBleGNlcHRpb24gaGFuZGxpbmcgaW4gdGhlCmNhbGxpbmcgZnVu
Y3Rpb24uCgpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBz
b2Z0d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNv
dXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210
NzYxNS9zb2MuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210
NzYvbXQ3NjE1L3NvYy5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc2
MTUvc29jLmMKaW5kZXggNDNhYTQ5NzA2YzY2Li45YWE1MTgzYzdhNTYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3NjE1L3NvYy5jCisrKyBiL2RyaXZl
cnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3NjE1L3NvYy5jCkBAIC0zNiwxMCArMzYs
OCBAQCBzdGF0aWMgaW50IG10NzYyMl93bWFjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAJaW50IGlycTsKCiAJaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKLQlp
ZiAoaXJxIDwgMCkgewotCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gZ2V0IGRldmlj
ZSBJUlFcbiIpOworCWlmIChpcnEgPCAwKQogCQlyZXR1cm4gaXJxOwotCX0KCiAJbWVtX2Jhc2Ug
PSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgcmVzKTsKIAlpZiAoSVNfRVJSKG1l
bV9iYXNlKSkgewotLQoyLjI2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
