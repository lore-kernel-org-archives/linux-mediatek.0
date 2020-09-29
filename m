Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AD9C4727C
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 01:30:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91168216C4
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 01:30:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kVT73AYV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLhgSvA4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91168216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z2iUFVhqN/AG1VyeS1scTILEK0k3rpkL02XkF6y4VXs=; b=kVT73AYVn6luZ1/0K9AW9to5p
	0TBe+oO6evOmAJW92ywHwNzPo2wqgdNYpNOAD5RMa6YsVkDjkXqAV0XvlkjVce6IQ8rQVsd3Ya2sf
	BOpMbQgzb0cNFK0N8U3m1SYL4fEQlmzEHIN2hD3PuV1C5/yUS9YWq7kSL2FHBsjIQAy80GLUg0VkO
	oehAM7+joSIOKEzy3srtCuWfi98Vdt6PRwine/gKZWaYNUVoHRiaoAMtwax8HOxMrS3qIZQzQY4Wp
	TVw80HnmAKPHmfTLC4jaAxkWPtOnGWvyB0S0ikSjxcpf5Ds27BBa8lu8S8Q87AEThhH4X2m3mO4gN
	AIrA1qrKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kN4TY-00078h-8L; Tue, 29 Sep 2020 01:30:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kN4TT-00077M-RP; Tue, 29 Sep 2020 01:30:36 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1749D20678;
 Tue, 29 Sep 2020 01:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601343032;
 bh=41COe5x7JjD1OwT5Ov3l1HjeqLrAse49svUyDHzocaU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CLhgSvA4xq02Lz8Ei0c/KN2TB6mD3QSsLkPiJJ3ZrL9SCZfGKFb/xstXxaNamrpGH
 rSJPbmA+504RfW2sSE5sXbzWZ1vJZWJrp8IvE+1yLZ8iV0ax1BaHzCUJBJszvW7ZJF
 KAxUJw4L3M5WhjBK3LvXSA7pq8COtzOmIZ2TUvmc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 03/29] mt76: mt7915: use ieee80211_free_txskb to
 free tx skbs
Date: Mon, 28 Sep 2020 21:30:00 -0400
Message-Id: <20200929013027.2406344-3-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929013027.2406344-1-sashal@kernel.org>
References: <20200929013027.2406344-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_213035_961964_E5B69D70 
X-CRM114-Status: GOOD (  12.72  )
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
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogRmVsaXggRmlldGthdSA8bmJkQG5iZC5uYW1lPgoKWyBVcHN0cmVhbSBjb21taXQgYjRi
ZTVhNTNlYmY0NzhmZmNmYjRjOThjMGNjYzRhOGQ5MjJiOWEwMiBdCgpVc2luZyBkZXZfa2ZyZWVf
c2tiIGZvciB0eCBza2JzIGJyZWFrcyBBUUwuIFRoaXMgd29ya2VkIHVudGlsIG5vdyBvbmx5CmJ5
IGFjY2lkZW50LCBiZWNhdXNlIGEgbWFjODAyMTEgaXNzdWUgYnJlYWtzIEFRTCBvbiBkcml2ZXJz
IHdpdGggZmlybXdhcmUKcmF0ZSBjb250cm9sIHRoYXQgcmVwb3J0IHRoZSByYXRlIHZpYSBpZWVl
ODAyMTFfdHhfc3RhdHVzX2V4dCBhcyBzdHJ1Y3QKcmF0ZV9pbmZvLgoKU2lnbmVkLW9mZi1ieTog
RmVsaXggRmlldGthdSA8bmJkQG5iZC5uYW1lPgpBY2tlZC1ieTogVG9rZSBIw7hpbGFuZC1Kw7hy
Z2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEthbGxlIFZhbG8gPGt2YWxv
QGNvZGVhdXJvcmEub3JnPgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjAwODEy
MTQ0OTQzLjkxOTc0LTEtbmJkQG5iZC5uYW1lClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxz
YXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2
L210NzkxNS9pbml0LmMgfCA4ICsrKysrKy0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRl
ay9tdDc2L210NzkxNS9tYWMuYyAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9t
ZWRpYXRlay9tdDc2L210NzkxNS9pbml0LmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRl
ay9tdDc2L210NzkxNS9pbml0LmMKaW5kZXggYWFkZjU2ZTgwYmFlOC4uZDdhM2IwNWFiNTBjMyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvaW5p
dC5jCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3OTE1L2luaXQu
YwpAQCAtNjkxLDggKzY5MSwxMiBAQCB2b2lkIG10NzkxNV91bnJlZ2lzdGVyX2RldmljZShzdHJ1
Y3QgbXQ3OTE1X2RldiAqZGV2KQogCXNwaW5fbG9ja19iaCgmZGV2LT50b2tlbl9sb2NrKTsKIAlp
ZHJfZm9yX2VhY2hfZW50cnkoJmRldi0+dG9rZW4sIHR4d2ksIGlkKSB7CiAJCW10NzkxNV90eHBf
c2tiX3VubWFwKCZkZXYtPm10NzYsIHR4d2kpOwotCQlpZiAodHh3aS0+c2tiKQotCQkJZGV2X2tm
cmVlX3NrYl9hbnkodHh3aS0+c2tiKTsKKwkJaWYgKHR4d2ktPnNrYikgeworCQkJc3RydWN0IGll
ZWU4MDIxMV9odyAqaHc7CisKKwkJCWh3ID0gbXQ3Nl90eF9zdGF0dXNfZ2V0X2h3KCZkZXYtPm10
NzYsIHR4d2ktPnNrYik7CisJCQlpZWVlODAyMTFfZnJlZV90eHNrYihodywgdHh3aS0+c2tiKTsK
KwkJfQogCQltdDc2X3B1dF90eHdpKCZkZXYtPm10NzYsIHR4d2kpOwogCX0KIAlzcGluX3VubG9j
a19iaCgmZGV2LT50b2tlbl9sb2NrKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNz
L21lZGlhdGVrL210NzYvbXQ3OTE1L21hYy5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0
ZWsvbXQ3Ni9tdDc5MTUvbWFjLmMKaW5kZXggYTI2NGUzMDRhM2RmYi4uNTgwMGIyZDFmYjIzMyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWFj
LmMKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWFjLmMK
QEAgLTg0NCw3ICs4NDQsNyBAQCBtdDc5MTVfdHhfY29tcGxldGVfc3RhdHVzKHN0cnVjdCBtdDc2
X2RldiAqbWRldiwgc3RydWN0IHNrX2J1ZmYgKnNrYiwKIAlpZiAoc3RhIHx8ICEoaW5mby0+Zmxh
Z3MgJiBJRUVFODAyMTFfVFhfQ1RMX05PX0FDSykpCiAJCW10NzkxNV90eF9zdGF0dXMoc3RhLCBo
dywgaW5mbywgTlVMTCk7CiAKLQlkZXZfa2ZyZWVfc2tiKHNrYik7CisJaWVlZTgwMjExX2ZyZWVf
dHhza2IoaHcsIHNrYik7CiB9CiAKIHZvaWQgbXQ3OTE1X3R4cF9za2JfdW5tYXAoc3RydWN0IG10
NzZfZGV2ICpkZXYsCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
