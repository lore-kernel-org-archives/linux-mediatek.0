Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D5FC2B9F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 13:01:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B368361420
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 13:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B368361420
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ddmSSdJQ02oJRdktXPh3CoBl1tG/Y5256W5pDLZK9U=; b=evAHlMd70xnG2y
	5dB6+D8Zs5HN3YVCHFchzCxmA71fVxP7SCQ2YcLBJO9Ixeo/Tmsp0VQWJmw+9BUAWN5mruo5f4XWc
	gg8ERL2nVW0awkEFEfcm5AVUwIeJdyj50ESsDk7JWj3j7XyzyP9VimDe7tamKKIIs1RsiiFmgrsZI
	QZaV6djj6Wiqe8q+Dl5lf0iFfWb4T6O3sgGdV2yXaC/Hjep1YktbKYJ39H07WDOQUEfATnOArRPeb
	y2jzT2cgEdrIPwP8Y0SLl1uVLl5KUd9tDAYDHQ+jG7GrUwB9AgP9erH/k5InTltY4kp9BDdMJoTki
	AUk5wM/Q+fZDn/8Gs+jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llWg1-005Bt0-QW; Tue, 25 May 2021 13:00:53 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llWfx-005Bqy-KY
 for linux-mediatek@lists.infradead.org; Tue, 25 May 2021 13:00:52 +0000
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1llWfo-00EOlC-PS; Tue, 25 May 2021 15:00:40 +0200
Message-ID: <47f9c5c2a9c5fd666751e01799a9a167d8776a49.camel@sipsolutions.net>
Subject: Re: [RFC PATCH 2/4] mac80211: minstrel_ht: fix minstrel_aggr_check
 for encap offload
From: Johannes Berg <johannes@sipsolutions.net>
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao
 <bo.jiao@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>, 
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Tue, 25 May 2021 15:00:39 +0200
In-Reply-To: <4e50d38c98c407825c6897a034fee3ba6366b0ad.1621453091.git.ryder.lee@mediatek.com>
 (sfid-20210519_215642_904470_7AA3F138)
References: <a959135d3fe21118f38c33fc9ffb18124c1ef7ce.1621453091.git.ryder.lee@mediatek.com>
 <4e50d38c98c407825c6897a034fee3ba6366b0ad.1621453091.git.ryder.lee@mediatek.com>
 (sfid-20210519_215642_904470_7AA3F138)
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_060049_711787_8D5C577A 
X-CRM114-Status: UNSURE (   5.67  )
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
KwlpZiAoIShpbmZvLT5mbGFncyAmIElFRUU4MDIxMV9UWF9DVExfSFdfODAyMTFfRU5DQVApICYm
Cj4gKwkgICAgdW5saWtlbHkoIWllZWU4MDIxMV9pc19kYXRhX3FvcyhoZHItPmZyYW1lX2NvbnRy
b2wpKSkKPiDCoAkJcmV0dXJuOwoKVGhhdCB1bmxpa2VseSgpIHBsYWNlbWVudCBzZWVtcyBvZGQ/
Cgpqb2hhbm5lcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
