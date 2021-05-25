Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC612C4707F
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 13:00:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 102EF61423
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 13:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 102EF61423
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBSPqzVwjuAVspVU5gU+4qmTHGTHYKNJur+ZDH2f4Ik=; b=15ix0AjEHHkZnG
	SgfdZ+MkrmjzYLF6tge/EFixeQ07wiryY786Fsvzsyu4XNu5+4UG2JIc4IKSD6PG8T5PkqAVpSckQ
	x55qAZmJiT1pY9Fi6gTe3Oz8KTry1jFqtIuxWbK5gXGBKsqTLx1Tnbugji3v2Ot7yTnnb4ZnM5i5x
	jUILcTtmPaQl8yVYvPLL2Tm89JjJoYin169GKqMyyPDoQ3jaUhn9Pcb952N38byNdVJCLjJP/CXuC
	kKIpiVBi93D9CCILVj2sIDl1tuFaGqGNWOPIoeig4dt2u/JmQ/cXIbMy615+U8ybvcZHLhYMHW9cN
	P86YJUVMY3Gmp8ffgXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llWfG-005BZP-Q5; Tue, 25 May 2021 13:00:06 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llWfE-005BX5-4t
 for linux-mediatek@lists.infradead.org; Tue, 25 May 2021 13:00:05 +0000
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1llWey-00EOir-E1; Tue, 25 May 2021 14:59:48 +0200
Message-ID: <f1a1d5da376d0ec187079d1277d3628328fdd81c.camel@sipsolutions.net>
Subject: Re: [RFC PATCH 1/4] mac80211: call ieee80211_tx_h_rate_ctrl() when
 dequeue
From: Johannes Berg <johannes@sipsolutions.net>
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao
 <bo.jiao@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>, 
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Tue, 25 May 2021 14:59:46 +0200
In-Reply-To: <a959135d3fe21118f38c33fc9ffb18124c1ef7ce.1621453091.git.ryder.lee@mediatek.com>
 (sfid-20210519_215633_470280_525C572D)
References: <a959135d3fe21118f38c33fc9ffb18124c1ef7ce.1621453091.git.ryder.lee@mediatek.com>
 (sfid-20210519_215633_470280_525C572D)
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_060004_218729_13A64E09 
X-CRM114-Status: UNSURE (   7.32  )
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

T24gVGh1LCAyMDIxLTA1LTIwIGF0IDAzOjU2ICswODAwLCBSeWRlciBMZWUgd3JvdGU6Cj4gCj4g
K3N0YXRpYyBpZWVlODAyMTFfdHhfcmVzdWx0Cj4gK2llZWU4MDIxMV94bWl0X2Zhc3RfZmluaXNo
KHN0cnVjdCBpZWVlODAyMTFfc3ViX2lmX2RhdGEgKnNkYXRhLAo+ICsJCQkgICBzdHJ1Y3Qgc3Rh
X2luZm8gKnN0YSwgdTggcG5fb2ZmcywKPiArCQkJICAgc3RydWN0IGllZWU4MDIxMV9rZXkgKmtl
eSwKPiArCQkJICAgc3RydWN0IGllZWU4MDIxMV90eF9kYXRhICp0eCkKPiDCoHsKPiArCXN0cnVj
dCBza19idWZmICpza2IgPSB0eC0+c2tiOwo+IMKgCXN0cnVjdCBpZWVlODAyMTFfdHhfaW5mbyAq
aW5mbyA9IElFRUU4MDIxMV9TS0JfQ0Ioc2tiKTsKPiDCoAlzdHJ1Y3QgaWVlZTgwMjExX2hkciAq
aGRyID0gKHZvaWQgKilza2ItPmRhdGE7Cj4gwqAJdTggdGlkID0gSUVFRTgwMjExX05VTV9USURT
Owo+IMKgCj4gCj4gCj4gCj4gKwlpZiAoIWllZWU4MDIxMV9od19jaGVjaygmdHgtPmxvY2FsLT5o
dywgSEFTX1JBVEVfQ09OVFJPTCkpCj4gKwkJaWYgKGllZWU4MDIxMV90eF9oX3JhdGVfY3RybCh0
eCkgIT0gVFhfQ09OVElOVUUpCj4gKwkJCXJldHVybiBUWF9EUk9QOwoKUHJvYmFibHkgbmljZXIg
dG8gcm9sbCB0aGF0IGludG8gb25lIGNvbmRpdGlvbjoKCmlmICghLi4uKCkgJiYKICAgIC4uLl9y
YXRlX2N0cmwodHgpICE9IC4uLikKCXJldHVybiBUWF9EUk9QOwoKCmpvaGFubmVzCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
