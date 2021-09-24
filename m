Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A958C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 14:47:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28D1F61038
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 14:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28D1F61038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=C+m08Ay2usN7rPgW3+wozoVL997VbnYmnq3Cqn75/kY=; b=RgkKvSpBlazGJgTnMVw3OCePxT
	BIC1nuXKOb4X4rKLeuKs9yCuLRWq3rgVEbIptO/NePg1ZgPOmaC6B9hhk9DQdHfXU6uKnzVm9HUm5
	8oMw8LkX7RosBTqMFxVEUYNrHuUAWqCXo/W3ZYxjMF0gQ+h0JXkqt0aikoxflOPxqD5g1sLCSMo2W
	y63SQDuXm/iuQBl2v+gQnWzWPFCZILRPGDsVeMw3SMieMg/W4Vd301WyjUP8m1p8EzZb/tRRR78q1
	RwiHvYsY8gelG/LRphsmD4MXdaO8xlr+qmlBtXt5HqDa9BWE64sfE1EqK+f58cD0vYjqMCWPOjFqo
	WllLa1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTmTO-00Ernw-Ke; Fri, 24 Sep 2021 14:46:46 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTmTC-00ErmO-LV; Fri, 24 Sep 2021 14:46:36 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="287754127"
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="287754127"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 07:46:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="551835095"
Received: from bordone-mobl1.amr.corp.intel.com (HELO [10.209.164.235])
 ([10.209.164.235])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 07:46:30 -0700
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8195: add machine driver with
 mt6359, rt1011 and rt5682
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 aaronyu@google.com, linux-arm-kernel@lists.infradead.org
References: <20210910104405.11420-1-trevor.wu@mediatek.com>
 <20210910104405.11420-2-trevor.wu@mediatek.com>
 <10fc49fa-9791-0225-365d-e3074680596c@linux.intel.com>
 <4d703c5f7cf27ddc8b9886b111ffeeba0c4aa08b.camel@mediatek.com>
 <1d7fe7455a054819daf05d41ab3658afdc1caced.camel@mediatek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c34d03ff-f349-724e-0dcf-7893f3622cd9@linux.intel.com>
Date: Fri, 24 Sep 2021 09:46:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1d7fe7455a054819daf05d41ab3658afdc1caced.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_074634_769115_545197A1 
X-CRM114-Status: GOOD (  10.34  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cj4+Pj4gKy8qIE1vZHVsZSBpbmZvcm1hdGlvbiAqLwo+Pj4+ICtNT0RVTEVfREVTQ1JJUFRJT04o
Ik1UODE5NS1NVDYzNTktUlQxMDExLVJUNTY4MiBBTFNBIFNvQyBtYWNoaW5lCj4+Pj4gZHJpdmVy
Iik7Cj4+Pj4gK01PRFVMRV9BVVRIT1IoIlRyZXZvciBXdSA8dHJldm9yLnd1QG1lZGlhdGVrLmNv
bT4iKTsKPj4+PiArTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOwo+Pj4KPj4+ICJHUEwiIGlzIGVu
b3VnaAo+Pj4KPj4KPj4gSSBzZWUgbWFueSBwcm9qZWN0cyB1c2UgR1BMIHYyIGhlcmUsIGFuZCBh
bGwgbWVkaWF0ZWsgcHJvamVjdHMgdXNlCj4+IEdQTAo+PiB2MiwgdG9vLgo+PiBJJ20gbm90IHN1
cmUgd2hpY2ggb25lIGlzIGJldHRlci4KPj4gRG8gSSBuZWVkIHRvIG1vZGlmeSB0aGlzPwoKU2Vl
Cmh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3MvbGljZW5zZS1y
dWxlcy5odG1sP2hpZ2hsaWdodD1tb2R1bGVfbGljZW5zZSNpZDEKCkxvYWRhYmxlIGtlcm5lbCBt
b2R1bGVzIGFsc28gcmVxdWlyZSBhIE1PRFVMRV9MSUNFTlNFKCkgdGFnLiBUaGlzIHRhZyBpcwpu
ZWl0aGVyIGEgcmVwbGFjZW1lbnQgZm9yIHByb3BlciBzb3VyY2UgY29kZSBsaWNlbnNlIGluZm9y
bWF0aW9uCihTUERYLUxpY2Vuc2UtSWRlbnRpZmllcikgbm9yIGluIGFueSB3YXkgcmVsZXZhbnQg
Zm9yIGV4cHJlc3Npbmcgb3IKZGV0ZXJtaW5pbmcgdGhlIGV4YWN0IGxpY2Vuc2UgdW5kZXIgd2hp
Y2ggdGhlIHNvdXJjZSBjb2RlIG9mIHRoZSBtb2R1bGUKaXMgcHJvdmlkZWQuCgrigJxHUEzigJ0K
Ck1vZHVsZSBpcyBsaWNlbnNlZCB1bmRlciBHUEwgdmVyc2lvbiAyLiBUaGlzIGRvZXMgbm90IGV4
cHJlc3MgYW55CmRpc3RpbmN0aW9uIGJldHdlZW4gR1BMLTIuMC1vbmx5IG9yIEdQTC0yLjAtb3It
bGF0ZXIuIFRoZSBleGFjdCBsaWNlbnNlCmluZm9ybWF0aW9uIGNhbiBvbmx5IGJlIGRldGVybWlu
ZWQgdmlhIHRoZSBsaWNlbnNlIGluZm9ybWF0aW9uIGluIHRoZQpjb3JyZXNwb25kaW5nIHNvdXJj
ZSBmaWxlcy4KCuKAnEdQTCB2MuKAnQoKU2FtZSBhcyDigJxHUEzigJ0uIEl0IGV4aXN0cyBmb3Ig
aGlzdG9yaWMgcmVhc29ucy4KClNvICJHUEwgdjIiIGlzIG5vdCBpbmNvcnJlY3QgYnV0IGZvciBu
ZXcgY29udHJpYnV0aW9ucyB5b3UgbWlnaHQgYXMgd2VsbAp1c2UgdGhlIHJlY29tbWVuZGVkIHRh
Zy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
