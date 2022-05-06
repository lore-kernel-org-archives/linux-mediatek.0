Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC51CC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 07:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LP3z2I4CPUWi/GZ4s1RkEASP4WyGtyfuZm1vrGLh/RI=; b=UmC/s9FXxTrmLM
	5IjMfWcluPf30/9oJ/98ZmPeHAf/82UNG4HneqPrLZqORXZvrKSDCxClT6GttRQkoP/5D4DbVRu6V
	V1VfGkLHQbbF66yNFhGgHInN+xI+qS0Pg2goGLIq5YntmvBB8hJ3nnMNnZOyzNhRZBX1VrtPQkvao
	j2wXBHQW007Xefj8R//qSTvJS3GtYMAUZ9FJniYOzpd0xkdrazFRZflfoK6oss/pnVDjGTE0BGSdl
	OgcN0sMTdiqAjDIAycH6zf0+Lpu/cTda6fjWDdRZMgeKg8A5TIs7Bkg3fbCbTCnuo5EmcFGlHtuxC
	x25+M0LEipCXlTKgcR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nms4s-001kvO-BM; Fri, 06 May 2022 07:08:38 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nms4p-001ks0-97; Fri, 06 May 2022 07:08:36 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MStGi-1nO5Nk1Zj4-00UMBu; Fri, 06 May 2022 09:08:26 +0200
Received: by mail-wr1-f41.google.com with SMTP id b19so8760505wrh.11;
 Fri, 06 May 2022 00:08:26 -0700 (PDT)
X-Gm-Message-State: AOAM533G050/qaTUhV3cpatddI4SumqPB0jZmhueSvmQ9JeXPfy3hwS8
 fO9K8w9SIaAe30QbdOsMbGGo4T9EDRc6Gw+0g/w=
X-Google-Smtp-Source: ABdhPJyxQL7zXUvqc8Kd4IsKQ8DDXXLoN0a7JzRoOljSaWzZBetR0EfL9eTA1FbUSvR8gVY1EVpw67HhWtjipCJXf7Q=
X-Received: by 2002:a5d:5986:0:b0:20c:5844:820d with SMTP id
 n6-20020a5d5986000000b0020c5844820dmr1442079wri.192.1651820906011; Fri, 06
 May 2022 00:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220506022638.15864-1-yuehaibing@huawei.com>
In-Reply-To: <20220506022638.15864-1-yuehaibing@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 6 May 2022 09:08:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2iPwOaRgrW6gw+8ZvxwKDROWFtoCz2LLF9RFDuDrEcJQ@mail.gmail.com>
Message-ID: <CAK8P3a2iPwOaRgrW6gw+8ZvxwKDROWFtoCz2LLF9RFDuDrEcJQ@mail.gmail.com>
Subject: Re: [PATCH -next] ASoC: mediatek: mt8195: Fix build warning without
 CONFIG_OF
To: YueHaibing <yuehaibing@huawei.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:eZoapwxsRyWm5f14BeanJSJceQvOh7WABOGCF2AO6ZXy+etIGMS
 rybuVMMMK6oSOXyGlra9OwntZ/WHUmQ26ZdeAII7zUv+TSTePaYxGvqHkWBpINH2bawhZTz
 XWiqzjCjZcX7vn5jDirWRpHbuSD6LAILT/Zg7k3OgASGj8gKGg/6k/QTVAKIFA1M/8+UYnB
 FoIWi5VwF7v2Wm7QYjHQQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FNiciwW900w=:Ixp2JSwyuoYxYqjpSCiMXD
 Lp5N1NAYNaZaiuA7SQ/vG3OT0aG0fnh1L3XfP5jnshRU0FDMlPA9U57QZexgZvIpjGnjpBcqN
 1KvbZgJyD2weGqZQ7TxqokXc3iyOMVDI7YgGtHjTXGS9x4TebdrDdh1UG3gaJgQlXtc+Pe0x8
 e4PEbJ/rxLIdSyg9EcYkI18LGGl+u/YUAhavIVfXgsjEGzfRG5OK7ljpKrCbTF6lK85bGSwCQ
 vXQidIwnDol9/XG5F+ZWas1ELRjvI6ZaqCDFD/RE0cw3ZA2p5WjVhnT2cT5QX7CF6IbyLeSFF
 ev4oRDvRFiqXvAOyZbcqSkNWEMTCM6+Hc0Lc+U2dKRQgzV9a7H9NXfvh0RddP2beXYlwfrFP5
 VNsw+MCfrImeE7hEbEbaExaneu+h2TrfuO1ogBS6YXXIjhE3+FkIP7NYpOY/c0HTXplsD5UXq
 96WP1NpR9F3PRFpRlf05ZHT0rihJghIR3RVPwnXt9iSmW/RCuVsQnc9KoqSjGWfsAqdDhGy3S
 0gkX9i+932cwW5gFl4l3O79tlFdrc3ZS7asPOJhJMVwyN36M2C9Flf7KHmtk46/l82YKiKQde
 EXV5yf569YByxI8eLoolyxAp65IdDQ670j5XukIrBJIOtRTs5pHwLqIbXi0ROHhOLNHxMXcd6
 qKWvdVGipPaCsFmJClFXmpqSnhoegAzFYUbcOzCybYCUUYKjhBEUmcktH15nrSOY9zps=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_000835_643435_824583CA 
X-CRM114-Status: GOOD (  14.57  )
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

T24gRnJpLCBNYXkgNiwgMjAyMiBhdCA0OjI2IEFNIFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVh
d2VpLmNvbT4gd3JvdGU6Cj4KPiBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS1tdDYz
NTkuYzoxNjM5OjMyOiB3YXJuaW5nOiDigJhtdDgxOTVfbXQ2MzU5X21heDk4MzkwX3J0NTY4Ml9j
YXJk4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC12YXJpYWJsZV0KPiAgMTYzOSB8
IHN0YXRpYyBzdHJ1Y3QgbXQ4MTk1X2NhcmRfZGF0YSBtdDgxOTVfbXQ2MzU5X21heDk4MzkwX3J0
NTY4Ml9jYXJkID0gewo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4
MTk1L210ODE5NS1tdDYzNTkuYzoxNjM0OjMyOiB3YXJuaW5nOiDigJhtdDgxOTVfbXQ2MzU5X3J0
MTAxMV9ydDU2ODJfY2FyZOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtdmFyaWFi
bGVdCj4gIDE2MzQgfCBzdGF0aWMgc3RydWN0IG10ODE5NV9jYXJkX2RhdGEgbXQ4MTk1X210NjM1
OV9ydDEwMTFfcnQ1NjgyX2NhcmQgPSB7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBzb3VuZC9zb2MvbWVk
aWF0ZWsvbXQ4MTk1L210ODE5NS1tdDYzNTkuYzoxNjI5OjMyOiB3YXJuaW5nOiDigJhtdDgxOTVf
bXQ2MzU5X3J0MTAxOV9ydDU2ODJfY2FyZOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVz
ZWQtdmFyaWFibGVdCj4gIDE2MjkgfCBzdGF0aWMgc3RydWN0IG10ODE5NV9jYXJkX2RhdGEgbXQ4
MTk1X210NjM1OV9ydDEwMTlfcnQ1NjgyX2NhcmQgPSB7Cj4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPgo+IFRo
ZXNlIHZhcmlhYmxlcyBpcyBvbmx5IHVzZWQgd2l0aCBDT05GSUdfT0YsIG1vdmUgaXQgaW50byB0
aGUgaWZkZWYgYmxvY2suCj4KPiBGaXhlczogODZhNmI5YzlkZmZmICgiQVNvQzogbWVkaWF0ZWs6
IG10ODE5NTogYWRkIG1hY2hpbmUgc3VwcG9ydCBmb3IgbWF4OTgzOTAgYW5kIHJ0NTY4MiIpCj4g
U2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgoKSXQncyBn
ZW5lcmFsbHkgYmV0dGVyIHRvIHJlbW92ZSB0aGUgI2lmZGVmIHJhdGhlciB0aGFuIGV4cGFuZGlu
ZyBpdCwKdGhlcmUgaXMgbm8gbmVlZCB0bwpzYXZlIGEgZmV3IGJ5dGVzIG9uIGtlcm5lbCBidWls
ZHMgb2YgdGhpcyBkcml2ZXIgdGhhdCBkaXNhYmxlCkNPTkZJR19PRi4gSnVzdCBkcm9wCnRoZSBv
Zl9tYXRjaF9wdHIoKSBtYWNybyBhcyB3ZWxsLgoKCiAgICAgICAgQXJuZAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
