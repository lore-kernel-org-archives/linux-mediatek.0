Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74652C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 02:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CEQBq3rBvDe4HYcWBVRvcJk5ewBIEcP9ROL0wLKgCbo=; b=40ASlua7FFzre5
	v6oV/xGG0Hoc9uAgr6ReP7kBJWDJ4oyzlIsA+jyPO5334SPZ/8hqfv5OySOHEfemTtcc6CJdI1aTG
	BN87tat/bTe8s4DuIowD0wdxdDJ6enXwhiY0bKWBnYEhVfw3DzjV0Uu8R92W+RHVm7zJGxgrIyBMF
	02uakAuazXC2BQhN3gbhHa31WpPQNtH76kgholRGrGlYFiYX7GjXTEwZJoXl7clRigIzNmXB7/5gJ
	mGhUdVKvZYaslAFi5RmVZZVxbHfgIKOS2ETOgTUgYqFPWUUYu+GbW9pBBB3JDv3de14MoBOtLfJcr
	Cm6dpJSeg4PhYQ8FRbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn9yA-005k1q-Es; Sat, 07 May 2022 02:14:54 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn9xz-005k0H-Ot; Sat, 07 May 2022 02:14:45 +0000
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Kw9t25f3zzGnxg;
 Sat,  7 May 2022 10:11:54 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 7 May
 2022 10:14:39 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <matthias.bgg@gmail.com>, <tzungbi@google.com>,
 <angelogioacchino.delregno@collabora.com>, <trevor.wu@mediatek.com>,
 <arnd@arndb.de>
CC: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH v2 -next] ASoC: mediatek: mt8195: Fix build warning without
 CONFIG_OF
Date: Sat, 7 May 2022 10:14:24 +0800
Message-ID: <20220507021424.12180-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_191444_020519_A92030A2 
X-CRM114-Status: GOOD (  10.86  )
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

c291bmQvc29jL21lZGlhdGVrL210ODE5NS9tdDgxOTUtbXQ2MzU5LmM6MTYzOTozMjogd2Fybmlu
Zzog4oCYbXQ4MTk1X210NjM1OV9tYXg5ODM5MF9ydDU2ODJfY2FyZOKAmSBkZWZpbmVkIGJ1dCBu
b3QgdXNlZCBbLVd1bnVzZWQtdmFyaWFibGVdCiAxNjM5IHwgc3RhdGljIHN0cnVjdCBtdDgxOTVf
Y2FyZF9kYXRhIG10ODE5NV9tdDYzNTlfbWF4OTgzOTBfcnQ1NjgyX2NhcmQgPSB7CiAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4Kc291bmQvc29jL21lZGlhdGVrL210ODE5NS9tdDgxOTUtbXQ2MzU5LmM6MTYzNDoz
Mjogd2FybmluZzog4oCYbXQ4MTk1X210NjM1OV9ydDEwMTFfcnQ1NjgyX2NhcmTigJkgZGVmaW5l
ZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLXZhcmlhYmxlXQogMTYzNCB8IHN0YXRpYyBzdHJ1Y3Qg
bXQ4MTk1X2NhcmRfZGF0YSBtdDgxOTVfbXQ2MzU5X3J0MTAxMV9ydDU2ODJfY2FyZCA9IHsKICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4Kc291bmQvc29jL21lZGlhdGVrL210ODE5NS9tdDgxOTUtbXQ2MzU5LmM6MTYy
OTozMjogd2FybmluZzog4oCYbXQ4MTk1X210NjM1OV9ydDEwMTlfcnQ1NjgyX2NhcmTigJkgZGVm
aW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLXZhcmlhYmxlXQogMTYyOSB8IHN0YXRpYyBzdHJ1
Y3QgbXQ4MTk1X2NhcmRfZGF0YSBtdDgxOTVfbXQ2MzU5X3J0MTAxOV9ydDU2ODJfY2FyZCA9IHsK
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KClNpbmNlIGFsbCB1c2VycyBvZiB0aGlzIGRyaXZlciBkbyBuZWVkIENP
TkZJR19PRiBhbnl3YXksIHRoZXJlIGlzIG5vCm5lZWQgdG8gc2F2ZSBhIGZldyBieXRlcyBvbiBr
ZXJuZWwgYnVpbGRzIHdoaWxlIENPTkZJR19PRiBkaXNhYmxlZCwgc28KanVzdCByZW1vdmUgdGhl
ICNpZmRlZiB0byBmaXggdGhpcyB3YXJuaW5nLgoKRml4ZXM6IDg2YTZiOWM5ZGZmZiAoIkFTb0M6
IG1lZGlhdGVrOiBtdDgxOTU6IGFkZCBtYWNoaW5lIHN1cHBvcnQgZm9yIG1heDk4MzkwIGFuZCBy
dDU2ODIiKQpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+
Ci0tLQp2MjogcmVtb3ZlICNpZmRlZiBibG9jayBhcyBBcm5kIHN1Z2dlc3RlZAotLS0KIHNvdW5k
L3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LW10NjM1OS5jIHwgNCAtLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4
MTk1L210ODE5NS1tdDYzNTkuYyBiL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LW10
NjM1OS5jCmluZGV4IGY5MDY3NWYxNGQ2MC4uNTRhMDBiMDY5OWIxIDEwMDY0NAotLS0gYS9zb3Vu
ZC9zb2MvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS1tdDYzNTkuYworKysgYi9zb3VuZC9zb2MvbWVk
aWF0ZWsvbXQ4MTk1L210ODE5NS1tdDYzNTkuYwpAQCAtMTYyNiw3ICsxNjI2LDYgQEAgc3RhdGlj
IGludCBtdDgxOTVfbXQ2MzU5X2Rldl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCXJldHVybiByZXQ7CiB9CiAKLSNpZmRlZiBDT05GSUdfT0YKIHN0YXRpYyBzdHJ1Y3QgbXQ4
MTk1X2NhcmRfZGF0YSBtdDgxOTVfbXQ2MzU5X3J0MTAxOV9ydDU2ODJfY2FyZCA9IHsKIAkubmFt
ZSA9ICJtdDgxOTVfcjEwMTlfNTY4MiIsCiAJLnF1aXJrID0gUlQxMDE5X1NQRUFLRVJfQU1QX1BS
RVNFTlQsCkBAIC0xNjU3LDcgKzE2NTYsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBtdDgxOTVfbXQ2MzU5X2R0X21hdGNoW10gPSB7CiAJfSwKIAl7fSwKIH07Ci0jZW5kaWYK
IAogc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIG10ODE5NV9tdDYzNTlfcG1fb3BzID0g
ewogCS5wb3dlcm9mZiA9IHNuZF9zb2NfcG93ZXJvZmYsCkBAIC0xNjY3LDkgKzE2NjUsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgbXQ4MTk1X210NjM1OV9wbV9vcHMgPSB7CiBz
dGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtdDgxOTVfbXQ2MzU5X2RyaXZlciA9IHsKIAku
ZHJpdmVyID0gewogCQkubmFtZSA9ICJtdDgxOTVfbXQ2MzU5IiwKLSNpZmRlZiBDT05GSUdfT0YK
IAkJLm9mX21hdGNoX3RhYmxlID0gbXQ4MTk1X210NjM1OV9kdF9tYXRjaCwKLSNlbmRpZgogCQku
cG0gPSAmbXQ4MTk1X210NjM1OV9wbV9vcHMsCiAJfSwKIAkucHJvYmUgPSBtdDgxOTVfbXQ2MzU5
X2Rldl9wcm9iZSwKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
