Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3A0C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 17:53:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D2B064EE8
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 17:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D2B064EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bo5rVkPOrHefREdLTcVRX921cbX8aomwRzI6flrwpj8=; b=k+d7ITsdzpU57i6cZQc6u7Hul
	IwRUC/Lr6Zn4DT5V+gxM0K6Ku1cuRjuwGXeOlRMHY5i+VWvLiQQkCuI0oytBh0GMWbsSDceCZjRDZ
	bkffhoXlImnmNk2ynvgQmw0fUPg1YZLJ0isUWg9L9vjqZz3/znq37YpdoUaI2qlh7L4wrxP0B3nSm
	niE+WYqN74Jj5Zmz4XsnsATZCu2k5T5FNS2epwyK+GYcejR2GZDUkos609CNnsBXwbYkdh0mG8uR2
	9sqQ0vlxKZq1/nkziE1TwSyKaMj3c5ztiqTq7SXX80dF/KeXFivn7dvzpm2IndUtNZ153eEwq/rif
	Wvm7Dor3w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHVgH-005tNG-3x; Wed, 03 Mar 2021 17:53:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSwg-005FtH-8Z; Wed, 03 Mar 2021 14:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=HcAfzYAJ4shf4IRD7vfkxPFmNhqYjG/me0v0yXwjqos=; b=X+xWtcnegsgnVCt/NG3Xhjvn7/
 YWuU2h6dGzJtfrWGWivDXjnynD2/luyCu26tiNW4x7ELKuZRJEDYzFCailRNEZbaNOddcDI5m4Qt+
 lRER1iTHQoZAhjdCg6bCGf87ct6BDanMybob4Ml25hwARBXlmEbHRRRzLAy2cXT5c1A5w+6wXo7Vy
 Qsehf4hCFhwUnd8Jzb7aTo/2w7VzHoA6AHyfwX9MbhyjugQ4tuRMRyu0DM5QhLTrmQh4oZzs1cIBF
 C78r+CeDjYhFHBb7Z/9yuvkFxz/O1LliGOXNZBCTql/v7Xe5nDSqBronfQGAHQ12lU+WjhwD/GJK1
 QHx/qNjw==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH3g1-00H3Pv-3b; Tue, 02 Mar 2021 11:58:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D7B164F9A;
 Tue,  2 Mar 2021 11:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614686333;
 bh=XHy79ktjp/3DMbsxJZ/NZDO9d10iNG59rH3kQZOJUbA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m5V5kfnHz8NS+IJckBZktoH+p5oCpBM4/LjzztZM9bk8l2kItR6glRb7b0/W2B6l5
 MIpwbLMR3Zy90T+lu4KigAjHUiUDeAR9XENM53YHxRmvlqVmpqSBpqZvxq9fy8oiyu
 pQNACquEtzW6TDm7lh6hhPqQioL8udsCi6enJYqWusfmnXzxuRrJn6aNyhq2/WfYD1
 N4JnwLsee8fUPAtkhZoqO6IkWYAldBUe4dazCkelUJDrRk25PlQcDVubhEWD9TGGTi
 BP2QwVqSbpaDihcDOJW3k5lwLaw84MtIpdgCwND7qhl8zleqY+NbYEp7wUkQN6QZaH
 B69dmOgS+hZZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sasha Levin <sashal@kernel.org>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 14/21] PCI: mediatek: Add missing of_node_put()
 to fix reference leak
Date: Tue,  2 Mar 2021 06:58:28 -0500
Message-Id: <20210302115835.63269-14-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302115835.63269-1-sashal@kernel.org>
References: <20210302115835.63269-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_115859_769800_0F44A3D4 
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
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1lZGlhdGVrLmMKaW5kZXggY2EwNmQ4YmMw
MWU3Li4wNjZlOWUwMGRlMTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNp
ZS1tZWRpYXRlay5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tZWRpYXRlay5j
CkBAIC0xMDg5LDE0ICsxMDg5LDE0IEBAIHN0YXRpYyBpbnQgbXRrX3BjaWVfc2V0dXAoc3RydWN0
IG10a19wY2llICpwY2llKQogCQllcnIgPSBvZl9wY2lfZ2V0X2RldmZuKGNoaWxkKTsKIAkJaWYg
KGVyciA8IDApIHsKIAkJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHBhcnNlIGRldmZuOiAlZFxu
IiwgZXJyKTsKLQkJCXJldHVybiBlcnI7CisJCQlnb3RvIGVycm9yX3B1dF9ub2RlOwogCQl9CiAK
IAkJc2xvdCA9IFBDSV9TTE9UKGVycik7CiAKIAkJZXJyID0gbXRrX3BjaWVfcGFyc2VfcG9ydChw
Y2llLCBjaGlsZCwgc2xvdCk7CiAJCWlmIChlcnIpCi0JCQlyZXR1cm4gZXJyOworCQkJZ290byBl
cnJvcl9wdXRfbm9kZTsKIAl9CiAKIAllcnIgPSBtdGtfcGNpZV9zdWJzeXNfcG93ZXJ1cChwY2ll
KTsKQEAgLTExMTIsNiArMTExMiw5IEBAIHN0YXRpYyBpbnQgbXRrX3BjaWVfc2V0dXAoc3RydWN0
IG10a19wY2llICpwY2llKQogCQltdGtfcGNpZV9zdWJzeXNfcG93ZXJkb3duKHBjaWUpOwogCiAJ
cmV0dXJuIDA7CitlcnJvcl9wdXRfbm9kZToKKwlvZl9ub2RlX3B1dChjaGlsZCk7CisJcmV0dXJu
IGVycjsKIH0KIAogc3RhdGljIGludCBtdGtfcGNpZV9yZXF1ZXN0X3Jlc291cmNlcyhzdHJ1Y3Qg
bXRrX3BjaWUgKnBjaWUpCi0tIAoyLjMwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
