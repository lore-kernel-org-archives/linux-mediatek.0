Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80051C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 18:32:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F371B64E25
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 18:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F371B64E25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XHqfVcXxvKCUds89DZgG71cxWw++KL/zFvvhxpkqjxg=; b=TA9+7hj5pnqLtPdM8Gmqwc8hO
	W7EojZVSBnK67Ub0a0O4UQ8aHTfYOB8QhCAaG0w34PuqtGhqiXK6hHzxWrjmaWHWHNBZ7Ly4OY+l5
	PjvisEtnGcDp7PeIWQfmTaDqRNmi6AA0anYIAKohD7Ewq6p7xspwbdOwQ5uGSB7Czm4ldsVhbjtoZ
	5jTPXKZTI+NeQX1PyrqAbMq9EZ8IbizLp3UXZ8U1r6UP/SOEQTJG/BxaSj9YnrpnBrxCZhzKe4TSG
	mPzFObUucvWL25xfipJkKd+OyvGn6HFXd9ICxRclFYXgdGEGQpEHb6RVt4KgR9PYWAHVhQ40XM0QC
	mJ8T67U7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHWIg-0061zd-Hg; Wed, 03 Mar 2021 18:32:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT0k-005H5z-3b; Wed, 03 Mar 2021 15:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=dhREwc4IH5ESc5P/9moaRg/3iBm0ihL62bRsFOV/srs=; b=bVim6gEqeqMYdPdvCp7T/7+Dgg
 YNfwWyPE5GwJfgAdp9VlJ3mbgQXGj+rM1IBfwKK/hdk9S6Rj5mD2ghyX7B9Fcec/YwkKaoUdhtPIR
 ah9ARmPHYRdIVZDRJM2LjhSp9jtzz2hs74QGqbVMeKtlcz1+unRIphvO5x3sfXS76zoIRw+8E5tdS
 ggtiPpV2HWiOUk0iLGase+HpAYFJn7fJaP/AzzO2JGzSN4e1NgxZz1dwEQc+oNBI62fI4Wdf15iO+
 ba+HFuGoq9LYaVlOqdFAqtEnyU0QJt9giAiAMSM1hmK2ep5OWr3OISsg9wQ79EneLJ7ZYoLHKxq8h
 0vZkvLHA==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH3gN-00H3Uj-4P; Tue, 02 Mar 2021 11:59:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 388DE64FBE;
 Tue,  2 Mar 2021 11:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614686357;
 bh=ttanRSDdKT/MJoxSdzTfCjV5gPBC06d1CKHa4cPf1Mk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KSn1nARDdzub5HvZ6uTYY3/enhBK5eh2z6CyaRHj8wwNjURgnKJf/xahbF5UoFtLb
 g/QBl3HwcZyFnlK0rGAnpOoEfQJE9C/NxAynQWOxKI7pnqHMVDO4poo+2oe2xYf6Ry
 6WcVbCyHtM683A8LDJz6bbQpuuUEbHUEA5Hya46SgyDL79KoHiHnk94gGpaYwbV4I6
 tP+VCnI7B5YlXSunJIeFcc6jx3zBQE+t5S332DVKth3wTNvjkAE83Ng0sd2hsj9c/b
 LWqHH+sx7B1VghlpzbdZO9OiuUZQ2LygWuxKL1HUzurr5x7mCDOt7DL3m1pwY+UBgI
 qVn5n2SMuDLSQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sasha Levin <sashal@kernel.org>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 10/13] PCI: mediatek: Add missing of_node_put()
 to fix reference leak
Date: Tue,  2 Mar 2021 06:59:00 -0500
Message-Id: <20210302115903.63458-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302115903.63458-1-sashal@kernel.org>
References: <20210302115903.63458-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_115922_721216_40223711 
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
bEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvcGNpL2hvc3QvcGNpZS1tZWRpYXRlay5jIHwgNyAr
KysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2hvc3QvcGNpZS1tZWRpYXRlay5jIGIvZHJpdmVycy9w
Y2kvaG9zdC9wY2llLW1lZGlhdGVrLmMKaW5kZXggYzg5NmJiOWVmOTY4Li42MGMzMTEwYjUxNTEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2hvc3QvcGNpZS1tZWRpYXRlay5jCisrKyBiL2RyaXZl
cnMvcGNpL2hvc3QvcGNpZS1tZWRpYXRlay5jCkBAIC0xMDQyLDE0ICsxMDQyLDE0IEBAIHN0YXRp
YyBpbnQgbXRrX3BjaWVfc2V0dXAoc3RydWN0IG10a19wY2llICpwY2llKQogCQllcnIgPSBvZl9w
Y2lfZ2V0X2RldmZuKGNoaWxkKTsKIAkJaWYgKGVyciA8IDApIHsKIAkJCWRldl9lcnIoZGV2LCAi
ZmFpbGVkIHRvIHBhcnNlIGRldmZuOiAlZFxuIiwgZXJyKTsKLQkJCXJldHVybiBlcnI7CisJCQln
b3RvIGVycm9yX3B1dF9ub2RlOwogCQl9CiAKIAkJc2xvdCA9IFBDSV9TTE9UKGVycik7CiAKIAkJ
ZXJyID0gbXRrX3BjaWVfcGFyc2VfcG9ydChwY2llLCBjaGlsZCwgc2xvdCk7CiAJCWlmIChlcnIp
Ci0JCQlyZXR1cm4gZXJyOworCQkJZ290byBlcnJvcl9wdXRfbm9kZTsKIAl9CiAKIAllcnIgPSBt
dGtfcGNpZV9zdWJzeXNfcG93ZXJ1cChwY2llKTsKQEAgLTEwNjUsNiArMTA2NSw5IEBAIHN0YXRp
YyBpbnQgbXRrX3BjaWVfc2V0dXAoc3RydWN0IG10a19wY2llICpwY2llKQogCQltdGtfcGNpZV9z
dWJzeXNfcG93ZXJkb3duKHBjaWUpOwogCiAJcmV0dXJuIDA7CitlcnJvcl9wdXRfbm9kZToKKwlv
Zl9ub2RlX3B1dChjaGlsZCk7CisJcmV0dXJuIGVycjsKIH0KIAogc3RhdGljIGludCBtdGtfcGNp
ZV9yZXF1ZXN0X3Jlc291cmNlcyhzdHJ1Y3QgbXRrX3BjaWUgKnBjaWUpCi0tIAoyLjMwLjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
