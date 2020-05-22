Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CC3C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 03:48:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3467B207D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 03:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D8BDUZeA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3467B207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C5wRI23VlVIidTg3/tEQZ9VOF/Fri44WqiJd7k67+dk=; b=D8BDUZeA7wq5FM
	/DovRZaSqENI5hwb+y9DPvvD5Ffj6AfjFYa/TxSrmpLfh3YDEHlRC92H8KzNPTcoOgw+XsZPxW6H9
	rb9T/Jzahc5AmtrkxRzBAS/SLL9svKDBApyfHPwlYw7Wzp6LUS+2+adfaY7VweOPcK6QfVhl684Xs
	reBIY7/swEGEjKWg7ew5S/feFBJ0heN91b9Ol5C7BhKiWcHUAbbiGKzQPajcrcNtIraPVC502Bt8R
	nqIswhw+8XKXNEQ5DbAA655EcR9RCw9coHKAmcDQzPaJTGAbda+8ELRGTCoYD7XFBuZqHoeD3838E
	96QJ7tYKlMJbxtiVFfkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbyfY-0000sa-ED; Fri, 22 May 2020 03:48:24 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbyfM-0000hX-Fb; Fri, 22 May 2020 03:48:13 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3F11374CB98CDB456CAC;
 Fri, 22 May 2020 11:48:01 +0800 (CST)
Received: from localhost (10.166.215.154) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Fri, 22 May 2020
 11:47:53 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <nbd@nbd.name>, <lorenzo.bianconi83@gmail.com>, <ryder.lee@mediatek.com>, 
 <kvalo@codeaurora.org>, <davem@davemloft.net>, <kuba@kernel.org>,
 <matthias.bgg@gmail.com>, <shayne.chen@mediatek.com>,
 <chih-min.chen@mediatek.com>, <yf.luo@mediatek.com>,
 <yiwei.chung@mediatek.com>
Subject: [PATCH -next] mt76: mt7915: Fix build error
Date: Fri, 22 May 2020 11:45:33 +0800
Message-ID: <20200522034533.61716-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.166.215.154]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_204812_684050_0070759A 
X-CRM114-Status: UNSURE (   6.40  )
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
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVkZS9saW51eC9maXJtd2FyZS5oOjY6MCwKICAg
ICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3
OTE1L21jdS5jOjQ6CkluIGZ1bmN0aW9uIOKAmF9fbXQ3OTE1X21jdV9tc2dfc2VuZOKAmSwKICAg
IGlubGluZWQgZnJvbSDigJhtdDc5MTVfbWN1X3NlbmRfbWVzc2FnZeKAmSBhdCBkcml2ZXJzL25l
dC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzkxNS9tY3UuYzozNzA6NjoKLi9pbmNsdWRlL2xp
bnV4L2NvbXBpbGVyLmg6Mzk2OjM4OiBlcnJvcjogY2FsbCB0byDigJhfX2NvbXBpbGV0aW1lX2Fz
c2VydF81NDXigJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgZXJyb3I6IEJVSUxEX0JVR19PTiBm
YWlsZWQ6IGNtZCA9PSBNQ1VfRVhUX0NNRF9FRlVTRV9BQ0NFU1MgJiYgbWN1X3R4ZC0+c2V0X3F1
ZXJ5ICE9IE1DVV9RX1FVRVJZCiAgX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywg
X19jb21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeCi4vaW5jbHVkZS9saW51eC9jb21waWxlci5oOjM3Nzo0OiBub3Rl
OiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmF9fY29tcGlsZXRpbWVfYXNzZXJ04oCZCiAgICBw
cmVmaXggIyMgc3VmZml4KCk7ICAgIFwKICAgIF5+fn5+fgouL2luY2x1ZGUvbGludXgvY29tcGls
ZXIuaDozOTY6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmF9jb21waWxldGltZV9h
c3NlcnTigJkKICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBpbGV0
aW1lX2Fzc2VydF8sIF9fQ09VTlRFUl9fKQogIF5+fn5+fn5+fn5+fn5+fn5+fn4KLi9pbmNsdWRl
L2xpbnV4L2J1aWxkX2J1Zy5oOjM5OjM3OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCY
Y29tcGlsZXRpbWVfYXNzZXJ04oCZCiAjZGVmaW5lIEJVSUxEX0JVR19PTl9NU0coY29uZCwgbXNn
KSBjb21waWxldGltZV9hc3NlcnQoIShjb25kKSwgbXNnKQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+Ci4vaW5jbHVkZS9saW51eC9idWlsZF9i
dWcuaDo1MDoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQlVJTERfQlVHX09OX01T
R+KAmQogIEJVSUxEX0JVR19PTl9NU0coY29uZGl0aW9uLCAiQlVJTERfQlVHX09OIGZhaWxlZDog
IiAjY29uZGl0aW9uKQogIF5+fn5+fn5+fn5+fn5+fn4KZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVk
aWF0ZWsvbXQ3Ni9tdDc5MTUvbWN1LmM6MjgwOjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNy
byDigJhCVUlMRF9CVUdfT07igJkKICBCVUlMRF9CVUdfT04oY21kID09IE1DVV9FWFRfQ01EX0VG
VVNFX0FDQ0VTUyAmJgogIF5+fn5+fn5+fn5+fgoKQlVJTERfQlVHX09OIGlzIG1lYW5pbmdsZXNz
IGhlcmUsIGNoYW5nIGl0IHRvIFdBUk5fT04uCgpGaXhlczogZTU3Yjc5MDE0NjlmICgibXQ3Njog
YWRkIG1hYzgwMjExIGRyaXZlciBmb3IgTVQ3OTE1IFBDSWUtYmFzZWQgY2hpcHNldHMiKQpTaWdu
ZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVy
cy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWN1LmMgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWN1LmMgYi9kcml2ZXJz
L25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzkxNS9tY3UuYwppbmRleCBmMDBhZDJiNjY3
NjEuLjk5ZWVlYTQyNDc4ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0
ZWsvbXQ3Ni9tdDc5MTUvbWN1LmMKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsv
bXQ3Ni9tdDc5MTUvbWN1LmMKQEAgLTI3Nyw4ICsyNzcsOCBAQCBzdGF0aWMgaW50IF9fbXQ3OTE1
X21jdV9tc2dfc2VuZChzdHJ1Y3QgbXQ3OTE1X2RldiAqZGV2LCBzdHJ1Y3Qgc2tfYnVmZiAqc2ti
LAogCX0KIAogCW1jdV90eGQtPnMyZF9pbmRleCA9IE1DVV9TMkRfSDJOOwotCUJVSUxEX0JVR19P
TihjbWQgPT0gTUNVX0VYVF9DTURfRUZVU0VfQUNDRVNTICYmCi0JCSAgICAgbWN1X3R4ZC0+c2V0
X3F1ZXJ5ICE9IE1DVV9RX1FVRVJZKTsKKwlXQVJOX09OKGNtZCA9PSBNQ1VfRVhUX0NNRF9FRlVT
RV9BQ0NFU1MgJiYKKwkJbWN1X3R4ZC0+c2V0X3F1ZXJ5ICE9IE1DVV9RX1FVRVJZKTsKIAogZXhp
dDoKIAlpZiAod2FpdF9zZXEpCi0tIAoyLjE3LjEKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
