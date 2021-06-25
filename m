Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0121CC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:05:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5B586142D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5B586142D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ldzwr5iUv9GqkjB8kVjVj9U0TDXJ+/wU0OYh/vNfSE4=; b=fXAWGK76XF9Ur2
	f+CeJyO/OJjsF3FebMe3Coq3zc7pzp+fc+/MtitxvhmlXMGrr+LvxIAhKFsjPLyqkhMaxBQeYhcsB
	YVx+8rcQk8dmL7dql8HjhBNkUMsqJdr7NV3RbUDehRaAF5obx7VpEtAZ4233WElRC/75oU+8ASVBb
	u7uGelTU6NlOiTfnzhFIXWUW6s430Z+RAUFDZtHcnjuyWasoRLBq9MjeJBmOgdRotxM/lQi1pSeZB
	IQHOYoRVAN3+Kx+bdMqYZTW+qjcTLyNPnhC203Y3aql+eIWTumZBZa0kaRv2VSSdPV+J1qGi0SSBs
	FQ2MpU6EBwheq/UYisvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwiiO-000qXU-W5; Fri, 25 Jun 2021 10:05:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwhmj-000ZDg-BI; Fri, 25 Jun 2021 09:06:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 464656142D;
 Fri, 25 Jun 2021 09:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624611960;
 bh=JRVtn2LF05O4zsE0yUfn3O6+raSRPmcoBZK9SlvE3Ek=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PI8vE6yPun5p4JI5lqgqmoj6wFcIKcxACiN0n0/ZqHEgn94A8GTyrSmQiOucWmEem
 wagx0jY9FU0oNSkLNbPC59J3f7u8E3D6Jia9fiaWsFS2oe3ZnPGQDWo1KHjjl5qvlc
 QHTnZT1TqLP06ybaXUpfI1KcDzW3NwX3ceo4GnpypoPjF56tWZ9m+yXl1xNcSgePpE
 psFHRxRdPMIWawB6OsvISLD5D3L2lTSKPAeO2gsKU/D+S22vIwwjmyOMe90lsAqKVw
 pc+sL92BFmuOOpfHsfYX4YZQF9Xx7jx0T5fEw10EXx2yD5eeqX19DPiszNhtvyWdKm
 OS90IuLCsK5mQ==
Received: by mail-ed1-f41.google.com with SMTP id i5so12476465eds.1;
 Fri, 25 Jun 2021 02:06:00 -0700 (PDT)
X-Gm-Message-State: AOAM530mfIWSHFeHowPM5tpAKqgplTZ+nCJw8jxCa2+zJ5o/3BNMVGL9
 89kEGU4C6Ngpnd7sDjPSUwOsOk03VZmDjnN0Xg==
X-Google-Smtp-Source: ABdhPJxab4jkrfzwFP+D7IPG+I+O5aPJXlWlmFnx/IiQeIs3tugbHdgiEvdUB5GE3e2v6Hzy6jf90PdaVKtT5o0Hc94=
X-Received: by 2002:a05:6402:4cf:: with SMTP id
 n15mr13597628edw.162.1624611958809; 
 Fri, 25 Jun 2021 02:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <YNHg5NuJILrrBIZ/@mwanda>
In-Reply-To: <YNHg5NuJILrrBIZ/@mwanda>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 25 Jun 2021 17:05:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY__qnvFX4NB0G878S_J-mug4sTfynAukLGSD1xoMHKGdqA@mail.gmail.com>
Message-ID: <CAAOTY__qnvFX4NB0G878S_J-mug4sTfynAukLGSD1xoMHKGdqA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: mtk-cmdq: Fix uninitialized variable in
 cmdq_mbox_flush()
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_020601_472320_1BE83FA5 
X-CRM114-Status: GOOD (  13.63  )
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

SGksIERhbjoKCkRhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4g5pa8IDIw
MjHlubQ25pyIMjLml6Ug6YCx5LqMIOS4i+WNiDk6MDnlr6vpgZPvvJoKPgo+IFRoZSAiY2IiIHBv
aW50ZXIgbmVlZHMgdG8gYmUgaW5pdGlhbGl6ZWQgYmVmb3JlIGNhbiBhc3NpZ24KPiAiZGF0YS5k
YXRhID0gY2ItPmRhdGE7Ii4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4KCj4KPiBGaXhlczogNGEzY2IwMzAzOTg0ICgibWFpbGJveDogbXRrLWNt
ZHE6IFVzZSBtYWlsYm94IHJ4X2NhbGxiYWNrIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVu
dGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWFpbGJveC9t
dGstY21kcS1tYWlsYm94LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21k
cS1tYWlsYm94LmMgYi9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jCj4gaW5kZXgg
MzAxZTY1Yjk1MjdhLi42N2E0MmI1MTQ0MjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tYWlsYm94
L210ay1jbWRxLW1haWxib3guYwo+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWls
Ym94LmMKPiBAQCAtNDU1LDEwICs0NTUsMTAgQEAgc3RhdGljIGludCBjbWRxX21ib3hfZmx1c2go
c3RydWN0IG1ib3hfY2hhbiAqY2hhbiwgdW5zaWduZWQgbG9uZyB0aW1lb3V0KQo+Cj4gICAgICAg
ICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUodGFzaywgdG1wLCAmdGhyZWFkLT50YXNrX2J1c3lf
bGlzdCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaXN0X2VudHJ5KSB7Cj4g
KyAgICAgICAgICAgICAgIGNiID0gJnRhc2stPnBrdC0+YXN5bmNfY2I7Cj4gICAgICAgICAgICAg
ICAgIGRhdGEuc3RhID0gLUVDT05OQUJPUlRFRDsKPiAgICAgICAgICAgICAgICAgZGF0YS5kYXRh
ID0gY2ItPmRhdGE7Cj4gICAgICAgICAgICAgICAgIGRhdGEucGt0ID0gdGFzay0+cGt0Owo+IC0g
ICAgICAgICAgICAgICBjYiA9ICZ0YXNrLT5wa3QtPmFzeW5jX2NiOwo+ICAgICAgICAgICAgICAg
ICBpZiAoY2ItPmNiKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNiLT5jYihkYXRhKTsKPgo+
IC0tCj4gMi4zMC4yCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
