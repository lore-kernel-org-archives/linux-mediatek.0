Return-Path: <SRS0=meO2=3N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DF9C32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jan 2020 11:41:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 221EF20678
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jan 2020 11:41:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FjNHBH1g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 221EF20678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdJKZnRWDQPo7lFnwjcHf8IFcmQz1PW1AKr6CMcG5yM=; b=FjNHBH1gVHgrBh
	Nn8XAtW7qt0PHumPryNIikitsiodqOcQh5+xvHyLrSJlAZb8otFNRP8VJn9VWE57bvxC0Lvwbr303
	BnnrrHVuZtTea+qMfjpTT+wrfZBMkQRUOFC6B1D7ckl7vo+1hpTOU7PnwJWw2t9ssByPSheZ07dhh
	BkWMYjZQjEG16BZR5d5GBTgyZwiQPt/Zq9+hJczcPcNrHulIV+y+RqWOvMiORWUq//1h3wGBNi5YV
	PUnkDu86qqZXisSMWzojiy39H7YnjCQ3KsLDFHZLviCsJsUbSEOwKmcOnlUUJf6hIVKNLKcV1Hnc1
	crrQ55axVVAQc7r2jCAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuxKi-0004ld-Fv; Fri, 24 Jan 2020 11:41:04 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuxKD-0004Fg-A3; Fri, 24 Jan 2020 11:40:34 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 75869ACB1;
 Fri, 24 Jan 2020 11:40:29 +0000 (UTC)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org
Subject: [PATCH v2 0/3] cgroup: Iterate tasks that did not finish do_exit()
Date: Fri, 24 Jan 2020 12:40:14 +0100
Message-Id: <20200124114017.8363-1-mkoutny@suse.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200120145635.GA30904@blackbody.suse.cz>
References: <20200120145635.GA30904@blackbody.suse.cz>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_034033_492975_E5599820 
X-CRM114-Status: UNSURE (   9.65  )
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
 linux-kernel@vger.kernel.org, surenb@google.com, tj@kernel.org,
 lizefan@huawei.com, linux-mediatek@lists.infradead.org,
 linux-kselftest@vger.kernel.org, hannes@cmpxchg.org, matthias.bgg@gmail.com,
 alex.shi@linux.alibaba.com, kernel-team@android.com, guro@fb.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksCnRoYW5rcyBmb3IgeW91ciBmZWVkYmFjay4gSSdtIHNlbmRpbmcgdXBkYXRlZCBzb2x1dGlv
biB0aGF0IGNoYW5nZXMgdGFzawppdGVyYXRpb24gdG8gYmUgY29uc2lzdGVudCB3aXRoIGNncm91
cF9pc19wb3B1bGF0ZWQoKSBjaGVjayBhbmQgbW92aW5nIHRoZQpyZXNwb25zaWJpbGl0eSB0byBj
aGVjayBQRl9FWElUSU5HIG9uIHRoZSBjb25zdW1lcnMgb2YgaXRlcmF0b3IgQVBJLgoKQ2hhbmdl
cyBmcm9tIHYxCi0gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDAxMTcxNTE1
MzMuMTIzODEtMS1ta291dG55QHN1c2UuY29tLwotIFN3YXAgdGhlIGZpeGluZyBhbmQgcmVmYWN0
b3JpbmcgcGF0Y2ggKGluIG9yZGVyIHRvIG1ha2UgdGhlIGZpeCBlYXNpZXIgZm9yCiAgYmFja3Bv
cnQpCi0gRG9uJ3QgaW50cm9kdWNlIHRhc2tzIGxpc3RzIGFycmF5IGJlY2F1c2Ugb2YgdW5uZWNl
c3NhcmlseSBsb25nIGFjY2VzcyBjb2RlCi0gRml4IGNvbW1lbnQgaW4gc2VsZnRlc3QKLSBJIGxl
YXZlIHRoZSBDQzpzdGFibGUgb24gZGlzY3JldGlvbiBvZiB0aGUgbWFpbnRhaW5lcgoKTWljaGFs
IEtvdXRuw70gKDIpOgogIGNncm91cDogSXRlcmF0ZSB0YXNrcyB0aGF0IGRpZCBub3QgZmluaXNo
IGRvX2V4aXQoKQogIGNncm91cDogQ2xlYW4gdXAgY3NzX3NldCB0YXNrIHRyYXZlcnNhbAoKU3Vy
ZW4gQmFnaGRhc2FyeWFuICgxKToKICBrc2VsZnRlc3QvY2dyb3VwOiBhZGQgY2dyb3VwIGRlc3Ry
dWN0aW9uIHRlc3QKCiBpbmNsdWRlL2xpbnV4L2Nncm91cC5oICAgICAgICAgICAgICAgICAgICAg
fCAgIDQgKy0KIGtlcm5lbC9jZ3JvdXAvY2dyb3VwLmMgICAgICAgICAgICAgICAgICAgICB8ICA2
MCArKysrKystLS0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvY2dyb3VwL3Rlc3RfY29yZS5j
IHwgMTEzICsrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxNDYgaW5zZXJ0
aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCgotLSAKMi4yNC4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
