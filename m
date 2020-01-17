Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70A3C33CB1
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 15:17:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78BFE2064C
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 15:17:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cl0aLFmE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78BFE2064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0KqmcE1My3JYTOvOIgmO+XQOf5FGyaNduJYfPU7wLrs=; b=cl0aLFmEXRcvDA
	fanY0Np3eDg+64uVQaxxBQY29G7NLjDx1wjwkdS3MlfSt9/7vicIy/yInCGu39y2yCQ3RCV4KxQSR
	evz9zIfIAN1FcIWtSjVwZ33mF6N+xs9k0CgyrharJ7U+HNL7+pASpE/3Mw5DG1Ru8IFi2ibB1VBED
	xZSrTumj9zw/++3A7AxxdLwIrx2kcCZ7H7C/rPfcuag/3C4aNQh9Jl7/4H8lz7U3CKXuKzcMhOauc
	BT4feqgmhcpVsBKh56dh5HzZpDyQ6lAgywminez4ag8CK4tEixXePJeK0F8Iz9mkSoZs0i3JRAg17
	KjkQWk6iecV1RlOM5f6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isTMj-00014V-6F; Fri, 17 Jan 2020 15:16:53 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isTLg-0008Vz-BG; Fri, 17 Jan 2020 15:15:56 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 09FD5AF42;
 Fri, 17 Jan 2020 15:15:47 +0000 (UTC)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org
Subject: [PATCH 3/3] kselftest/cgroup: add cgroup destruction test
Date: Fri, 17 Jan 2020 16:15:33 +0100
Message-Id: <20200117151533.12381-4-mkoutny@suse.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117151533.12381-1-mkoutny@suse.com>
References: <20200116043612.52782-1-surenb@google.com>
 <20200117151533.12381-1-mkoutny@suse.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_071548_670075_B3F95D43 
X-CRM114-Status: GOOD (  14.83  )
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

RnJvbTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KCkFkZCBuZXcgdGVz
dCB0byB2ZXJpZnkgdGhhdCBhIGNncm91cCB3aXRoIGRlYWQgcHJvY2Vzc2VzIGNhbiBiZSBkZXN0
cm95ZWQuClRoZSB0ZXN0IHNwYXducyBhIGNoaWxkIHByb2Nlc3Mgd2hpY2ggYWxsb2NhdGVzIGFu
ZCB0b3VjaGVzIDEwME1CIG9mIFJBTQp0byBlbnN1cmUgcHJvbG9uZ2VkIGV4aXQuIFN1YnNlcXVl
bnRseSBpdCBraWxscyB0aGUgY2hpbGQsIHdhaXRzIHVudGlsCnRoZSBjZ3JvdXAgY29udGFpbmlu
ZyB0aGUgY2hpbGQgaXMgZW1wdHkgYW5kIGRlc3Ryb3lzIHRoZSBjZ3JvdXAuCgpTaWduZWQtb2Zm
LWJ5OiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5
OiBNaWNoYWwgS291dG7DvSA8bWtvdXRueUBzdXNlLmNvbT4KLS0tCiB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9jZ3JvdXAvdGVzdF9jb3JlLmMgfCAxMTMgKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMTEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9jZ3JvdXAvdGVzdF9jb3JlLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9jZ3JvdXAvdGVzdF9jb3JlLmMKaW5kZXggYzVjYTY2OWZlYjJiLi4yYTUyNDJlYzFhNDkgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Nncm91cC90ZXN0X2NvcmUuYworKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9jZ3JvdXAvdGVzdF9jb3JlLmMKQEAgLTIsNyArMiwx
MCBAQAogCiAjaW5jbHVkZSA8bGludXgvbGltaXRzLmg+CiAjaW5jbHVkZSA8c3lzL3R5cGVzLmg+
CisjaW5jbHVkZSA8c3lzL21tYW4uaD4KKyNpbmNsdWRlIDxzeXMvd2FpdC5oPgogI2luY2x1ZGUg
PHVuaXN0ZC5oPgorI2luY2x1ZGUgPGZjbnRsLmg+CiAjaW5jbHVkZSA8c3RkaW8uaD4KICNpbmNs
dWRlIDxlcnJuby5oPgogI2luY2x1ZGUgPHNpZ25hbC5oPgpAQCAtMTIsNiArMTUsMTE1IEBACiAj
aW5jbHVkZSAiLi4va3NlbGZ0ZXN0LmgiCiAjaW5jbHVkZSAiY2dyb3VwX3V0aWwuaCIKIAorc3Rh
dGljIGludCB0b3VjaF9hbm9uKGNoYXIgKmJ1Ziwgc2l6ZV90IHNpemUpCit7CisJaW50IGZkOwor
CWNoYXIgKnBvcyA9IGJ1ZjsKKworCWZkID0gb3BlbigiL2Rldi91cmFuZG9tIiwgT19SRE9OTFkp
OworCWlmIChmZCA8IDApCisJCXJldHVybiAtMTsKKworCXdoaWxlIChzaXplID4gMCkgeworCQlz
c2l6ZV90IHJldCA9IHJlYWQoZmQsIHBvcywgc2l6ZSk7CisKKwkJaWYgKHJldCA8IDApIHsKKwkJ
CWlmIChlcnJubyAhPSBFSU5UUikgeworCQkJCWNsb3NlKGZkKTsKKwkJCQlyZXR1cm4gLTE7CisJ
CQl9CisJCX0gZWxzZSB7CisJCQlwb3MgKz0gcmV0OworCQkJc2l6ZSAtPSByZXQ7CisJCX0KKwl9
CisJY2xvc2UoZmQpOworCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgYWxsb2NfYW5kX3Rv
dWNoX2Fub25fbm9leGl0KGNvbnN0IGNoYXIgKmNncm91cCwgdm9pZCAqYXJnKQoreworCWludCBw
cGlkID0gZ2V0cHBpZCgpOworCXNpemVfdCBzaXplID0gKHNpemVfdClhcmc7CisJdm9pZCAqYnVm
OworCisJYnVmID0gbW1hcChOVUxMLCBzaXplLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLCBNQVBf
UFJJVkFURSB8IE1BUF9BTk9OLAorCQkgICAwLCAwKTsKKwlpZiAoYnVmID09IE1BUF9GQUlMRUQp
CisJCXJldHVybiAtMTsKKworCWlmICh0b3VjaF9hbm9uKChjaGFyICopYnVmLCBzaXplKSkgewor
CQltdW5tYXAoYnVmLCBzaXplKTsKKwkJcmV0dXJuIC0xOworCX0KKworCXdoaWxlIChnZXRwcGlk
KCkgPT0gcHBpZCkKKwkJc2xlZXAoMSk7CisKKwltdW5tYXAoYnVmLCBzaXplKTsKKwlyZXR1cm4g
MDsKK30KKworLyoKKyAqIENyZWF0ZSBhIGNoaWxkIHByb2Nlc3MgdGhhdCBhbGxvY2F0ZXMgYW5k
IHRvdWNoZXMgMTAwTUIsIHRoZW4gd2FpdHMgdG8gYmUKKyAqIGtpbGxlZC4gV2FpdCB1bnRpbCB0
aGUgY2hpbGQgaXMgYXR0YWNoZWQgdG8gdGhlIGNncm91cCwga2lsbCBhbGwgcHJvY2Vzc2VzCisg
KiBpbiB0aGF0IGNncm91cCBhbmQgd2FpdCB1bnRpbCAiY2dyb3VwLmV2ZW50cyIgaXMgZW1wdHku
IEF0IHRoaXMgcG9pbnQgdHJ5IHRvCisgKiBkZXN0cm95IHRoZSBlbXB0eSBjZ3JvdXAuIFRoZSB0
ZXN0IGhlbHBzIGRldGVjdCByYWNlIGNvbmRpdGlvbnMgYmV0d2VlbgorICogZHlpbmcgcHJvY2Vz
c2VzIGxlYXZpbmcgdGhlIGNncm91cCBhbmQgY2dyb3VwIGRlc3RydWN0aW9uIHBhdGguCisgKi8K
K3N0YXRpYyBpbnQgdGVzdF9jZ2NvcmVfZGVzdHJveShjb25zdCBjaGFyICpyb290KQoreworCWlu
dCByZXQgPSBLU0ZUX0ZBSUw7CisJY2hhciAqY2dfdGVzdCA9IE5VTEw7CisJaW50IGNoaWxkX3Bp
ZDsKKwljaGFyIGJ1ZltQQUdFX1NJWkVdOworCisJY2dfdGVzdCA9IGNnX25hbWUocm9vdCwgImNn
X3Rlc3QiKTsKKworCWlmICghY2dfdGVzdCkKKwkJZ290byBjbGVhbnVwOworCisJZm9yIChpbnQg
aSA9IDA7IGkgPCAxMDsgaSsrKSB7CisJCWlmIChjZ19jcmVhdGUoY2dfdGVzdCkpCisJCQlnb3Rv
IGNsZWFudXA7CisKKwkJY2hpbGRfcGlkID0gY2dfcnVuX25vd2FpdChjZ190ZXN0LCBhbGxvY19h
bmRfdG91Y2hfYW5vbl9ub2V4aXQsCisJCQkJCSAgKHZvaWQgKikgTUIoMTAwKSk7CisKKwkJaWYg
KGNoaWxkX3BpZCA8IDApCisJCQlnb3RvIGNsZWFudXA7CisKKwkJLyogd2FpdCBmb3IgdGhlIGNo
aWxkIHRvIGVudGVyIGNncm91cCAqLworCQlpZiAoY2dfd2FpdF9mb3JfcHJvY19jb3VudChjZ190
ZXN0LCAxKSkKKwkJCWdvdG8gY2xlYW51cDsKKworCQlpZiAoY2dfa2lsbGFsbChjZ190ZXN0KSkK
KwkJCWdvdG8gY2xlYW51cDsKKworCQkvKiB3YWl0IGZvciBjZ3JvdXAgdG8gYmUgZW1wdHkgKi8K
KwkJd2hpbGUgKDEpIHsKKwkJCWlmIChjZ19yZWFkKGNnX3Rlc3QsICJjZ3JvdXAucHJvY3MiLCBi
dWYsIHNpemVvZihidWYpKSkKKwkJCQlnb3RvIGNsZWFudXA7CisJCQlpZiAoYnVmWzBdID09ICdc
MCcpCisJCQkJYnJlYWs7CisJCQl1c2xlZXAoMTAwMCk7CisJCX0KKworCQlpZiAocm1kaXIoY2df
dGVzdCkpCisJCQlnb3RvIGNsZWFudXA7CisKKwkJaWYgKHdhaXRwaWQoY2hpbGRfcGlkLCBOVUxM
LCAwKSA8IDApCisJCQlnb3RvIGNsZWFudXA7CisJfQorCXJldCA9IEtTRlRfUEFTUzsKK2NsZWFu
dXA6CisJaWYgKGNnX3Rlc3QpCisJCWNnX2Rlc3Ryb3koY2dfdGVzdCk7CisJZnJlZShjZ190ZXN0
KTsKKwlyZXR1cm4gcmV0OworfQorCiAvKgogICogQSgwKSAtIEIoMCkgLSBDKDEpCiAgKiAgICAg
ICAgXCBEKDApCkBAIC01MTIsNiArNjI0LDcgQEAgc3RydWN0IGNvcmVjZ190ZXN0IHsKIAlUKHRl
c3RfY2djb3JlX3BvcHVsYXRlZCksCiAJVCh0ZXN0X2NnY29yZV9wcm9jX21pZ3JhdGlvbiksCiAJ
VCh0ZXN0X2NnY29yZV90aHJlYWRfbWlncmF0aW9uKSwKKwlUKHRlc3RfY2djb3JlX2Rlc3Ryb3kp
LAogfTsKICN1bmRlZiBUCiAKLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
