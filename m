Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F29C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 00:09:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8602F64E9A
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 00:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8602F64E9A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hbEoBQnDCtpOFTwncJOham+exMd8eXg4+aN2uMl5FQU=; b=VI73PlKQw8kVMpm1UUVAl+yDz
	TZpekcvGGoPrP/INisue6FFtuYwvyLktfXys7cLWcAnM+7B3Ve6hdGUNR6liK/9arzmyx2aNNd/VB
	QiBw+Aqlc73qQ4gGAOq8fOqXp90TiOp8qzbX570X2u5RCUCVi/jIC8AvNUt3iGkWOeYW1Zy42UPrI
	hEYKeEk7g7Y/yl1ZqLC4R0DnDZ8blxzC6Ashsjv9B0f25wE9tvjFW8GEEVY+hJ07syIGGnV17+9/+
	zt7ld/7zfDOvIhtPE3SG/uNXkq9Kv21WIeocSwX5n2KYlrKFtfl4knsDCDbxEds1qVEJ+asB/LohZ
	l9UfgZqdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9GaU-0006Sw-AG; Tue, 09 Feb 2021 00:09:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9GaR-0006SD-1r; Tue, 09 Feb 2021 00:08:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA6D064EB4;
 Tue,  9 Feb 2021 00:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612829337;
 bh=BIx3eGSYs9bP+3OswyB3XhNzfUFRBY2kgxghItTuskE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=opBunexJL58nGbpC8oGnOZvEL9CH7dTCEutJETDFyqqk8OqRVYhu33yw1KZEUz5cX
 KhDYoY2040yNEc0HU9kiCkCl6pD7nbK+Y1eZEEVcKgb247l/JesoZILG9qOD83FPOR
 ZYXEQyfsA/lX1sS09fsOniXXt/ksqBH/3QJQxosF45ncce1mgg3FcdoDvBHS5ZB/J/
 f6QCfLr+ywhCiwahmEA1elvZKxNlt/DD4CDe5Km9BcBXLyoEykuY+/nlWKjeY+60NM
 U8KcjKlY9oOb2C6noew90FZvJffP2yv2esgMZInXOcUiZeVoJ7LjGMBlHwYjmBU7Tg
 jCrOFvl3PHVXA==
Received: by mail-ej1-f52.google.com with SMTP id a9so28541590ejr.2;
 Mon, 08 Feb 2021 16:08:56 -0800 (PST)
X-Gm-Message-State: AOAM531GTSPBtNSzct3Gy3bjVem33WdyzNagSCsutItKMQ2pZTbWsI5o
 gvBmrwbieMu32sOjl4H8bH6tbkALprd9mG9zhA==
X-Google-Smtp-Source: ABdhPJzpLqbujyvxL39zTOTeUscDS/tYzRbxuOzriw8VhEGNKVWX8nbXtvNGzdKFO2JaeBLgzu8Et0m/dH+2P6MVock=
X-Received: by 2002:a17:906:708f:: with SMTP id
 b15mr19813910ejk.267.1612829335422; 
 Mon, 08 Feb 2021 16:08:55 -0800 (PST)
MIME-Version: 1.0
References: <20210208014221.196584-1-jitao.shi@mediatek.com>
 <20210208014221.196584-4-jitao.shi@mediatek.com>
In-Reply-To: <20210208014221.196584-4-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 9 Feb 2021 08:08:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-WZRUgSBNTe2-Xu1+pkK2RAEScacYZTcHkSUuqXDU5Mg@mail.gmail.com>
Message-ID: <CAAOTY_-WZRUgSBNTe2-Xu1+pkK2RAEScacYZTcHkSUuqXDU5Mg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek, dpi: add mt8192 to mediatek,
 dpi
To: Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_190859_187738_8E25A3A4 
X-CRM114-Status: GOOD (  13.94  )
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
tDLmnIg45pelIOmAseS4gCDkuIrljYg5OjQy5a+r6YGT77yaCj4KPiBBZGQgY29tcGF0aWJsZSAi
bWVkaWF0ZWssbXQ4MTkyLWRwaSIgZm9yIHRoZSBtdDgxOTIgZHBpLgo+CgpSZXZpZXdlZC1ieTog
Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+IFNpZ25lZC1vZmYtYnk6
IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbCAgICAgICB8IDEg
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxk
cGkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRwaS55YW1sCj4gaW5kZXggNmNkYjczNGM5MWE5Li4yZjU2NmYxOWU2ZTAg
MTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbAo+IEBAIC0yMiw2
ICsyMiw3IEBAIHByb3BlcnRpZXM6Cj4gICAgICAgIC0gbWVkaWF0ZWssbXQ3NjIzLWRwaQo+ICAg
ICAgICAtIG1lZGlhdGVrLG10ODE3My1kcGkKPiAgICAgICAgLSBtZWRpYXRlayxtdDgxODMtZHBp
Cj4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTkyLWRwaQo+Cj4gICAgcmVnOgo+ICAgICAgbWF4SXRl
bXM6IDEKPiAtLQo+IDIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
