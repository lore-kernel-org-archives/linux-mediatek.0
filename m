Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF21C07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 07:32:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B03C613AA
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 07:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B03C613AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFIjE4GzreUQQSjzCwebzous0YLuixv3sJpUWDXOH3Q=; b=VR/Q3TBsDItIKF
	7jVz8o8cKQvThlG4yKwOruxzRVFNck7dy67ifDp7IqjVofyy6vecntMKJ/aOshIjeKFLHsOHurlrf
	DHxvg/WMQEhVqHIK1TNMjZs33T1NiZ8qEteXvxwjCfMDjG3QAKJtNakydYcIibccvxvE5vg/ZXRZ+
	MwwD5huPLMuYvNxKDTNbzDZQ/AcV4tgo85ijrJTtRfMya3mekeQDS308ZpiLeBgsJtyGvGkx/bK7H
	u9qaEj1fzqscsUzpjxJF3j7XPQw/nkQYXLlfvkr8vY21ww7e9PBLQvJBVSjkIg4pW5NUsPve4BYIQ
	77nnEj+6/jhJ4aUJJPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3ZN2-00CWay-NY; Wed, 14 Jul 2021 07:31:52 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ZN0-00CWaI-3J
 for linux-mediatek@lists.infradead.org; Wed, 14 Jul 2021 07:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=RG1iCBaT6E1VgpQV+JwxWmlLZlmtPr/DHuj0X5NRrws=; 
 t=1626247909; x=1627457509; b=NWRpyCtsJ95VAGE7ZJ5IKRq4NOc4ValGFCbhK0d9rnLN2Ab
 uHfl+0zNCH9onlD+z/GF+sNo7dj0sJWw43AEa/beljjiqpkKVpt8Iv1uYhZTJKPuhRIhHnB4qi2z2
 jfv6RWmiHTaeGoE48r0qt5js8C7CByYD/WTNPBY+HZuWMo8rELIjYB6tQTRHuB/aBLkBUO5LPyQih
 dtHvqMotpDnpg5IxaPD6e3qUPy3LoDtN0lJvoXIERWVg04ad4KM8zWIj1BkzdciZrNeiaPDz9yUMs
 YxavjSq72LYoGkbYZsjeHZWYTIsGwZ493WIEV0KB7X9X6JWDQqaCRA5ZiGK0Pdjg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1m3ZMo-0025w2-Pe; Wed, 14 Jul 2021 09:31:38 +0200
Message-ID: <59ca83f01601a47bf3cfaf38e85570b8a3c5c72a.camel@sipsolutions.net>
Subject: Re: [PATCH 1/3] mt76 mt7915: take RCU read lock when calling
 ieee80211_bss_get_elem()
From: Johannes Berg <johannes@sipsolutions.net>
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, 
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Wed, 14 Jul 2021 09:31:37 +0200
In-Reply-To: <510ef14986079c731ea2879b3095831b60e4f648.1626240767.git.ryder.lee@mediatek.com>
References: <510ef14986079c731ea2879b3095831b60e4f648.1626240767.git.ryder.lee@mediatek.com>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_003150_182571_F55061D5 
X-CRM114-Status: UNSURE (   6.21  )
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

T24gV2VkLCAyMDIxLTA3LTE0IGF0IDEzOjM2ICswODAwLCBSeWRlciBMZWUgd3JvdGU6Cj4gCj4g
wqAJaWYgKCFlbGVtIHx8IGVsZW0tPmRhdGFsZW4gPCAxMCB8fAo+IMKgCSAgICAhKGVsZW0tPmRh
dGFbMTBdICYKPiDCoAkgICAgICBXTEFOX0VYVF9DQVBBMTBfT0JTU19OQVJST1dfQldfUlVfVE9M
RVJBTkNFX1NVUFBPUlQpKQo+IMKgCQlkYXRhLT50b2xlcmF0ZWQgPSBmYWxzZTsKClVucmVsYXRl
ZCB0byB0aGlzIHBhdGNoLCBidXQgdGhhdCBsb29rcyBsaWtlIGFuIG9mZi1ieS1vbmU/CgpJZiBk
YXRhbGVuID09IDEwLCB0aGVuIHlvdSBjYW4gb25seSBhY2Nlc3MgZGF0YVswXSB0aHJvdWdoIGRh
dGFbOV0sIG5vdApkYXRhWzEwXT8KCmpvaGFubmVzCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
