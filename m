Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E71C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 15:58:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ED9222E01
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 15:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jTEiiyPn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="T6rsCij1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ED9222E01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vfNkpZac6XUq4R/DK80gQ8EDHxBasZgnNYoBA3gk2g8=; b=jTEiiyPnAHj0GMzzJ+CowACE8n
	YD/UL5hDgITa/9Wo5hUmJKwgok/fZ/AUq6bkl5ID9C5u87/dB81wrjBEVkv4SLdgg7PO23/Ktfc3t
	WMr1WqKNmJ/Lw+Qdf7eiZOVSGCO10G1losoZzYj0w7Tp2z2E7LT1hEh0mZCFaB9AaftMiSDmDXfrJ
	pDDkwc3dq52GNk3EUiHTjjnPzknxjIeFjvZtYUZiwapl0mo+cdYQPOqBziJRNqI7Tsz7HOw37SsPu
	T02CSKi1soImjCSJWQjZ5PsXeI1is76gnrQ/dmRqhs7zypX64dzAUi3Ho05EZiIJsG5vWbDhn+4+g
	uJAbu6Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3iI0-0003uW-4j; Thu, 06 Aug 2020 15:58:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3iHx-0003u0-0c; Thu, 06 Aug 2020 15:58:42 +0000
X-UUID: d3289bf2109a404ea609ebdaed348894-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=OtJd/yRRZV8IvkNBbGFYLaPgoO8DWoAzhEC+fs64370=; 
 b=T6rsCij1uCd9/OEjGIssBIhMIxwXMYtiMCMd0VsqyWPgrdzoU3Pe+aoAClLqm2LzQgHAgmKVANH3COsw6Bulk1eSLcjyZThm98tfPtbttAq7nDOcWwwijoU+Hdh3rvVLIgENNDwMoB92hgjk5VU5Z6+7QgCxoLcnJf1dJ166uvs=;
X-UUID: d3289bf2109a404ea609ebdaed348894-20200806
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <frederic.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1389352060; Thu, 06 Aug 2020 07:58:33 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 08:58:29 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 23:58:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Aug 2020 23:58:29 +0800
From: <frederic.chen@mediatek.com>
To: <hans.verkuil@cisco.com>, <laurent.pinchart+renesas@ideasonboard.com>,
 <tfiga@chromium.org>, <matthias.bgg@gmail.com>, <mchehab@kernel.org>
Subject: [PATCH V2, 0/1] media: change media_device_request_alloc to match
 media_ioctl_info
Date: Thu, 6 Aug 2020 23:58:21 +0800
Message-ID: <20200806155822.3772-1-frederic.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_115841_187336_A1BEAD34 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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
Cc: Sean.Cheng@mediatek.com, srv_heupstream@mediatek.com, sj.huang@mediatek.com,
 yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org,
 christie.yu@mediatek.com, frederic.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGVsbG8sDQoNClRoaXMgcGF0Y2ggaXMgdG8gbW9kaWZ5IG1lZGlhX2RldmljZV9yZXF1ZXN0X2Fs
bG9jKCkgc28gdGhhdCBpdCBjYW4gcGFzcw0KQ0ZJKENvbnRyb2wgRmxvdyBJbnRlZ3JpdHkpIGNo
ZWNrLiBJIHdvdWxkIGxpa2Ugc29tZSByZXZpZXcgY29tbWVudHMuDQoNCm1lZGlhX2RldmljZV9y
ZXF1ZXN0X2FsbG9jKCkgaXMgc2F2ZWQgaW4gZm4gb2YgbWVkaWFfaW9jdGxfaW5mbyBzdHJ1Y3Qs
DQp3aGljaCBpcyBkZWZpbmVkIGFzIGxvbmcgKCpmbikoc3RydWN0IG1lZGlhX2RldmljZSAqZGV2
LCB2b2lkICphcmcpLiBUaGUNCnR5cGUgb2YgdGhlIHNlY29uZCBwYXJhbWV0ZXIgb2YgbWVkaWFf
ZGV2aWNlX3JlcXVlc3RfYWxsb2MoKSBpcyBpbnQqIG5vdywNCmJ1dCBpdCBpcyB2b2lkKiBpbiBm
biBvZiBtZWRpYV9pb2N0bF9pbmZvLiBXZSBnb3Qgc29tZSBBQkkgdmlvbGF0aW9uIGhlcmUuDQpU
aGVyZWZvcmUsIHdlIHdvdWxkIGxpa2UgdG8gdXNlIHZvaWQqIGluc3RlYWQgb2YgaW50KiBmb3Ig
dGhlIHNlY29uZA0KcGFyYW1ldGVyIG9mIG1lZGlhX2RldmljZV9yZXF1ZXN0X2FsbG9jKCkuDQoN
CnN0YXRpYyBsb25nIG1lZGlhX2RldmljZV9yZXF1ZXN0X2FsbG9jKHN0cnVjdCBtZWRpYV9kZXZp
Y2UgKm1kZXYsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgKmFs
bG9jX2ZkKTsNCg0Kc3RydWN0IG1lZGlhX2lvY3RsX2luZm8gew0KICAgICAgICB1bnNpZ25lZCBp
bnQgY21kOw0KICAgICAgICB1bnNpZ25lZCBzaG9ydCBmbGFnczsNCiAgICAgICAgbG9uZyAoKmZu
KShzdHJ1Y3QgbWVkaWFfZGV2aWNlICpkZXYsIHZvaWQgKmFyZyk7DQogICAgICAgIGxvbmcgKCph
cmdfZnJvbV91c2VyKSh2b2lkICprYXJnLCB2b2lkIF9fdXNlciAqdWFyZywgdW5zaWduZWQgaW50
IGNtZCk7DQogICAgICAgIGxvbmcgKCphcmdfdG9fdXNlcikodm9pZCBfX3VzZXIgKnVhcmcsIHZv
aWQgKmthcmcsIHVuc2lnbmVkIGludCBjbWQpOw0KfTsNCg0KDQpIZXJlIGlzIGFuIGV4YW1wbGUu
IFdpdGggQW5kcm9pZOKAmXMgQ0ZJIGNoZWNraW5nLCB3ZSBnb3QgdGhlIGZvbGxvd2luZyBlcnJv
cg0Kd2l0aG91dCB0aGlzIGNoYW5nZS4NCg0KWyAgIDIzLjUwMjQ3N10gbXRrLWNhbSBzb2M6Y2Ft
aXNwOiBzZDptdGstY2FtIHJhdy0wIHBhZDoyIHNldCBmb3JtYXQgdy9oL2NvZGUgMjMyOC8xNzQ4
LzB4MzAwNw0KWyAgIDIzLjUxODY5MF0gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IENGSSBm
YWlsdXJlICh0YXJnZXQ6IG1lZGlhX2RldmljZV9yZXF1ZXN0X2FsbG9jKzB4MC8weDQpDQpbICAg
MjMuNTE5ODA0XSBDUFU6IDcgUElEOiA4MTggQ29tbTogbXRrdjRsMl91dCBUYWludGVkOiBHIFMg
ICAgICAgICBPICAgICAgNS40LjM5LWcwMmMwYTQ4NThiZWQtZGlydHkgIzQ1DQpbICAgMjMuNTIx
NTUzXSBDYWxsIHRyYWNlOg0KWyAgIDIzLjUyMTg2OF0gIGR1bXBfYmFja3RyYWNlLmNmaV9qdCsw
eDAvMHg0DQpbICAgMjMuNTIyMzg5XSAgZHVtcF9zdGFjaysweGI4LzB4MTE0DQpbICAgMjMuNTIy
ODI0XSAgcGFuaWMrMHgxNzAvMHgzZTANClsgICAyMy41MjMyMTVdICBfX3Vic2FuX2hhbmRsZV9j
ZmlfY2hlY2tfZmFpbF9hYm9ydCsweDAvMHgxNA0KWyAgIDIzLjUyMzg5Nl0gIHBlcmZfcHJvY191
cGRhdGVfaGFuZGxlcisweDAvMHhjYw0KWyAgIDIzLjUyNDQ2MF0gIF9fY2ZpX2NoZWNrKzB4NjEw
Y2MvMHg2OGVmMA0KWyAgIDIzLjUyNDk1OV0gIG1lZGlhX2RldmljZV9pb2N0bCsweDIxOC8weDIz
OA0KWyAgIDIzLjUyNTQ4OF0gIG1lZGlhX2RldmljZV9jb21wYXRfaW9jdGwrMHg2MC8weDdjDQpb
ICAgMjMuNTI2MDcyXSAgbWVkaWFfY29tcGF0X2lvY3RsKzB4NTgvMHg5Yw0KWyAgIDIzLjUyNjU4
MV0gIF9fYXJtNjRfY29tcGF0X3N5c19pb2N0bCsweDEwYy8weDQzNA0KWyAgIDIzLjUyNzE3Nl0g
IGVsMF9zdmNfY29tbW9uKzB4YjQvMHgxOGMNClsgICAyMy41Mjc2NTFdICBlbDBfc3ZjX2NvbXBh
dF9oYW5kbGVyKzB4MWMvMHgyOA0KWyAgIDIzLjUyODIwMl0gIGVsMF9zdmNfY29tcGF0KzB4OC8w
eDI0DQpbICAgMjMuNTI4NjU5XSBTTVA6IHN0b3BwaW5nIHNlY29uZGFyeSBDUFVzDQpbICAgMjMu
NTI5MTYxXSBLZXJuZWwgT2Zmc2V0OiAweDI0YjhjMDAwMDAgZnJvbSAweGZmZmZmZmMwMTAwMDAw
MDANClsgICAyMy41Mjk5MDZdIFBIWVNfT0ZGU0VUOiAweGZmZmZmZmRkMDAwMDAwMDANClsgICAy
My41MzA0MzRdIENQVSBmZWF0dXJlczogMHgwMDAwMDAwNiwyYTgwYTIzOA0KWyAgIDIzLjUzMDk4
M10gTWVtb3J5IExpbWl0OiBub25lDQpQUExfTE9HX1NUT1JFOiBjaGVjayBvbmNlLCBzaWcgdmFs
dWUgMHgyNywgYWRkciAweDExNjAwMC4NCg0KPT09PT09PT09PT09PT09PT09DQogQ2hhbmdlcyBp
biB2Mg0KPT09PT09PT09PT09PT09PT09DQpXZSBhbHNvIHJlbW92ZWQgdGhlIHR5cGUgY2FzdCBp
biB0aGUgTUVESUFfSU9DX0FSRyBkZWZpbmUgLg0KDQoNCkZyZWRlcmljIENoZW4gKDEpOg0KICBt
ZWRpYTogbWMtZGV2aWNlLmM6IGNoYW5nZSBtZWRpYV9kZXZpY2VfcmVxdWVzdF9hbGxvYyB0byBt
YXRjaA0KICAgIG1lZGlhX2lvY3RsX2luZm8NCg0KIGRyaXZlcnMvbWVkaWEvbWMvbWMtZGV2aWNl
LmMgfCA3ICsrKystLS0NCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
