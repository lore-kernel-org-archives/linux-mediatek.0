Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6B2C07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 10:30:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BB006113C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 10:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BB006113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1j4WS0I7APO9jeoZSPrncbt+ie9Xfm/JWZKaTeM2fU=; b=2yOGDdCLyS+wum
	X6w9som3ZP2N5pmhzHZqrg1PLhVclRiurDQNz9kN9UtpTfsOlcwK0FegGgDBuSYIFyFu9vw8gaWIQ
	pvMerJSRErtVh4PjZ0aDmxND5T5raF4JCWrnzyHUdseQH9RwBxPloB1z6kBkytb8SQ+L3MmplU0Y6
	ubXKyPbWXFw0v37LfooB1nuRobvPkE/zSMuCb1+XEQ07nsGMgLU0cS0SV5zAbK8xNBqWMPKczGjsb
	Zhht5FSol4AZQKSHzUU2KeR7Bo0AdQnLQR0vYVUZSMXlE/ir1SoRVfn/WDTwisYtFMENoLuxarBNV
	5D5or7WNE/KPQkBF9PWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5n0j-00CWJr-JU; Tue, 20 Jul 2021 10:30:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5n0g-00CWJ6-W9; Tue, 20 Jul 2021 10:30:00 +0000
X-UUID: 16bffd418208441fa4e88c15b2776924-20210720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HnUGyZP9ROLLqpJVCBK4+RlMHuXbc0SP5x4GYT4u384=; 
 b=FL0lTf2XVjgaXl0P6w3t0vbeVMsU+D3DvbigdCLB0nx/WoKxdnQ+gKW9+bJjV7eGnEs6sZ83RU8KyIZpljLyUAIJ7IGZ7heWz/jvexXJxXu4YID0uA0YvgNpJXdisXAtF+KNeI7+mPHfOpEIyH5Weltw6v0dag8Qng221ggUvKQ=;
X-UUID: 16bffd418208441fa4e88c15b2776924-20210720
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 559255507; Tue, 20 Jul 2021 03:29:53 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 03:29:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 18:29:37 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 MTKCAS06.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 20 Jul 2021 18:29:37 +0800
From: <guangming.cao@mediatek.com>
To: <christian.koenig@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <guangming.cao@mediatek.com>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <sumit.semwal@linaro.org>, <wsd_upstream@mediatek.com>, Guangming Cao
 <Guangming.Cao@mediatek.com>
Subject: Re: [PATCH] dma_buf: remove dmabuf sysfs teardown before
 release/detach
Date: Tue, 20 Jul 2021 18:29:35 +0800
Message-ID: <20210720102935.83187-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <8d7dfc78-aa85-48b5-2828-21ec6b463ac3@amd.com>
References: <8d7dfc78-aa85-48b5-2828-21ec6b463ac3@amd.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_032959_072341_F6B760BD 
X-CRM114-Status: GOOD (  10.27  )
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

RnJvbTogR3VhbmdtaW5nIENhbyA8R3VhbmdtaW5nLkNhb0BtZWRpYXRlay5jb20+DQoNCk9uIFR1
ZSwgMjAyMS0wNy0yMCBhdCAxMTozMSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4g
QW0gMTkuMDcuMjEgdW0gMDc6MTkgc2NocmllYiBndWFuZ21pbmcuY2FvQG1lZGlhdGVrLmNvbToN
Cj4gPiBGcm9tOiBHdWFuZ21pbmcgQ2FvIDxHdWFuZ21pbmcuQ2FvQG1lZGlhdGVrLmNvbT4NCj4g
PiANCj4gPiBEbWFidWYgc3lzZnMgc3RhdCBpcyB1c2VkIGZvciBkbWFidWYgaW5mbyB0cmFjay4N
Cj4gPiBidXQgdGhlc2UgZmlsZSBtYXliZSBzdGlsbCB1c2UgYWZ0ZXIgYnVmZmVyIHJlbGVhc2Uv
ZGV0YWNoLA0KPiA+IHNob3VsZCBjbGVhciBpdCBiZWZvcmUgYnVmZmVyIHJlbGVhc2UvZGV0YWNo
Lg0KPiANCj4gUGxlYXNlIHJlYmFzZSBvbiBjdXJyZW50IGRybS1taXNjLW5leHQuIFRoZSBhdHRh
Y2htZW50IHN5c2ZzIGZpbGVzDQo+IGhhdmUgDQo+IGJlZW4gcmVtb3ZlZCBpbiB0aGUgbWVhbnRp
bWUuDQo+IA0KPiBUaGFua3MsDQo+IENocmlzdGlhbi4NCj4gDQp1cGRhdGVkLCB0aGFua3MgZm9y
IHlvdXIgcmVtaW5kaW5nLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
