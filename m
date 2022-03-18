Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F4BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 10:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qBztY5qfC8gQQLsTWanrAUZYbqqjMtJ6vKHnvwrm08=; b=ge9qmfLB0jpd34
	dISci3vhdHiTo5iH0BYyyYkd/R5gk8KkaeipKo/Vx00begWg5IbkIXgSg16EaV0Hi9ua49DJonOq4
	E9Q/hTYdaAnRsIyThKvf5gVJzbDMRAN2AYR/+mIEkZMdCvxUtu0iVtMOFrYZ7sze8m4P362bIcrja
	FLvb8FVKvTXys7tnXmzG+Te+ggKp6KvtKwZJQCdPmOu584sq51O9M0RrkPy7DlfRkr8l1Z4PtxKsN
	GxbvDR44MdyVO78IaxIamk4Mt5hDT5b3qSxh1IAO/PwYn5He09ftc57mRmwop8ywuRyeg17h0M0O0
	CKUc8lQi3/teh+hQw9GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV9kE-00181c-7u; Fri, 18 Mar 2022 10:22:06 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV9kB-00180J-IB
 for linux-mediatek@lists.infradead.org; Fri, 18 Mar 2022 10:22:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 362351F45DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647598921;
 bh=W1u39IUbe6otztE9r97TmBCaSkIJMT4WAPdgwQbuLz4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iyNSFjkU8INvl3lzVLbYVltGn9Ljcetd9s8dl/V8f5DVEU00xl0ZDrqbXRsL65QYc
 UoeyDwjqn2KUdwJYnh2luQ44Ht+3XAgexrigTM7hX0WFQwVZFoY6kyhOAHAj7xn1UN
 uwcXJkRlIm/z0mP82WxrdoYQeCNZ4pjawzoLTPZpRC9vBB4NUFLXMJJIUcJwAp1Rrw
 45qYx9I4aN+L8o8FrQ6sR70thPKtHdlYwfCY89nbYDEJMtJkminYYjuULIgIuK6Gsk
 5iQbJZfsZDXGcjQckZrH245rhABMCJAiZ+VD9Xae84TfHqV13qmye6VmojaJWYAE8Q
 m6U05UKxQXLTw==
Message-ID: <bb78f340-4a37-33ad-55d6-805f64e1389c@collabora.com>
Date: Fri, 18 Mar 2022 11:21:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/2 RESEND] drm/bridge: parade-ps8640: avoid race
 condition on driver unbinding
Content-Language: en-US
To: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, andrzej.hajda@intel.com, narmstrong@baylibre.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20220311093406.4068019-1-ricardo.canuelo@collabora.com>
 <20220311093406.4068019-2-ricardo.canuelo@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220311093406.4068019-2-ricardo.canuelo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_032203_752184_BBEDC918 
X-CRM114-Status: GOOD (  14.38  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SWwgMTEvMDMvMjIgMTA6MzQsIFJpY2FyZG8gQ2HDsXVlbG8gaGEgc2NyaXR0bzoKPiBXaGVuIHVu
YmluZGluZyBhIERSTSBtYXN0ZXIgZHJpdmVyIHRoZXJlJ3MgYSByYWNlIGNvbmRpdGlvbiB0aGF0
Cj4gc29tZXRpbWVzIHJlc3VsdHMgaW4gYW4gaW52YWxpZCB2bSBhY2Nlc3Mgd2hlbiB1c2Vyc3Bh
Y2UgKGdub21lLXNoZWxsKQo+IGlzc3VlcyBhIERSTV9JT0NUTF9NT0RFX0dFVENPTk5FQ1RPUiBp
b2N0bCByaWdodCBhZnRlciBhIGJyaWRnZSBoYXMgYmVlbgo+IHJlbW92ZWQgZnJvbSBhbiBlbmNv
ZGVyJ3MgYnJpZGdlIGNoYWluLgo+IAo+IFRoaXMgbWVhbnMgdGhhdCBvbmNlIGEgYnJpZGdlIGhh
cyBiZWVuIGRpc2FibGVkIGFuZCBnb25lIHRocm91Z2gKPiBwczg2NDBfcG9zdF9kaXNhYmxlKCks
IGlmIHBzODY0MF9icmlkZ2VfZ2V0X2VkaWQoKSBydW5zIGFmdGVyd2FyZHMgYXMgYQo+IHJlc3Vs
dCBvZiB0aGF0IGlvY3RsIGNhbGwgaXQgd2lsbCBjYWxsIGRybV9icmlkZ2VfY2hhaW5fcHJlX2Vu
YWJsZSgpCj4gYW5kIGRybV9icmlkZ2VfY2hhaW5fcG9zdF9kaXNhYmxlKCkgYWdhaW4gaW4gYSBi
cmlkZ2UgdGhhdCBoYXMgYmVlbgo+IGFscmVhZHkgZGV0YWNoZWQuCj4gCj4gU2V0dGluZyBgcHNf
YnJpZGdlLT5wcmVfZW5hYmxlZCA9IGZhbHNlYCBhdCBhIGxhdGVyIHN0YWdlIG9mIHRoZQo+IGJy
aW5nZG93biBwYXRoIGFuZCBjYWxsaW5nIGRybV9icmlkZ2VfY2hhaW5fcHJlX2VuYWJsZSgpIGlu
c2lkZQo+IHBzODY0MF9icmlkZ2VfZ2V0X2VkaWQoKSBvbmx5IGlmIG5lZWRlZCBhdm9pZCB0aGlz
LCBhbHRob3VnaCBhIHByb3Blcgo+IHN1YnN5c3RlbS13aWRlIGZpeCB3b3VsZCBiZSB0aGUgcHJv
cGVyIHNvbHV0aW9uLCBzaW5jZSB0aGUgc2FtZSB0eXBlIG9mCj4gcmFjZSBjb25kaXRpb25zIG1p
Z2h0IGhhcHBlbiBzb21ld2hlcmUgZWxzZS4KPiAKPiBUZXN0ZWQgb24gYW4gQWNlciBDaHJvbWVi
b29rIFIxMyAoRWxtLCBNVDgxNzMpIHdpdGggRGViaWFuIFNpZC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBSaWNhcmRvIENhw7F1ZWxvIDxyaWNhcmRvLmNhbnVlbG9AY29sbGFib3JhLmNvbT4KClJldmll
d2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxy
ZWdub0Bjb2xsYWJvcmEuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFy
YWRlLXBzODY0MC5jIHwgNiArKystLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
