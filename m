Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75C1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 09:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNAiFLaUs9xNq7i1+jdijgyXO0aMq0/UvPZMCau4cKE=; b=rybNbIBBuCIAFp
	e2k2NyW4itr/j2mcCB3HCVqBQDUmJ/oTL4k8DAvicSVv72TSuThRESyTVcG9YsieLt53Yc8Obaqn1
	/6TdjdbVBbr/Ymw2sAFUDqOnjXTWW1rnNpTOPcOQ8sBI7CFHzl/5XaBeXFPYxk0Ova/bHnmsinTaX
	b6myqeYyS1h6G/+FlAsH872mP9+eNfGluD9oHv+hMA/FBpWGshCxipjZBprt4MWo/1MYYk+Bx9Sh/
	PlujAlJdrtYzs3reiCY+w/SsiO2A1DRzHYmrowXJKdFWZxGqja90wMb5C9t85B7IxGnKwbFYu3j1X
	pbANqnrd640Ngi0LbeRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0KFB-00CO71-Af; Thu, 23 Dec 2021 09:18:37 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11] helo=mx1.molgen.mpg.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0KF8-00CO6O-5u
 for linux-mediatek@lists.infradead.org; Thu, 23 Dec 2021 09:18:36 +0000
Received: from [192.168.0.2] (ip5f5aea70.dynamic.kabel-deutschland.de
 [95.90.234.112])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id F355A61EA1BDD;
 Thu, 23 Dec 2021 10:18:27 +0100 (CET)
Message-ID: <373eb764-f5bb-d6ff-0500-db2ccd62a6b2@molgen.mpg.de>
Date: Thu, 23 Dec 2021 10:18:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v3 1/3] Bluetooth: mt7921s: Support wake on bluetooth
Content-Language: en-US
To: Sean Wang <sean.wang@mediatek.com>, Marcel Holtmann
 <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: Mark-YW.Chen@mediatek.com, Soul.Huang@mediatek.com, YN.Chen@mediatek.com, 
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, 
 km.lin@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
 Eric.Liang@mediatek.com, Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
 steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
 jemele@google.com, abhishekpandit@google.com, michaelfsun@google.com,
 mcchou@chromium.org, shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <ceafc644ca9ce926a9fb07f7b3f4e2f701e69c8d.1640165092.git.sean.wang@kernel.org>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <ceafc644ca9ce926a9fb07f7b3f4e2f701e69c8d.1640165092.git.sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_011834_396094_A2C78328 
X-CRM114-Status: UNSURE (   6.47  )
X-CRM114-Notice: Please train this message.
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

RGVhciBTZWFuLAoKCkFtIDIzLjEyLjIxIHVtIDAzOjU2IHNjaHJpZWIgc2Vhbi53YW5nQG1lZGlh
dGVrLmNvbToKClvigKZdCgo+ICAgc3RhdGljIGludCBidG10a3NkaW9fcHJvYmUoc3RydWN0IHNk
aW9fZnVuYyAqZnVuYywKPiAgIAkJCSAgIGNvbnN0IHN0cnVjdCBzZGlvX2RldmljZV9pZCAqaWQp
Cj4gICB7Cj4gQEAgLTk5OCw2ICsxMDI0LDcgQEAgc3RhdGljIGludCBidG10a3NkaW9fcHJvYmUo
c3RydWN0IHNkaW9fZnVuYyAqZnVuYywKPiAgIAloZGV2LT5zaHV0ZG93biA9IGJ0bXRrc2Rpb19z
aHV0ZG93bjsKPiAgIAloZGV2LT5zZW5kICAgICA9IGJ0bXRrc2Rpb19zZW5kX2ZyYW1lOwo+ICAg
CWhkZXYtPnNldF9iZGFkZHIgPSBidG10a19zZXRfYmRhZGRyOwo+ICsJaGRldi0+d2FrZXVwID0g
YnRtdGtfc2Rpb193YWtldXA7CgpUaGUgZXF1YWwgc2lnbiBzdGlsbCBpcyBub3QgYWxpZ25lZCB3
aXRoIHRoZSBvbmUgb24gYGhkZXYtPnNlbmRgLgoKW+KApl0KCgpLaW5kIHJlZ2FyZHMsCgpQYXVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
