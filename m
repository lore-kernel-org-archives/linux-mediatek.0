Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF307C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8M9aUOejX9EMGd5pu0FZQmDKD0zficDcF7t41wevxQ=; b=mpNUKItEDe0q3D
	19XkhpQR2h01ElYzMapeMxpgGNLoC4Uav2Cp4VBPTQNcLTKa1MAmhhDw0+VuOmxAPtXua0FHu6XUr
	ekUcCsw+0+Hh41nZLiys/fDNBOIDVeGVB13gUzbjOp/caj0y0hwjoHotZ2oWpDzKy+dwjlTAogqpd
	WJP99KPe1CoJzmLevDuaYre9EE+JWMKfUcYARgiVEViLSqlQk/d6VnfTQ/nUySSpALXtgkFwv1h4Z
	A7P5bVJJUBAoLb7S1IjH9g+kPCB2jxBbMZa8oJxn8texNplk0TZSwNy8UhwIPup4SGrBMZDtKrGvb
	1f7UXV6qimXTJTHcJCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnG1n-006WaL-G9; Sat, 07 May 2022 08:43:03 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnG1k-006WZ0-Bx; Sat, 07 May 2022 08:43:01 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MRC3Y-1nQDOs39ka-00N9oK; Sat, 07 May 2022 10:42:55 +0200
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2f16645872fso102483477b3.4; 
 Sat, 07 May 2022 01:42:54 -0700 (PDT)
X-Gm-Message-State: AOAM5305oxpw4AhMjBsmQ8fNJB9PGzXgX4aY3w7AasvN1ohClEos8kwH
 P6tvTjSDBuNpky4DTh5lL5lQrsMJbu7ISNQxqZQ=
X-Google-Smtp-Source: ABdhPJz41aUj/+pW1sZWxLrXajtnNs3IdnmCkPvNJurEZtj0IpvMA1ea1Z+O8FJy68YG/6GjY7AECeBWF00pOfGqm4g=
X-Received: by 2002:a81:9213:0:b0:2f6:eaae:d22f with SMTP id
 j19-20020a819213000000b002f6eaaed22fmr6217535ywg.249.1651912972980; Sat, 07
 May 2022 01:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220507021424.12180-1-yuehaibing@huawei.com>
In-Reply-To: <20220507021424.12180-1-yuehaibing@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 7 May 2022 10:42:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3haxtEjZL4jZ9a1xbZdEGAgG=NxDwWQ=syvQArett2Fw@mail.gmail.com>
Message-ID: <CAK8P3a3haxtEjZL4jZ9a1xbZdEGAgG=NxDwWQ=syvQArett2Fw@mail.gmail.com>
Subject: Re: [PATCH v2 -next] ASoC: mediatek: mt8195: Fix build warning
 without CONFIG_OF
To: YueHaibing <yuehaibing@huawei.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:8GbSkSOivZKWRNw0ukMfgWroUwd9PEwEj8+djoy+M8n6VQxcgcg
 RCjS+xNnLsPgKBkDmGe3GemYEAIRePoTHDsBZLeQ8fHYJvm0lIWp+MvQQDBqoHl3f0cNovA
 p9jP/7pL6p4glNHKW9rYj6AgCDI4Mlu78e8q/0TVk9vEtqEQhLqxLAtiP95X6RjdFPM8JLt
 +BpieWIuf7uVzJJboZcaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/NzFWD9aymI=:4nHotfvFlKhnTpdEPY5z2D
 7gPlf8us7ThbRsiCIFHIXuKk2e9fmlh5xkTWS2RM3JZyTOigSp70YksmKSzSm9g9tKq2Rm1e9
 j/q4O7PLHq8cyxaedGvDX1d4f6W+C84G3WQpOBl3O3zuLS8LkI02ziv5U7vf1BjLJ+VPdlUsX
 hlAAyqz7X5Z12wiJcvNk8/1pW3FrL/rpNl1LbDF62MPQQys8jkZX9a9aeVrHSz3UhgPwgXk6C
 TMle9Y+o3z4llxMjjMxIVWeiMhqBQm9Adl8ImufLoyFei7DDfHU2SBnLeqBh0hoE/T32SL8wu
 gFBzOwmwIKdE1K/6kjrfVCSFnsvtx2Y+BSUJPea9rSaI7uesQpQ7/WHUe+OswixcdtBSPtVoP
 f9g5HzSkGuuN3wNqBVYvib4EElOK7j6fH3S0YaL+l031zcNscbq07yV7gaT+PMD7vT5Caqt/Q
 EATHVOksCi1UxqH2WkDb2Zx53xx38SF3KpRAMGcTLWHhXTqY+XKCC4e3qmoxrQscJLCsWFSbJ
 tgd0BdS631vfc8e2FKvGOTSixShTZiBB1HCRcjEf23kxeEqkcHeWxr4XepiqHoTQPXuWMH8ki
 jKEat4GTR4/PH/NVxQh+5OxXYlq5MawiVxb9HmvN45HJ1YjttFPFUUhnGh3yzwKLyE3Fbjava
 yN+NPBsQVhGhhrt8St7rLM1zPhuJclueHAANX+LZKd3XR7DlQdlp9GiXVAZjgZ4ro7jB5Dvu4
 Bjrs8nlEoht/epX7OpiM4dLHSVh2JYnm99fc/a2i9CykIF8Q6D5/fXEMkvmsnbzV+GysPG8ws
 H19X3r7sPmFDl0Qu43cq4lMHa67Tsr8A7El4hQn9A0wsNtefcc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_014300_750293_C63CEB78 
X-CRM114-Status: GOOD (  14.53  )
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

T24gU2F0LCBNYXkgNywgMjAyMiBhdCA0OjE0IEFNIFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVh
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
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPgo+IFNp
bmNlIGFsbCB1c2VycyBvZiB0aGlzIGRyaXZlciBkbyBuZWVkIENPTkZJR19PRiBhbnl3YXksIHRo
ZXJlIGlzIG5vCj4gbmVlZCB0byBzYXZlIGEgZmV3IGJ5dGVzIG9uIGtlcm5lbCBidWlsZHMgd2hp
bGUgQ09ORklHX09GIGRpc2FibGVkLCBzbwo+IGp1c3QgcmVtb3ZlIHRoZSAjaWZkZWYgdG8gZml4
IHRoaXMgd2FybmluZy4KPgo+IEZpeGVzOiA4NmE2YjljOWRmZmYgKCJBU29DOiBtZWRpYXRlazog
bXQ4MTk1OiBhZGQgbWFjaGluZSBzdXBwb3J0IGZvciBtYXg5ODM5MCBhbmQgcnQ1NjgyIikKPiBT
aWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4g
djI6IHJlbW92ZSAjaWZkZWYgYmxvY2sgYXMgQXJuZCBzdWdnZXN0ZWQKCkxvb2tzIGdvb2QgdG8g
bWUsCgpBY2tlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
