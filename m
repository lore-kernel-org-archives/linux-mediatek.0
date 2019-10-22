Return-Path: <SRS0=62P0=YP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0013CA9EA0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2019 09:46:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1B9A2089E
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2019 09:46:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UGhlE0dL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="FvfPvGDC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1B9A2089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:From:To:Subject:
	MIME-Version:References:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfTQjBARkYDJZuDFkxkWLCZ0xKk3vd4p+pq24FujBns=; b=UGhlE0dLj8SiYQ
	072v4JdIK4pri5y0lcmHuU+nODiRU2qeTdCglhEKtQNjOo05qfr2Pi/OYoLzs4e7EgRSVBPpZWxCO
	J4xfkWdcuy1JbqPaSUq7UUDljwB9hx5/4oFNlSaSSDo1Z4U+VP0dubfzoeECGS8wsSodX+bvg1V39
	S/1sopoyu3Yl9+q1zjxdpYNIVntdFG/MRXCNX/sq62FMhyrboXAfc62FkQfJxIp7qX24BQu48bfCa
	2K0aMpSwwISxKuQh6yFjeDx29YME51WI7B8C0Z9q7zpubZIXOXZRIZXBx+QIAGH5J1GxRYHgiJngy
	1b0h+sdcbBkdAIwKvoDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMqkN-0006Hs-NN; Tue, 22 Oct 2019 09:46:35 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMqkD-00069d-8M; Tue, 22 Oct 2019 09:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1571737572;
 bh=YQnIZApIf+d3RC8+gJ4XAh8mf3pKoDtSYtaWU4JHfWw=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=FvfPvGDCY4u86PA4B0Ipju/7zhuRh/KbOUl5ahk+B8S0V5DJhQ91TTLTBhS8GC9Bn
 DJtMayQxDgY/MLSoUCFg8mPrjMLzAnwC+tNTKZx7sTyLNSovZTaOE2tk+Jwz0L8Feb
 Wco1dM3nL3L3P0XbHdlSPYfO/pCyLDxGOY/u/yoQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-bq ([185.75.73.113]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnJlW-1hde1H3qaq-00jIuP; Tue, 22
 Oct 2019 11:46:11 +0200
Date: Tue, 22 Oct 2019 11:46:07 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <20191016095338.GD4365@dell>
References: <20191003185323.24646-1-frank-w@public-files.de>
 <20191016095338.GD4365@dell>
MIME-Version: 1.0
Subject: Re: [PATCH] mfd: mt6397: fix probe after changing mt6397-core
To: linux-mediatek@lists.infradead.org,Lee Jones <lee.jones@linaro.org>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <24600EAE-5379-475F-B83D-880E767F2CDA@public-files.de>
X-Provags-ID: V03:K1:zn6CtqLXymxCEpB4Z1h5hKRQMZxDbjptqj8SY/i72+7a//VKmAP
 BMNrdloz0JRUo1gU6KmNykIc8C8HFn3Pii1+bLj6e/ImqSrzmpweE3MaZ5Aj/aMixWHLZG6
 prqBNzb0IwKz5sG/i0+XGoz/yrzoPfxZlarxjCXLDWO8Hk3FM4Ltc1iIM1K4raT73q/WbEE
 seoTp7xTu4+1YjDCsJmgw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6lpq+4CB3fo=:bdh66YT68Xl01DxxnCV72W
 tkREJoNo2ZCTsxa88mHMktJqBf1EO8hFqRlsKHnO+Cwuj9XJVxVSh08UynS/W0FLAV20PGE4i
 UsRNdKTXLeW37rn1hIoQ6vCTGpCjMToooBMHG65Q2f0FZfBmgNZp9f0gpbZyWLOQyeo6qvh2D
 KnsCAFab+pD+rpWqVEVePkaZs7O1bm7imhBMawElc8OYyDzYUBepRDNb2FwLbv/PFq1luTHaZ
 2+4NVZadMCnPWmdGayPDQBJq09BkyhNKHM47eAXBulHPVEn367CtLUyKtwfyBwpDAH3tHhttl
 sNnsgZxWwsMrl6MsqZ+ro9kbIdST7bk2vubsMSRHig941wAMyxar/Ov+NqLdHRonDdQ6f8fOK
 nqQX++BJwXOkZXfo/cGA4bHzw0mQacAyKm59YAAYN9gaiTScHgYJzPdgusd2V7dB4OOhjbX+d
 PipQm3iMkX6GMxebEK0nAGHpLoUZVSozXJztNAc8Zisq/USjBN7aJdWZIENbluGRJS6Qc+MXA
 2uYdpeDiJi/XEtGMWYbpLXIKTsd6AGhg7Jx0CZD7ydBqf+PftY8qjuuGkBsG2scJW932xXF05
 IYDVi3/gmsTpQoeWwbm+hAgk2RS2OAIy83Ejt/x1wLWFilZNPD4Y9KqGEiggfQ3Toh06v3CG7
 Th9Jnnf3btS+i8YxehHaA2fBsyCZilDqBsoAMdUsFRdST+6m1l8GwKZcCx7AKsRq+9ckJfB7N
 SlyMhWCEXkEHDSxU3xWqrlzdNOEODQyn5D0G8Pc6W2dfjI5rlxS7e9OYqSxdqNgEEnB+2+Z4o
 +X4EGQ/jzJ9It4CLyCsx+iwF6MI93Oztqd4dqsypTRL6nhUSLguJaYEPnNXRvm2RUWRNdK54F
 4OiW2xBO1xDj4vJB1ESZz5tthVbnO/ucXqX4KgsEVf6FrkKpfzEq0pLi7BAdAARDHHyMsfKrP
 d12LXL4tl/lTIyqbYdo1qf413Gtzj/UTEude5ACLpSAsaT+Q+hgoL5xLzfzv+ZWWTsVTm4EPg
 R6etENs1oUbPzecg3pY1Bfc1Tvykx3BT/vq/o0l2am2lx9pIr3QzoU7bVNQigmaNiYJzvuNuY
 KnYcVgnLZ27MmNKRBy57xzQboh/+aO5L146IS6pOw6b20NG3CCuZe1kzoEYWuEDp8Jz3icr55
 nG15H5wdExV4SrV9bBv6KXMmCJPL4oxE7PAT/YWjRr+cT2UYXdYKvONBXQ6abYk7+7lgR+UOd
 ErAGjaARVot8535/owLHha0eP1W8NczLfv3NQEFiYwLM5sJLig5ByhAlI/E0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_024625_595435_E4B75EEE 
X-CRM114-Status: UNSURE (   7.27  )
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
Reply-To: frank-w@public-files.de
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

V2lsbCBpdCBiZSBtZXJnZWQgb24gcmMtY3ljbGU/CgpJIGFzayBiZWNhdXNlIGkgc2VlIGl0IG9u
bHkgaW4gbWZkLW5leHQgYnV0IG5vdCBpbiBmaXhlcy90b3J2YWxkcy1tYXN0ZXIKClJlZ2FyZHMg
RnJhbmsKCkFtIDE2LiBPa3RvYmVyIDIwMTkgMTE6NTM6MzggTUVTWiBzY2hyaWViIExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ogo+T24gVGh1LCAwMyBPY3QgMjAxOSwgRnJhbmsgV3Vu
ZGVybGljaCB3cm90ZToKPgo+PiBQYXJ0IDMgZnJvbSB0aGlzIHNlcmllcyBbMV0gd2FzIG5vdCBt
ZXJnZWQgZHVlIHRvIHdyb25nIHNwbGl0dGluZwo+PiBhbmQgYnJlYWtzIG10NjMyMyBwbWljIG9u
IGJhbmFuYXBpLXIyCj4+IAo+PiBkbWVzZyBwcmludHMgdGhpcyBsaW5lIGFuZCBhdCBsZWFzdCBz
d2l0Y2ggaXMgbm90IGluaXRpYWxpemVkIG9uCj5iYW5hbmFwaS1yMgo+PiAKPj4gbXQ2Mzk3IDEw
MDBkMDAwLnB3cmFwOm10NjMyMzogdW5zdXBwb3J0ZWQgY2hpcDogMHgwCj4+IAo+PiB0aGlzIHBh
dGNoIGNvbnRhaW5zIG9ubHkgdGhlIHByb2JlLWNoYW5nZXMgYW5kIGNoaXBfZGF0YSBzdHJ1Y3Rz
Cj4+IGZyb20gb3JpZ2luYWwgcGFydCAzIGJ5IEhzaW4tSHNpdW5nIFdhbmcKPj4gCj4+IEZpeGVz
OiBhNDg3MmU4MGNlN2QyYTE4NDQzMjgxNzZkYmYyNzlkMGEyYjg5YmRiIG1mZDogbXQ2Mzk3OiBF
eHRyYWN0Cj5JUlEgcmVsYXRlZCBjb2RlIGZyb20gY29yZSBkcml2ZXIKPgo+SSd2ZSBmaXhlZCB0
aGlzIGxpbmUgdG8gdXNlIHRoZSBzdGFuZGFyZCBmb3JtYXR0aW5nLgo+Cj4+IFsxXQo+aHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nlcmll
cz0xNjQxNTUKPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIFd1bmRlcmxpY2ggPGZyYW5rLXdA
cHVibGljLWZpbGVzLmRlPgo+PiAtLS0KPj4gIGRyaXZlcnMvbWZkL210NjM5Ny1jb3JlLmMgfCA2
NAo+KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hh
bmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCj4KPkFwcGxpZWQsIHRoYW5r
cy4KPgo+LS0gCj5MZWUgSm9uZXMgW+adjueQvOaWr10KPkxpbmFybyBTZXJ2aWNlcyBUZWNobmlj
YWwgTGVhZAo+TGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0Nz
Cj5Gb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCj4KPl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj5MaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKPkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
