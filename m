Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E389C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 10:15:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE9F2610A4
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 10:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE9F2610A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Il1YzffiGvb1g5r3Lo3bqSYWkfTQFyh6YugX7xTnaCE=; b=vUy/oZg+1iA5srbXf9QYlcYptp
	fqZ+CRy7jCER6r2j1bwc2fzDdTqvk4wPC8MfNNgDvZLGhwBh9o8/59+9JFCSNKPFHGy0gINkdiq2F
	014nHL49Kx9PSDALiXuoH/9z6aZjn/vVWzxOmkfwR2l1XPBj+zex+QkVUwtoOxr/e0RROONL/pyGG
	0c6fBgL3fZP6rEou2DH0R3YGBvb50YAvEFII/BSrxacvbsodYGmzhUEJQ3Tq/kNf4G4WfPHV80rIN
	8wQOYi6hJlWAGUbe48x3LJNiWCVxnfn7EbsPQsCixfTTO+pAA1nGiTxVHmbPmQ/TAmnYmRLioZo98
	rYCrumnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEUDd-00CQZ7-NR; Fri, 13 Aug 2021 10:15:17 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEUDY-00CQY2-4e
 for linux-mediatek@lists.infradead.org; Fri, 13 Aug 2021 10:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EwBDn+MmZXsf2retNthI5UkmLCBolXZWJ/auLbis7XI=; b=emVUoEH4fQBscl4npECKzQRThY
 N1Qrb5YdQWpvAL8IUDrYISnYxdL66bqVXsao4YjlNp1GsTmRL0bt6xCneVmdwr2VNm1z7HhceG806
 igwYVsocgJ8It/V9QYrPUidnYug2eDAQ8vtJDMf9okWJJu2XgH59vWPfOTvDw2aZFPjU=;
Received: from p4ff13206.dip0.t-ipconnect.de ([79.241.50.6] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mEUDN-00069Y-EJ; Fri, 13 Aug 2021 12:15:01 +0200
Subject: Re: [PATCH v4 1/2] mt76: mt7915: fix hwmon temp sensor mem
 use-after-free
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Ben Greear <greearb@candelatech.com>
References: <9f5b0cf6c4296d3a9e78a95516cf26d1db4baba9.1627696765.git.ryder.lee@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <04c61f83-e4ce-536f-7030-9050d8edfe78@nbd.name>
Date: Fri, 13 Aug 2021 12:15:00 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9f5b0cf6c4296d3a9e78a95516cf26d1db4baba9.1627696765.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_031512_432062_650C7530 
X-CRM114-Status: UNSURE (   9.15  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjEtMDctMzEgMDQ6MTcsIFJ5ZGVyIExlZSB3cm90ZToKPiBGcm9tOiBCZW4gR3JlZWFy
IDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4KPiAKPiBXaXRob3V0IHRoaXMgY2hhbmdlLCBnYXJi
YWdlIGlzIHNlZW4gaW4gdGhlIGh3bW9uIG5hbWUKPiBhbmQgc2Vuc29ycyBvdXRwdXQgZm9yIG10
NzkxNSBpcyBnYXJibGVkLgpXaGVyZSBkb2VzIHRoZSB1c2UtYWZ0ZXItZnJlZSBidWcgY29tZSBm
cm9tPyBJdCdzIG5vdCBvYnZpb3VzIHRvIG1lIHdoeQp1c2luZyBLQlVJTERfTU9ETkFNRSBpbnN0
ZWFkIG9mIHdpcGh5X25hbWUoKSBmaXhlcyBpdC4KSSBzdGlsbCB0aGluayB0aGUgcGh5IG5hbWUg
c2hvdWxkIHByb2JhYmx5IGJlIHBhcnQgb2YgdGhlIHByZWZpeC4KCj4gV2l0aCB0aGUgY2hhbmdl
Ogo+IAo+IG10NzkxNS1wY2ktMTQwMAo+IEFkYXB0ZXI6IFBDSSBhZGFwdGVyCj4gdGVtcDE6ICAg
ICAgICArNDkuMMKwQwo+IAo+IEZpeGVzOiBkNjkzODI1MWJiNWIgKG10NzY6IG10NzkxNTogYWRk
IHRoZXJtYWwgc2Vuc29yIGRldmljZSBzdXBwb3J0KQpUaGUgZm9ybWF0IGlzIHdyb25nIChtaXNz
aW5nIHF1b3RlcyksIGFuZCB0aGUgaGFzaCByZWZlcmVuY2VzIGEgY29tbWl0CnRoYXQncyBub3Qg
aW4gYW55IHVwc3RyZWFtIHRyZWUuCgotIEZlbGl4CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
