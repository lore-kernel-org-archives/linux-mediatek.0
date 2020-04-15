Return-Path: <SRS0=9LKV=57=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A711C38A29
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 11:50:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 019FD20732
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 11:50:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gh6u7gLa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcATTDqV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 019FD20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7bwl1DFQ54wzpWHdebW/miIL7GZgAGEhzqvVhJq1VQ=; b=Gh6u7gLaPjc6Rr
	QG/TWljsKezXWv1FhlNuAbSAcOMPeNXRncyEtFcqWNGTcLpacfOZTMiKV8adacPo901V5SJUiyCCA
	qXPbpjTxQOuSp5wZek9V0cREOFrmS2DxZblM7GWF3Qd5a5wvNmbYk6xTxAfdU7jLN+LSlEos+Fi6h
	14JsnUZ8xiFSbOILVf/Z2ZkB4L3zFXBe+Z9WraZxN9E84nctOJPwFg6dJT6PJLLhQBFSF+ypaBTWg
	LeNuH0AO3J6CddhWDT98Dv/qWb3nV2dJsmUQUIHc9fiCwob61nRsEAMD30zoc+xKxCetW6d3QtFqA
	yOCR/Dl9SDdyNURONXYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOgYf-0001aU-Em; Wed, 15 Apr 2020 11:50:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOgU2-0004J3-HH; Wed, 15 Apr 2020 11:45:36 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89DDE20768;
 Wed, 15 Apr 2020 11:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586951133;
 bh=ZdQpdMXAuKXWa7gWPIpjYwpVyeQdiVktFAnHfPKPAMU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GcATTDqVReMMCGAKNSShEXVojRmSdAHa/S4R+atCH0YTNtLwjndPj+/FSu+IXVvkx
 LN/xS3e5jlU5kBIgyXAVyg6YDG7mBkqabMDlN0IuO5Ar9XU6Wp8jYsAoO52BGgwaOW
 UbfvPWozIQi8X9X9vsmDfiLl5NnDEy600sMlgUOA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 44/84] net: dsa: mt7530: fix null pointer
 dereferencing in port5 setup
Date: Wed, 15 Apr 2020 07:44:01 -0400
Message-Id: <20200415114442.14166-44-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415114442.14166-1-sashal@kernel.org>
References: <20200415114442.14166-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_044534_637842_5CF1DA70 
X-CRM114-Status: GOOD (  10.89  )
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
Cc: Sasha Levin <sashal@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogQ2h1YW5ob25nIEd1byA8Z2NoOTgxMjEzQGdtYWlsLmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IDA0NTI4MDBmNmRiNGVkMGE0MmZmYjE1ODY3YzBhY2ZkNjg4MjlmNmEgXQoKVGhlIDJuZCBn
bWFjIG9mIG1lZGlhdGVrIHNvYyBldGhlcm5ldCBtYXkgbm90IGJlIGNvbm5lY3RlZCB0byBhIFBI
WQphbmQgYSBwaHktaGFuZGxlIGlzbid0IGFsd2F5cyBhdmFpbGFibGUuClVuZm9ydHVuYXRlbHks
IG10NzUzMCBkc2EgZHJpdmVyIGFzc3VtZXMgdGhhdCB0aGUgMm5kIGdtYWMgaXMgYWx3YXlzCmNv
bm5lY3RlZCB0byBzd2l0Y2ggcG9ydCA1IGFuZCBzZXR1cCBtdDc1MzAgYWNjb3JkaW5nIHRvIHBo
eSBhZGRyZXNzCm9mIDJuZCBnbWFjIG5vZGUsIGNhdXNpbmcgbnVsbCBwb2ludGVyIGRlcmVmZXJl
bmNpbmcgd2hlbiBwaHktaGFuZGxlCmlzbid0IGRlZmluZWQgaW4gZHRzLgpUaGlzIGNvbW1pdCBm
aXggdGhpcyBzZXR1cCBjb2RlIGJ5IGNoZWNraW5nIHJldHVybiB2YWx1ZSBvZgpvZl9wYXJzZV9w
aGFuZGxlIGJlZm9yZSB1c2luZyBpdC4KCkZpeGVzOiAzOGY3OTBhODA1NjAgKCJuZXQ6IGRzYTog
bXQ3NTMwOiBBZGQgc3VwcG9ydCBmb3IgcG9ydCA1IikKU2lnbmVkLW9mZi1ieTogQ2h1YW5ob25n
IEd1byA8Z2NoOTgxMjEzQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IFZpdmllbiBEaWRlbG90IDx2
aXZpZW4uZGlkZWxvdEBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxm
LmZhaW5lbGxpQGdtYWlsLmNvbT4KVGVzdGVkLWJ5OiBSZW7DqSB2YW4gRG9yc3QgPG9wZW5zb3Vy
Y2VAdmRvcnN0LmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZl
bWxvZnQubmV0PgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+
Ci0tLQogZHJpdmVycy9uZXQvZHNhL210NzUzMC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMgYi9k
cml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMKaW5kZXggZTBlOTMyZjBhZWQxZS4uODA3MWMzZmEzZmI3
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZHNhL210NzUzMC5jCisrKyBiL2RyaXZlcnMvbmV0
L2RzYS9tdDc1MzAuYwpAQCAtMTM1Myw2ICsxMzUzLDkgQEAgbXQ3NTMwX3NldHVwKHN0cnVjdCBk
c2Ffc3dpdGNoICpkcykKIAkJCQljb250aW51ZTsKIAogCQkJcGh5X25vZGUgPSBvZl9wYXJzZV9w
aGFuZGxlKG1hY19ucCwgInBoeS1oYW5kbGUiLCAwKTsKKwkJCWlmICghcGh5X25vZGUpCisJCQkJ
Y29udGludWU7CisKIAkJCWlmIChwaHlfbm9kZS0+cGFyZW50ID09IHByaXYtPmRldi0+b2Zfbm9k
ZS0+cGFyZW50KSB7CiAJCQkJaW50ZXJmYWNlID0gb2ZfZ2V0X3BoeV9tb2RlKG1hY19ucCk7CiAJ
CQkJaWQgPSBvZl9tZGlvX3BhcnNlX2FkZHIoZHMtPmRldiwgcGh5X25vZGUpOwotLSAKMi4yMC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
