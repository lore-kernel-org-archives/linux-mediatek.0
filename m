Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 16:09:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5335C60F02
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 16:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5335C60F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Mime-Version:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8i0JDBuYbuaJvFKBUR2e5d6333Lx5OpoYAkM/V6uuzE=; b=xqjv0ZIVZsO7+e
	BfPLWdObgBZe47HrYK0voysHV58ujW4ZRaW7773+cbftQL/kxcHpkJNxLm2rWZMoKRzuo2tcycK3O
	7noyINcMN8FENzmktLya3nXQx5TE9zTwa/+uTfGJ5mv678jOj+l2/tQuec+NhT9QXVfsQGPYUbdWo
	29kg6xUArFRfW5Yr2iK3B6crq07MwpArrNZUtOar//EmvmGw0YY9j3Po8BACfLFXn4MbbzOnlk1nq
	TCMtnl9krDFjShIotejGFqGrNbH5swlAyTRMLE1C3RZ7IEbvsv9fZCbFEb5KF/ry8NSchdHI6ITi9
	5gen/X+oBz1BGdWzd9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcrgM-001r6H-Fb; Tue, 19 Oct 2021 16:09:42 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcre5-001puS-Jm; Tue, 19 Oct 2021 16:07:23 +0000
Received: by mail-pl1-x634.google.com with SMTP id 21so13969635plo.13;
 Tue, 19 Oct 2021 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:mime-version:message-id
 :content-transfer-encoding;
 bh=9nKO5MBR4+kd0HJ32kWDjjupmN6pRGPGsMDzDplVOvc=;
 b=OR/bROCSq3bOlD4iij6cTHHxAZvsqvk1aiDeAhj0vVDqc+JYbPlhG4b5aLnKjO9M0F
 UbJG4CIGlf/EWCDZ0awppV7uGbToiV8/4DS4jRifHiOZScqZjthv3dvaDOgKke04eNwu
 NwDzcCJm6Ayqk2V+KvG/LiBNbsIWOMy6k33JLPko8+bfxUMc+0EfLU7MARKxCxwnmlwv
 lvINqNnQeEhvR02vkeApn+KnWtK7khduVgbohP2Q+Qmud1y+0j+OP0LUyIuVw96Nxir8
 MdXh93/rSeIrlrDxN54xIVIGXH2ApHrxWr3PEHuA1i6mTzqU3Wg+KvMqg1/ugjDvOcki
 1SfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:mime-version:message-id
 :content-transfer-encoding;
 bh=9nKO5MBR4+kd0HJ32kWDjjupmN6pRGPGsMDzDplVOvc=;
 b=NmnXodDFZPh32CHAKwiQP/vuO54cUuPglK7ofIDBLPV5+A/sqjYcgj1Z05fF7OQTHW
 rPNMBS2zH4sCI11DQwcLE2cPX952UAp1aDrhn5NJHy2dTHSrHlic0eTBPio7CMq67u9F
 hu/AA9puioS6wpGB+3Kv/sdvBSfY9aGoFPYU0VX/meFDESNcKTYK4Iwat4UEsEVau6Ot
 zAjEZNHP22IqBKYawc68LMZJePdoiwi9BeCyp14B925Nu4gA9QC20y0g1kU8LgNJcPhD
 mbEv/BqEHiNgSoRPPYAplPC4WsqrUuCEzafZvd/ry36BkPY9oVh1tWJ4TncYzrCGLNhN
 ydXw==
X-Gm-Message-State: AOAM53174mlw2KZPzi6WMwH5Z0io/7B2qeQmDexZI1b+sO9MOYFuccgp
 7qMNJKNmVa/lysWq3/RPIdQdQClzBhBPqA==
X-Google-Smtp-Source: ABdhPJznPURueeiRev5x7DrHOelLkHIzxaJ23QRRfr/hyvKHWpOaeYT/A0GkEMuK6vKysLb2eGSpXg==
X-Received: by 2002:a17:902:6ac4:b0:13f:52e1:8840 with SMTP id
 i4-20020a1709026ac400b0013f52e18840mr33719062plt.15.1634659638362; 
 Tue, 19 Oct 2021 09:07:18 -0700 (PDT)
Received: from DESKTOP-O1J7GSD (211-21-92-117.hinet-ip.hinet.net.
 [211.21.92.117])
 by smtp.gmail.com with ESMTPSA id t14sm16062502pga.62.2021.10.19.09.07.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Oct 2021 09:07:17 -0700 (PDT)
Date: Wed, 20 Oct 2021 00:07:16 +0800
From: "zhaojh329@gmail.com" <zhaojh329@gmail.com>
To: sr <sr@denx.de>
Cc: matthias.bgg <matthias.bgg@gmail.com>, 
 linux-i2c <linux-i2c@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-mediatek <linux-mediatek@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH] i2c: mt76xx: add I2C_FUNC_NOSTART and I2C_M_REV_DIR_ADDR
X-Priority: 3
X-GUID: 4D9ECA36-F416-4365-8968-CACAFDFE0424
X-Has-Attach: no
X-Mailer: Foxmail 7.2.21.453[cn]
Mime-Version: 1.0
Message-ID: <202110200007146639874@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_090721_734708_8D8B1CBB 
X-CRM114-Status: GOOD (  14.00  )
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

wqBUaGlzIHBhdGNoIGFkZHMgSTJDX0ZVTkNfTk9TVEFSVCBhbmQgSTJDX01fUkVWX0RJUl9BRERS
IHN1cHBvcnQgZm9yCk1lZGlhVGVrIE1UNzYyMS83NjI4Lzc2ODguIFRoaXMgaXMgdXNlZnVsIGZv
ciBzb21lIEkyQyBzbGF2ZSBjaGlwcywKc3VjaCBhcyAnZHJpdmVycy9pbnB1dC9qb3lzdGljay9h
czUwMTEuYycuCgpTaWduZWQtb2ZmLWJ5OiBKaWFuaHVpIFpoYW8gPHpoYW9qaDMyOUBnbWFpbC5j
b20+Ci0tLQogZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDc2MjEuYyB8IDkgKysrKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDc2MjEuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtbXQ3NjIxLmMKaW5kZXggNDVmZTRhN2ZlMGMwLi4zZDI3NjNkOWMwOTAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ3NjIxLmMKKysrIGIvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1tdDc2MjEuYwpAQCAtMTUwLDYgKzE1MCw5IEBAIHN0YXRpYyBpbnQgbXRrX2kyY19tYXN0
ZXJfeGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsIHN0cnVjdCBpMmNfbXNnICptc2dzLAog
CWZvciAoaSA9IDA7IGkgPCBudW07IGkrKykgewogCQlwbXNnID0gJm1zZ3NbaV07CiAKKwkJaWYg
KHBtc2ctPmZsYWdzICYgSTJDX01fTk9TVEFSVCkKKwkJCWdvdG8gbm9zdGFydDsKKwogCQkvKiB3
YWl0IGhhcmR3YXJlIGlkbGUgKi8KIAkJcmV0ID0gbXRrX2kyY193YWl0X2lkbGUoaTJjKTsKIAkJ
aWYgKHJldCkKQEAgLTE3NCw2ICsxNzcsOCBAQCBzdGF0aWMgaW50IG10a19pMmNfbWFzdGVyX3hm
ZXIoc3RydWN0IGkyY19hZGFwdGVyICphZGFwLCBzdHJ1Y3QgaTJjX21zZyAqbXNncywKIAkJfSBl
bHNlIHsKIAkJCS8qIDcgYml0cyBhZGRyZXNzICovCiAJCQlhZGRyID0gaTJjXzhiaXRfYWRkcl9m
cm9tX21zZyhwbXNnKTsKKwkJCWlmIChwbXNnLT5mbGFncyAmIEkyQ19NX1JFVl9ESVJfQUREUikK
KwkJCQlhZGRyIF49IDE7CiAJCQlpb3dyaXRlMzIoYWRkciwgaTJjLT5iYXNlICsgUkVHX1NNMEQw
X1JFRyk7CiAJCQlyZXQgPSBtdGtfaTJjX21hc3Rlcl9jbWQoaTJjLCBTTTBDVEwxX1dSSVRFLCAx
KTsKIAkJCWlmIChyZXQpCkBAIC0xODcsNiArMTkyLDcgQEAgc3RhdGljIGludCBtdGtfaTJjX21h
c3Rlcl94ZmVyKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCwgc3RydWN0IGkyY19tc2cgKm1zZ3Ms
CiAJCQkJZ290byBlcnJfYWNrOwogCQl9CiAKK25vc3RhcnQ6CiAJCS8qIHRyYW5zZmVyIGRhdGEg
Ki8KIAkJZm9yIChsZW4gPSBwbXNnLT5sZW4sIGogPSAwOyBsZW4gPiAwOyBsZW4gLT0gOCwgaiAr
PSA4KSB7CiAJCQlwYWdlX2xlbiA9IChsZW4gPj0gOCkgPyA4IDogbGVuOwpAQCAtMjQyLDcgKzI0
OCw4IEBAIHN0YXRpYyBpbnQgbXRrX2kyY19tYXN0ZXJfeGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIg
KmFkYXAsIHN0cnVjdCBpMmNfbXNnICptc2dzLAogCiBzdGF0aWMgdTMyIG10a19pMmNfZnVuYyhz
dHJ1Y3QgaTJjX2FkYXB0ZXIgKmEpCiB7Ci0JcmV0dXJuIEkyQ19GVU5DX0kyQyB8IEkyQ19GVU5D
X1NNQlVTX0VNVUwgfCBJMkNfRlVOQ19QUk9UT0NPTF9NQU5HTElORzsKKwlyZXR1cm4gSTJDX0ZV
TkNfSTJDIHwgSTJDX0ZVTkNfU01CVVNfRU1VTCB8IEkyQ19GVU5DXzEwQklUX0FERFIKKwkJfCBJ
MkNfRlVOQ19QUk9UT0NPTF9NQU5HTElORyB8IEkyQ19GVU5DX05PU1RBUlQ7CiB9CiAKIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgaTJjX2FsZ29yaXRobSBtdGtfaTJjX2FsZ28gPSB7Ci0tIAoyLjI1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
