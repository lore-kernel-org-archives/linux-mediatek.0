Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA061C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 15:36:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B1A123CD4
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 15:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B1A123CD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FOQI3JovT4T7UrWDdw+xvZx1WhZRf1/RCDxk+aMB1N4=; b=mi6HbI1Y5yRv7yv23vCQ1g3K8
	6en2E4QYVwDkGrNwsH5zkEc9PbM7mz1piiWh/hBcdqWXjV6cxqPDQjdImsMjkOeX08LtymgxG9aoF
	wpoGYHHeez4rC6SP3FMaBAN637tCObxxU5Bi4ze/qjBobZjJCxa2llLP19cpaO1n9L6N2GfbKhsK2
	qrmkJN/e1n4hNs3HHW6pNOW3fc4N3V39i9K8R3cTrMuNNlO0AVSM5DSVx9yuVVBo9P4PmFQcDsuS+
	eRIcBc+5yrUO+iIKE98Sips/EsCU3zpJrHKJ8Cy0MytETsTZMGhFtCEXcpqWINeZYK4+jRA8Jjxo1
	gNp6whDAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knNzr-0006BV-Pn; Thu, 10 Dec 2020 15:36:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knNzn-0006AM-Lj; Thu, 10 Dec 2020 15:36:44 +0000
X-Gm-Message-State: AOAM532n4qr4jAQPNh7fKKS/LiZ6rxq3jvDiokpzmyIV7zbXCGnE+x9j
 Q7dzqtHHSeuUY1BW9t66BG2XtPJF25M7brMsZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607614602;
 bh=gfjKDkgsUzlSXkLKgAEbUS/Mv1PVZmFwSXCS39LAV6E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RPP7Y3MYJM2iQesQl1tK8TgtLyQQ6J9Ev+RMitEYdSKe8iLqjuQnttGueriC7nRs1
 yuACw7ty0/BdVxriEJmAeQZxm712jHoB5tYWv/KSHXEv4rcE49/Ht5N3Kt5rg9yVz7
 Nxn8EgiIObUWH6Dyk5R1pJ7yMf2qsJaPF5h6B9dVEKMCMzMNoAO8DBVxlKy0g7YzWT
 KIozGCXi7YygbAmetK3gVGRuJo30f8EGOVUKqY4HcNLb2pKVBDYTiw3AuhW3hT9egn
 7l620dqQkOgWD1ZQmafHhDQCJzMM9KW/3/7kX4xnuBV9Oq99W71s5inSsJy3mfEWAb
 mB7F5FWrPmGaQ==
X-Google-Smtp-Source: ABdhPJxSRwBGAkP+9mfLM02WdsbbFX5lBks02URQV937lg/PC5OBCOeM7kRWkYp0bnV7bJe0ZjiglASvX2KGwpziqho=
X-Received: by 2002:a50:c3c5:: with SMTP id i5mr7382571edf.166.1607614600133; 
 Thu, 10 Dec 2020 07:36:40 -0800 (PST)
MIME-Version: 1.0
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607591262-21736-3-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 10 Dec 2020 23:36:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY_90gcnGFiV2uZ-y2TrQYSowhvoM5k36+0zG6+tG9bj3Mw@mail.gmail.com>
Message-ID: <CAAOTY_90gcnGFiV2uZ-y2TrQYSowhvoM5k36+0zG6+tG9bj3Mw@mail.gmail.com>
Subject: Re: [PATCH v8,
 2/6] dt-bindings: mediatek: add description for mt8183 display
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_103643_808883_AC6FF3DB 
X-CRM114-Status: GOOD (  15.21  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTDml6Ug6YCx5ZubIOS4i+WNiDU6MjLlr6vpgZPvvJoKPgo+IGFk
ZCBkZXNjcmlwdGlvbiBmb3IgbXQ4MTgzIGRpc3BsYXkKClJldmlld2VkLWJ5OiBDaHVuLUt1YW5n
IEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKPiBpbmRleCA2NGM2NGVl
Li41Y2E2OTNhIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQK
PiBAQCAtNDMsNyArNDMsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzIChhbGwgZnVuY3Rpb24gYmxv
Y2tzKToKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZHBpIiAgICAgICAgICAgICAgICAgICAt
IERQSSBjb250cm9sbGVyLCBzZWUgbWVkaWF0ZWssZHBpLnR4dAo+ICAgICAgICAgIm1lZGlhdGVr
LDxjaGlwPi1kaXNwLW11dGV4IiAgICAgICAgICAgIC0gZGlzcGxheSBtdXRleAo+ICAgICAgICAg
Im1lZGlhdGVrLDxjaGlwPi1kaXNwLW9kIiAgICAgICAgICAgICAgIC0gb3ZlcmRyaXZlCj4gLSAg
dGhlIHN1cHBvcnRlZCBjaGlwcyBhcmUgbXQyNzAxLCBtdDc2MjMsIG10MjcxMiBhbmQgbXQ4MTcz
Lgo+ICsgIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQ3NjIzLCBtdDI3MTIsIG10
ODE3MyBhbmQgbXQ4MTgzLgo+ICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5n
dGggb2YgdGhlIGZ1bmN0aW9uIGJsb2NrIHJlZ2lzdGVyIHNwYWNlCj4gIC0gaW50ZXJydXB0czog
VGhlIGludGVycnVwdCBzaWduYWwgZnJvbSB0aGUgZnVuY3Rpb24gYmxvY2sgKHJlcXVpcmVkLCBl
eGNlcHQgZm9yCj4gICAgbWVyZ2UgYW5kIHNwbGl0IGZ1bmN0aW9uIGJsb2NrcykuCj4gLS0KPiAx
LjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
