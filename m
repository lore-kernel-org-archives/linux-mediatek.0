Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180D6C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 08:19:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CEBA64E22
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 08:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CEBA64E22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uswx1wuc/cFskSqpb3BzmZE/OATo0xxqj39J4bWlAzw=; b=Ngigurhx7drWbBYAkkTJYHmda
	0dca/U+MxnB0eBtmEj545/bbWEG/M38YpxMDHnSItazHV24Rr1WnFqt5OuQ07s82mJSoGvRoxSC6z
	FUvNx/X0s1T7OH/8zrJC3nnN4kZ2hMwfAqOKZ429INyP1rjB7OixvXhKNltfZG4SHP6iPq8wqXTHV
	djpPK9h80FgexR+4ceTqL4pUkAPCSELWTG9V32l6b5F7gvA6f3Emn2EsRlPMpsNnoKobtZmKhHGDY
	aeu3226X8no6ipbdfg6IRF8TfG9xi/SbYzLxXhbZ+/tyxXMIPjN+vZcBcHbF4Af0NfMSVeErYtbNE
	g7ZrxMwUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKGXg-008fRz-AV; Thu, 11 Mar 2021 08:19:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKGXT-008fON-Cr; Thu, 11 Mar 2021 08:19:25 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 411B164EAE;
 Thu, 11 Mar 2021 08:19:21 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lKGXO-000waf-MQ; Thu, 11 Mar 2021 08:19:18 +0000
MIME-Version: 1.0
Date: Thu, 11 Mar 2021 08:19:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Jianjun Wang
 <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sj Huang
 <sj.huang@mediatek.com>, youlin.pei@mediatek.com, chuanjia.liu@mediatek.com,
 qizhong.cheng@mediatek.com, sin_jieyang@mediatek.com, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com
Subject: Re: [v8,5/7] PCI: mediatek-gen3: Add MSI support
In-Reply-To: <20210311000555.epypouwxdbql2aqx@pali>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-6-jianjun.wang@mediatek.com>
 <20210311000555.epypouwxdbql2aqx@pali>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <e6c53aa3863c3f5b0560ed65282fc5e2@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: pali@kernel.org, jianjun.wang@mediatek.com,
 bhelgaas@google.com, robh+dt@kernel.org, lorenzo.pieralisi@arm.com,
 ryder.lee@mediatek.com, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
 youlin.pei@mediatek.com, chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
 sin_jieyang@mediatek.com, drinkcat@chromium.org, Rex-BC.Chen@mediatek.com,
 anson.chuang@mediatek.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_081923_844508_0F52E9EE 
X-CRM114-Status: GOOD (  14.44  )
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

T24gMjAyMS0wMy0xMSAwMDowNSwgUGFsaSBSb2jDoXIgd3JvdGU6Cj4gT24gV2VkbmVzZGF5IDI0
IEZlYnJ1YXJ5IDIwMjEgMTQ6MTE6MzAgSmlhbmp1biBXYW5nIHdyb3RlOgo+PiArc3RhdGljIGlu
dCBtdGtfbXNpX2JvdHRvbV9kb21haW5fYWxsb2Moc3RydWN0IGlycV9kb21haW4gKmRvbWFpbiwK
Pj4gKwkJCQkgICAgICAgdW5zaWduZWQgaW50IHZpcnEsIHVuc2lnbmVkIGludCBucl9pcnFzLAo+
PiArCQkJCSAgICAgICB2b2lkICphcmcpCj4+ICt7Cj4+ICsJc3RydWN0IG10a19wY2llX3BvcnQg
KnBvcnQgPSBkb21haW4tPmhvc3RfZGF0YTsKPj4gKwlzdHJ1Y3QgbXRrX21zaV9zZXQgKm1zaV9z
ZXQ7Cj4+ICsJaW50IGksIGh3aXJxLCBzZXRfaWR4Owo+PiArCj4+ICsJbXV0ZXhfbG9jaygmcG9y
dC0+bG9jayk7Cj4+ICsKPj4gKwlod2lycSA9IGJpdG1hcF9maW5kX2ZyZWVfcmVnaW9uKHBvcnQt
Pm1zaV9pcnFfaW5fdXNlLCAKPj4gUENJRV9NU0lfSVJRU19OVU0sCj4+ICsJCQkJCW9yZGVyX2Jh
c2VfMihucl9pcnFzKSk7Cj4+ICsKPj4gKwltdXRleF91bmxvY2soJnBvcnQtPmxvY2spOwo+PiAr
Cj4+ICsJaWYgKGh3aXJxIDwgMCkKPj4gKwkJcmV0dXJuIC1FTk9TUEM7Cj4+ICsKPj4gKwlzZXRf
aWR4ID0gaHdpcnEgLyBQQ0lFX01TSV9JUlFTX1BFUl9TRVQ7Cj4+ICsJbXNpX3NldCA9ICZwb3J0
LT5tc2lfc2V0c1tzZXRfaWR4XTsKPj4gKwo+PiArCWZvciAoaSA9IDA7IGkgPCBucl9pcnFzOyBp
KyspCj4+ICsJCWlycV9kb21haW5fc2V0X2luZm8oZG9tYWluLCB2aXJxICsgaSwgaHdpcnEgKyBp
LAo+PiArCQkJCSAgICAmbXRrX21zaV9ib3R0b21faXJxX2NoaXAsIG1zaV9zZXQsCj4+ICsJCQkJ
ICAgIGhhbmRsZV9lZGdlX2lycSwgTlVMTCwgTlVMTCk7Cj4+ICsKPj4gKwlyZXR1cm4gMDsKPj4g
K30KPj4gKwo+PiArc3RhdGljIHZvaWQgbXRrX21zaV9ib3R0b21fZG9tYWluX2ZyZWUoc3RydWN0
IGlycV9kb21haW4gKmRvbWFpbiwKPj4gKwkJCQkgICAgICAgdW5zaWduZWQgaW50IHZpcnEsIHVu
c2lnbmVkIGludCBucl9pcnFzKQo+PiArewo+PiArCXN0cnVjdCBtdGtfcGNpZV9wb3J0ICpwb3J0
ID0gZG9tYWluLT5ob3N0X2RhdGE7Cj4+ICsJc3RydWN0IGlycV9kYXRhICpkYXRhID0gaXJxX2Rv
bWFpbl9nZXRfaXJxX2RhdGEoZG9tYWluLCB2aXJxKTsKPj4gKwo+PiArCW11dGV4X2xvY2soJnBv
cnQtPmxvY2spOwo+PiArCj4+ICsJYml0bWFwX2NsZWFyKHBvcnQtPm1zaV9pcnFfaW5fdXNlLCBk
YXRhLT5od2lycSwgbnJfaXJxcyk7Cj4gCj4gTWFyYywgc2hvdWxkIG5vdCBiZSB0aGVyZSBiaXRt
YXBfcmVsZWFzZV9yZWdpb24oKSB3aXRoIG9yZGVyX2Jhc2VfMigpPwo+IAo+IGJpdG1hcF9yZWxl
YXNlX3JlZ2lvbihwb3J0LT5tc2lfaXJxX2luX3VzZSwgZGF0YS0+aHdpcnEsIAo+IG9yZGVyX2Jh
c2VfMihucl9pcnFzKSk7Cj4gCj4gQmVjYXVzZSBtdGtfbXNpX2JvdHRvbV9kb21haW5fYWxsb2Mo
KSBpcyBhbGxvY2F0aW5nCj4gb3JkZXJfYmFzZV8yKG5yX2lycXMpIGludGVycnVwdHMsIG5vdCBv
bmx5IG5yX2lycXMuCgpJbmRlZWQsIGdvb2QgY2F0Y2guCgpUaGFua3MsCgogICAgICAgICBNLgot
LSAKSmF6eiBpcyBub3QgZGVhZC4gSXQganVzdCBzbWVsbHMgZnVubnkuLi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
