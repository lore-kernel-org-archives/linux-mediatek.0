Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E08C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 10:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IXP5Ln3TALHgdKl4VqEAdw7bN0MGe/7O0frOTKQwGuo=; b=lE0kLbnfixQbk6
	5/woC4hWC/e5kegPA6Qs5P6+qyhJiVWhYL77Qi91JcF6/T19WoKTgN4gO1LPRuPE4PmenWf0uThWW
	ddL6s57tFsAVrnSYNtw6TEWon1zQ6ClwQpZVqbkiI5kZljU2L7rpdkYNpwJ/MwU0mDcsEt4t8atGi
	6WUq/91Fp2L2W/cOVrt/vM3eL09J66LRtDpPC+GwT1G/j+28SpHfJKuaKKZbaSzs4MiSycSF98KXX
	8EPSOfoGBXRY6L9CyOgmqm3jvmPwmNcOiA53YRHE/RufJD59KPjj1VT86RCrYpHcGY3dGDXGpz1TJ
	3FceYeJJsO7vbNtVGrZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV9jx-0017xD-CX; Fri, 18 Mar 2022 10:21:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV9jv-0017w7-4B
 for linux-mediatek@lists.infradead.org; Fri, 18 Mar 2022 10:21:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 967871F45DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647598905;
 bh=R2Fab+/4Q7++fifqmPDXKzsJYJZyn9f33fmTuUB0D4I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dod9l0meUNiRYcJN4FDqfmbnda3tnKjwdpK3zx/jLmDpE1cs+kukPITKnv4Xo4ZQW
 OxatywIqPs/f7uywjxvQOONMVvJuEsba2n1AxDugu50DHmFp60tebAgLauQPyDafcb
 6FoVy7FoYgmgZ0rZVYmSpsZ1OmgPSB9kzjW7EqAbYabqrdZcmU9LB5BC9OpkEhcMpj
 f1GaMJtUiUeb9c3kgLwBjsxHLZ1cb/3Pg7gtXR3em+ETEfvBs0KTbLbVB30UVJT+Ul
 J6eOsJ++nZ3HSHtqOVkBHRADiiSqlXbjkhUZiWB1q2of0qoxBkVSb+rhwQsJQAbdkz
 7NVSBTzY+VH7A==
Message-ID: <399aa873-4285-cc48-8c58-89673c505cb0@collabora.com>
Date: Fri, 18 Mar 2022 11:21:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/2 RESEND] drm/bridge: Add extra checks in pre_enable and
 post_enable
Content-Language: en-US
To: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, andrzej.hajda@intel.com, narmstrong@baylibre.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20220311093406.4068019-1-ricardo.canuelo@collabora.com>
 <20220311093406.4068019-3-ricardo.canuelo@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220311093406.4068019-3-ricardo.canuelo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_032147_358611_5EC017A3 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

SWwgMTEvMDMvMjIgMTA6MzQsIFJpY2FyZG8gQ2HDsXVlbG8gaGEgc2NyaXR0bzoKPiBEZXBlbmRp
bmcgb24gdGhlIGJyaWRnZSBjb2RlLCBjZXJ0YWluIHVzZXJzcGFjZSBldmVudHMgZHVyaW5nIGEg
ZHJpdmVyCj4gdGVhcmRvd24gKHN1Y2ggYXMgYSBEUk0gaW9jdGwgY2FsbCkgbWlnaHQgY2F1c2Ug
YSByYWNlIGNvbmRpdGlvbiB3aGVyZQo+IHRoZSBkcm1fYnJpZGdlX2NoYWluX3ByZV9lbmFibGUo
KSBhbmQgZHJtX2JyaWRnZV9jaGFpbl9wb3N0X2VuYWJsZSgpCj4gZnVuY3Rpb25zIGNvdWxkIGJl
IGNhbGxlZCBmb3IgYSBicmlkZ2UgdGhhdCBoYXMganVzdCBiZWVuIGRldGFjaGVkIGFuZAo+IHJl
bW92ZWQgZnJvbSB0aGUgYnJpZGdlIGNoYWluIG9mIGFuIGVuY29kZXIuCj4gCj4gVGhpcyBjaGFu
Z2UgbWFrZXMgdGhlc2UgZnVuY3Rpb25zIGEgYml0IG1vcmUgcm9idXN0IGJ5IGJhaWxpbmcgb3V0
IGlmCj4gdGhlIGJyaWRnZSBoYXMgYWxyZWFkeSBiZWVuIGRldGFjaGVkLgo+IAo+IFRlc3RlZCBv
biBhbiBBY2VyIENocm9tZWJvb2sgUjEzIChFbG0sIE1UODE3Mykgd2l0aCBEZWJpYW4gU2lkLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFJpY2FyZG8gQ2HDsXVlbG8gPHJpY2FyZG8uY2FudWVsb0Bjb2xs
YWJvcmEuY29tPgoKT24gdmFyaW91cyBjaHJvbWVib29rcyB3aXRoIGRpZmZlcmVudCBNZWRpYVRl
ayBTb0MgbW9kZWxzLCBhbmQgb24KUXVhbGNvbW0gU0M3MTgwIFRyb2dkb3IsCgpUZXN0ZWQtYnk6
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNv
bGxhYm9yYS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
