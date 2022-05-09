Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3F6C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 18:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQ4jiKBbiZAIIGcmHKVxnG47wt8d8hkMxnPRWg8cXp8=; b=z30ENZnRgNi0/4
	p2FilhvK4HmCb30F9UaroJrz/6xqbKCoO+Fvp2wH6FNQHVxSEItepTEMaWNfyAumtGyfJXUPC7Fuo
	qUaXzyLj4NeRRPT6XkqWfiaw8cqhWNbYECc9EJIUUuSC3HXKXqTX631epOLgIWRMQWkS+xxFw55sn
	AVFiPirRXLjoZHxbYRwigRo75D0MNDekTD+SymMhhOVG84oMJo3hzjKeVY8ql9Or5jBsMEepce2wq
	O6+bomEw8GH9gb1cdZCezIWdUEn0YJLqQ1NJhlag1UhVa4cTqcZTSlBC34/UXaAa7iyLAt5XarKrA
	q+Q6QVMTmnLV770C3fvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no7mX-00FkkX-AT; Mon, 09 May 2022 18:06:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no7lF-00Fk3X-Lk; Mon, 09 May 2022 18:05:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0209D612C8;
 Mon,  9 May 2022 18:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFC9C385B2;
 Mon,  9 May 2022 18:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652119532;
 bh=Kf5T/f0XKjbYWD/C6hVkJzR5NvVs2HNYRz/qFkL+TjE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kMNw81pkTL4sG8Wuk7JEHYFIO0qbaJknS/iK55lckBFARqfzLyO6pRMx4Z1wC9nzN
 8OQjcYHu+N+N8P8AoDXEnFDQhFR+sGvoJ3K9iLyyPB50yvudUUWumkIQiA6a4pjzo0
 FgwGKfxKug410pw97pmvs9Uj34mBsW+I1ypxepI6ExayyeoroF2hi9in6IWkDQ5A3w
 dJrY5Kr3tOowIVUTem+dISVXh0zxSzHoFoEYpcd8xDG8+gJyRULyANdH/dsU6cKkgb
 n25kFx++efiOYW/1kJ1vjP8oec7wpSj2aOQIgQQ774ByTG8Ys94XJRq9Ybyd3wy+Cz
 11gWG0Ntne4dw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, yuehaibing@huawei.com, Arnd Bergmann <arnd@arndb.de>,
 angelogioacchino.delregno@collabora.com, perex@perex.cz, tzungbi@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, tiwai@suse.com
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
In-Reply-To: <20220509120918.9000-1-yuehaibing@huawei.com>
References: <20220509120918.9000-1-yuehaibing@huawei.com>
Subject: Re: [PATCH v3 -next] ASoC: mediatek: mt8195: Fix build warning
 without CONFIG_OF
Message-Id: <165211952969.1181242.10041450382891029022.b4-ty@kernel.org>
Date: Mon, 09 May 2022 19:05:29 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_110533_774603_70E33AB3 
X-CRM114-Status: GOOD (  13.27  )
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

T24gTW9uLCA5IE1heSAyMDIyIDIwOjA5OjE4ICswODAwLCBZdWVIYWliaW5nIHdyb3RlOgo+IHNv
dW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LW10NjM1OS5jOjE2Mzk6MzI6IHdhcm5pbmc6
IOKAmG10ODE5NV9tdDYzNTlfbWF4OTgzOTBfcnQ1NjgyX2NhcmTigJkgZGVmaW5lZCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLXZhcmlhYmxlXQo+ICAxNjM5IHwgc3RhdGljIHN0cnVjdCBtdDgxOTVf
Y2FyZF9kYXRhIG10ODE5NV9tdDYzNTlfbWF4OTgzOTBfcnQ1NjgyX2NhcmQgPSB7Cj4gICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgo+IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LW10NjM1OS5jOjE2
MzQ6MzI6IHdhcm5pbmc6IOKAmG10ODE5NV9tdDYzNTlfcnQxMDExX3J0NTY4Ml9jYXJk4oCZIGRl
ZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC12YXJpYWJsZV0KPiAgMTYzNCB8IHN0YXRpYyBz
dHJ1Y3QgbXQ4MTk1X2NhcmRfZGF0YSBtdDgxOTVfbXQ2MzU5X3J0MTAxMV9ydDU2ODJfY2FyZCA9
IHsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fgo+IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LW10
NjM1OS5jOjE2Mjk6MzI6IHdhcm5pbmc6IOKAmG10ODE5NV9tdDYzNTlfcnQxMDE5X3J0NTY4Ml9j
YXJk4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC12YXJpYWJsZV0KPiAgMTYyOSB8
IHN0YXRpYyBzdHJ1Y3QgbXQ4MTk1X2NhcmRfZGF0YSBtdDgxOTVfbXQ2MzU5X3J0MTAxOV9ydDU2
ODJfY2FyZCA9IHsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvCgogICBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icm9vbmllL3Nv
dW5kLmdpdCBmb3ItbmV4dAoKVGhhbmtzIQoKWzEvMV0gQVNvQzogbWVkaWF0ZWs6IG10ODE5NTog
Rml4IGJ1aWxkIHdhcm5pbmcgd2l0aG91dCBDT05GSUdfT0YKICAgICAgY29tbWl0OiAwZTYzYTJi
ZTU2NTFlMmIzNGU1YzI1MDU5OTJlNThiZTBlOWM0YmIxCgpBbGwgYmVpbmcgd2VsbCB0aGlzIG1l
YW5zIHRoYXQgaXQgd2lsbCBiZSBpbnRlZ3JhdGVkIGludG8gdGhlIGxpbnV4LW5leHQKdHJlZSAo
dXN1YWxseSBzb21ldGltZSBpbiB0aGUgbmV4dCAyNCBob3VycykgYW5kIHNlbnQgdG8gTGludXMg
ZHVyaW5nCnRoZSBuZXh0IG1lcmdlIHdpbmRvdyAob3Igc29vbmVyIGlmIGl0IGlzIGEgYnVnIGZp
eCksIGhvd2V2ZXIgaWYKcHJvYmxlbXMgYXJlIGRpc2NvdmVyZWQgdGhlbiB0aGUgcGF0Y2ggbWF5
IGJlIGRyb3BwZWQgb3IgcmV2ZXJ0ZWQuCgpZb3UgbWF5IGdldCBmdXJ0aGVyIGUtbWFpbHMgcmVz
dWx0aW5nIGZyb20gYXV0b21hdGVkIG9yIG1hbnVhbCB0ZXN0aW5nCmFuZCByZXZpZXcgb2YgdGhl
IHRyZWUsIHBsZWFzZSBlbmdhZ2Ugd2l0aCBwZW9wbGUgcmVwb3J0aW5nIHByb2JsZW1zIGFuZApz
ZW5kIGZvbGxvd3VwIHBhdGNoZXMgYWRkcmVzc2luZyBhbnkgaXNzdWVzIHRoYXQgYXJlIHJlcG9y
dGVkIGlmIG5lZWRlZC4KCklmIGFueSB1cGRhdGVzIGFyZSByZXF1aXJlZCBvciB5b3UgYXJlIHN1
Ym1pdHRpbmcgZnVydGhlciBjaGFuZ2VzIHRoZXkKc2hvdWxkIGJlIHNlbnQgYXMgaW5jcmVtZW50
YWwgdXBkYXRlcyBhZ2FpbnN0IGN1cnJlbnQgZ2l0LCBleGlzdGluZwpwYXRjaGVzIHdpbGwgbm90
IGJlIHJlcGxhY2VkLgoKUGxlYXNlIGFkZCBhbnkgcmVsZXZhbnQgbGlzdHMgYW5kIG1haW50YWlu
ZXJzIHRvIHRoZSBDQ3Mgd2hlbiByZXBseWluZwp0byB0aGlzIG1haWwuCgpUaGFua3MsCk1hcmsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
