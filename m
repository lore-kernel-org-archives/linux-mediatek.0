Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCA8C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 18:48:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5B8022473
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 18:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5B8022473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q7+ucwhvEhMBLkUgHcyzhhrAJVNl4dvnrFQW9Jd83Eo=; b=dSEGC+xoYbzxPK9YOgRODeIWfG
	9oxXbJvNI9zh0KpTrE4kmiLK84jXmxXr6BfQfEiIbSJqrlr1h4HTEDcOdCeeQjrvXEvrvsbHrUVpk
	jG+Dz8ajS8qDhwzXE/GyTQ2QE8OY8+eImAxMhDTtTi6xFjBaIzzhJsCSHLTpdMzWkmM2YU4lyCLJw
	POuw6ukHDbAFl4s4iCTxjClxfcce5ZrDCXxlcoUrRYcv/Lp/+COZskKP9aUsus6NiGUIN0AKZSt8s
	zaqGcyFRuEOcbt5X6qup6HLv+ehfFcAM168WbHJYSQOQ/yUtTygouLVGNt044qokPiuzm5BGEcu5/
	PyMU4wTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2IWf-0003fl-Vu; Wed, 20 Jan 2021 18:48:18 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2IWd-0003ez-F4; Wed, 20 Jan 2021 18:48:16 +0000
Received: by mail-wm1-f51.google.com with SMTP id c127so3737605wmf.5;
 Wed, 20 Jan 2021 10:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uxPmbiajECo9YExCxiewn6BUGuPfDNtaPp5Y2cOf+vw=;
 b=nKMLx/+uz3ne91/cR1ztZADBl4IL3vr1dM1R2KyJ5vZq6sftlBrtCQYehmbgdl7Hwh
 Nx9z6jqTFUjyONjHyuVpqmvI/NxasjFzwSwP1dohl48hrSKQK50QsqdQwdsKk2KIU8m4
 RKP66vCNiZhu3llq0PRZf3PZBXtAqTA+FOHnAUtRRFBByP0j7bhFgp/KkkrDVzNrWTSt
 y+XZwVEkpw/Df50EagfsQ6157FKdnkUdHBR/ZQ3Qh0eN65olsm1xexdNAon3F2kLQklS
 ARpe9ZoHNNjyraC5l/bWY8Romv7lPOVfURPi0rMciu27gq6GHBCDnwmLRKs34sxFhq4x
 AEeg==
X-Gm-Message-State: AOAM531LcpEbV2ku3RwfLyfcGvfC8fIeD8J8wuOgoheJ6v3kPVmVBUfW
 BIKojQlX0BjeDFuXSisYOy0=
X-Google-Smtp-Source: ABdhPJwtn2xpshugzYAvflARryBYa82pNPYQWztaOHR67Bzcg8Dpc4zdRyBK9jvQ3DfPLD+GcFYXig==
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr5726969wmb.98.1611168492620; 
 Wed, 20 Jan 2021 10:48:12 -0800 (PST)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id v11sm5466474wrt.25.2021.01.20.10.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 10:48:11 -0800 (PST)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] PCI: mediatek: Add missing of_node_put() to fix reference leak
Date: Wed, 20 Jan 2021 18:48:10 +0000
Message-Id: <20210120184810.3068794-1-kw@linux.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_134815_513824_895415CA 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VGhlIGZvcl9lYWNoX2F2YWlsYWJsZV9jaGlsZF9vZl9ub2RlIGhlbHBlciBpbnRlcm5hbGx5IG1h
a2VzIHVzZSBvZiB0aGUKb2ZfZ2V0X25leHRfYXZhaWxhYmxlX2NoaWxkKCkgd2hpY2ggcGVyZm9y
bXMgYW4gb2Zfbm9kZV9nZXQoKSBvbiBlYWNoCml0ZXJhdGlvbiB3aGVuIHNlYXJjaGluZyBmb3Ig
bmV4dCBhdmFpbGFibGUgY2hpbGQgbm9kZS4KClNob3VsZCBhbiBhdmFpbGFibGUgY2hpbGQgbm9k
ZSBiZSBmb3VuZCwgdGhlbiBpdCB3b3VsZCByZXR1cm4gYSBkZXZpY2UKbm9kZSBwb2ludGVyIHdp
dGggcmVmZXJlbmNlIGNvdW50IGluY3JlbWVudGVkLCB0aHVzIGVhcmx5IHJldHVybiBmcm9tCnRo
ZSBtaWRkbGUgb2YgdGhlIGxvb3AgcmVxdWlyZXMgYW4gZXhwbGljaXQgb2Zfbm9kZV9wdXQoKSB0
byBwcmV2ZW50CnJlZmVyZW5jZSBjb3VudCBsZWFrLgoKVG8gc3RvcCB0aGUgcmVmZXJlbmNlIGxl
YWssIGV4cGxpY2l0bHkgY2FsbCBvZl9ub2RlX3B1dCgpIGJlZm9yZQpyZXR1cm5pbmcgYWZ0ZXIg
YW4gZXJyb3Igb2NjdXJyZWQuCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgV2lsY3p5xYRza2kg
PGt3QGxpbnV4LmNvbT4KLS0tCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWVkaWF0ZWsu
YyB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWVkaWF0ZWsu
YyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tZWRpYXRlay5jCmluZGV4IGNmNGMxOGYw
YzI1YS4uMjM1NDhiNTE3ZTRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3Bj
aWUtbWVkaWF0ZWsuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWVkaWF0ZWsu
YwpAQCAtMTAzNSwxNCArMTAzNSwxNCBAQCBzdGF0aWMgaW50IG10a19wY2llX3NldHVwKHN0cnVj
dCBtdGtfcGNpZSAqcGNpZSkKIAkJZXJyID0gb2ZfcGNpX2dldF9kZXZmbihjaGlsZCk7CiAJCWlm
IChlcnIgPCAwKSB7CiAJCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBwYXJzZSBkZXZmbjogJWRc
biIsIGVycik7Ci0JCQlyZXR1cm4gZXJyOworCQkJZ290byBlcnJvcl9wdXRfbm9kZTsKIAkJfQog
CiAJCXNsb3QgPSBQQ0lfU0xPVChlcnIpOwogCiAJCWVyciA9IG10a19wY2llX3BhcnNlX3BvcnQo
cGNpZSwgY2hpbGQsIHNsb3QpOwogCQlpZiAoZXJyKQotCQkJcmV0dXJuIGVycjsKKwkJCWdvdG8g
ZXJyb3JfcHV0X25vZGU7CiAJfQogCiAJZXJyID0gbXRrX3BjaWVfc3Vic3lzX3Bvd2VydXAocGNp
ZSk7CkBAIC0xMDU4LDYgKzEwNTgsOSBAQCBzdGF0aWMgaW50IG10a19wY2llX3NldHVwKHN0cnVj
dCBtdGtfcGNpZSAqcGNpZSkKIAkJbXRrX3BjaWVfc3Vic3lzX3Bvd2VyZG93bihwY2llKTsKIAog
CXJldHVybiAwOworZXJyb3JfcHV0X25vZGU6CisJb2Zfbm9kZV9wdXQoY2hpbGQpOworCXJldHVy
biBlcnI7CiB9CiAKIHN0YXRpYyBpbnQgbXRrX3BjaWVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKLS0gCjIuMzAuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
