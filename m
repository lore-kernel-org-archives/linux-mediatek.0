Return-Path: <SRS0=inF0=5E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82781C4332D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 13:48:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55F702080C
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 13:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JBhf8lnk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vdorst.com header.i=@vdorst.com header.b="noV2Bi8S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55F702080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kfu4QhKbpLNiT1Y6/+mV/nhnjJMabUrH9ohXEm1L3BQ=; b=JBhf8lnkCSeL/e
	9Fzo0V8eL5cMfN1J5DmBmhpZX/VErec3R480XDKOqOhzLTx2GW9Ht08J6sTfmAVdDDLK5H1zFyl0y
	rXPyq42T92fykgHaSBPMKTAPuSOF4GhanD6zLLd+TWtWx97jUU8f/pnAxwYj3klMjQwQwae2fiagI
	6sxorqGrYaBzfeLdb8k7hdf+5xFTRlLilVJTo/G3snYtY0a9tu0W8dikloolqlajl0se7Kh23zhZu
	49CHYgbz51wcU4iHRDMFI/imtBqDZNXItpp/YjX1x4RthvbSPwYoZ/cUD8ekqImQe61jfiH24E1oa
	0Iuz/oQjwf+AOMkH3xGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEvX5-0007Cl-CI; Thu, 19 Mar 2020 13:48:23 +0000
Received: from mx.0dd.nl ([2a04:52c0:101:921::25])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEvX0-0007BB-Uz
 for linux-mediatek@lists.infradead.org; Thu, 19 Mar 2020 13:48:21 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx.0dd.nl (Postfix) with ESMTPS id 0BB065FAE6;
 Thu, 19 Mar 2020 14:48:14 +0100 (CET)
Authentication-Results: mx.0dd.nl; dkim=pass (2048-bit key;
 secure) header.d=vdorst.com header.i=@vdorst.com header.b="noV2Bi8S"; 
 dkim-atps=neutral
Received: from pc-rene-vdorst-com.vdorst.com (pc-rene-vdorst-com.vdorst.com
 [192.168.2.14])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id B65A424FCBC;
 Thu, 19 Mar 2020 14:48:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com B65A424FCBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1584625693;
 bh=O6YczJK1x6AOo1kB2bIezDwDRopcG6VypEaDqIBfUMM=;
 h=From:To:Cc:Subject:Date:From;
 b=noV2Bi8S9TcIClj7xR6/P0K1PQmfRwkoO4jN2XGaSGv4LIWM/62TmvBatR57czl/6
 sy/4wFrEg2MF6bJoLFxGrmJ+E/J5ZxetESI6iy5pfW786/vqUFvhZ0/omebB2oRYuG
 UUCcO/riKC6BYTspGaK/l67IdOuTChEF0/Ybykcd+X7gA+i8NMNRp+TX4zS5d/G+jB
 UJYaLV5ELFKMXpsQU8QYRCT5Y4ZStzHdE6/kuC6gNxvuDJWZ3pUD8r0z76mYXiI4QC
 8KQ+h3lymmO9AlYtkWfWFt9LHV8wAcpjMvQqiC2HEADRk6w9vbGrEBFw0D8vzn0IKk
 +H8D2ybk/7Kdw==
From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
To: netdev@vger.kernel.org
Subject: [[PATCH,
 net]] net: dsa: mt7530: Change the LINK bit to reflect the link status
Date: Thu, 19 Mar 2020 14:47:56 +0100
Message-Id: <20200319134756.46428-1-opensource@vdorst.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_064819_551753_065540C0 
X-CRM114-Status: GOOD (  14.19  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <landen.chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Smith <andrew.smith@digi.com>,
 Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

QW5kcmV3IHJlcG9ydGVkOgoKQWZ0ZXIgYSBudW1iZXIgb2YgbmV0d29yayBwb3J0IGxpbmsgdXAv
ZG93biBjaGFuZ2VzLCBzb21ldGltZXMgdGhlIHN3aXRjaApwb3J0IGdldHMgc3R1Y2sgaW4gYSBz
dGF0ZSB3aGVyZSBpdCB0aGlua3MgaXQgaXMgc3RpbGwgdHJhbnNtaXR0aW5nIHBhY2tldHMKYnV0
IHRoZSBjcHUgcG9ydCBpcyBub3QgYWN0dWFsbHkgdHJhbnNtaXR0aW5nIGFueW1vcmUuIEluIHRo
aXMgc3RhdGUgeW91CndpbGwgc2VlIGEgbWVzc2FnZSBvbiB0aGUgY29uc29sZQoibXRrX3NvY19l
dGggMWUxMDAwMDAuZXRoZXJuZXQgZXRoMDogdHJhbnNtaXQgdGltZWQgb3V0IiBhbmQgdGhlIFR4
IGNvdW50ZXIKaW4gaWZjb25maWcgd2lsbCBiZSBpbmNyZW1lbnRpbmcgb24gdmlydHVhbCBwb3J0
LCBidXQgbm90IGluY3JlbWVudGluZyBvbgpjcHUgcG9ydC4KClRoZSBpc3N1ZSBpcyB0aGF0IE1B
QyBUWC9SWCBzdGF0dXMgaGFzIG5vIGltcGFjdCBvbiB0aGUgbGluayBzdGF0dXMgb3IKcXVldWUg
bWFuYWdlciBvZiB0aGUgc3dpdGNoLiBTbyB0aGUgcXVldWUgbWFuYWdlciBqdXN0IHF1ZXVlcyB1
cCBwYWNrZXRzCm9mIGEgZGlzYWJsZWQgcG9ydCBhbmQgc2VuZHMgb3V0IHBhdXNlIGZyYW1lcyB3
aGVuIHRoZSBxdWV1ZSBpcyBmdWxsLgoKQ2hhbmdlIHRoZSBMSU5LIGJpdCB0byByZWZsZWN0IHRo
ZSBsaW5rIHN0YXR1cy4KCkZpeGVzOiBiOGYxMjZhOGQ1NDMgKCJuZXQtbmV4dDogZHNhOiBhZGQg
ZHNhIHN1cHBvcnQgZm9yIE1lZGlhdGVrIE1UNzUzMCBzd2l0Y2giKQpSZXBvcnRlZC1ieTogQW5k
cmV3IFNtaXRoIDxhbmRyZXcuc21pdGhAZGlnaS5jb20+ClNpZ25lZC1vZmYtYnk6IFJlbsOpIHZh
biBEb3JzdCA8b3BlbnNvdXJjZUB2ZG9yc3QuY29tPgotLS0KIGRyaXZlcnMvbmV0L2RzYS9tdDc1
MzAuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMgYi9kcml2ZXJzL25l
dC9kc2EvbXQ3NTMwLmMKaW5kZXggOWVlM2YyNjNkNTI5Li5kNDIyZDNkNmExMjkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAuYworKysgYi9kcml2ZXJzL25ldC9kc2EvbXQ3NTMw
LmMKQEAgLTU2Niw3ICs1NjYsNyBAQCBtdDc1MzBfbWliX3Jlc2V0KHN0cnVjdCBkc2Ffc3dpdGNo
ICpkcykKIHN0YXRpYyB2b2lkCiBtdDc1MzBfcG9ydF9zZXRfc3RhdHVzKHN0cnVjdCBtdDc1MzBf
cHJpdiAqcHJpdiwgaW50IHBvcnQsIGludCBlbmFibGUpCiB7Ci0JdTMyIG1hc2sgPSBQTUNSX1RY
X0VOIHwgUE1DUl9SWF9FTjsKKwl1MzIgbWFzayA9IFBNQ1JfVFhfRU4gfCBQTUNSX1JYX0VOIHwg
UE1DUl9GT1JDRV9MTks7CiAKIAlpZiAoZW5hYmxlKQogCQltdDc1MzBfc2V0KHByaXYsIE1UNzUz
MF9QTUNSX1AocG9ydCksIG1hc2spOwpAQCAtMTUxMiw3ICsxNTEyLDcgQEAgc3RhdGljIHZvaWQg
bXQ3NTMwX3BoeWxpbmtfbWFjX2NvbmZpZyhzdHJ1Y3QgZHNhX3N3aXRjaCAqZHMsIGludCBwb3J0
LAogCW1jcl9uZXcgJj0gfihQTUNSX0ZPUkNFX1NQRUVEXzEwMDAgfCBQTUNSX0ZPUkNFX1NQRUVE
XzEwMCB8CiAJCSAgICAgUE1DUl9GT1JDRV9GRFggfCBQTUNSX1RYX0ZDX0VOIHwgUE1DUl9SWF9G
Q19FTik7CiAJbWNyX25ldyB8PSBQTUNSX0lGR19YTUlUKDEpIHwgUE1DUl9NQUNfTU9ERSB8IFBN
Q1JfQkFDS09GRl9FTiB8Ci0JCSAgIFBNQ1JfQkFDS1BSX0VOIHwgUE1DUl9GT1JDRV9NT0RFIHwg
UE1DUl9GT1JDRV9MTks7CisJCSAgIFBNQ1JfQkFDS1BSX0VOIHwgUE1DUl9GT1JDRV9NT0RFOwog
CiAJLyogQXJlIHdlIGNvbm5lY3RlZCB0byBleHRlcm5hbCBwaHkgKi8KIAlpZiAocG9ydCA9PSA1
ICYmIGRzYV9pc191c2VyX3BvcnQoZHMsIDUpKQotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
