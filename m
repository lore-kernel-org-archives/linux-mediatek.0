Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13353C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 00:15:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B328164E3B
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 00:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B328164E3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RyhZF5L2p/ANrdkt87lOtsF+Sz6/ha1kUIej6DYH7To=; b=3hRjlGXiJu+9tmfgBKfP98RPc
	HlQ00hLnV/vFYS6t3/QFnadnV0re6jQsFnW07O7hQtbK/2I4dcVmzfzO4AjBxaAMtsMsXAaUi8/WD
	y6fixTpQNwV57V8D5Te0O26ZR/xSQTQI9jgdO0VA7GzmiDw3PTn0MuRgcAj+IT9Hk+9nS6CUk7baP
	Ff1h+oBdtbfO3J0zGQkRWokz/s2geHy7Z4wpHNGhCkPCmfRQcIo0Pwe5E3J2n8B53iBLMdWMa2rRJ
	xvp2HFyBpo38dL2Ik+DMGDGxABLBjwi3xPRJdL5RW6P9j9McnlESeeK87IIyswI/1mxpv/iwuSXTU
	f70bcDIXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9GgB-0007P8-1y; Tue, 09 Feb 2021 00:14:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Gg6-0007My-6r; Tue, 09 Feb 2021 00:14:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5A4D64EB6;
 Tue,  9 Feb 2021 00:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612829689;
 bh=WoOjxOk8JYT5efEA7HSlP75glTYtvejfp2tn/9Mzzhs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uhvbNFS8wAXY/9NR9b9Mamz2DDgTkOxSf0m+sS3XnHkntYhctfd+Og/wgum0T3w89
 VBJ+jSBK0/8q0KCXLhXEj/nn68fTc4mCA5pUK4qmaMzgqpheVMuLuwdWZgr/JPPGM+
 ecHKZsDLK1GoK/i97a7Ln05r11oJrlIDTtMzLz9grN7/Qz2el8KugzIzV9r8qYGsMn
 B8cPY0Byq7D8EXnXdON5ZRzZPo9EdxGKaP16TZUNUA9qXGbUiKTagPJ5Wfv+rqizzg
 Wn1vYf0VDjE+HbR/n5pb/7nJjNqULTLjd2+qWyeQj/Uj8JUI8FWDTu0PGeD4xU60f8
 IET+D4ponC/uA==
Received: by mail-ed1-f46.google.com with SMTP id s11so21399216edd.5;
 Mon, 08 Feb 2021 16:14:48 -0800 (PST)
X-Gm-Message-State: AOAM5316lix0O0+1r+AEWlkk0xY4XSFiEbppoiwdweqhqWAUJMBhLotW
 hx7qbPMjJhalqRhuG04hhyWmlckJSi33qtyIoA==
X-Google-Smtp-Source: ABdhPJwZu/LT//WuvGKVPlXuTP7AnCe2WDHnPiD5yYbRvAimq56Exf9C2zmxxRxrJUSZmx3eYYMvY1jDe0iuuqPDiF4=
X-Received: by 2002:a05:6402:1711:: with SMTP id
 y17mr19613530edu.72.1612829687397; 
 Mon, 08 Feb 2021 16:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20210208014221.196584-1-jitao.shi@mediatek.com>
 <20210208014221.196584-3-jitao.shi@mediatek.com>
In-Reply-To: <20210208014221.196584-3-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 9 Feb 2021 08:14:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9i0yQ5eg-X_AKXd=sj=6qxbeB8QgaziN-Sw2146iHPKA@mail.gmail.com>
Message-ID: <CAAOTY_9i0yQ5eg-X_AKXd=sj=6qxbeB8QgaziN-Sw2146iHPKA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/mediatek: mtk_dpi: Add dpi config for mt8192
To: Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_191450_331031_9736F211 
X-CRM114-Status: GOOD (  14.59  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, shuijing.li@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDLmnIg45pelIOmAseS4gCDkuIrljYg5OjQy5a+r6YGT77yaCgpXaGVyZSBpcyB0aGUgZGVzY3Jp
cHRpb24/IFNheSBzb21ldGhpbmcgaGVyZS4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkg
PGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHBpLmMgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiBpbmRleCBmZmE0YTBmMTk4OWYu
LmY2ZjcxZWI2N2ZmMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RwaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IEBAIC03
MDMsNiArNzAzLDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE4M19j
b25mID0gewo+ICAgICAgICAgLm1heF9jbG9ja19raHogPSAxMDAwMDAsCj4gIH07Cj4KPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTkyX2NvbmYgPSB7Cj4gKyAgICAgICAu
Y2FsX2ZhY3RvciA9IG10ODE4M19jYWxjdWxhdGVfZmFjdG9yLAo+ICsgICAgICAgLnJlZ19oX2Zy
ZV9jb24gPSAweGUwLAo+ICsgICAgICAgLm1heF9jbG9ja19raHogPSAxNTAwMDAsCj4gK307Cj4g
Kwo+ICBzdGF0aWMgaW50IG10a19kcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgewo+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiBAQCAt
ODM3LDYgKzg0Myw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kcGlf
b2ZfaWRzW10gPSB7Cj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1k
cGkiLAo+ICAgICAgICAgICAuZGF0YSA9ICZtdDgxODNfY29uZiwKPiAgICAgICAgIH0sCj4gKyAg
ICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1kcGkiLAo+ICsgICAgICAgICAu
ZGF0YSA9ICZtdDgxOTJfY29uZiwKPiArICAgICAgIH0sCj4gICAgICAgICB7IH0sCj4gIH07Cj4K
PiAtLQo+IDIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
