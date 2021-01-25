Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADA9C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 17:35:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9677B22B3F
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 17:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9677B22B3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dvDWWcQ8/VUoKglh7NK75Qu3PC67Amm169MeKpx5DuA=; b=NcHp/TwTIWb6Hzu5ZlJsW+Kri
	m3dXaeb43ZZPDijs2YaIb1G+TsvZrUcRJ69vL4NsU41R8Vx+8w2gjdUYY06eochdpvT4wpeffo9sk
	Gd145w5rQhPHfpdKm1AJUELi2boL+JG8jDA2VeCFMOHHx010lTYUfP1M25mHEQmGkQBuhPFDL3PKh
	U0O2rqhdI1u1T06L7V3XlrxVwcRuPePbY7eTxb8tTCVJ02BRWJf5FnfMlvxlnq3tsK2SbewNUs0y2
	EJx2Qe1VwoNpFULQFohwWq5tTiJLjfXzy2+AnyVn+USJ/chO3+zq0W3zwlXnPG4mBc0ozYj38suqG
	OcLJe1IXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l45lK-0000FZ-2t; Mon, 25 Jan 2021 17:34:50 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l45lG-0000EK-3c; Mon, 25 Jan 2021 17:34:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5CCD1063;
 Mon, 25 Jan 2021 09:34:40 -0800 (PST)
Received: from e123427-lin.arm.com (unknown [10.57.45.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93B723F68F;
 Mon, 25 Jan 2021 09:34:38 -0800 (PST)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] PCI: mediatek: Add missing of_node_put() to fix reference
 leak
Date: Mon, 25 Jan 2021 17:34:33 +0000
Message-Id: <161159605117.9561.12692669940945121604.b4-ty@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210120184810.3068794-1-kw@linux.com>
References: <20210120184810.3068794-1-kw@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_123446_223720_2B4E6F9B 
X-CRM114-Status: UNSURE (   9.66  )
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
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMCBKYW4gMjAyMSAxODo0ODoxMCArMDAwMCwgS3J6eXN6dG9mIFdpbGN6ecWEc2tp
IHdyb3RlOgo+IFRoZSBmb3JfZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zfbm9kZSBoZWxwZXIgaW50
ZXJuYWxseSBtYWtlcyB1c2Ugb2YgdGhlCj4gb2ZfZ2V0X25leHRfYXZhaWxhYmxlX2NoaWxkKCkg
d2hpY2ggcGVyZm9ybXMgYW4gb2Zfbm9kZV9nZXQoKSBvbiBlYWNoCj4gaXRlcmF0aW9uIHdoZW4g
c2VhcmNoaW5nIGZvciBuZXh0IGF2YWlsYWJsZSBjaGlsZCBub2RlLgo+IAo+IFNob3VsZCBhbiBh
dmFpbGFibGUgY2hpbGQgbm9kZSBiZSBmb3VuZCwgdGhlbiBpdCB3b3VsZCByZXR1cm4gYSBkZXZp
Y2UKPiBub2RlIHBvaW50ZXIgd2l0aCByZWZlcmVuY2UgY291bnQgaW5jcmVtZW50ZWQsIHRodXMg
ZWFybHkgcmV0dXJuIGZyb20KPiB0aGUgbWlkZGxlIG9mIHRoZSBsb29wIHJlcXVpcmVzIGFuIGV4
cGxpY2l0IG9mX25vZGVfcHV0KCkgdG8gcHJldmVudAo+IHJlZmVyZW5jZSBjb3VudCBsZWFrLgo+
IAo+IFsuLi5dCgpBcHBsaWVkIHRvIHBjaS9tZWRpYXRlaywgdGhhbmtzIQoKWzEvMV0gUENJOiBt
ZWRpYXRlazogQWRkIG1pc3Npbmcgb2Zfbm9kZV9wdXQoKSB0byBmaXggcmVmZXJlbmNlIGxlYWsK
ICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9scGllcmFsaXNpL3BjaS9jLzQyODE0YzQzOGEK
ClRoYW5rcywKTG9yZW56bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
