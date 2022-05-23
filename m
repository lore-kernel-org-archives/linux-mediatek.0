Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85609C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEqLwoAF6gldXQSWBrbITcxDofUwvLzzWWVo+eH2uWI=; b=opLBTjPcsKIFI2
	5Lc8/d5ADsuyWGxFwAjP2U3zRM/fKBVIMVE8dq+B5twHUSdFirKDDPAmaSNvFzmYSufaSkA4kb5FC
	cs04vPESygsdfq9eex5agbStBcwekel+EirweD1i/NoqmLKhPvMbHPhIs/Dw6e1m4D0J2F9QmhKSt
	zUztZNaKuJVQv7BmYKqfavSReq0GhcjyEJfIACzAqA9GW5qogIxFy6FcOq7ERq3dOE/7P1K+7ld48
	xYUfuLMuHGSAW7f9vhkZRkeM7rKCCBNK+ZkEFokR486DiDVQg2UaI8AY6zZk02cb8ayXTO2C4Zx2O
	XOHJn3369KeYPOofirvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4Cn-002mQf-Ro; Mon, 23 May 2022 09:18:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2ob-002AAA-K3; Mon, 23 May 2022 07:49:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=QIwzzBHqurNW0MflVEjdYTAjy2cInSyxA3uq1qK/eMs=; b=oZ+LqUXvedoXcPhnT+lsjlY3X/
 zqUFm9NSd2CzoQSP5/KykdiDGIAd0d5ZOA+llvLp3vKCDVcpfhnou7wMftAewaAcufG14FwcJCiB5
 NG2NbkfjsTpHoEMcapltfzJ1WY4sbBPtYJoeOCKhCqUkjafQ4hzATEFEiPx+v7jLF+yn6poMf8hUj
 pr4gkuCF26xLnP9nIDZEelbU+AXBOMMAdGnh62sRm/yrty8RVjq4HYPYOp9L4Dhmo1V1B/iEgeFaZ
 f4NmGMN6kqLT/NSbCKvL2mX6fJRJe0ZphgxLogAacROrtyaQYUttXwrcQbY1SIXqQYfErml+vv21N
 v+YS44ug==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt1Hn-000szH-1o; Mon, 23 May 2022 06:11:26 +0000
X-UUID: ca471c4debca4e5ab3beff727eacc80a-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:23c9cdd7-78ff-48f6-85a8-e97c98e7e213, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:35ff2ee3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: ca471c4debca4e5ab3beff727eacc80a-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 451387705; Sun, 22 May 2022 23:10:52 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 23:01:00 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 14:00:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 14:00:58 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <nfraprado@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v8 11/19] clk: mediatek: reset: Add reset support for simple
 probe
Date: Mon, 23 May 2022 14:00:48 +0800
Message-ID: <20220523060056.24396-12-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_071124_499657_778A71E8 
X-CRM114-Status: UNSURE (   9.98  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

LSBBZGQgYSBwb2ludGVyIG9mICJtdGtfY2xrX3JzdF9kZXNjIiB0byAibXRrX2Nsa19kZXNjIi4K
LSBBZGQgcmVnaXN0ZXIgcmVzZXQgd2l0aCBkZXZpY2UgZnVuY3Rpb24gaW4gbXRrX2Nsa19zaW1w
bGVfcHJvYmUoKS4KClNpZ25lZC1vZmYtYnk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRp
YXRlay5jb20+ClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxv
Z2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogTsOtY29sYXMg
Ri4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgpUZXN0ZWQtYnk6IE7DrWNv
bGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJz
L2Nsay9tZWRpYXRlay9jbGstbXRrLmMgfCA3ICsrKysrKysKIGRyaXZlcnMvY2xrL21lZGlhdGVr
L2Nsay1tdGsuaCB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXRrLmMgYi9kcml2ZXJzL2Nsay9tZWRp
YXRlay9jbGstbXRrLmMKaW5kZXggYjkxODgwMDBhYjNjLi4wNWExODhjNjIxMTkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdGsuYworKysgYi9kcml2ZXJzL2Nsay9tZWRp
YXRlay9jbGstbXRrLmMKQEAgLTQ0NCw2ICs0NDQsMTMgQEAgaW50IG10a19jbGtfc2ltcGxlX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0
YShwZGV2LCBjbGtfZGF0YSk7CiAKKwlpZiAobWNkLT5yc3RfZGVzYykgeworCQlyID0gbXRrX3Jl
Z2lzdGVyX3Jlc2V0X2NvbnRyb2xsZXJfd2l0aF9kZXYoJnBkZXYtPmRldiwKKwkJCQkJCQkgICBt
Y2QtPnJzdF9kZXNjKTsKKwkJaWYgKHIpCisJCQlnb3RvIHVucmVnaXN0ZXJfY2xrczsKKwl9CisK
IAlyZXR1cm4gcjsKIAogdW5yZWdpc3Rlcl9jbGtzOgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsv
bWVkaWF0ZWsvY2xrLW10ay5oIGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ay5oCmluZGV4
IDZlZDBjNzQ1Y2FlMi4uMWI5NWM0ODRkNWFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9tZWRp
YXRlay9jbGstbXRrLmgKKysrIGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ay5oCkBAIC0x
OTIsNiArMTkyLDcgQEAgc3RydWN0IGNsa19odyAqbXRrX2Nsa19yZWdpc3Rlcl9yZWYydXNiX3R4
KGNvbnN0IGNoYXIgKm5hbWUsCiBzdHJ1Y3QgbXRrX2Nsa19kZXNjIHsKIAljb25zdCBzdHJ1Y3Qg
bXRrX2dhdGUgKmNsa3M7CiAJc2l6ZV90IG51bV9jbGtzOworCWNvbnN0IHN0cnVjdCBtdGtfY2xr
X3JzdF9kZXNjICpyc3RfZGVzYzsKIH07CiAKIGludCBtdGtfY2xrX3NpbXBsZV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KTsKLS0gCjIuMTguMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
