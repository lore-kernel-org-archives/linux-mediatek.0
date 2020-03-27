Return-Path: <SRS0=6DyL=5M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360C9C43331
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 20:25:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B9FC20716
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 20:25:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iMu2zV0H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IThb/2dX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B9FC20716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KvsgQORUayGylBELCHz2E3QIjOe4oWR1vEdPf+qyVo=; b=iMu2zV0HsCrjYD
	KYt0ab3cnpNJCUzCFCL3w8V8BN06pEneSo1m5j7JCnTrMOgtlWzHFJjeZxD3/SrfM+VEb+mSvTJqK
	93V0QIs4AZqky44Iaa00iK286VgyRtJDOjQuA50onQV1LcUlGLMj0gGNC0ewr8b5jtGF/j1TrzopI
	FYkWt+zlE3U6ULo1LFzYAg4RIoOR2OLE52nF3qWPFmMQtEGuWT5wdyIjnYkyZfhBqxtHF2n8CMva+
	CAIm7CGhG2uMBhBQfeMcsrceKAnajeIbAUdsmYTfXhlxTQonigQHPyzT5RpZsxduRk+T6DNkmI5yh
	/Misf3fUGmdzG9sWZl8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHvXl-0001YN-My; Fri, 27 Mar 2020 20:25:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHvXi-0001XS-EO
 for linux-mediatek@lists.infradead.org; Fri, 27 Mar 2020 20:25:27 +0000
X-UUID: 4194b85bdf2b4d049f401abec9c1f6f1-20200327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Srf3BRn2UUVY4cXD1Kv+sL+AswQnzJsHnmQNVtOozvY=; 
 b=IThb/2dXv2ASi0QKA6TjB9GbJT6/Uy/2tv1gbXF2mWgRPS36RGnKo3uEJn08mZdX08GcoXXyHpqnkY6eXFIvbMAMy937hn5gMM707G9YJ1Dvts3sQjY9ZkX+jNnY7eyHaq+6YzHwYTsOEsERv5aW5Jeftr2JO4C2bU3Qet3fGVM=;
X-UUID: 4194b85bdf2b4d049f401abec9c1f6f1-20200327
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1352211736; Fri, 27 Mar 2020 12:25:19 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Mar 2020 13:25:17 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 28 Mar 2020 04:25:16 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 28 Mar 2020 04:25:15 +0800
From: <sean.wang@mediatek.com>
To: <netdev@vger.kernel.org>
Subject: =?UTF-8?q?Re=3A=20=5BPATCH=20net-next=5D=20net=3A=20dsa=3A=20mt7530=3A=20use=20resolved=20link=20config=20in=20mac=5Flink=5Fup=28=29?=
Date: Sat, 28 Mar 2020 04:25:14 +0800
Message-ID: <1585340714-9932-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20200327144412.100913-1-opensource@vdorst.com>
References: <20200327144412.100913-1-opensource@vdorst.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_132526_496687_6B3C6FE3 
X-CRM114-Status: UNSURE (   5.57  )
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
Cc: andrew@lunn.ch, landen.chao@mediatek.com, f.fainelli@gmail.com,
 frank-w@public-files.de, sean.wang@mediatek.com, linux@armlinux.org.uk,
 davem@davemloft.net, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, vivien.didelot@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogU2VhbiBXYW5nIDxzZWFuLndhbmdAbWVkaWF0ZWsuY29tPg0KDQo+Q29udmVydCB0aGUg
bXQ3NTMwIHN3aXRjaCBkcml2ZXIgdG8gdXNlIHRoZSBmaW5hbGlzZWQgbGluayBwYXJhbWV0ZXJz
IGluIG1hY19saW5rX3VwKCkgcmF0aGVyIHRoYW4gdGhlIHBhcmFtZXRlcnMgaW4gbWFjX2NvbmZp
ZygpLg0KPg0KPlNpZ25lZC1vZmYtYnk6IFJlbsOpIHZhbiBEb3JzdCA8b3BlbnNvdXJjZUB2ZG9y
c3QuY29tPg0KDQpUaGF0IHBhdGNoIHdvcmtzIHdlbGwgd2l0aCBlaXRoZXIgVFJHTUkgb24gUkdN
SUkgbW9kZSBvbiBNVDc2MjMgcmVmZXJlbmNlIGJvYXJkLg0KDQpUZXN0ZWQtYnk6IFNlYW4gV2Fu
ZyA8c2Vhbi53YW5nQG1lZGlhdGVrLmNvbT4NCg0KPi0tLQ0KPiBkcml2ZXJzL25ldC9kc2EvbXQ3
NTMwLmMgfCA1NyArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IGRy
aXZlcnMvbmV0L2RzYS9tdDc1MzAuaCB8ICA0ICsrKw0KPiAyIGZpbGVzIGNoYW5nZWQsIDI4IGlu
c2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC9kc2EvbXQ3NTMwLmMgYi9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMgaW5kZXggNmU5MWZlMmY0
YjlhLi5lZjU3NTUyZGIyNjAgMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9uZXQvZHNhL210NzUzMC5j
DQo+KysrIGIvZHJpdmVycy9uZXQvZHNhL210NzUzMC5jDQo+QEAgLTU2MywxNyArNTYzLDYgQEAg
bXQ3NTMwX21pYl9yZXNldChzdHJ1Y3QgZHNhX3N3aXRjaCAqZHMpDQo+IAltdDc1MzBfd3JpdGUo
cHJpdiwgTVQ3NTMwX01JQl9DQ1IsIENDUl9NSUJfQUNUSVZBVEUpOyAgfQ0KPiANCj4tc3RhdGlj
IHZvaWQNCj4tbXQ3NTMwX3BvcnRfc2V0X3N0YXR1cyhzdHJ1Y3QgbXQ3NTMwX3ByaXYgKnByaXYs
IGludCBwb3J0LCBpbnQgZW5hYmxlKSAtew0KPi0JdTMyIG1hc2sgPSBQTUNSX1RYX0VOIHwgUE1D
Ul9SWF9FTiB8IFBNQ1JfRk9SQ0VfTE5LOw0KPi0NCj4tCWlmIChlbmFibGUpDQo+LQkJbXQ3NTMw
X3NldChwcml2LCBNVDc1MzBfUE1DUl9QKHBvcnQpLCBtYXNrKTsNCj4tCWVsc2UNCj4tCQltdDc1
MzBfY2xlYXIocHJpdiwgTVQ3NTMwX1BNQ1JfUChwb3J0KSwgbWFzayk7DQo+LX0NCj4tDQo+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
