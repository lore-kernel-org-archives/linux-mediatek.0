Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439E4C433F8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:43:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 068DF20767
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:43:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CE+FLBs6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DalSWzsW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 068DF20767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K/5w9ldgz1mgAP4kZCtXou510cO8Buj42FYNjH7GAR4=; b=CE+FLBs63Jx7L82GASYy985x2
	rQ1pjaEoRvMh+9hTts/Vna4aec6Nor2+EBQadE3Hvq1PA9O1l5swP4wTaUnwfHhklSbjbWn24ZlJv
	4LlZcQcekJqNYY7T7VqmO1IAus0XFm6ZgVgZp8eqT8POiATqRWDOsQce1k1XescVD9262Na/fvS1o
	/EG0nce5XUBFPCX//U9IWNqQ0D3DvhtOa6HOws+zYhBOXiFVzwyF91qQx7dW0vlbNCMpxk9ZXyOma
	pjS+c6BtSKT3mtmWfE2OXe5AVH1JTaeXkC7blR4RtDBumPeQcp1X5hACYwR6qQRMVo1iAwvXZK1lP
	aZBSp+xzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysMI-0002nD-92; Fri, 24 Jul 2020 07:43:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysKW-0001qi-Ci; Fri, 24 Jul 2020 07:41:22 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B14E2074F;
 Fri, 24 Jul 2020 07:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595576479;
 bh=Bt/ODkou+h7UXM3XoTT6oTEvvX96jMbrnoncqKrBSPA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DalSWzsWoGQcDrririhVVo43b1awBPFRnkQ/ke9MWRXRFJcUbhi+jLnD838DC7sZf
 AIYSTNNlqJfS9c481DLcmr0C1owj0rYCpKZfvzwugly82CniG1pkDfXkqlvIWwQnUZ
 UDtllsiCmgwHAqH1yXtgp5B7njOmwPIvYfHNnXcQ=
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
Subject: [RFT v2 02/29] memory: omap-gpmc: Remove unused file-scope phys_base
 and mem_size
Date: Fri, 24 Jul 2020 09:40:11 +0200
Message-Id: <20200724074038.5597-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034121_119648_4B38DF92 
X-CRM114-Status: GOOD (  13.90  )
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

VGhlIGZpbGUtc2NvcGUgdmFyaWFibGVzIHBoeXNfYmFzZSBhbmQgbWVtX3NpemUgYXJlIGFzc2ln
bmVkIGluCmdwbWNfcHJvYmUoKSBidXQgbmV2ZXIgcmVhZC4KClRoaXMgZml4ZXMgYnVpbGQgZXJy
b3Igd2hlbiBjb21waWxlIHRlc3Rpbmcgb24geDg2XzY0IGFyY2hpdGVjdHVyZToKCiAgICBkcml2
ZXJzL21lbW9yeS9vbWFwLWdwbWMuYzoyNDY6MjQ6IGVycm9yOiBjb25mbGljdGluZyB0eXBlcyBm
b3Ig4oCYcGh5c19iYXNl4oCZCiAgICAgc3RhdGljIHJlc291cmNlX3NpemVfdCBwaHlzX2Jhc2Us
IG1lbV9zaXplOwogICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGFyY2gveDg2L2luY2x1ZGUvYXNt
L3BhZ2UuaDoxMjowLAogICAgICAgICAgICAgICAgICAgICBmcm9tIGFyY2gveDg2L2luY2x1ZGUv
YXNtL3RocmVhZF9pbmZvLmg6MTIsCiAgICAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9s
aW51eC90aHJlYWRfaW5mby5oOjM4LAogICAgICAgICAgICAgICAgICAgICBmcm9tIGFyY2gveDg2
L2luY2x1ZGUvYXNtL3ByZWVtcHQuaDo3LAogICAgICAgICAgICAgICAgICAgICBmcm9tIGluY2x1
ZGUvbGludXgvcHJlZW1wdC5oOjc4LAogICAgICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUv
bGludXgvc3BpbmxvY2suaDo1MSwKICAgICAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xp
bnV4L2lycS5oOjE0LAogICAgICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMvbWVtb3J5L29t
YXAtZ3BtYy5jOjEyOgogICAgYXJjaC94ODYvaW5jbHVkZS9hc20vcGFnZV82NC5oOjEyOjIyOiBu
b3RlOiBwcmV2aW91cyBkZWNsYXJhdGlvbiBvZiDigJhwaHlzX2Jhc2XigJkgd2FzIGhlcmUKICAg
ICBleHRlcm4gdW5zaWduZWQgbG9uZyBwaHlzX2Jhc2U7CgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9tZW1vcnkvb21hcC1n
cG1jLmMgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jIGIvZHJpdmVycy9tZW1vcnkvb21hcC1ncG1j
LmMKaW5kZXggZmMwOGI1MjkyOTMyLi44ZWMyZWYyYWViZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bWVtb3J5L29tYXAtZ3BtYy5jCisrKyBiL2RyaXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jCkBAIC0y
NDIsNyArMjQyLDYgQEAgc3RhdGljIERFRklORV9TUElOTE9DSyhncG1jX21lbV9sb2NrKTsKIC8q
IERlZmluZSBjaGlwLXNlbGVjdHMgYXMgcmVzZXJ2ZWQgYnkgZGVmYXVsdCB1bnRpbCBwcm9iZSBj
b21wbGV0ZXMgKi8KIHN0YXRpYyB1bnNpZ25lZCBpbnQgZ3BtY19jc19udW0gPSBHUE1DX0NTX05V
TTsKIHN0YXRpYyB1bnNpZ25lZCBpbnQgZ3BtY19ucl93YWl0cGluczsKLXN0YXRpYyByZXNvdXJj
ZV9zaXplX3QgcGh5c19iYXNlLCBtZW1fc2l6ZTsKIHN0YXRpYyB1bnNpZ25lZCBncG1jX2NhcGFi
aWxpdHk7CiBzdGF0aWMgdm9pZCBfX2lvbWVtICpncG1jX2Jhc2U7CiAKQEAgLTIzNTcsOSArMjM1
Niw2IEBAIHN0YXRpYyBpbnQgZ3BtY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCWlmIChyZXMgPT0gTlVMTCkKIAkJcmV0dXJuIC1FTk9FTlQ7CiAKLQlwaHlzX2Jhc2UgPSBy
ZXMtPnN0YXJ0OwotCW1lbV9zaXplID0gcmVzb3VyY2Vfc2l6ZShyZXMpOwotCiAJZ3BtY19iYXNl
ID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIHJlcyk7CiAJaWYgKElTX0VSUihn
cG1jX2Jhc2UpKQogCQlyZXR1cm4gUFRSX0VSUihncG1jX2Jhc2UpOwotLSAKMi4xNy4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
