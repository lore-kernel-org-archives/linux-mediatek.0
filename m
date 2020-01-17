Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58299C33CB1
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 15:16:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B7002064C
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 15:16:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FFkoKSqH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B7002064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OFcsjW0QFRAz9PWp4lVFdzWA5PM9wb2NFx0PgskDy8I=; b=FFkoKSqHdvhELf
	cHvKL0Ru+y6Dl3SSPBbtnb8Ls6M90YLlbFgW78eT5ELLsrVB1DZkUsxRYzna3fWfmC7XlcInrwycH
	ZDg3nKldyIjtVWb7oM3VehtsiuGZFiDyKQrFm2ez/5mUEH8TcVx7U/xGj/nI6Nz3vybcAphd5bJM9
	Ft6UweTJVr/0hC5VKpg/XA5KWtBaBFAjrn+hahlIJuplUKk2ehVJYzphIIkDRcGsfEyiy2wagGXVL
	NWCprqU1VmiOpe71IzpLgwOEz1EfKmzTg64P84PFwjGZ4T+wGx0uc6MvwXGOCF6kgWDQqZf4zaZjn
	Ws4KhIwPV0ImKA77BZHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isTMF-0000XF-OI; Fri, 17 Jan 2020 15:16:23 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isTLe-0008V9-CD; Fri, 17 Jan 2020 15:15:52 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 899D9AE2C;
 Fri, 17 Jan 2020 15:15:42 +0000 (UTC)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org
Subject: [PATCH 0/3] cgroup: Iterate tasks that did not finish do_exit()
Date: Fri, 17 Jan 2020 16:15:30 +0100
Message-Id: <20200117151533.12381-1-mkoutny@suse.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200116043612.52782-1-surenb@google.com>
References: <20200116043612.52782-1-surenb@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_071546_561254_56CB38A8 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
Cc: linger.lee@mediatek.com, tomcherry@google.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 Li Zefan <lizefan@huawei.com>, linux-mediatek@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, alex.shi@linux.alibaba.com, kernel-team@android.com,
 guro@fb.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksCkkgd2FzIGxvb2tpbmcgaW50byB0aGUgaXNzdWUgYW5kIGNhbWUgdXAgd2l0aCBhbiBhbHRl
cm5hdGl2ZSBzb2x1dGlvbiB0aGF0CmNoYW5nZXMgdGFzayBpdGVyYXRpb24gdG8gYmUgY29uc2lz
dGVudCB3aXRoIGNncm91cF9pc19wb3B1bGF0ZWQoKSBjaGVjayBhbmQKbW92aW5nIHRoZSByZXNw
b25zaWJpbGl0eSB0byBjaGVjayBQRl9FWElUSU5HIG9uIHRoZSBjb25zdW1lcnMgb2YgaXRlcmF0
b3IgQVBJLgoKSSBoYXZlbid0IGNoZWNrIHlvdXIgYXBwcm9hY2ggdGhvcm91Z2hseSwgaG93ZXZl
ciwgaXQgYXBwZWFycyB0byBtZSBpdApjb21wbGljYXRlcyAoYWxyZWFkeSBub24tdHJpdmlhbCkg
Y2dyb3VwIGRlc3RydWN0aW9uIHBhdGguIEkgcmFuIHlvdXIgc2VsZnRlc3QKb24gdGhlIGl0ZXJh
dG9ycyBhcHByb2FjaCBhbmQgaXQgcHJvdmVkIHdvcmtpbmcuCgpNaWNoYWwgS291dG7DvSAoMik6
CiAgY2dyb3VwOiBVbmlmeSBjc3Nfc2V0IHRhc2sgbGlzdHMKICBjZ3JvdXA6IEl0ZXJhdGUgdGFz
a3MgdGhhdCBkaWQgbm90IGZpbmlzaCBkb19leGl0KCkKClN1cmVuIEJhZ2hkYXNhcnlhbiAoMSk6
CiAga3NlbGZ0ZXN0L2Nncm91cDogYWRkIGNncm91cCBkZXN0cnVjdGlvbiB0ZXN0CgogaW5jbHVk
ZS9saW51eC9jZ3JvdXAtZGVmcy5oICAgICAgICAgICAgICAgIHwgIDE1ICsrLQogaW5jbHVkZS9s
aW51eC9jZ3JvdXAuaCAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstCiBrZXJuZWwvY2dyb3Vw
L2Nncm91cC5jICAgICAgICAgICAgICAgICAgICAgfCAgODYgKysrKysrKystLS0tLS0tLQoga2Vy
bmVsL2Nncm91cC9kZWJ1Zy5jICAgICAgICAgICAgICAgICAgICAgIHwgIDE2ICsrLQogdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvY2dyb3VwL3Rlc3RfY29yZS5jIHwgMTEzICsrKysrKysrKysrKysr
KysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAxNzYgaW5zZXJ0aW9ucygrKSwgNTggZGVsZXRpb25z
KC0pCgotLSAKMi4yNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
