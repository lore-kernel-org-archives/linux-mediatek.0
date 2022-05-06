Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77E7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 02:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TWpQz9H0mOh8dp3xSkquB/h3ccfD7l3IWkOyb42Vd+c=; b=A3MXKdlJzFYK4+
	VEK5m2WcRIg5de1kLWLX1+0su4TQ1EiD6y06w0fJKskTD6FleMFKNfSYaV4MK1GPpoEzsUwjgNsZj
	tHPPe0FzKs/+HwCzNGC9cMTTN1dcR0M5nMgYrYxmKCoWvli0AlMOi6hCan2EPX7wXzrqPo4ivTWrs
	bjtfXqF77rLuB7M3tFH6i7Crdhltazg+b0tko4SFneSZGJgYvkb+yhi7kiTqQoMQBhJ1uLwZuy1y/
	jy6EQDhj+5uOEodW8q+g2jr88lbdSVX79zuwDSWz1DES0VLpZIm7LX1wnpB8sgV1FvYwDVNvRGRzA
	l5QKQm5HZKktPMntCsXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmngI-000yNc-Sv; Fri, 06 May 2022 02:26:58 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmng7-000yK0-RJ; Fri, 06 May 2022 02:26:49 +0000
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KvZ854dLhzNkTG;
 Fri,  6 May 2022 10:21:57 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 6 May
 2022 10:26:39 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <matthias.bgg@gmail.com>, <tzungbi@google.com>,
 <angelogioacchino.delregno@collabora.com>, <trevor.wu@mediatek.com>
CC: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] ASoC: mediatek: mt8195: Fix build warning without
 CONFIG_OF
Date: Fri, 6 May 2022 10:26:38 +0800
Message-ID: <20220506022638.15864-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_192648_072149_27546407 
X-CRM114-Status: GOOD (  10.28  )
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
fn5+fn5+fn5+fn5+fn4KClRoZXNlIHZhcmlhYmxlcyBpcyBvbmx5IHVzZWQgd2l0aCBDT05GSUdf
T0YsIG1vdmUgaXQgaW50byB0aGUgaWZkZWYgYmxvY2suCgpGaXhlczogODZhNmI5YzlkZmZmICgi
QVNvQzogbWVkaWF0ZWs6IG10ODE5NTogYWRkIG1hY2hpbmUgc3VwcG9ydCBmb3IgbWF4OTgzOTAg
YW5kIHJ0NTY4MiIpClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2Vp
LmNvbT4KLS0tCiBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS1tdDYzNTkuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LW10NjM1OS5jIGIvc291bmQv
c29jL21lZGlhdGVrL210ODE5NS9tdDgxOTUtbXQ2MzU5LmMKaW5kZXggM2UzMmZlODAxYjNjLi5m
OTA2NzVmMTRkNjAgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1
LW10NjM1OS5jCisrKyBiL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LW10NjM1OS5j
CkBAIC0xNjI2LDYgKzE2MjYsNyBAQCBzdGF0aWMgaW50IG10ODE5NV9tdDYzNTlfZGV2X3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAorI2lmZGVm
IENPTkZJR19PRgogc3RhdGljIHN0cnVjdCBtdDgxOTVfY2FyZF9kYXRhIG10ODE5NV9tdDYzNTlf
cnQxMDE5X3J0NTY4Ml9jYXJkID0gewogCS5uYW1lID0gIm10ODE5NV9yMTAxOV81NjgyIiwKIAku
cXVpcmsgPSBSVDEwMTlfU1BFQUtFUl9BTVBfUFJFU0VOVCwKQEAgLTE2NDEsNyArMTY0Miw2IEBA
IHN0YXRpYyBzdHJ1Y3QgbXQ4MTk1X2NhcmRfZGF0YSBtdDgxOTVfbXQ2MzU5X21heDk4MzkwX3J0
NTY4Ml9jYXJkID0gewogCS5xdWlyayA9IE1BWDk4MzkwX1NQRUFLRVJfQU1QX1BSRVNFTlQsCiB9
OwogCi0jaWZkZWYgQ09ORklHX09GCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBt
dDgxOTVfbXQ2MzU5X2R0X21hdGNoW10gPSB7CiAJewogCQkuY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxOTVfbXQ2MzU5X3J0MTAxOV9ydDU2ODIiLAotLSAKMi4xNy4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
