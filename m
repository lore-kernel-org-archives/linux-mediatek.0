Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2907CC33CB1
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 15:16:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92BB72064C
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 15:16:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WrIZFWgc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92BB72064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upfAqgJ9rWy1wb8njKCh+GbnX9YL3Bwu0867W1ntTQk=; b=WrIZFWgcAnrPgo
	B3M2XZiNBPyMZgKGGIOqAaxBZp9cE331JnYMO+vh4Z03PD5P5Cw8I8a073x7CJ9QMzTR90ks81bue
	PcDzPk6jIcc6Rtramjm/Gdu8Xhie25pW0Lu4hQyXWbjoIIB3r3T+YuEONt4VR+hBvqDF2krgGxo1P
	oa1m9fuRw6U5eA5skFMXwtbtIZgEfZHISNsuVPsQhz6pXpumMAyHje3KfrG9nqUcgYXykfwV72PvT
	VyfZ6b6d2jHZPqmBhoDzTnXAfsHX4oTtLFdcBUD3t7ZRobM84Lf+2zX1EBJ8A2aMpmzOGkcEmkmJx
	tklYDqHt8Txlotg67stw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isTLu-0000Ea-B9; Fri, 17 Jan 2020 15:16:02 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isTLf-0008VJ-3U; Fri, 17 Jan 2020 15:15:51 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C73C5AF41;
 Fri, 17 Jan 2020 15:15:45 +0000 (UTC)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org
Subject: [PATCH 2/3] cgroup: Iterate tasks that did not finish do_exit()
Date: Fri, 17 Jan 2020 16:15:32 +0100
Message-Id: <20200117151533.12381-3-mkoutny@suse.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117151533.12381-1-mkoutny@suse.com>
References: <20200116043612.52782-1-surenb@google.com>
 <20200117151533.12381-1-mkoutny@suse.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_071547_286293_C489E6AC 
X-CRM114-Status: GOOD (  12.81  )
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

UEZfRVhJVElORyBpcyBzZXQgZWFybGllciB0aGFuIGFjdHVhbCByZW1vdmFsIGZyb20gY3NzX3Nl
dCB3aGVuIGEgdGFzawppcyBleGl0dGluZy4gVGhpcyBjYW4gY29uZnVzZSBjZ3JvdXAucHJvY3Mg
cmVhZGVycyB3aG8gc2VlIG5vIFBGX0VYSVRJTkcKdGFza3MsIGhvd2V2ZXIsIHJtZGlyIGlzIGNo
ZWNraW5nIGFnYWluc3QgY3NzX3NldCBtZW1iZXJzaGlwIHNvIGl0IGNhbgp0cmFuc2l0aW9uYWxs
eSBmYWlsIHdpdGggRUJVU1kuCgpGaXggdGhpcyBieSBsaXN0aW5nIHRhc2tzIHRoYXQgd2VyZW4n
dCB1bmxpbmtlZCBmcm9tIGNzc19zZXQgYWN0aXZlCmxpc3RzLgpJdCBtYXkgaGFwcGVuIHRoYXQg
b3RoZXIgdXNlcnMgb2YgdGhlIHRhc2sgaXRlcmF0b3IgKHdpdGhvdXQKQ1NTX1RBU0tfSVRFUl9Q
Uk9DUykgc3BvdCBhIFBGX0VYSVRJTkcgdGFzayBiZWZvcmUgY2dyb3VwX2V4aXQoKS4gVGhpcwpp
cyBlcXVhbCB0byB0aGUgc3RhdGUgYmVmb3JlIGNvbW1pdCBjMDNjZDc3MzhhODMgKCJjZ3JvdXA6
IEluY2x1ZGUgZHlpbmcKbGVhZGVycyB3aXRoIGxpdmUgdGhyZWFkcyBpbiBQUk9DUyBpdGVyYXRp
b25zIikgYnV0IGl0IG1heSBiZSByZXZpZXdlZApsYXRlci4KClJlcG9ydGVkLWJ5OiBTdXJlbiBC
YWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgpGaXhlczogYzAzY2Q3NzM4YTgzICgiY2dy
b3VwOiBJbmNsdWRlIGR5aW5nIGxlYWRlcnMgd2l0aCBsaXZlIHRocmVhZHMgaW4gUFJPQ1MgaXRl
cmF0aW9ucyIpClNpZ25lZC1vZmYtYnk6IE1pY2hhbCBLb3V0bsO9IDxta291dG55QHN1c2UuY29t
PgotLS0KIGtlcm5lbC9jZ3JvdXAvY2dyb3VwLmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2tlcm5lbC9jZ3Jv
dXAvY2dyb3VwLmMgYi9rZXJuZWwvY2dyb3VwL2Nncm91cC5jCmluZGV4IGI1NjI4M2UxMzQ5MS4u
MTMyZDI1OGU3MTcyIDEwMDY0NAotLS0gYS9rZXJuZWwvY2dyb3VwL2Nncm91cC5jCisrKyBiL2tl
cm5lbC9jZ3JvdXAvY2dyb3VwLmMKQEAgLTQ0OTIsMTEgKzQ0OTIsMTIgQEAgc3RhdGljIHZvaWQg
Y3NzX3Rhc2tfaXRlcl9hZHZhbmNlKHN0cnVjdCBjc3NfdGFza19pdGVyICppdCkKIAkJCWdvdG8g
cmVwZWF0OwogCiAJCS8qIGFuZCBkeWluZyBsZWFkZXJzIHcvbyBsaXZlIG1lbWJlciB0aHJlYWRz
ICovCi0JCWlmICghYXRvbWljX3JlYWQoJnRhc2stPnNpZ25hbC0+bGl2ZSkpCisJCWlmIChpdC0+
Y3VyX2xpc3QgPT0gQ1NTX1NFVF9UQVNLU19EWUlORyAmJgorCQkgICAgIWF0b21pY19yZWFkKCZ0
YXNrLT5zaWduYWwtPmxpdmUpKQogCQkJZ290byByZXBlYXQ7CiAJfSBlbHNlIHsKIAkJLyogc2tp
cCBhbGwgZHlpbmcgb25lcyAqLwotCQlpZiAodGFzay0+ZmxhZ3MgJiBQRl9FWElUSU5HKQorCQlp
ZiAoaXQtPmN1cl9saXN0ID09IENTU19TRVRfVEFTS1NfRFlJTkcpCiAJCQlnb3RvIHJlcGVhdDsK
IAl9CiB9Ci0tIAoyLjI0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
