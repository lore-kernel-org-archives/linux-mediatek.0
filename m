Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15470C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:52:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBCE3613F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBCE3613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:CC:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=954ly2xOiYREl4KiIHd0wH9DbtoCf1lcwNBZeojcCn4=; b=SoR286k3vQT9xL
	6RdW3urYPnIroHcG1pr4sUuHDVnxi8BQ9XTmVkhATyK3pzVjLScQ3d/3pJiosB/oQtSulEjNas8jn
	oVWM0bmeCBm7cZqMbCNjF3OcEwrxvVDidL/dIHRU/uEWAbmKlBkQJYl5g2iqE5ZOZkUzYqgOE4PHZ
	IpW/wjmxh5FjGPEfrcG5rliOlEWqoxWlyP7C6QV2OkHNwMg+yiCmsRW/K7wkHTGaimNl18UtwRfuY
	7IsEtBhbYq+wfY36M0VACLPztPb4hjJ4f5KMm0clTWJm2W58rjdM2kSxiY6bg/1F2Kkeo9rkGu55j
	cdHZoDMQNvyw6AilZjag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llnOW-00Blch-4K; Wed, 26 May 2021 06:51:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llnOS-00BlaJ-HL; Wed, 26 May 2021 06:51:53 +0000
X-UUID: 9b22f853bebe49a58c28f6a6b0e1f0a5-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=Ef3pnCm9We5Q9KDDo1U7lOmeoKmB0n0p7CA0ZFxyAWc=; 
 b=o3MLLQjyFsPEKDwPWp1edaaLPSVjLkgsVmf08ZfvqIFZKwtscTjHNj6L9pJ2C96D4Dz7JHQ14jEC/Tu+0wOUnyCmjfLW8kKnMpKx8WNJn+9sgCeNs+q9ZnLvUACENwlu11fFH81F+pCbymsai5TSQWQ3QcLlHyiOwTvVebpegLs=;
X-UUID: 9b22f853bebe49a58c28f6a6b0e1f0a5-20210525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 462837755; Tue, 25 May 2021 23:51:50 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 23:51:48 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 May 2021 14:51:44 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 May 2021 14:51:44 +0800
Message-ID: <1622011904.21671.3.camel@mhfsdcap03>
Subject: Re: [PATCH 2/3] mailbox: mtk-cmdq: Use mailbox rx_callback
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>, "Bibby
 Hsieh" <bibby.hsieh@mediatek.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Date: Wed, 26 May 2021 14:51:44 +0800
In-Reply-To: <CAAOTY_-yo0oWfgaCNNvkESgnWf6cyY=1g0T82-_aTJ-d7EiUWw@mail.gmail.com>
References: <20210314233323.23377-1-chunkuang.hu@kernel.org>
 <20210314233323.23377-3-chunkuang.hu@kernel.org>
 <CAAOTY_-yo0oWfgaCNNvkESgnWf6cyY=1g0T82-_aTJ-d7EiUWw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F74DB410A06C4BA0766489CE693BD946516CD910FEBAA2C684F99D03057429CB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_235152_610332_A67B8F25 
X-CRM114-Status: GOOD (  19.38  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UmV2aWV3ZWQtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPg0K
DQpPbiBXZWQsIDIwMjEtMDUtMjYgYXQgMTQ6MTcgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6
DQo+ICsgWW9uZ3FpYW5nDQo+IA0KPiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVs
Lm9yZz4g5pa8IDIwMjHlubQz5pyIMTXml6Ug6YCx5LiAIOS4iuWNiDc6MzPlr6vpgZPvvJoNCj4g
Pg0KPiA+IHJ4X2NhbGxiYWNrIGlzIGEgc3RhbmRhcmQgbWFpbGJveCBjYWxsYmFjayBtZWNoYW5p
c20gYW5kIGNvdWxkIGNvdmVyIHRoZQ0KPiA+IGZ1bmN0aW9uIG9mIHByb3ByaWV0YXJ5IGNtZHFf
dGFza19jYiwgc28gdXNlIHRoZSBzdGFuZGFyZCBvbmUgaW5zdGVhZCBvZg0KPiA+IHRoZSBwcm9w
cmlldGFyeSBvbmUuIEJ1dCB0aGUgY2xpZW50IGRyaXZlciBoYXMgYWxyZWFkeSB1c2VkIGNtZHFf
dGFza19jYiwNCj4gPiBzbyBrZWVwIGNtZHFfdGFza19jYiB1bnRpbCBhbGwgY2xpZW50IGRyaXZl
ciB1c2UgcnhfY2FsbGJhY2sgaW5zdGVhZCBvZg0KPiA+IGNtZHFfdGFza19jYi4NCj4gPg0KPiA+
IENjOiBKYXNzaSBCcmFyIDxqYXNzaXNpbmdoYnJhckBnbWFpbC5jb20+DQo+ID4gQ2M6IE1hdHRo
aWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+DQo+ID4gQ2M6IEhvdWxvbmcgV2Vp
IDxob3Vsb25nLndlaUBtZWRpYXRlay5jb20+DQo+ID4gQ2M6IEJpYmJ5IEhzaWVoIDxiaWJieS5o
c2llaEBtZWRpYXRlay5jb20+DQo+ID4gQ2M6IERlbm5pcyBZQyBIc2llaCA8ZGVubmlzLXljLmhz
aWVoQG1lZGlhdGVrLmNvbT4NCj4gPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0K
PiA+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gPiBDYzogbGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+IFNpZ25lZC1vZmYtYnk6IENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJz
L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jIHwgMTQgKysrKysrKysrLS0tLS0NCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jIGIvZHJpdmVycy9t
YWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiA+IGluZGV4IDNkMzdjMWNkNDBmMS4uZWY1OWUy
MjM0ZjIyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94
LmMNCj4gPiArKysgYi9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+ID4gQEAg
LTE4OCw3ICsxODgsMTAgQEAgc3RhdGljIHZvaWQgY21kcV90YXNrX2V4ZWNfZG9uZShzdHJ1Y3Qg
Y21kcV90YXNrICp0YXNrLCBpbnQgc3RhKQ0KPiA+ICAgICAgICAgV0FSTl9PTihjYi0+Y2IgPT0g
KGNtZHFfYXN5bmNfZmx1c2hfY2IpTlVMTCk7DQo+ID4gICAgICAgICBkYXRhLnN0YSA9IHN0YTsN
Cj4gPiAgICAgICAgIGRhdGEuZGF0YSA9IGNiLT5kYXRhOw0KPiA+IC0gICAgICAgY2ItPmNiKGRh
dGEpOw0KPiA+ICsgICAgICAgaWYgKGNiLT5jYikNCj4gPiArICAgICAgICAgICAgICAgY2ItPmNi
KGRhdGEpOw0KPiA+ICsNCj4gPiArICAgICAgIG1ib3hfY2hhbl9yZWNlaXZlZF9kYXRhKHRhc2st
PnRocmVhZC0+Y2hhbiwgJmRhdGEpOw0KPiA+DQo+ID4gICAgICAgICBsaXN0X2RlbCgmdGFzay0+
bGlzdF9lbnRyeSk7DQo+ID4gIH0NCj4gPiBAQCAtNDUxLDEyICs0NTQsMTMgQEAgc3RhdGljIGlu
dCBjbWRxX21ib3hfZmx1c2goc3RydWN0IG1ib3hfY2hhbiAqY2hhbiwgdW5zaWduZWQgbG9uZyB0
aW1lb3V0KQ0KPiA+DQo+ID4gICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUodGFzaywg
dG1wLCAmdGhyZWFkLT50YXNrX2J1c3lfbGlzdCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsaXN0X2VudHJ5KSB7DQo+ID4gKyAgICAgICAgICAgICAgIGRhdGEuc3RhID0g
LUVDT05OQUJPUlRFRDsNCj4gPiArICAgICAgICAgICAgICAgZGF0YS5kYXRhID0gY2ItPmRhdGE7
DQo+ID4gICAgICAgICAgICAgICAgIGNiID0gJnRhc2stPnBrdC0+YXN5bmNfY2I7DQo+ID4gLSAg
ICAgICAgICAgICAgIGlmIChjYi0+Y2IpIHsNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBk
YXRhLnN0YSA9IC1FQ09OTkFCT1JURUQ7DQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgZGF0
YS5kYXRhID0gY2ItPmRhdGE7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChjYi0+Y2IpDQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgY2ItPmNiKGRhdGEpOw0KPiA+IC0gICAgICAgICAgICAg
ICB9DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBtYm94X2NoYW5fcmVjZWl2ZWRfZGF0YSh0
YXNrLT50aHJlYWQtPmNoYW4sICZkYXRhKTsNCj4gPiAgICAgICAgICAgICAgICAgbGlzdF9kZWwo
JnRhc2stPmxpc3RfZW50cnkpOw0KPiA+ICAgICAgICAgICAgICAgICBrZnJlZSh0YXNrKTsNCj4g
PiAgICAgICAgIH0NCj4gPiAtLQ0KPiA+IDIuMTcuMQ0KPiA+DQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
