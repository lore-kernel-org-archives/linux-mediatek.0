Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA69EC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 02:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZwwzFqFvLDEDJrocghI4yjcz3WrMfeTtlH3Hqw0wIwk=; b=vhvbBAw/5I6qUyvL2ROiGoWzk2
	Q8QILzS2+cIMfT5nZxIuHUxJ9f7tmLGxDTvAH/MnCsaEGHOpsa9A2SmnGSQ9cSiAcHn8e/UVkS/t2
	x5GjEUr3E2uSAQUVJO9BjgCtLYwv8aXMD5tEuReWkI/7fmnsHLk2KY202s1pbctvnbhr6eeq+cY0v
	+XVQnvYOOfpBpXgXCx91zJCCswzfcU4YAoHqEqgzymn7GZj9VJCUlOqf+CKavNYrPd5F15XVXwEzi
	ytKdI73NxHYWxkbP2SGrK4j1K7ud0a7vJboRqDpJeJkdH4dNeFbFdyXrH26dNAOKSPBzijsd5HSkz
	RK3nfiDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn9pz-005j56-Ei; Sat, 07 May 2022 02:06:27 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn9po-005j3F-Ap; Sat, 07 May 2022 02:06:18 +0000
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Kw9kj2Q2WzhYyc;
 Sat,  7 May 2022 10:05:33 +0800 (CST)
Received: from [10.174.179.215] (10.174.179.215) by
 canpemm500007.china.huawei.com (7.192.104.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 7 May 2022 10:05:53 +0800
Subject: Re: [PATCH -next] ASoC: mediatek: mt8195: Fix build warning without
 CONFIG_OF
To: Arnd Bergmann <arnd@arndb.de>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Trevor
 Wu <trevor.wu@mediatek.com>, ALSA Development Mailing List
 <alsa-devel@alsa-project.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..."
 <linux-mediatek@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
References: <20220506022638.15864-1-yuehaibing@huawei.com>
 <CAK8P3a2iPwOaRgrW6gw+8ZvxwKDROWFtoCz2LLF9RFDuDrEcJQ@mail.gmail.com>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <7204f405-444e-629b-67c5-db10959085ab@huawei.com>
Date: Sat, 7 May 2022 10:05:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2iPwOaRgrW6gw+8ZvxwKDROWFtoCz2LLF9RFDuDrEcJQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_190616_575556_8DFE338E 
X-CRM114-Status: GOOD (  14.22  )
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

T24gMjAyMi81LzYgMTU6MDgsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gT24gRnJpLCBNYXkgNiwg
MjAyMiBhdCA0OjI2IEFNIFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4gd3JvdGU6
Cj4+Cj4+IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LW10NjM1OS5jOjE2Mzk6MzI6
IHdhcm5pbmc6IOKAmG10ODE5NV9tdDYzNTlfbWF4OTgzOTBfcnQ1NjgyX2NhcmTigJkgZGVmaW5l
ZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLXZhcmlhYmxlXQo+PiAgMTYzOSB8IHN0YXRpYyBzdHJ1
Y3QgbXQ4MTk1X2NhcmRfZGF0YSBtdDgxOTVfbXQ2MzU5X21heDk4MzkwX3J0NTY4Ml9jYXJkID0g
ewo+PiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1
LW10NjM1OS5jOjE2MzQ6MzI6IHdhcm5pbmc6IOKAmG10ODE5NV9tdDYzNTlfcnQxMDExX3J0NTY4
Ml9jYXJk4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC12YXJpYWJsZV0KPj4gIDE2
MzQgfCBzdGF0aWMgc3RydWN0IG10ODE5NV9jYXJkX2RhdGEgbXQ4MTk1X210NjM1OV9ydDEwMTFf
cnQ1NjgyX2NhcmQgPSB7Cj4+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+IHNvdW5kL3NvYy9tZWRpYXRlay9t
dDgxOTUvbXQ4MTk1LW10NjM1OS5jOjE2Mjk6MzI6IHdhcm5pbmc6IOKAmG10ODE5NV9tdDYzNTlf
cnQxMDE5X3J0NTY4Ml9jYXJk4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC12YXJp
YWJsZV0KPj4gIDE2MjkgfCBzdGF0aWMgc3RydWN0IG10ODE5NV9jYXJkX2RhdGEgbXQ4MTk1X210
NjM1OV9ydDEwMTlfcnQ1NjgyX2NhcmQgPSB7Cj4+ICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+Cj4+IFRoZXNl
IHZhcmlhYmxlcyBpcyBvbmx5IHVzZWQgd2l0aCBDT05GSUdfT0YsIG1vdmUgaXQgaW50byB0aGUg
aWZkZWYgYmxvY2suCj4+Cj4+IEZpeGVzOiA4NmE2YjljOWRmZmYgKCJBU29DOiBtZWRpYXRlazog
bXQ4MTk1OiBhZGQgbWFjaGluZSBzdXBwb3J0IGZvciBtYXg5ODM5MCBhbmQgcnQ1NjgyIikKPj4g
U2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgo+IAo+IEl0
J3MgZ2VuZXJhbGx5IGJldHRlciB0byByZW1vdmUgdGhlICNpZmRlZiByYXRoZXIgdGhhbiBleHBh
bmRpbmcgaXQsCj4gdGhlcmUgaXMgbm8gbmVlZCB0bwo+IHNhdmUgYSBmZXcgYnl0ZXMgb24ga2Vy
bmVsIGJ1aWxkcyBvZiB0aGlzIGRyaXZlciB0aGF0IGRpc2FibGUKPiBDT05GSUdfT0YuIEp1c3Qg
ZHJvcAo+IHRoZSBvZl9tYXRjaF9wdHIoKSBtYWNybyBhcyB3ZWxsLgoKU3VyZSwgd2lsbCBkbyB0
aGF0IGluIHYyLgo+IAo+IAo+ICAgICAgICAgQXJuZAo+IAo+IC4KPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
