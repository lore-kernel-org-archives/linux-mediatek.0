Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FA4C43219
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7LeCWc2c7rWDVPt7fUWVWACiNgMRAv0k1mJIm6GFbA=; b=r/I041G9J5njwQ
	G0Wi8dZIORIXlmXUMyFqJw4XytS1OVH5LCA6dtCFXEawWsUkdfHvRUgr44rM4cNnQbMc7IVWCiV0q
	uJPDuku5nIZt+0SzkUch8kINS2WnBrdZ3Sxr8VOxzGEdzLJO9FurYDq9y08OIrRZaA3MkZMazbauz
	gcD2eGXzBmTmGuKGFVa6rbRjX1EMOUeP6STez23Vx8rwS3P+FjQCBW+exB4m2Ef69r3bdq9OQBSAU
	l8pusrAVQYm104cTuKFm6wmcR4E/GIposkKYl1aKEl6hCJFCzXFBZ+/7EaltHJZTEaIqQUXDmxplv
	aQOSlSUURP9XV+drT+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfVf-006jxV-Hi; Mon, 30 May 2022 13:32:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfSi-006iA1-Tk; Mon, 30 May 2022 13:29:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 351BD60EDF;
	Mon, 30 May 2022 13:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52635C3411E;
	Mon, 30 May 2022 13:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653917375;
	bh=edmrEx74CLJEL2ZSmVTR+lC6JWHI26Po+D1lAUpwoPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zgzo1WofPfTyFeBS/NCG0AC3fF6M994h9NkKQyii/L8bUtUH8W8XrtH83Fhx8obaP
	 9JJS/+oFWGA3AjMMJ8I3+FK/urWxi3yryBcLXd4w7Nq06HYpVGngZmWWZ270JqfIEK
	 eK/eD4Ihe4Dnu5Nr8ViMytawdp3+0SKBA1nctU5ydabO8poMsPHQpbo7YIx9AXC7vG
	 p6vxCd+r+CLF97JhN9eTYFDa+Phb2VAetE58Peghi0eb+aTUTYWadfRnYtoUEfffeQ
	 XP60S4IObuZUg1vPOX6PVcR3b/Hxi0oRExbYSUwersRamOO2mRa0XX7vnEFyvCQf69
	 eOLCaTQM4OtVw==
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
Subject: [PATCH AUTOSEL 5.18 111/159] mt76: fix encap offload ethernet type check
Date: Mon, 30 May 2022 09:23:36 -0400
Message-Id: <20220530132425.1929512-111-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_062937_124618_0CAE6026 
X-CRM114-Status: GOOD (  12.69  )
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
NzkxNS9tYWMuYwppbmRleCBhOGRmNjVjYzExNWYuLmVhYTMxZjVlMGIwMCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWFjLmMKKysrIGIvZHJp
dmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWFjLmMKQEAgLTEwMTcsNiAr
MTAxNyw3IEBAIG10NzkxNV9tYWNfd3JpdGVfdHh3aV84MDIzKHN0cnVjdCBtdDc5MTVfZGV2ICpk
ZXYsIF9fbGUzMiAqdHh3aSwKIAogCXU4IHRpZCA9IHNrYi0+cHJpb3JpdHkgJiBJRUVFODAyMTFf
UU9TX0NUTF9USURfTUFTSzsKIAl1OCBmY190eXBlLCBmY19zdHlwZTsKKwl1MTYgZXRoZXJ0eXBl
OwogCWJvb2wgd21tID0gZmFsc2U7CiAJdTMyIHZhbDsKIApAQCAtMTAzMCw3ICsxMDMxLDggQEAg
bXQ3OTE1X21hY193cml0ZV90eHdpXzgwMjMoc3RydWN0IG10NzkxNV9kZXYgKmRldiwgX19sZTMy
ICp0eHdpLAogCXZhbCA9IEZJRUxEX1BSRVAoTVRfVFhEMV9IRFJfRk9STUFULCBNVF9IRFJfRk9S
TUFUXzgwMl8zKSB8CiAJICAgICAgRklFTERfUFJFUChNVF9UWEQxX1RJRCwgdGlkKTsKIAotCWlm
IChiZTE2X3RvX2NwdShza2ItPnByb3RvY29sKSA+PSBFVEhfUF84MDJfM19NSU4pCisJZXRoZXJ0
eXBlID0gZ2V0X3VuYWxpZ25lZF9iZTE2KCZza2ItPmRhdGFbMTJdKTsKKwlpZiAoZXRoZXJ0eXBl
ID49IEVUSF9QXzgwMl8zX01JTikKIAkJdmFsIHw9IE1UX1RYRDFfRVRIXzgwMl8zOwogCiAJdHh3
aVsxXSB8PSBjcHVfdG9fbGUzMih2YWwpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxl
c3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MjEvbWFjLmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRp
YXRlay9tdDc2L210NzkyMS9tYWMuYwppbmRleCBmMzQwNzBjYTdiYmUuLmM1MzUwZTdhMTFlNiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MjEvbWFj
LmMKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MjEvbWFjLmMK
QEAgLTgxNCw2ICs4MTQsNyBAQCBtdDc5MjFfbWFjX3dyaXRlX3R4d2lfODAyMyhzdHJ1Y3QgbXQ3
OTIxX2RldiAqZGV2LCBfX2xlMzIgKnR4d2ksCiB7CiAJdTggdGlkID0gc2tiLT5wcmlvcml0eSAm
IElFRUU4MDIxMV9RT1NfQ1RMX1RJRF9NQVNLOwogCXU4IGZjX3R5cGUsIGZjX3N0eXBlOworCXUx
NiBldGhlcnR5cGU7CiAJYm9vbCB3bW0gPSBmYWxzZTsKIAl1MzIgdmFsOwogCkBAIC04MjcsNyAr
ODI4LDggQEAgbXQ3OTIxX21hY193cml0ZV90eHdpXzgwMjMoc3RydWN0IG10NzkyMV9kZXYgKmRl
diwgX19sZTMyICp0eHdpLAogCXZhbCA9IEZJRUxEX1BSRVAoTVRfVFhEMV9IRFJfRk9STUFULCBN
VF9IRFJfRk9STUFUXzgwMl8zKSB8CiAJICAgICAgRklFTERfUFJFUChNVF9UWEQxX1RJRCwgdGlk
KTsKIAotCWlmIChiZTE2X3RvX2NwdShza2ItPnByb3RvY29sKSA+PSBFVEhfUF84MDJfM19NSU4p
CisJZXRoZXJ0eXBlID0gZ2V0X3VuYWxpZ25lZF9iZTE2KCZza2ItPmRhdGFbMTJdKTsKKwlpZiAo
ZXRoZXJ0eXBlID49IEVUSF9QXzgwMl8zX01JTikKIAkJdmFsIHw9IE1UX1RYRDFfRVRIXzgwMl8z
OwogCiAJdHh3aVsxXSB8PSBjcHVfdG9fbGUzMih2YWwpOwotLSAKMi4zNS4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
