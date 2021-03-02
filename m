Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CA9C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 15:54:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E521064EE3
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 15:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E521064EE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sAhIgZm40WiPayR5oCgXyqAuxgSyg8dXu0+UcImQwYw=; b=ctbxooHkEfNqn+aWHdUVnUV/R
	1VCZe2jriHdU1SaYquXJoyVnUuiFx84U8+8Mri6M+y637xWMfiN4nbekCJGXVeeTQebG8guql2JCP
	zUbYTbM7lpl4ADFxdBeN6o+zp7Au/eh+Eb9SP2tHWFWox0YGcFRUlmkJONfwVpYfPAhRzjOHAK7v9
	XO4IdyDrUEypKn1GiBy3hLlmdQM+xXMZPdInSA0XwCnge6Te7+i4DsV7HtggiIkthFae2UQriwXdk
	oHcy9+/mEdYZsmlZvg9yjqBeNbEQr86u8rg9Kh/vJTXrSdcCsvLMqIFWkTLRRGV3SbX9zaxfBFErJ
	mowXr1Clg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHTpJ-005TrC-7C; Wed, 03 Mar 2021 15:54:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSnM-005CRU-VI; Wed, 03 Mar 2021 14:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=XjZAUEaJ8Lk6KV/+KYlBc38rH8IcowsW85DULXoAymk=; b=tfo5Jdsk28DGZPbdBgGzVUsEXH
 B6HvV3rAp5j+gICxiMnHGQXsGLoa0t0TFcP8+sUq/ZYaRhBLEUQhf9fa7gLJwQYr7adMnvrSSjPLq
 NuxMK/ZXacnVZlZZi8NGTL7Bp4ZnoGgSH8FlZyn+EY3HRB5HoWCEuePgF9VQmmb6hX4bKxoY64hO2
 lkG/6I7hmJJ+fnD1NZH2Qbtgc+C7DQYp0vgLXM3tOqmgTMTJADhYcpRHfq14tAGOORWPI38GF2kAp
 B5tluYu6BHcCOSsSo+twEqeQIfiF6PdWhLQ3jQZHFzPr90cflu1eAOQAH5mZRERawg7ZoiJK68e3S
 gW5HtqQw==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH3fT-00H3MA-45; Tue, 02 Mar 2021 11:58:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 59C3264F94;
 Tue,  2 Mar 2021 11:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614686300;
 bh=wZpW6HTnql2/6O3FZEJJqHicP9NtO9R0NZCbSqbg/K8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X+y7sF7rNuuQSQsxJHqjW1uDc39dsWJwcCOs4THN6ku1LHyVxEO0vB0Jgn572yVVH
 RTDPKDichE5A5q0S3r+BgReoCwjsesIE65S9lwzv0NRlzsXWxPP8oP/2GJjlYmu6y3
 G2WK4mvXx6NscC8r7WuzHD5j5xVeSIxzzd3onay0hcLKE05lJzL8OPxHl3NcNQj2Ef
 X80/3Wxdktkk2hlXDOY+J2/FHdrt2u6dPQQJHvR2xPc6jqnxBsEMUg/1izN1fNc/YU
 CwGf6h2I+7l5dvtnmimVOFHnilmKP3DPo1hVLbFNdWKxUXAYu9PidLGM00iEUJQ/D4
 mIP2pEMnTqyUg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sasha Levin <sashal@kernel.org>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 23/33] PCI: mediatek: Add missing of_node_put() to
 fix reference leak
Date: Tue,  2 Mar 2021 06:57:39 -0500
Message-Id: <20210302115749.62653-23-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302115749.62653-1-sashal@kernel.org>
References: <20210302115749.62653-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_115829_230648_636584E4 
X-CRM114-Status: GOOD (  10.40  )
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

RnJvbTogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxrd0BsaW51eC5jb20+CgpbIFVwc3RyZWFtIGNv
bW1pdCA0MjgxNGM0MzhhYWM3OTc0NmQzMTBmNDEzYTI3ZDViMGI5NTljNWRlIF0KClRoZSBmb3Jf
ZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zfbm9kZSBoZWxwZXIgaW50ZXJuYWxseSBtYWtlcyB1c2Ug
b2YgdGhlCm9mX2dldF9uZXh0X2F2YWlsYWJsZV9jaGlsZCgpIHdoaWNoIHBlcmZvcm1zIGFuIG9m
X25vZGVfZ2V0KCkgb24gZWFjaAppdGVyYXRpb24gd2hlbiBzZWFyY2hpbmcgZm9yIG5leHQgYXZh
aWxhYmxlIGNoaWxkIG5vZGUuCgpTaG91bGQgYW4gYXZhaWxhYmxlIGNoaWxkIG5vZGUgYmUgZm91
bmQsIHRoZW4gaXQgd291bGQgcmV0dXJuIGEgZGV2aWNlCm5vZGUgcG9pbnRlciB3aXRoIHJlZmVy
ZW5jZSBjb3VudCBpbmNyZW1lbnRlZCwgdGh1cyBlYXJseSByZXR1cm4gZnJvbQp0aGUgbWlkZGxl
IG9mIHRoZSBsb29wIHJlcXVpcmVzIGFuIGV4cGxpY2l0IG9mX25vZGVfcHV0KCkgdG8gcHJldmVu
dApyZWZlcmVuY2UgY291bnQgbGVhay4KClRvIHN0b3AgdGhlIHJlZmVyZW5jZSBsZWFrLCBleHBs
aWNpdGx5IGNhbGwgb2Zfbm9kZV9wdXQoKSBiZWZvcmUKcmV0dXJuaW5nIGFmdGVyIGFuIGVycm9y
IG9jY3VycmVkLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMDEyMDE4NDgx
MC4zMDY4Nzk0LTEta3dAbGludXguY29tClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBXaWxjennF
hHNraSA8a3dAbGludXguY29tPgpTaWduZWQtb2ZmLWJ5OiBMb3JlbnpvIFBpZXJhbGlzaSA8bG9y
ZW56by5waWVyYWxpc2lAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hh
bEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tZWRpYXRlay5j
IHwgNyArKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tZWRpYXRlay5j
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1lZGlhdGVrLmMKaW5kZXggNjI2YTdjMzUy
ZGZkLi43MjhhNTk2NTU4MjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNp
ZS1tZWRpYXRlay5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tZWRpYXRlay5j
CkBAIC0xMDYzLDE0ICsxMDYzLDE0IEBAIHN0YXRpYyBpbnQgbXRrX3BjaWVfc2V0dXAoc3RydWN0
IG10a19wY2llICpwY2llKQogCQllcnIgPSBvZl9wY2lfZ2V0X2RldmZuKGNoaWxkKTsKIAkJaWYg
KGVyciA8IDApIHsKIAkJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHBhcnNlIGRldmZuOiAlZFxu
IiwgZXJyKTsKLQkJCXJldHVybiBlcnI7CisJCQlnb3RvIGVycm9yX3B1dF9ub2RlOwogCQl9CiAK
IAkJc2xvdCA9IFBDSV9TTE9UKGVycik7CiAKIAkJZXJyID0gbXRrX3BjaWVfcGFyc2VfcG9ydChw
Y2llLCBjaGlsZCwgc2xvdCk7CiAJCWlmIChlcnIpCi0JCQlyZXR1cm4gZXJyOworCQkJZ290byBl
cnJvcl9wdXRfbm9kZTsKIAl9CiAKIAllcnIgPSBtdGtfcGNpZV9zdWJzeXNfcG93ZXJ1cChwY2ll
KTsKQEAgLTEwODYsNiArMTA4Niw5IEBAIHN0YXRpYyBpbnQgbXRrX3BjaWVfc2V0dXAoc3RydWN0
IG10a19wY2llICpwY2llKQogCQltdGtfcGNpZV9zdWJzeXNfcG93ZXJkb3duKHBjaWUpOwogCiAJ
cmV0dXJuIDA7CitlcnJvcl9wdXRfbm9kZToKKwlvZl9ub2RlX3B1dChjaGlsZCk7CisJcmV0dXJu
IGVycjsKIH0KIAogc3RhdGljIGludCBtdGtfcGNpZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQotLSAKMi4zMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
