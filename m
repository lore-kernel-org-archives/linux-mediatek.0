Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099A1C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:26:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6A4122DFA
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:26:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jPo2ldQ7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ldAGfpV+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6A4122DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zh1GShiuRe50/hv6YteqenYpLyVW1TWx+VDoKzOpR/k=; b=jPo2ldQ7ezASwunYIY0a2rq9FR
	ZhNDEsy2P229nSA4UoM0pDMbBfqToFe0gY4Me8mj4hJvKoIjj3nq5L3vUn364p5sldlTEDukYZhqa
	Uz8fDu5GMRuWUcUGZBoPuuiTSdtQ4xMtaOhTrcDOfcrGMjbVTSrjOaP9XJbCBmdiTIQtk4AjmjDcZ
	8qK0W31tGYZBDJf48qaRV3aEcap3XR6Yij0LLZICgvHN22OlBiaJViTRd8ypzLfR9MoIbmW8zDqTb
	tc36xu4L0D171Iwrof6wRl8GITR+y73Crfzw9+to076KnBc4JZeGd8BL4bQG3+a7V/tKCzSBwZ+0+
	2p/MLw1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3aMg-0002Ob-TN; Thu, 06 Aug 2020 07:31:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3aMf-0002Nt-7j; Thu, 06 Aug 2020 07:31:02 +0000
X-UUID: f0bc0435eeef4ead976e92bf2f99eeaa-20200805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HPY1Y8WchrDTl7dW9nXX5eI/MbrnUntKhJLM+zFG4Ko=; 
 b=ldAGfpV+ws5Wa7QwAJzZLrDKqDaDR8ozIdBSqykIHKFRRFEkFQi6wM+qWHOelZOB01TJjvtwZjrKyu/m11hOotpa9O3BJYKz33Z4UbsKuynxpieDN9ZSDDMb+G8WhFqLQDE0opBURo472+NRY0zrXnTsoiZWy+MpraCiVFVpc24=;
X-UUID: f0bc0435eeef4ead976e92bf2f99eeaa-20200805
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <frederic.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 138367907; Wed, 05 Aug 2020 23:30:58 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 00:30:06 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 15:29:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Aug 2020 15:29:59 +0800
From: <frederic.chen@mediatek.com>
To: <hans.verkuil@cisco.com>, <laurent.pinchart+renesas@ideasonboard.com>,
 <tfiga@chromium.org>, <matthias.bgg@gmail.com>, <mchehab@kernel.org>
Subject: [PATCH 0/1] media: change media_device_request_alloc to match
 media_ioctl_info
Date: Thu, 6 Aug 2020 15:29:51 +0800
Message-ID: <20200806072952.11709-1-frederic.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_033101_422588_59F79D8A 
X-CRM114-Status: GOOD (  10.59  )
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

KioqIEJMVVJCIEhFUkUgKioqDQpIZWxsbywNCg0KVGhpcyBwYXRjaCBpcyB0byBtb2RpZnkgbWVk
aWFfZGV2aWNlX3JlcXVlc3RfYWxsb2MoKSBzbyB0aGF0IGl0IGNhbiBwYXNzDQpDRkkoQ29udHJv
bCBGbG93IEludGVncml0eSkgY2hlY2suIEkgd291bGQgbGlrZSBzb21lIHJldmlldyBjb21tZW50
cy4NCg0KbWVkaWFfZGV2aWNlX3JlcXVlc3RfYWxsb2MoKSBpcyBzYXZlZCBpbiBmbiBvZiBtZWRp
YV9pb2N0bF9pbmZvIHN0cnVjdCwNCndoaWNoIGlzIGRlZmluZWQgYXMgbG9uZyAoKmZuKShzdHJ1
Y3QgbWVkaWFfZGV2aWNlICpkZXYsIHZvaWQgKmFyZykuIFRoZQ0KdHlwZSBvZiB0aGUgc2Vjb25k
IHBhcmFtZXRlciBvZiBtZWRpYV9kZXZpY2VfcmVxdWVzdF9hbGxvYygpIGlzIGludCogbm93LA0K
YnV0IGl0IGlzIHZvaWQqIGluIGZuIG9mIG1lZGlhX2lvY3RsX2luZm8uIFdlIGdvdCBzb21lIEFC
SSB2aW9sYXRpb24gaGVyZS4NClRoZXJlZm9yZSwgd2Ugd291bGQgbGlrZSB0byB1c2Ugdm9pZCog
aW5zdGVhZCBvZiBpbnQqIGZvciB0aGUgc2Vjb25kDQpwYXJhbWV0ZXIgb2YgbWVkaWFfZGV2aWNl
X3JlcXVlc3RfYWxsb2MoKS4NCg0Kc3RhdGljIGxvbmcgbWVkaWFfZGV2aWNlX3JlcXVlc3RfYWxs
b2Moc3RydWN0IG1lZGlhX2RldmljZSAqbWRldiwNCgkJCQkgICAgICAgaW50ICphbGxvY19mZCk7
DQoNCnN0cnVjdCBtZWRpYV9pb2N0bF9pbmZvIHsNCgl1bnNpZ25lZCBpbnQgY21kOw0KCXVuc2ln
bmVkIHNob3J0IGZsYWdzOw0KCWxvbmcgKCpmbikoc3RydWN0IG1lZGlhX2RldmljZSAqZGV2LCB2
b2lkICphcmcpOw0KCWxvbmcgKCphcmdfZnJvbV91c2VyKSh2b2lkICprYXJnLCB2b2lkIF9fdXNl
ciAqdWFyZywgdW5zaWduZWQgaW50IGNtZCk7DQoJbG9uZyAoKmFyZ190b191c2VyKSh2b2lkIF9f
dXNlciAqdWFyZywgdm9pZCAqa2FyZywgdW5zaWduZWQgaW50IGNtZCk7DQp9Ow0KDQoNCkhlcmUg
aXMgYW4gZXhhbXBsZS4gV2l0aCBBbmRyb2lk4oCZcyBDRkkgY2hlY2tpbmcsIHdlIGdvdCB0aGUg
Zm9sbG93aW5nIGVycm9yDQp3aXRob3V0IHRoaXMgY2hhbmdlLg0KDQpbICAgMjMuNTAyNDc3XSBt
dGstY2FtIHNvYzpjYW1pc3A6IHNkOm10ay1jYW0gcmF3LTAgcGFkOjIgc2V0IGZvcm1hdCB3L2gv
Y29kZSAyMzI4LzE3NDgvMHgzMDA3DQpbICAgMjMuNTE4NjkwXSBLZXJuZWwgcGFuaWMgLSBub3Qg
c3luY2luZzogQ0ZJIGZhaWx1cmUgKHRhcmdldDogbWVkaWFfZGV2aWNlX3JlcXVlc3RfYWxsb2Mr
MHgwLzB4NCkNClsgICAyMy41MTk4MDRdIENQVTogNyBQSUQ6IDgxOCBDb21tOiBtdGt2NGwyX3V0
IFRhaW50ZWQ6IEcgUyAgICAgICAgIE8gICAgICA1LjQuMzktZzAyYzBhNDg1OGJlZC1kaXJ0eSAj
NDUNClsgICAyMy41MjE1NTNdIENhbGwgdHJhY2U6DQpbICAgMjMuNTIxODY4XSAgZHVtcF9iYWNr
dHJhY2UuY2ZpX2p0KzB4MC8weDQNClsgICAyMy41MjIzODldICBkdW1wX3N0YWNrKzB4YjgvMHgx
MTQNClsgICAyMy41MjI4MjRdICBwYW5pYysweDE3MC8weDNlMA0KWyAgIDIzLjUyMzIxNV0gIF9f
dWJzYW5faGFuZGxlX2NmaV9jaGVja19mYWlsX2Fib3J0KzB4MC8weDE0DQpbICAgMjMuNTIzODk2
XSAgcGVyZl9wcm9jX3VwZGF0ZV9oYW5kbGVyKzB4MC8weGNjDQpbICAgMjMuNTI0NDYwXSAgX19j
ZmlfY2hlY2srMHg2MTBjYy8weDY4ZWYwDQpbICAgMjMuNTI0OTU5XSAgbWVkaWFfZGV2aWNlX2lv
Y3RsKzB4MjE4LzB4MjM4DQpbICAgMjMuNTI1NDg4XSAgbWVkaWFfZGV2aWNlX2NvbXBhdF9pb2N0
bCsweDYwLzB4N2MNClsgICAyMy41MjYwNzJdICBtZWRpYV9jb21wYXRfaW9jdGwrMHg1OC8weDlj
DQpbICAgMjMuNTI2NTgxXSAgX19hcm02NF9jb21wYXRfc3lzX2lvY3RsKzB4MTBjLzB4NDM0DQpb
ICAgMjMuNTI3MTc2XSAgZWwwX3N2Y19jb21tb24rMHhiNC8weDE4Yw0KWyAgIDIzLjUyNzY1MV0g
IGVsMF9zdmNfY29tcGF0X2hhbmRsZXIrMHgxYy8weDI4DQpbICAgMjMuNTI4MjAyXSAgZWwwX3N2
Y19jb21wYXQrMHg4LzB4MjQNClsgICAyMy41Mjg2NTldIFNNUDogc3RvcHBpbmcgc2Vjb25kYXJ5
IENQVXMNClsgICAyMy41MjkxNjFdIEtlcm5lbCBPZmZzZXQ6IDB4MjRiOGMwMDAwMCBmcm9tIDB4
ZmZmZmZmYzAxMDAwMDAwMA0KWyAgIDIzLjUyOTkwNl0gUEhZU19PRkZTRVQ6IDB4ZmZmZmZmZGQw
MDAwMDAwMA0KWyAgIDIzLjUzMDQzNF0gQ1BVIGZlYXR1cmVzOiAweDAwMDAwMDA2LDJhODBhMjM4
DQpbICAgMjMuNTMwOTgzXSBNZW1vcnkgTGltaXQ6IG5vbmUNClBQTF9MT0dfU1RPUkU6IGNoZWNr
IG9uY2UsIHNpZyB2YWx1ZSAweDI3LCBhZGRyIDB4MTE2MDAwLg0KDQoNCkZyZWRlcmljIENoZW4g
KDEpOg0KICBtZWRpYTogbWMtZGV2aWNlLmM6IGNoYW5nZSBtZWRpYV9kZXZpY2VfcmVxdWVzdF9h
bGxvYyB0byBtYXRjaA0KICAgIG1lZGlhX2lvY3RsX2luZm8NCg0KIGRyaXZlcnMvbWVkaWEvbWMv
bWMtZGV2aWNlLmMgfCA1ICsrKy0tDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
