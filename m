Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD7DC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:44:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0ECC2074F
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lva+qyiI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpUncPWG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0ECC2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kMSPjZJ9Yt7bXU4p03IQT8TdLJAqqOBr/rFBL4M+5cc=; b=Lva+qyiIDGTzH3UN54dZEx1Ye
	cMWQrfj2Ld0iaKmiV03CFBdBgUp40uHeh3bgJBLabgokzb1fzmqNjuYipKT7napM4fjsPHwimy4Fz
	qkrtR60BDq1kD/dP6Pop3K/t5wLMfpzgAHi7pJ9qyoiDCY/kdUM69ooaPuhG5u0TCqfvemG+H1/9G
	7oMdpDD7L7lpkyWGXQscd3kyzQXSX0aM7AqyQ8IDUWDmvFWiTYR3CCYTnY978ooSFDTI+L9Httcw7
	k/rrApWDbmagrCAqgQGZsMfDxRLhacm/SxIZ2h3T/9h1bu2npvrM7e5IdL49MZInDOEWZTQDXhQr/
	EGXt540hQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysMy-00038N-8e; Fri, 24 Jul 2020 07:43:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysKc-0001uS-8s; Fri, 24 Jul 2020 07:41:28 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E8BD20771;
 Fri, 24 Jul 2020 07:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595576484;
 bh=wSYqc6zd8XQuJxIuMyrVpPOP0RSQXvA79nPZgRDW0wY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hpUncPWGDzGoTP9/S2oyMfSCw/TYT02lgI76NR/YUshrNZFMTJzujixw8UNVu6xUs
 2NE+SHzUZrcyiIp8mZ5zjDgiwM0lsQJjOtwg8ldIG17ipxcYGaWmkA9gw0n8C8Ke5M
 G68wajafmJUgFaD8IvXuzjODVgYyWlNjxYE9wFWo=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Kukjin Kim <kgene@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 03/29] memory: omap-gpmc: Include <linux/sizes.h> for SZ_16M
Date: Fri, 24 Jul 2020 09:40:12 +0200
Message-Id: <20200724074038.5597-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034126_680321_F6230C39 
X-CRM114-Status: GOOD (  14.48  )
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VGhlIGRyaXZlciB1c2VzIFNaXzE2TSB3aGljaCBpcyBkZWZpbmVkIGluIGluY2x1ZGUvbGludXgv
c2l6ZXMuaC4gIE9uCkFSTSBpdCB3YXMgcHVsbGVkIGJ5IG90aGVyIGhlYWRlcnMgYnV0IGl0cyBp
bmNsdXNpb24gaXMgbmVjZXNzYXJ5IGZvcgpjb21waWxlIHRlc3Rpbmcgb24gb3RoZXIgYXJjaGl0
ZWN0dXJlcy4KClRoaXMgZml4ZXMgYnVpbGQgZXJyb3Igd2hlbiBjb21waWxlIHRlc3Rpbmcgb24g
aTM4NiBhcmNoaXRlY3R1cmU6CgogICAgZHJpdmVycy9tZW1vcnkvb21hcC1ncG1jLmM6IEluIGZ1
bmN0aW9uIOKAmGdwbWNfY3NfcmVtYXDigJk6CiAgICBkcml2ZXJzL21lbW9yeS9vbWFwLWdwbWMu
Yzo5NjE6MTI6IGVycm9yOiDigJhTWl8xNk3igJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRo
aXMgZnVuY3Rpb24pCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtl
cm5lbC5vcmc+Ci0tLQogZHJpdmVycy9tZW1vcnkvb21hcC1ncG1jLmMgfCAxICsKIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVtb3J5L29tYXAt
Z3BtYy5jIGIvZHJpdmVycy9tZW1vcnkvb21hcC1ncG1jLmMKaW5kZXggOGVjMmVmMmFlYmRkLi5j
MTU4YjZjYWU5YTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jCisrKyBi
L2RyaXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jCkBAIC0yOSw2ICsyOSw3IEBACiAjaW5jbHVkZSA8
bGludXgvb2ZfcGxhdGZvcm0uaD4KICNpbmNsdWRlIDxsaW51eC9vbWFwLWdwbWMuaD4KICNpbmNs
dWRlIDxsaW51eC9wbV9ydW50aW1lLmg+CisjaW5jbHVkZSA8bGludXgvc2l6ZXMuaD4KIAogI2lu
Y2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RhdGEvbXRkLW5hbmQtb21hcDIuaD4KIAotLSAKMi4xNy4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
