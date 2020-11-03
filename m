Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7944C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 08:18:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 465CD206E3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 08:18:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hyGbBtTC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 465CD206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gk4TLdGVFJKNvxnUC2kWZpMDQ0V4gUsDSPrdd0TO4Pg=; b=hyGbBtTCmWUIzQZ3tuRHenXtC
	P5tzMP4uxnca+ibmKJwYq9yTksEIqLwtDnOU5xc3GgciWyuPcXH263jCb7zWmju1JcMEeD/dArqn9
	gYyiLgtC3Ef3z7yKacHQ/+c6vb4zJAJsSDNDVYo5XJnDjJnx44vA73cxLkXIXgY3TptxjpNGYYwWo
	4kOKB7WzpZhP3XXKgA341BEzCSbZzziqCZMzCDJgr7VZgYCztbnyPjaMkc8Mneueqv2LvG43nyh7q
	V4jThbaTYluX65x1tcx/q7N99ZL0fUEH4FCwTMiqjGhYT9IKzDTIwjc6XPF8T9hKrt+ynCR2ECv+g
	KkCj5UKDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZrWE-0000ek-7L; Tue, 03 Nov 2020 08:18:18 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZrW7-0000cM-JG; Tue, 03 Nov 2020 08:18:12 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQN2K2pzVzhfb3;
 Tue,  3 Nov 2020 16:18:01 +0800 (CST)
Received: from [10.174.177.149] (10.174.177.149) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Tue, 3 Nov 2020 16:18:01 +0800
Subject: Re: [PATCH v2] spi: mt7621: fix missing clk_disable_unprepare() on
 error in mt7621_spi_probe
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20201103074912.195576-1-miaoqinglang@huawei.com>
From: Qinglang Miao <miaoqinglang@huawei.com>
Message-ID: <18289705-1025-2851-d24c-91a8da4910e1@huawei.com>
Date: Tue, 3 Nov 2020 16:18:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20201103074912.195576-1-miaoqinglang@huawei.com>
X-Originating-IP: [10.174.177.149]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_031811_994303_A41BB889 
X-CRM114-Status: GOOD (  15.83  )
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgrU2iAyMDIwLzExLzMgMTU6NDksIFFpbmdsYW5nIE1pYW8g0LS1wDoKPiBGaXggdGhlIG1pc3Np
bmcgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgYmVmb3JlIHJldHVybgo+IGZyb20gbXQ3NjIxX3Nw
aV9wcm9iZSBpbiB0aGUgZXJyb3IgaGFuZGxpbmcgY2FzZS4KPiAKPiBGaXhlczogY2JkNjZjNjI2
ZTE2ICgic3BpOiBtdDc2MjE6IE1vdmUgU1BJIGRyaXZlciBvdXQgb2Ygc3RhZ2luZyIpCj4gU2ln
bmVkLW9mZi1ieTogUWluZ2xhbmcgTWlhbyA8bWlhb3FpbmdsYW5nQGh1YXdlaS5jb20+Cj4gLS0t
Cj4gICBkcml2ZXJzL3NwaS9zcGktbXQ3NjIxLmMgfCAyICsrCj4gICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1tdDc2MjEu
YyBiL2RyaXZlcnMvc3BpL3NwaS1tdDc2MjEuYwo+IGluZGV4IDJjM2I3YTJhMS4uMmNkYWU3OTk0
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1tdDc2MjEuYwo+ICsrKyBiL2RyaXZlcnMv
c3BpL3NwaS1tdDc2MjEuYwo+IEBAIC0zNTMsNiArMzUzLDcgQEAgc3RhdGljIGludCBtdDc2MjFf
c3BpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJbWFzdGVyID0gc3Bp
X2FsbG9jX21hc3RlcigmcGRldi0+ZGV2LCBzaXplb2YoKnJzKSk7Cj4gICAJaWYgKCFtYXN0ZXIp
IHsKPiAgIAkJZGV2X2luZm8oJnBkZXYtPmRldiwgIm1hc3RlciBhbGxvY2F0aW9uIGZhaWxlZFxu
Iik7Cj4gKwkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGNsayk7Cj4gICAJCXJldHVybiAtRU5PTUVN
Owo+ICAgCX0KPiAgIAo+IEBAIC0zNzcsNiArMzc4LDcgQEAgc3RhdGljIGludCBtdDc2MjFfc3Bp
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJcmV0ID0gZGV2aWNlX3Jl
c2V0KCZwZGV2LT5kZXYpOwo+ICAgCWlmIChyZXQpIHsKPiAgIAkJZGV2X2VycigmcGRldi0+ZGV2
LCAiU1BJIHJlc2V0IGZhaWxlZCFcbiIpOwo+ICsJCWNsa19kaXNhYmxlX3VucHJlcGFyZShjbGsp
Owo+ICAgCQlyZXR1cm4gcmV0Owo+ICAgCX0KPiAgIAo+IApIaSBNYXJrIGFuZCBNYXR0aGlhcywK
CkkgbWFkZSBhIGNhcmVsZXNzIG1pc3Rha2UgZm9yIGFkZGluZyB2MiBhcyBzdWJqZWN0LXByZWZp
eCwgdGhpcyBwYXRjaCBpcyAKdGhlIGJhc2UgdmVyc2lvbiBhY3R1YWxseS4KClNvcnJ5IGFib3V0
IHRoYXQuCgpUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
