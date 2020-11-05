Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,
	CHARSET_FARAWAY_HEADER,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD45C4742C
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 12:06:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C8E122243
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 12:05:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cJ2jMzpD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C8E122243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZXxscXMdtz1ehOA9tqlTi2094J/mYiYezWS3t1wnPds=; b=cJ2jMzpD5u51c5zqzYHjE0CS1
	XOZvJPDHz2ZClwroYoijW1aDiWqY5tRZKAOr1UQZHaHuQ+KswjjS98tBirSHyGB4jbVUh6Lrrl1ll
	0Oy3ARvGLLotCUGdIhPQbLxreuKG/GpQj1efMNP4zav20c8PbWa92Y7xuhQYs3XQQtdRB/K7aDGSi
	HXeyn4q8m+CSfuB+hx3fTOakKyoRW/17NXS1WEu252Zhrld38KM2K/Hpv858BPT1SJXl85UEznFmg
	eY2zLC6jCRGwPBUjtNPCgeCyiUkUX0ze1CfgnguJuA0GvGJP/AqSqecx8+MXo2A7NSnsW+89uxIvG
	pYbiwJTUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kae1W-0006pN-09; Thu, 05 Nov 2020 12:05:50 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kae1P-0006kS-VY; Thu, 05 Nov 2020 12:05:46 +0000
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4CRhzt591Vz52Dh;
 Thu,  5 Nov 2020 20:05:30 +0800 (CST)
Received: from dggemi709-chm.china.huawei.com (10.3.20.108) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Thu, 5 Nov 2020 20:05:34 +0800
Received: from dggemi762-chm.china.huawei.com (10.1.198.148) by
 dggemi709-chm.china.huawei.com (10.3.20.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Thu, 5 Nov 2020 20:05:34 +0800
Received: from dggemi762-chm.china.huawei.com ([10.1.198.148]) by
 dggemi762-chm.china.huawei.com ([10.1.198.148]) with mapi id 15.01.1913.007;
 Thu, 5 Nov 2020 20:05:33 +0800
From: "Zouwei (Samuel)" <zou_wei@huawei.com>
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
 <tiwai@suse.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIC1uZXh0XSBBU29DOiBtZWRpYXRlazogbXQ4MTkyOiBN?=
 =?gb2312?Q?ake_some_symbols_static?=
Thread-Topic: [PATCH -next] ASoC: mediatek: mt8192: Make some symbols static
Thread-Index: AQHWs2nWluaJsVCcpEKkmgl3F4+tXam5cHAg
Date: Thu, 5 Nov 2020 12:05:33 +0000
Message-ID: <5f10d3f7d9b24bdc82b7ce9f6bf50023@huawei.com>
References: <1604577724-24687-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1604577724-24687-1-git-send-email-zou_wei@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.178.100]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_070545_038656_2570B41E 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgYWxsLA0KDQpQbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2gsIEknbGwgc2VuZCBhbm90aGVyIHBh
dGNoIHdpdGggb3RoZXIgZml4ZXMuDQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBab3V3
ZWkgKFNhbXVlbCkgDQq3osvNyrG85DogMjAyMMTqMTHUwjXI1SAyMDowMg0KytW8/sjLOiBsZ2ly
ZHdvb2RAZ21haWwuY29tOyBicm9vbmllQGtlcm5lbC5vcmc7IHBlcmV4QHBlcmV4LmN6OyB0aXdh
aUBzdXNlLmNvbTsgbWF0dGhpYXMuYmdnQGdtYWlsLmNvbQ0Ks63LzTogYWxzYS1kZXZlbEBhbHNh
LXByb2plY3Qub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IFpvdXdlaSAoU2FtdWVsKSA8em91X3dlaUBodWF3ZWkuY29tPg0K1vfM4jogW1BBVENIIC1u
ZXh0XSBBU29DOiBtZWRpYXRlazogbXQ4MTkyOiBNYWtlIHNvbWUgc3ltYm9scyBzdGF0aWMNCg0K
Rml4IHRoZSBmb2xsb3dpbmcgc3BhcnNlIHdhcm5pbmdzOg0KDQouL210ODE5Mi1kYWktaTJzLmM6
MjA0MDo1OiB3YXJuaW5nOiBzeW1ib2wgJ210ODE5Ml9kYWlfaTJzX2dldF9zaGFyZScgd2FzIG5v
dCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8NCi4vbXQ4MTkyLWRhaS1pMnMuYzoyMDYw
OjU6IHdhcm5pbmc6IHN5bWJvbCAnbXQ4MTkyX2RhaV9pMnNfc2V0X3ByaXYnIHdhcyBub3QgZGVj
bGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/DQoNClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxo
dWxrY2lAaHVhd2VpLmNvbT4NClNpZ25lZC1vZmYtYnk6IFpvdSBXZWkgPHpvdV93ZWlAaHVhd2Vp
LmNvbT4NCi0tLQ0KIHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWRhaS1pMnMuYyB8
IDQgKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQoNCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1kYWktaTJz
LmMgYi9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1kYWktaTJzLmMNCmluZGV4IDUz
YzU2MGUuLjViMjkzNDAgMTAwNjQ0DQotLS0gYS9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210
ODE5Mi1kYWktaTJzLmMNCisrKyBiL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWRh
aS1pMnMuYw0KQEAgLTIwMzcsNyArMjAzNyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Fm
ZV9pMnNfcHJpdiBtdDgxOTJfaTJzX3ByaXZbREFJX0kyU19OVU1dID0gew0KIAl9LA0KIH07DQog
DQotaW50IG10ODE5Ml9kYWlfaTJzX2dldF9zaGFyZShzdHJ1Y3QgbXRrX2Jhc2VfYWZlICphZmUp
DQorc3RhdGljIGludCBtdDgxOTJfZGFpX2kyc19nZXRfc2hhcmUoc3RydWN0IG10a19iYXNlX2Fm
ZSAqYWZlKQ0KIHsNCiAJc3RydWN0IG10ODE5Ml9hZmVfcHJpdmF0ZSAqYWZlX3ByaXYgPSBhZmUt
PnBsYXRmb3JtX3ByaXY7DQogCWNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqb2Zfbm9kZSA9IGFm
ZS0+ZGV2LT5vZl9ub2RlOyBAQCAtMjA1Nyw3ICsyMDU3LDcgQEAgaW50IG10ODE5Ml9kYWlfaTJz
X2dldF9zaGFyZShzdHJ1Y3QgbXRrX2Jhc2VfYWZlICphZmUpDQogCXJldHVybiAwOw0KIH0NCiAN
Ci1pbnQgbXQ4MTkyX2RhaV9pMnNfc2V0X3ByaXYoc3RydWN0IG10a19iYXNlX2FmZSAqYWZlKQ0K
K3N0YXRpYyBpbnQgbXQ4MTkyX2RhaV9pMnNfc2V0X3ByaXYoc3RydWN0IG10a19iYXNlX2FmZSAq
YWZlKQ0KIHsNCiAJaW50IGk7DQogCWludCByZXQ7DQotLQ0KMi42LjINCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
