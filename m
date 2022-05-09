Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBC9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 12:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qlj1KMoKibbJsLPpXxKVwxdi895f5wA+GgleMubpe2w=; b=PPvBd4+c0Ins5t
	UkY9CBn6RLd0r9b+3q5ADcfeRUaYFC4zh2U5CI8u3gY/Qzuq8N63il4+Y5j2jr/0gnVdxCJDPkhZf
	cxxrUemlu5u5ByrJ7ttAoSZS0R0Zv89VMrInZhaxPrv5nBfmM1ZBYhr+0ROXG/QhIs4438dMHfjBr
	6RI+B62A/f9vIPyDrkEx0VTu1Z6EvTk3BybLJQXeXERButgp3HZUzyH8wrMXL7YiA6yi98c5CQvXV
	sCi4yiRykx1FzhigJHPel8TcqcmU/Kbk93bk2N81SS2lD33gDQNRfjJRT6FWwe4hRgnFePgNumHr6
	rBj3PSQXaNf0qWDwXJLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no2Fr-00EHWY-TN; Mon, 09 May 2022 12:12:47 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no2Fd-00EHNW-IH; Mon, 09 May 2022 12:12:35 +0000
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Kxg2v3PrQzGpj4;
 Mon,  9 May 2022 20:09:43 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 20:12:30 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <matthias.bgg@gmail.com>, <tzungbi@google.com>,
 <angelogioacchino.delregno@collabora.com>, <trevor.wu@mediatek.com>,
 <arnd@arndb.de>
CC: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH v3 -next] ASoC: mediatek: mt8195: Fix build warning without
 CONFIG_OF
Date: Mon, 9 May 2022 20:09:18 +0800
Message-ID: <20220509120918.9000-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_051233_810323_3E14CC54 
X-CRM114-Status: GOOD (  11.34  )
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
CkFja2VkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KdjM6IHJlYmFzZSBv
biBuZXh0LTIwMjIwNTA5CnYyOiByZW1vdmUgI2lmZGVmIGJsb2NrIGFzIEFybmQgc3VnZ2VzdGVk
Ci0tLQogc291bmQvc29jL21lZGlhdGVrL210ODE5NS9tdDgxOTUtbXQ2MzU5LmMgfCA0IC0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9t
ZWRpYXRlay9tdDgxOTUvbXQ4MTk1LW10NjM1OS5jIGIvc291bmQvc29jL21lZGlhdGVrL210ODE5
NS9tdDgxOTUtbXQ2MzU5LmMKaW5kZXggM2UzMmZlODAxYjNjLi41NGEwMGIwNjk5YjEgMTAwNjQ0
Ci0tLSBhL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LW10NjM1OS5jCisrKyBiL3Nv
dW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LW10NjM1OS5jCkBAIC0xNjQxLDcgKzE2NDEs
NiBAQCBzdGF0aWMgc3RydWN0IG10ODE5NV9jYXJkX2RhdGEgbXQ4MTk1X210NjM1OV9tYXg5ODM5
MF9ydDU2ODJfY2FyZCA9IHsKIAkucXVpcmsgPSBNQVg5ODM5MF9TUEVBS0VSX0FNUF9QUkVTRU5U
LAogfTsKIAotI2lmZGVmIENPTkZJR19PRgogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgbXQ4MTk1X210NjM1OV9kdF9tYXRjaFtdID0gewogCXsKIAkJLmNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ4MTk1X210NjM1OV9ydDEwMTlfcnQ1NjgyIiwKQEAgLTE2NTcsNyArMTY1Niw2IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10ODE5NV9tdDYzNTlfZHRfbWF0Y2hb
XSA9IHsKIAl9LAogCXt9LAogfTsKLSNlbmRpZgogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9w
bV9vcHMgbXQ4MTk1X210NjM1OV9wbV9vcHMgPSB7CiAJLnBvd2Vyb2ZmID0gc25kX3NvY19wb3dl
cm9mZiwKQEAgLTE2NjcsOSArMTY2NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29w
cyBtdDgxOTVfbXQ2MzU5X3BtX29wcyA9IHsKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
IG10ODE5NV9tdDYzNTlfZHJpdmVyID0gewogCS5kcml2ZXIgPSB7CiAJCS5uYW1lID0gIm10ODE5
NV9tdDYzNTkiLAotI2lmZGVmIENPTkZJR19PRgogCQkub2ZfbWF0Y2hfdGFibGUgPSBtdDgxOTVf
bXQ2MzU5X2R0X21hdGNoLAotI2VuZGlmCiAJCS5wbSA9ICZtdDgxOTVfbXQ2MzU5X3BtX29wcywK
IAl9LAogCS5wcm9iZSA9IG10ODE5NV9tdDYzNTlfZGV2X3Byb2JlLAotLSAKMi4xNy4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
