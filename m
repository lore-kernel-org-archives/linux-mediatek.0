Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7B5C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1o/+DhyPN8YHimb4z3f+N7dhvSfDM6E9bS8J+Pa6Iw=; b=u6sq97lxq6ICGL
	M4dmRX6LI9f/ProxHnENG+A85B7Qkbsk43jsHwmCXNwwNryK9IhryRJjq6Ufc6IJdUUPeZbZ3uZ7x
	9/vxpbqMHE1AVqlyPe8jpsT/TAvLhl0YYdwROksoAYibEmLGEIJeDTN+3XCPNa6OkfggtoxIYWWye
	OSoNsj1/DAFueRFaHwdi3URKTW+JVFP5FdL8qwFo5qmnDP8wJwR6u7LB9SeALaajxYXc+WIGAlgwT
	U2WbDrewlXdBiPCiyIsA+mW+vrRTcF9iWIYAJ20oC9bQBa0DSabMt9ifq5IDKh+afbCEQfNR82IZS
	FK5jjViZq32a8wkABEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfmV-006tyP-7O; Mon, 30 May 2022 13:50:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfZ9-006lqs-3a; Mon, 30 May 2022 13:36:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7AB4B60F27;
	Mon, 30 May 2022 13:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E4EC3411C;
	Mon, 30 May 2022 13:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653917773;
	bh=WXE3h52fOurnVlECd+Kj5Tga/VKW/SB9MyprE7My13k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D/JirQRGC/n8ozTuSMPkWaIsS5pyXA3pi9SDx67N3DrF0gappJufL9QnvP3c6kv3t
	 FJvnI9hOyTB2zrsSCbmcqukUkq00XhLg00uYc4O8O0QGISIcCz4C4dXD0OSTspcGOZ
	 8YJ2TFUOVpgPLpzVeKp7+HbFYIfM2nTUMDb2K3XnEUc0Bp0XWsKS+lVfVibiytGVdQ
	 QCkP6K0i0pJ+k/IEXcsR2qsFpNkS+kIUqE2LqKlWf9irntdA3Wce9tFR3t94pffjD7
	 5w6SWIwoRofdOn1gM30Ps+mn7guGkbLUf5Cmd5zbz0TzoOso6iD9YWB3mMtc4NAAxd
	 6lWP04tPE5c2w==
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
	greearb@candelatech.com,
	sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	xing.song@mediatek.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.17 092/135] mt76: fix encap offload ethernet type check
Date: Mon, 30 May 2022 09:30:50 -0400
Message-Id: <20220530133133.1931716-92-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133133.1931716-1-sashal@kernel.org>
References: <20220530133133.1931716-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_063615_321201_132E8FA0 
X-CRM114-Status: GOOD (  12.77  )
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
NzkxNS9tYWMuYwppbmRleCBlNGMzMDBhYTE1MjYuLmVmYzA0ZjdhM2M3MSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWFjLmMKKysrIGIvZHJp
dmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWFjLmMKQEAgLTk4Miw2ICs5
ODIsNyBAQCBtdDc5MTVfbWFjX3dyaXRlX3R4d2lfODAyMyhzdHJ1Y3QgbXQ3OTE1X2RldiAqZGV2
LCBfX2xlMzIgKnR4d2ksCiAKIAl1OCB0aWQgPSBza2ItPnByaW9yaXR5ICYgSUVFRTgwMjExX1FP
U19DVExfVElEX01BU0s7CiAJdTggZmNfdHlwZSwgZmNfc3R5cGU7CisJdTE2IGV0aGVydHlwZTsK
IAlib29sIHdtbSA9IGZhbHNlOwogCXUzMiB2YWw7CiAKQEAgLTk5NSw3ICs5OTYsOCBAQCBtdDc5
MTVfbWFjX3dyaXRlX3R4d2lfODAyMyhzdHJ1Y3QgbXQ3OTE1X2RldiAqZGV2LCBfX2xlMzIgKnR4
d2ksCiAJdmFsID0gRklFTERfUFJFUChNVF9UWEQxX0hEUl9GT1JNQVQsIE1UX0hEUl9GT1JNQVRf
ODAyXzMpIHwKIAkgICAgICBGSUVMRF9QUkVQKE1UX1RYRDFfVElELCB0aWQpOwogCi0JaWYgKGJl
MTZfdG9fY3B1KHNrYi0+cHJvdG9jb2wpID49IEVUSF9QXzgwMl8zX01JTikKKwlldGhlcnR5cGUg
PSBnZXRfdW5hbGlnbmVkX2JlMTYoJnNrYi0+ZGF0YVsxMl0pOworCWlmIChldGhlcnR5cGUgPj0g
RVRIX1BfODAyXzNfTUlOKQogCQl2YWwgfD0gTVRfVFhEMV9FVEhfODAyXzM7CiAKIAl0eHdpWzFd
IHw9IGNwdV90b19sZTMyKHZhbCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9t
ZWRpYXRlay9tdDc2L210NzkyMS9tYWMuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVr
L210NzYvbXQ3OTIxL21hYy5jCmluZGV4IGUwNzcwN2Y1MThhMi4uZWFjMmQ4NWI1ODY0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzkyMS9tYWMuYwor
KysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzkyMS9tYWMuYwpAQCAt
ODE2LDYgKzgxNiw3IEBAIG10NzkyMV9tYWNfd3JpdGVfdHh3aV84MDIzKHN0cnVjdCBtdDc5MjFf
ZGV2ICpkZXYsIF9fbGUzMiAqdHh3aSwKIHsKIAl1OCB0aWQgPSBza2ItPnByaW9yaXR5ICYgSUVF
RTgwMjExX1FPU19DVExfVElEX01BU0s7CiAJdTggZmNfdHlwZSwgZmNfc3R5cGU7CisJdTE2IGV0
aGVydHlwZTsKIAlib29sIHdtbSA9IGZhbHNlOwogCXUzMiB2YWw7CiAKQEAgLTgyOSw3ICs4MzAs
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
