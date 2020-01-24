Return-Path: <SRS0=meO2=3N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24E2C35244
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jan 2020 11:41:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6A8320678
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jan 2020 11:41:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cz7qXr/H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6A8320678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhOg8t/sjPLc+pc3ECzv83W8iPPpfYfqLTBa/m8TDY0=; b=Cz7qXr/HopQsng
	DiqHwjcy/MFT4P7WLLKkgUmwRsBcIJA0+wftFXOJBwDjxBilBJy3/rZq0RIhxr0qPJQ8E8t9Pop/Y
	LZ1lBG45dx97F1wto5UiY3JwMKGsB6Zy71vjLevZ6zx84Ms3UXF9bBoVHcucE+cICSbpF3uiWb/kd
	m5iSpKS78xpZGaTKheq7nhPhfIfJrb/+njy65egKaR2Nue9HSRZATB+l1LJzsSQW0OtvxQsF99iix
	ZuKk+7Z2WhZbKJ6RUf/uIm5xoEBmMr8kCsYo1VX6odjl5BTENy3XRuxNClVv23zYD7hkO3x+rHNUq
	Gmd0/WIOPumE3RgnDASg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuxKf-0004hi-4b; Fri, 24 Jan 2020 11:41:01 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuxKD-0004G3-A3; Fri, 24 Jan 2020 11:40:34 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 43407B149;
 Fri, 24 Jan 2020 11:40:30 +0000 (UTC)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org
Subject: [PATCH v2 1/3] cgroup: Iterate tasks that did not finish do_exit()
Date: Fri, 24 Jan 2020 12:40:15 +0100
Message-Id: <20200124114017.8363-2-mkoutny@suse.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200124114017.8363-1-mkoutny@suse.com>
References: <20200120145635.GA30904@blackbody.suse.cz>
 <20200124114017.8363-1-mkoutny@suse.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_034033_637862_A38D9173 
X-CRM114-Status: GOOD (  14.22  )
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
PgotLS0KIGluY2x1ZGUvbGludXgvY2dyb3VwLmggfCAgMSArCiBrZXJuZWwvY2dyb3VwL2Nncm91
cC5jIHwgMjMgKysrKysrKysrKysrKysrKy0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Nn
cm91cC5oIGIvaW5jbHVkZS9saW51eC9jZ3JvdXAuaAppbmRleCBkN2RkZWJkMGNkZWMuLmU3NWQy
MTkxMjI2YiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9jZ3JvdXAuaAorKysgYi9pbmNsdWRl
L2xpbnV4L2Nncm91cC5oCkBAIC02Miw2ICs2Miw3IEBAIHN0cnVjdCBjc3NfdGFza19pdGVyIHsK
IAlzdHJ1Y3QgbGlzdF9oZWFkCQkqbWdfdGFza3NfaGVhZDsKIAlzdHJ1Y3QgbGlzdF9oZWFkCQkq
ZHlpbmdfdGFza3NfaGVhZDsKIAorCXN0cnVjdCBsaXN0X2hlYWQJCSpjdXJfdGFza3NfaGVhZDsK
IAlzdHJ1Y3QgY3NzX3NldAkJCSpjdXJfY3NldDsKIAlzdHJ1Y3QgY3NzX3NldAkJCSpjdXJfZGNz
ZXQ7CiAJc3RydWN0IHRhc2tfc3RydWN0CQkqY3VyX3Rhc2s7CmRpZmYgLS1naXQgYS9rZXJuZWwv
Y2dyb3VwL2Nncm91cC5jIGIva2VybmVsL2Nncm91cC9jZ3JvdXAuYwppbmRleCA3MzVhZjhmMTVm
OTUuLmE2ZTM2MTllMDEzYiAxMDA2NDQKLS0tIGEva2VybmVsL2Nncm91cC9jZ3JvdXAuYworKysg
Yi9rZXJuZWwvY2dyb3VwL2Nncm91cC5jCkBAIC00NDA0LDEyICs0NDA0LDE2IEBAIHN0YXRpYyB2
b2lkIGNzc190YXNrX2l0ZXJfYWR2YW5jZV9jc3Nfc2V0KHN0cnVjdCBjc3NfdGFza19pdGVyICpp
dCkKIAkJfQogCX0gd2hpbGUgKCFjc3Nfc2V0X3BvcHVsYXRlZChjc2V0KSAmJiBsaXN0X2VtcHR5
KCZjc2V0LT5keWluZ190YXNrcykpOwogCi0JaWYgKCFsaXN0X2VtcHR5KCZjc2V0LT50YXNrcykp
CisJaWYgKCFsaXN0X2VtcHR5KCZjc2V0LT50YXNrcykpIHsKIAkJaXQtPnRhc2tfcG9zID0gY3Nl
dC0+dGFza3MubmV4dDsKLQllbHNlIGlmICghbGlzdF9lbXB0eSgmY3NldC0+bWdfdGFza3MpKQor
CQlpdC0+Y3VyX3Rhc2tzX2hlYWQgPSAmY3NldC0+dGFza3M7CisJfSBlbHNlIGlmICghbGlzdF9l
bXB0eSgmY3NldC0+bWdfdGFza3MpKSB7CiAJCWl0LT50YXNrX3BvcyA9IGNzZXQtPm1nX3Rhc2tz
Lm5leHQ7Ci0JZWxzZQorCQlpdC0+Y3VyX3Rhc2tzX2hlYWQgPSAmY3NldC0+bWdfdGFza3M7CisJ
fSBlbHNlIHsKIAkJaXQtPnRhc2tfcG9zID0gY3NldC0+ZHlpbmdfdGFza3MubmV4dDsKKwkJaXQt
PmN1cl90YXNrc19oZWFkID0gJmNzZXQtPmR5aW5nX3Rhc2tzOworCX0KIAogCWl0LT50YXNrc19o
ZWFkID0gJmNzZXQtPnRhc2tzOwogCWl0LT5tZ190YXNrc19oZWFkID0gJmNzZXQtPm1nX3Rhc2tz
OwpAQCAtNDQ2NywxMCArNDQ3MSwxNCBAQCBzdGF0aWMgdm9pZCBjc3NfdGFza19pdGVyX2FkdmFu
Y2Uoc3RydWN0IGNzc190YXNrX2l0ZXIgKml0KQogCQllbHNlCiAJCQlpdC0+dGFza19wb3MgPSBp
dC0+dGFza19wb3MtPm5leHQ7CiAKLQkJaWYgKGl0LT50YXNrX3BvcyA9PSBpdC0+dGFza3NfaGVh
ZCkKKwkJaWYgKGl0LT50YXNrX3BvcyA9PSBpdC0+dGFza3NfaGVhZCkgewogCQkJaXQtPnRhc2tf
cG9zID0gaXQtPm1nX3Rhc2tzX2hlYWQtPm5leHQ7Ci0JCWlmIChpdC0+dGFza19wb3MgPT0gaXQt
Pm1nX3Rhc2tzX2hlYWQpCisJCQlpdC0+Y3VyX3Rhc2tzX2hlYWQgPSBpdC0+bWdfdGFza3NfaGVh
ZDsKKwkJfQorCQlpZiAoaXQtPnRhc2tfcG9zID09IGl0LT5tZ190YXNrc19oZWFkKSB7CiAJCQlp
dC0+dGFza19wb3MgPSBpdC0+ZHlpbmdfdGFza3NfaGVhZC0+bmV4dDsKKwkJCWl0LT5jdXJfdGFz
a3NfaGVhZCA9IGl0LT5keWluZ190YXNrc19oZWFkOworCQl9CiAJCWlmIChpdC0+dGFza19wb3Mg
PT0gaXQtPmR5aW5nX3Rhc2tzX2hlYWQpCiAJCQljc3NfdGFza19pdGVyX2FkdmFuY2VfY3NzX3Nl
dChpdCk7CiAJfSBlbHNlIHsKQEAgLTQ0ODksMTEgKzQ0OTcsMTIgQEAgc3RhdGljIHZvaWQgY3Nz
X3Rhc2tfaXRlcl9hZHZhbmNlKHN0cnVjdCBjc3NfdGFza19pdGVyICppdCkKIAkJCWdvdG8gcmVw
ZWF0OwogCiAJCS8qIGFuZCBkeWluZyBsZWFkZXJzIHcvbyBsaXZlIG1lbWJlciB0aHJlYWRzICov
Ci0JCWlmICghYXRvbWljX3JlYWQoJnRhc2stPnNpZ25hbC0+bGl2ZSkpCisJCWlmIChpdC0+Y3Vy
X3Rhc2tzX2hlYWQgPT0gaXQtPmR5aW5nX3Rhc2tzX2hlYWQgJiYKKwkJICAgICFhdG9taWNfcmVh
ZCgmdGFzay0+c2lnbmFsLT5saXZlKSkKIAkJCWdvdG8gcmVwZWF0OwogCX0gZWxzZSB7CiAJCS8q
IHNraXAgYWxsIGR5aW5nIG9uZXMgKi8KLQkJaWYgKHRhc2stPmZsYWdzICYgUEZfRVhJVElORykK
KwkJaWYgKGl0LT5jdXJfdGFza3NfaGVhZCA9PSBpdC0+ZHlpbmdfdGFza3NfaGVhZCkKIAkJCWdv
dG8gcmVwZWF0OwogCX0KIH0KLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
