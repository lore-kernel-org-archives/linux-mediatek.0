Return-Path: <SRS0=hubc=FK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BF6C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Dec 2020 05:32:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 633BC22B37
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Dec 2020 05:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 633BC22B37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfJM8+zD7JtWRykprHyPDlM6TJr0n2QBawOjUZe/UZ0=; b=J56e/KSOozfMrTM05VcN681Xm4
	XXgTnwRT7GZg/3SUoa/yt0nmg/kZIUanT3Su8WWteTRgifXKtiUCfNIWuRMOdNOg39ME/rRUBepWt
	ccCsjuUF9CigWdYMGu1j79qDIbUryL2drNZ5w2g+C18gO6vbyMs0KJamesaAyr3YdcYOUmgEofxQQ
	apxb+Xxw6hQG7XdOfjH5Rrz/ZK/CtsE8rG+k0WmGdFpXdccen16Wi8J60sQMm+yPQ/ncIEe8J2eHZ
	JjWiX7f+iWurXRA8eZ/87oG4/uEkMxhQuOlt5rmD1WT8X3YmFrf99T3YDON+mgSfYu1PBZ6ppRtrb
	Et3wMb7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klmf5-0000Lx-Qo; Sun, 06 Dec 2020 05:32:43 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klmey-0000L3-A5; Sun, 06 Dec 2020 05:32:38 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CpZnN2gFCz15XHT;
 Sun,  6 Dec 2020 13:31:52 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.9) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Sun, 6 Dec 2020
 13:32:17 +0800
Subject: Re: [PATCH 1/5] media: dt-bindings: add the required property
 'additionalProperties'
To: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Karol Gugala
 <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Pawel Czarnecki
 <pczarnecki@internships.antmicro.com>, Stafford Horne <shorne@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-media <linux-media@vger.kernel.org>, linux-serial
 <linux-serial@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, devicetree
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-2-thunder.leizhen@huawei.com>
 <2c36ef4c2d022f6f83ec5c78a951d5e76f95378e.camel@pengutronix.de>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <c2be6704-e3f8-ec52-9114-c3fa3c235a3c@huawei.com>
Date: Sun, 6 Dec 2020 13:32:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2c36ef4c2d022f6f83ec5c78a951d5e76f95378e.camel@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_003237_698191_E677DE09 
X-CRM114-Status: GOOD (  11.18  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIwLzEyLzQgMTg6NTYsIFBoaWxpcHAgWmFiZWwgd3JvdGU6Cj4gT24gRnJpLCAyMDIw
LTEyLTA0IGF0IDE3OjM4ICswODAwLCBaaGVuIExlaSB3cm90ZToKPj4gV2hlbiBJIGRvIGR0X2Jp
bmRpbmdfY2hlY2sgZm9yIGFueSBZQU1MIGZpbGUsIGJlbG93IHdhbnJpbmcgaXMgYWx3YXlzCj4+
IHJlcG9ydGVkOgo+Pgo+PiB4eHgvbWVkaWEvY29kYS55YW1sOiAnYWRkaXRpb25hbFByb3BlcnRp
ZXMnIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPj4geHh4L21lZGlhL2NvZGEueWFtbDogaWdub3Jp
bmcsIGVycm9yIGluIHNjaGVtYToKPj4gd2FybmluZzogbm8gc2NoZW1hIGZvdW5kIGluIGZpbGU6
IHh4eC9tZWRpYS9jb2RhLnlhbWwKPj4KPj4gVGhlcmUgYXJlIHRocmVlIHByb3BlcnRpZXMgZGVm
aW5lZCBpbiBhbGxPZiwgdGhleSBzaG91bGQgYmUgZXhwbGljaXRseQo+PiBkZWNsYXJlZC4gT3Ro
ZXJ3aXNlLCAiYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlIiB3aWxsIHByb2hpYml0IHRoZW0u
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFpoZW4gTGVpIDx0aHVuZGVyLmxlaXpoZW5AaHVhd2VpLmNv
bT4KPiAKPiBUaGFuayB5b3UsIHRoZXJlIGFscmVhZHkgaXMgYSBwYXRjaCB0byBmaXggdGhpczoK
PiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDIwMTExNzIwMDc1Mi40
MDA0MzY4LTEtcm9iaEBrZXJuZWwub3JnLwoKT0suIEkgZm91bmQgaXQgdGVtcG9yYXJpbHkgZHVy
aW5nIGRvIGEgSlNPTiBjb252ZXJzaW9u77yMSSBoYXZlIG5vdCBzdWJzY3JpYmVkIHRoZQpkdC1i
aW5kaW5nIG1haWxsaXN0LgoKPiAKPiByZWdhcmRzCj4gUGhpbGlwcAo+IAo+IC4KPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
