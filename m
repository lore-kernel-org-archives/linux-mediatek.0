Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AA1C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 23:39:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7529E61222
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 23:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7529E61222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hALmuvYPWFctPljl4hhfTSmlXXHbD2zBDZcJbOEOgL0=; b=PDjGzwEHJY1i+XADBcIZYqxul
	mGnYKlwBxHZiAnWGhFSGBC0JLlpSysa0j4yuUCltelyi+WdYMrVE7V7u39FIx57fB4Gz4qGyG6iKz
	dbCckc9eN94a2g57E6c8K7L+ilrS/abvHI9oXsu0Q5LcSAAMznmvBTGoY018XVAMr9MOqoDDcX//N
	nV00cgdYKqh7p9E7rs8116Fr5NlRAMeEMXK7DCH8c7l4FD4zTXR7NMj9L3Ms2dg85laCQRAMbFayY
	BAWHm6chqPkYIjvdI8KZ3a6dMM3TPKZfkuHgJlPQ1f5aRjxVOYogcz9ueZ60GCzKgaHw/aaW0Itnc
	6Pzj+f0KQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWScL-00Aq87-GW; Tue, 13 Apr 2021 23:38:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWSc1-00Aq5a-Rr; Tue, 13 Apr 2021 23:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=htsf6aD6EqqnVlH0yV1TrgIDVjKYzvx4Z0qXn2GRqt4=; b=u7hU7s5S21+1vvIt/hIkHUTsvL
 /klPgzA5bDoQNKg/WnV5FRcCuyRNBct+NA3bC+2OnUkBgtZ9e1Y5fGl+4f8WiMcmW05hfDtaU6ZVy
 R0RKDetbaAzbyTI1gZvoAn/7voju9/R1rhpg/xvtFNrXW795gYRqn/AmOVBVDsDdNQLY4BFnL3eyg
 AKk8fbdIYgi1DXb2yNj5TNfqbwE8gLN5rofpiy0J5lvREah2DdvjNIpVCt5oz9w7HGcarkbtFLvxz
 AX4p8em92kEi5QH0kQhOLKHk2l+/3PSRWP/MDiQ0d/JinZKY9wLsoVWxlQY++Lv1VtmIS2cEJ3F9I
 BEUoadug==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWSbz-007O40-2W; Tue, 13 Apr 2021 23:38:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0552F61222;
 Tue, 13 Apr 2021 23:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618357106;
 bh=i/SPq4DqaHJFgtAIJjeY4ErFuPgoVxrSMsgumddGdOI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Sd2VJPUiLekJVilp57UiDBL6O4v7RlzURmQiCz61C6TJFAUcEiNMB8W+Za0OjJOhr
 +k2AaiTWCIcgiwA/9RhlPiUJ73M1nEeMM5lSO/kowTe8jzk9+JAs7nVYZFjC0iSknc
 oU1OZQXgIE9hFXJRoSclXeIZVo7dqGtO7GbZgzIqvUhpMC/tTQ8Zm0oj9SgnZAAJLG
 HtV5EZtahqk5v8AxWQAs2EMToBlp2h76pIfYjUSIMVNLLzFrtdjFAJ0qDv3LLDr1Zm
 UXIcdQuIMfPtIl/iHqLLwLlsIdXYTjBuQh36r48koOaDbv6It0V4dAH6H9r712KO5x
 UWo6MQJ5HZOxg==
Received: by mail-ej1-f51.google.com with SMTP id u17so28596542ejk.2;
 Tue, 13 Apr 2021 16:38:25 -0700 (PDT)
X-Gm-Message-State: AOAM5302TsnYYniVsb5NNlvLVm4eNaz11beYUws1xMSMmXT4IpbiqWXD
 K/ErK5Q9Q9ruu3MSAyM6bkpN0py6/PVQG4dIOA==
X-Google-Smtp-Source: ABdhPJzpH5eOS77fuaMMC1TeLT9DWDR87PI5sxoQLhq7SEPIPoVBozS6J7PZv1i/qiEEVXTWa8fAM544xi4x8RQkXWM=
X-Received: by 2002:a17:906:b01:: with SMTP id
 u1mr8479963ejg.310.1618357104520; 
 Tue, 13 Apr 2021 16:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618226325-31927-4-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1618226325-31927-4-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 14 Apr 2021 07:38:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY__zcdjA-tu4kNtWjy=37_HZV1U2fS6=k4OBAbjfNwC9Ow@mail.gmail.com>
Message-ID: <CAAOTY__zcdjA-tu4kNtWjy=37_HZV1U2fS6=k4OBAbjfNwC9Ow@mail.gmail.com>
Subject: Re: [PATCH v2, 3/5] Revert "dt-bindings: mailbox: mtk-gce: fix
 incorrect mbox-cells value"
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_163827_171912_9D46CC8E 
X-CRM114-Status: GOOD (  16.49  )
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

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDTmnIgxMuaXpSDpgLHkuIAg5LiL5Y2INzoxOeWvq+mBk++8mgo+Cj4gVGhp
cyByZXZlcnRzIGNvbW1pdCBmODNiMDNmYzcyN2FiNTZhNzdlNjg3MTNkNmU0MDI5OTY5OGYzYzlm
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRl
ay5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94
L210ay1nY2UudHh0IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWFpbGJveC9tdGstZ2NlLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tYWlsYm94L210ay1nY2UudHh0Cj4gaW5kZXggNzc3MWVjYS4uY2Y0OGNkOCAxMDA2NDQK
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9tdGstZ2Nl
LnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L210
ay1nY2UudHh0Cj4gQEAgLTQ3LDcgKzQ3LDcgQEAgRXhhbXBsZToKPiAgICAgICAgICAgICAgICAg
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDEzNSBJUlFfVFlQRV9MRVZFTF9MT1c+Owo+ICAgICAgICAg
ICAgICAgICBjbG9ja3MgPSA8JmluZnJhY2ZnIENMS19JTkZSQV9HQ0U+Owo+ICAgICAgICAgICAg
ICAgICBjbG9jay1uYW1lcyA9ICJnY2UiOwo+IC0gICAgICAgICAgICAgICAjbWJveC1jZWxscyA9
IDwyPjsKPiArICAgICAgICAgICAgICAgI21ib3gtY2VsbHMgPSA8Mz47CgpJIHRoaW5rIHdlIHNo
b3VsZCBub3QgY2hhbmdlIHRoZSBiaW5kaW5nIGp1c3QgdG8gZml4IHNvZnR3YXJlIGJ1Zy4KSSB0
aGluayB0aGVyZSBhcmUgbWFueSB0ZW1wb3Jhcnkgc29sdXRpb24gdG8gZml4IGRybSBidWcuIElm
IGRybSBidWcKaXMgY2F1c2VkIGJ5IGN1cnNvciBwbGFuZSwgeW91IGNvdWxkIHRlbXBvcmFyaWx5
IGxldCBkcm0gbm90IHN1cHBvcnQKY3Vyc29yIHBsYW5lIHRvIGZpeCBpdCAoaW4gWzFdLCBkbyBu
b3QgcmV0dXJuIERSTV9QTEFORV9UWVBFX0NVUlNPUikuCkJ1dCBJIHdvdWxkIGxpa2UgeW91IHRv
IGZpbmQgb3V0IHRoZSBjb3JyZWN0IHNvbHV0aW9uIHJhdGhlciB0aGFuIGEKdGVtcG9yYXJ5IHNv
bHV0aW9uIGJlY2F1c2UgdGhpcyBidWcgaXMgbm90IHNvIHVyZ2VudC4gKEZvciBtZSwgYnVnIG9m
CmJ1aWxkIGZhaWwsIGJvb3QgZmFpbCwgYmxhY2sgc2NyZWVuIGlzIHVyZ2VudCkuCgpbMV0gaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGlu
dXguZ2l0L3RyZWUvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jP2g9djUu
MTItcmM3I242OTkKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICAgICAgICAgfTsKPgo+ICBFeGFt
cGxlIGZvciBhIGNsaWVudCBkZXZpY2U6Cj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
