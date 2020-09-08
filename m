Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457A4C43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 01:05:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA93E2068D
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 01:05:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mD1PAaf5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA93E2068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ieziIytmul2ZTQbpLmqYqw2cQuAseX5mCYoIbc7q9Dc=; b=mD1PAaf5pnrICwmrxg52iMNJG
	7UxSta0YmMa8zyqqVA3cvyUhRslZpSu9BFwl25yDvsm1/NqXIBB56bFB8J2RrHRh2YNgYADX9JZv1
	Ejdk6YSzStDFqdMyPRlmafMpKF9S6D8yKx+pXY469z3PV8wIVruXakNqpRZbBmWPVidIxaoEMvN2q
	3hmyoo9fs5+ypxxcD+5SGVDAFg2JUjKO4P+TCZ9+9qMHCNTDWsLJkJpmnd3AHtc5SXW/2uDJLOXYa
	gF24OQVaWylFeeV8CPe69hJ0J6G+Rq6j5We4ACX+lA7Rnhc+ULPIK0KqeQWpGj/OJn2yGCKNLEn1i
	f5UdA3u4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFS4s-0000rm-AC; Tue, 08 Sep 2020 01:05:42 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFS4m-0000pP-VO; Tue, 08 Sep 2020 01:05:38 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8B5548295C3B4781B870;
 Tue,  8 Sep 2020 09:05:24 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.103) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 8 Sep 2020 09:05:15 +0800
Subject: Re: [PATCH] drm/mediatek: add missing put_device() call in
 mtk_ddp_comp_init()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20200905083058.1631726-1-yukuai3@huawei.com>
 <CAAOTY_-BQx0rozw0qoGj1bt4hO2rFmYvKrjQHbA-K04txUWW+w@mail.gmail.com>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <e10c0375-8ef3-a2ba-b23f-f80d082e1ba7@huawei.com>
Date: Tue, 8 Sep 2020 09:05:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY_-BQx0rozw0qoGj1bt4hO2rFmYvKrjQHbA-K04txUWW+w@mail.gmail.com>
X-Originating-IP: [10.174.179.103]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_210537_296332_D2AD8051 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, yi.zhang@huawei.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMjAyMC8wOS8wOCA2OjU2LCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+IEhpIFl1IEt1YWk6Cj4g
Cj4gWXUgS3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPiDmlrwgMjAyMOW5tDnmnIg15pelIOmAseWF
rSDkuIvljYg0OjMx5a+r6YGT77yaCj4+Cj4+IGlmIG9mX2ZpbmRfZGV2aWNlX2J5X25vZGUoKSBz
dWNjZWVkLCBtdGtfZGRwX2NvbXBfaW5pdCgpIGRvZXNuJ3QgaGF2ZQo+PiBhIGNvcnJlc3BvbmRp
bmcgcHV0X2RldmljZSgpLiBUaHVzIGFkZCBwdXRfZGV2aWNlKCkgdG8gZml4IHRoZSBleGNlcHRp
b24KPj4gaGFuZGxpbmcgZm9yIHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24uCj4+Cj4gCj4g
VGhpcyBwYXRjaCBsb29rcyBnb29kIHRvIG1lLCBidXQgSSBmaW5kIGFub3RoZXIgdGhpbmcgcmVs
YXRlZCB0byB0aGlzLgo+IG10a19kZHBfY29tcF9pbml0KCkgaXMgY2FsbGVkIGluIGEgbG9vcCBp
biBtdGtfZHJtX3Byb2JlKCksIHdoZW4gdGhpcwo+IGNvbXBvbmVudCBpbml0IGZhaWwsIEkgdGhp
bmsgd2Ugc2hvdWxkIHVuaW5pdGlhbGl6ZSBwcmV2aW91cwo+IHN1Y2Nlc3NpdmUgaW5pdCBjb21w
b25lbnQgYW5kIHB1dCB0aGVpciBkZXZpY2UuIFdvdWxkIHlvdSBsaWtlIHRvIG1ha2UKPiB0aGlz
IHBhdGNoIG1vcmUgY29tcGxldGU/CgpIaSwKCk9mIGNvdXJzZSwgdGhhbmsgeW91IGZvciB5b3Vy
IHJldmlldy4KCkJlc3QgcmVnYXJkcywKWXUgS3VhaQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
