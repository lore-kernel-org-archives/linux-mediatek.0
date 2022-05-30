Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0ACC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 14:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeBr6fd31YXRNbEMLoF54OAyLbar6aPxZiIDX1pIzGc=; b=vnBvVe0qT08NsJ
	+FmuhqMgnVRFF7pmPDFLPlTSYGimq8hCHbY7iVDH/uDKkWII0LCnN/36YpqSKW/342ZR5oVRH/tJH
	5xF7eizv2+25HcvqWDaSjeTLhIMUDv+5j0W0btv5qCWtB0KLTo29KjXU9hrqDvkXBLTTqY8rWimNr
	V5c01DycwbdQzQnDZWnfvu2CNCtulrYlX7ChfyAqcygBbgLUatKy8S9uFysBzxvZSamKqYGjToiJ6
	xiEkxBUDslSGYXwzAdlZaAxaj6S1ViOvCee9lp/kXx3Y1c8OMd0OzctIIlyLJEnOup5LFo+dchHNj
	kIFKH5wq3ld1dOQ+0WPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfzL-0071LI-Aq; Mon, 30 May 2022 14:03:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvff5-006pSb-Pj; Mon, 30 May 2022 13:42:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C7CF560FC9;
	Mon, 30 May 2022 13:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22962C3411E;
	Mon, 30 May 2022 13:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653918141;
	bh=z0nAyk/VU0ksVU4YbjsvPBgUNPDMbbrVaHL11Of9pZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tcXUM9Mt00yqROSr4JfU7kluOvUjdAknUI2SlVrSKG3DEbo6oBNNqurQYE5X8MSXg
	 gQxUx9jP8QhM43z1uz6cfOQUhN/KzDzt2k3rnsvsWuaG0uwYPvfkg2K6TUqVIbXifo
	 VQznQaLbo3RLRYCQ3ghfP4w/UMwAIwKW34fsTyCvrsCXmvKUroeEVQurnNnl5TJkVq
	 FvbomnConRUsXi3coHcXUWikpQT3QHLQz8rgwxwq0DjfiKdxJQrAsbxV7DalEo/8j1
	 IXEb44q5+DLBbcuGv2kUX6ryAald9QmtkF+pTpBG+/kRUvl/ESW7pNbmDi62BAtXu8
	 cOjDI3Q0pzQuA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks+kernel@slashdirt.org>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	shayne.chen@mediatek.com,
	greearb@candelatech.com,
	sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	xing.song@mediatek.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 075/109] mt76: fix encap offload ethernet type check
Date: Mon, 30 May 2022 09:37:51 -0400
Message-Id: <20220530133825.1933431-75-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133825.1933431-1-sashal@kernel.org>
References: <20220530133825.1933431-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_064223_999154_765B1649 
X-CRM114-Status: GOOD (  12.67  )
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

RnJvbTogRmVsaXggRmlldGthdSA8bmJkQG5iZC5uYW1lPgoKWyBVcHN0cmVhbSBjb21taXQgYmM5
OGU3ZmRkODBkMjE1YjRiNTVlZWEwMDEwMjMyMzFlYjhjZTEyZSBdCgpUaGUgZHJpdmVyIG5lZWRz
IHRvIGNoZWNrIGlmIHRoZSBmb3JtYXQgaXMgODAyLjIgdnMgODAyLjMgaW4gb3JkZXIgdG8gc2V0
CmEgdHggZGVzY3JpcHRvciBmbGFnLiBza2ItPnByb3RvY29sIGNhbid0IGJlIHVzZWQsIHNpbmNl
IGl0IG1heSBub3QgYmUgcHJvcGVybHkKaW5pdGlhbGl6ZWQgZm9yIHBhY2tldHMgY29taW5nIGlu
IGZyb20gYSBwYWNrZXQgc29ja2V0LgpGaXggbWlzZGV0ZWN0aW9uIGJ5IGNoZWNraW5nIHRoZSBl
dGhlcnR5cGUgZnJvbSB0aGUgc2tiIGRhdGEgaW5zdGVhZAoKUmVwb3J0ZWQtYnk6IFRoaWJhdXQg
VkFSw4hORSA8aGFja3Mra2VybmVsQHNsYXNoZGlydC5vcmc+ClNpZ25lZC1vZmYtYnk6IEZlbGl4
IEZpZXRrYXUgPG5iZEBuYmQubmFtZT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hh
bEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3
OTE1L21hYy5jIHwgNCArKystCiBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210
NzkyMS9tYWMuYyB8IDQgKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsv
bXQ3Ni9tdDc5MTUvbWFjLmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210
NzkxNS9tYWMuYwppbmRleCA3NjkxMjkyNTI2ZTAuLmE4YTBlNmFmNTFmOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWFjLmMKKysrIGIvZHJp
dmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWFjLmMKQEAgLTc5OSw2ICs3
OTksNyBAQCBtdDc5MTVfbWFjX3dyaXRlX3R4d2lfODAyMyhzdHJ1Y3QgbXQ3OTE1X2RldiAqZGV2
LCBfX2xlMzIgKnR4d2ksCiAKIAl1OCB0aWQgPSBza2ItPnByaW9yaXR5ICYgSUVFRTgwMjExX1FP
U19DVExfVElEX01BU0s7CiAJdTggZmNfdHlwZSwgZmNfc3R5cGU7CisJdTE2IGV0aGVydHlwZTsK
IAlib29sIHdtbSA9IGZhbHNlOwogCXUzMiB2YWw7CiAKQEAgLTgxMiw3ICs4MTMsOCBAQCBtdDc5
MTVfbWFjX3dyaXRlX3R4d2lfODAyMyhzdHJ1Y3QgbXQ3OTE1X2RldiAqZGV2LCBfX2xlMzIgKnR4
d2ksCiAJdmFsID0gRklFTERfUFJFUChNVF9UWEQxX0hEUl9GT1JNQVQsIE1UX0hEUl9GT1JNQVRf
ODAyXzMpIHwKIAkgICAgICBGSUVMRF9QUkVQKE1UX1RYRDFfVElELCB0aWQpOwogCi0JaWYgKGJl
MTZfdG9fY3B1KHNrYi0+cHJvdG9jb2wpID49IEVUSF9QXzgwMl8zX01JTikKKwlldGhlcnR5cGUg
PSBnZXRfdW5hbGlnbmVkX2JlMTYoJnNrYi0+ZGF0YVsxMl0pOworCWlmIChldGhlcnR5cGUgPj0g
RVRIX1BfODAyXzNfTUlOKQogCQl2YWwgfD0gTVRfVFhEMV9FVEhfODAyXzM7CiAKIAl0eHdpWzFd
IHw9IGNwdV90b19sZTMyKHZhbCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9t
ZWRpYXRlay9tdDc2L210NzkyMS9tYWMuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVr
L210NzYvbXQ3OTIxL21hYy5jCmluZGV4IDUwMjRkZGYwN2NiYy4uYmVmOGQ0YTc2ZWQ5IDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzkyMS9tYWMuYwor
KysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzkyMS9tYWMuYwpAQCAt
NjgxLDYgKzY4MSw3IEBAIG10NzkyMV9tYWNfd3JpdGVfdHh3aV84MDIzKHN0cnVjdCBtdDc5MjFf
ZGV2ICpkZXYsIF9fbGUzMiAqdHh3aSwKIHsKIAl1OCB0aWQgPSBza2ItPnByaW9yaXR5ICYgSUVF
RTgwMjExX1FPU19DVExfVElEX01BU0s7CiAJdTggZmNfdHlwZSwgZmNfc3R5cGU7CisJdTE2IGV0
aGVydHlwZTsKIAlib29sIHdtbSA9IGZhbHNlOwogCXUzMiB2YWw7CiAKQEAgLTY5NCw3ICs2OTUs
OCBAQCBtdDc5MjFfbWFjX3dyaXRlX3R4d2lfODAyMyhzdHJ1Y3QgbXQ3OTIxX2RldiAqZGV2LCBf
X2xlMzIgKnR4d2ksCiAJdmFsID0gRklFTERfUFJFUChNVF9UWEQxX0hEUl9GT1JNQVQsIE1UX0hE
Ul9GT1JNQVRfODAyXzMpIHwKIAkgICAgICBGSUVMRF9QUkVQKE1UX1RYRDFfVElELCB0aWQpOwog
Ci0JaWYgKGJlMTZfdG9fY3B1KHNrYi0+cHJvdG9jb2wpID49IEVUSF9QXzgwMl8zX01JTikKKwll
dGhlcnR5cGUgPSBnZXRfdW5hbGlnbmVkX2JlMTYoJnNrYi0+ZGF0YVsxMl0pOworCWlmIChldGhl
cnR5cGUgPj0gRVRIX1BfODAyXzNfTUlOKQogCQl2YWwgfD0gTVRfVFhEMV9FVEhfODAyXzM7CiAK
IAl0eHdpWzFdIHw9IGNwdV90b19sZTMyKHZhbCk7Ci0tIAoyLjM1LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
