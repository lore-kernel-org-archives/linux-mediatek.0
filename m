Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B59C606A32C
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 06:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2dTit3Z4;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.a=rsa-sha256 header.s=dkim header.b=hAH12G5b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mXYQzIaaSv6AmSi2udnXwEZprmwNs4qcFT5JHKRMs9c=; b=2dTit3Z4v9cbnRzvxYB5IjgEBr
	2W6m+5LyAx0rGVc1EgWeZHuBkG2zLVJuH7YF0hFuycnKiygAXD4yACaDc2Wy8HC4KnTyRtVRxzour
	9t6qxh6ueuRb8/RFvw1NJOKQE9fuTzsQnwZOH1Kgt86QAoxO0BALM+HgkOh1GrGNzAwBoQjIFj/8d
	PTiRVAWbDhijgTa7SjkbpmX7N90vz+4reMVb6p7P92cqaMQPXNPTtjZKQIxHGP4iiJXKgxjq/FP/2
	MsWPp7qYjGfZvwXBZa+YSHmBpxVdLGbrkh9N/zwh8IkIuZG56TOyyXWKIv78LvdkxDdLhO06M7Dtl
	AJb+AG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIRX-0000000EBKa-2JCN;
	Fri, 20 Nov 2026 06:49:55 +0000
Received: from itemail.ite.com.tw ([60.251.196.230] helo=ironport.ite.com.tw)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIRU-0000000EBJo-3j4b;
	Fri, 20 Nov 2026 06:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mXYQzIaaSv6AmSi2udnXwEZprmwNs4qcFT5JHKRMs9c=;
  b=hAH12G5bQ2UlaOx5NeJ2GMg6h0Koh4UF5Z5OI0tWBiaLKyzLiwnfo9vH
   yo6BdwhHRJ0/6BbgSUG6fYNIjkma8ICyl+ytbcoJ5GxmTEvsZSp/tcrPh
   AZzx/as8fjSpX3At0Yp3X0cvRO6lyb2d3GTVZ4MHXXpkykZBacbGVormt
   EU73YNezgPtUeNKW6Eg/Mv1UK3mSXP/f5JaOgwanUXJ+akEwrQW2v3mLn
   mj9Jdbqez1lV6r6RfY3VaCykn2ho5KE2jXCvXgAxAeoG4ZihRBJy3mxxa
   Fu/6sPyNhw0/L3r5ZbpzZJA2qwtYdiC7KaGBJBqX7qM8wA1OsYwdlveIi
   g==;
X-CSE-ConnectionGUID: bEqCvRHgRlWKXLF3WFlqxw==
X-CSE-MsgGUID: knnoYdR8Ss6NQAgog7IGlA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 20 Nov 2026 14:49:46 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw [192.168.15.58])
	by mse.ite.com.tw with ESMTP id 6AK6nfum040993;
	Fri, 20 Nov 2026 14:49:41 +0800 (+08)
	(envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 20 Nov 2026 14:49:39 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291%3]) with mapi id
 15.02.2562.046; Fri, 20 Nov 2026 14:49:39 +0800
From: <Hermes.Wu@ite.com.tw>
To: <daniel@makrotopia.org>
CC: <luca.ceresoli@bootlin.com>, <andrzej.hajda@intel.com>,
        <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
        <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
        <angelogioacchino.delregno@collabora.com>, <allen.chen@ite.com.tw>,
        <treapking@chromium.org>, <wenst@chromium.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: RE: [PATCH v8 08/14] drm/bridge: it6505: avoid division by zero in
 audio FS debug print
Thread-Topic: [PATCH v8 08/14] drm/bridge: it6505: avoid division by zero in
 audio FS debug print
Thread-Index: AQHddahmDGCOZ1R9702oMT4TMp7f/bczKViwgAHqqYCAAXcSgA==
Date: Fri, 20 Nov 2026 06:49:39 +0000
Message-ID: <da7b73e6ab2749438acd2909cc9deebf@ite.com.tw>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <26ee2c94c42fb09c081201071cb5730c96c8c25b.1790552614.git.daniel@makrotopia.org>
 <179251509978.78870.2485132679226608837.b4-review@b4>
 <179481904178.211952.8076269834336042526@makrotopia.org>
 <9485b4a86b124cc3a528ca147609bf4c@ite.com.tw>
 <av8jL0W1vgdqPQhu@makrotopia.org>
In-Reply-To: <av8jL0W1vgdqPQhu@makrotopia.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tm-snts-smtp: 60F66699CD10F79D09AD0BF56ADA95C39007560D7B71D33B564E58776966AD952002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 6AK6nfum040993
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_224953_630066_615D90C5 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRGFuaWVsDQoNCj5PbiBUaHUsIE5vdiAxOSwgMjAyNiBhdCAwNDoyNjoyM1BNICswMDAwLCBE
YW5pZWwgR29sbGUgd3JvdGU6DQo+IEkgd2FzIGFmcmFpZCB0aGUgYm91bmNpbmcgZW1haWxzIG9m
IHRoZSBmb3JtZXIgZHJpdmVyIG1haW50YWluZXJzIHdvdWxkDQo+IGluZGljYXRlIHRoZSBkcml2
ZXIgaGFzIG5vdyBiZWVuIG9ycGhhbmVkLiBJdCdkIGhlbmNlIGJlIGdyZWF0IGlmIHlvdQ0KPiBj
YW4gZW5saXN0IHlvdXJzZWxmIGluIHRoZSBNQUlOVEFJTkVSUyBmaWxlIGZvciB0aGF0IGRyaXZl
ci4NCg0KU3VyZSwgSSdsbCBzZW5kIGEgcGF0Y2ggYWRkaW5nIGEgTUFJTlRBSU5FUlMgZW50cnkg
Zm9yIHRoZSBJVDY1MDUNCmFuZCByZXBsYWNpbmcgQWxsZW4gYXMgbWFpbnRhaW5lciBpbiB0aGUg
YmluZGluZy4NCg0KQmVzdCByZWdhcmRzLA0KSGVybWVzDQo=

