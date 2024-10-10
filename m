Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9B4CF11D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 12:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Mime-Version:References:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=gz2smKnkk2RNcrj6xuDZIDac9lwnTzKH5lj78bfhCoc=; b=B37RWOyPzOkvo0ctRtvbwIFvCr
	B9G7mHn3F01Nv07X1l8W+wt6gm340kMKy5s4rkYT18gC4P5ioHBcQZ16ZqyvTNzs+mwtW0DKYZ7xB
	9/E1P6dXoUqcYAphWNNooONQiXn8V8iwSMRgBnUE2XlbiTruy8eesMDJCiKeAJa4Zd8RGlnN1vqZu
	dQbHNKBj1R/SnIa0YSFfy86UObpJfypTI68P67QXC1BxRnD3Ds9xoSwSmJrW1RGIR4TjipV6JI8HK
	hkcM6dYkSq2tgd8w4aRKPCVU2r50/DDTbti9ZE2cAEvIlNYLd4KI2OMYcbObCXipLy2W7DK2cQLzm
	zmJnbaSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syrqy-0000000CdGJ-3hli;
	Thu, 10 Oct 2024 12:01:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syptE-0000000CJLJ-3f07;
	Thu, 10 Oct 2024 09:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:Mime-Version:References:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To;
	bh=gz2smKnkk2RNcrj6xuDZIDac9lwnTzKH5lj78bfhCoc=; b=dua1VCDGwLaHYVpjhkEZwc8NnZ
	6Lfx6MEfXsSr3I6/FMrWynpm+0YBBkbE/w9groc5kp1Mm/k6Och/WwVs3JDgg5O5OhZSENKS7l5hA
	mYCm3dYYo4sp59RmvZAyrwxsrBdP24dNSiV+Q0CKLNPN8uiWF2YivTlHTI4ECHhSidJBby0rsYxJb
	MD8WbZJ3Np4R9YMYmEpVQxbEQtiZ7lQu+o7UcjatMrdPwaAd+YS2ICUB5ioPHdhLl/ULPTNzozK3k
	//60GcyxYE4y6qHIcIA6hbAFloaoYwrEW6ym69JRkz1CWB79uEwXfaQXob/oHsfYzFy5SWoAQBIMO
	NiSETA0Q==;
Received: from cmccmta4.chinamobile.com ([111.22.67.137] helo=cmccmta1.chinamobile.com)
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sypt9-00000005KgH-0zp8;
	Thu, 10 Oct 2024 09:55:22 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46707a47c231-c8b30;
	Thu, 10 Oct 2024 17:55:10 +0800 (CST)
X-RM-TRANSID: 2ee46707a47c231-c8b30
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from Honor (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56707a47d9cd-49527;
	Thu, 10 Oct 2024 17:55:10 +0800 (CST)
X-RM-TRANSID: 2ee56707a47d9cd-49527
Date: Thu, 10 Oct 2024 17:55:09 +0800
From: =?utf-8?B?5ZSQ5b2s?= <tangbin@cmss.chinamobile.com>
To: broonie <broonie@kernel.org>
Cc: lgirdwood <lgirdwood@gmail.com>, 
	perex <perex@perex.cz>, 
	tiwai <tiwai@suse.com>, 
	matthias.bgg <matthias.bgg@gmail.com>, 
	angelogioacchino.delregno <angelogioacchino.delregno@collabora.com>, 
	linux-sound <linux-sound@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: Re: [PATCH 1/2] ASoC: mediatek: mt8188: Remove unnecessary variable assignments
References: <20241010073547.3720-1-tangbin@cmss.chinamobile.com>, 
	<ZwejOZQlSsWbAWBg@finisterre.sirena.org.uk>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.213[cn]
Mime-Version: 1.0
Message-ID: <202410101755089538782@cmss.chinamobile.com>
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_105520_082789_4E195538 
X-CRM114-Status: UNSURE (   5.80  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SSBhbSBzb3JyeSwgaXQncyBteSBtaXN0YWtlLiBJIGtub3cgdGhlIHJ1bGUsIGp1c3QgbWlzdGFr
ZS4KCgoKCgoKCkZyb206wqBNYXJrIEJyb3duCgoKCkRhdGU6wqAyMDI0LTEwLTEwwqAxNzo0OQoK
CgpUbzrCoFRhbmcgQmluCgoKCkNDOsKgbGdpcmR3b29kOyBwZXJleDsgdGl3YWk7IG1hdHRoaWFz
LmJnZzsgYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdubzsgbGludXgtc291bmQ7IGxpbnV4LWtlcm5l
bDsgbGludXgtYXJtLWtlcm5lbDsgbGludXgtbWVkaWF0ZWsKCgoKU3ViamVjdDrCoFJlOiBbUEFU
Q0ggMS8yXSBBU29DOiBtZWRpYXRlazogbXQ4MTg4OiBSZW1vdmUgdW5uZWNlc3NhcnkgdmFyaWFi
bGUgYXNzaWdubWVudHMKCgoKT24gVGh1LCBPY3QgMTAsIDIwMjQgYXQgMDM6MzU6NDdQTSArMDgw
MCwgVGFuZyBCaW4gd3JvdGU6CgoKCj4gSW4gdGhlIGZ1bmN0aW9uIG10a19kYWlfaGRtaXR4X2Rw
dHhfaHdfcGFyYW1zLCB0aGUgdmFyaWFibGUKCgoKPiAncmV0JyBpcyByZWR1bmRhbnQsIHRodXMg
cmVtb3ZlIGl0LgoKCgrCoAoKCgpQbGVhc2UgZG9uJ3Qgc2VuZCBwYXRjaCBzZXJpZXNlcyB3aXRo
b3V0IGNvdmVyIGxldHRlcnMsIGhhdmluZyBhIGNvdmVyCgoKCmxldHRlciBtYWtlcyBpdCBlYXNp
ZXIgdG8gdGVsbCB3aHkgdGhlIHNlcmllcyBpcyBhIHNlcmllcyBhbmQgbWFrZXMgaXQKCgoKZWFz
aWVyIGZvciB0b29saW5nIHRvIHdvcmsgd2l0aCB0aGUgc2VyaWVzLgoKCgo=




