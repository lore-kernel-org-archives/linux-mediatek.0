Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82563C67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 12:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVrLcFdYPUDEWEn5KDV423hxP0oT8V4yLUiWZ5gAH/s=; b=ydpZJ/PEXmI46+wwc62kd1JYQk
	NCUx5snUVbZeeVrLUeilbPJG0kBhSrmmp2uYJmgNlQPMpkj2qOXK/kwA6AL92Nl8MXE6XNIeQL9rL
	inW1UpdmbhxVjeZ9W39Mr6YoHJg2a25V2xnSSOuF9i8viqTRpuXh1lusyTopLVmkaP95t1cAskWfZ
	dzdNC+Z+gsjPpxlk6rZGaiUD3bbXhv/9f0uYtTREfW2VAdHH37l07MOy6aphPkRQcBUOqKfXfUKn/
	2x8FJ7k/ZPNP997/eS5/jJOFtka3OA+3vysxkeLTJngMF8u4pC/LvnBKINCz6MoRxnP73z13P/+TE
	Zze0WG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAKX-00000001sJI-3jJn;
	Tue, 09 Apr 2024 12:12:01 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAKU-00000001sGw-2bxr;
	Tue, 09 Apr 2024 12:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712664716;
	bh=BVrLcFdYPUDEWEn5KDV423hxP0oT8V4yLUiWZ5gAH/s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ooLazIGZqE3OaFF6d+Ilz7NVeVx8eJIxOh2mbgysLKU5kS1Xy1WZHP+Upx+0xJlc+
	 m6jB+h/LEox8y7O2NEqE2sWa1uZEHjur17z/65/ePxGRvPgjqkqRjTaU9aIFIY/sC/
	 o1XEc0KavHkF+mfQfskvEcsNoUQe0RwCwA1lWOgWNpC8cjvjbJsT6INFZhfJtYI7u6
	 kbU558Fo2sTzdjwQIfMLTsvo0eFUMbpNPW15H6mzzj0Q5yus3XsIPzWGLhoiJuTE33
	 F7SWQd1CxPabfYNAqhuynrP4N6vXO9j/gDePIeJkKcI2oKNv4Je0GTZwjpa93U29xi
	 sLS1RPRloeXuQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C820137820F5;
	Tue,  9 Apr 2024 12:11:55 +0000 (UTC)
Message-ID: <66237505-d84f-483e-b088-b8fd7c34ab9f@collabora.com>
Date: Tue, 9 Apr 2024 14:11:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: qcom: msm8974: Use proper compatible for
 APCS syscon
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240408-msm8974-apcs-v1-0-90cb7368836e@z3ntu.xyz>
 <20240408-msm8974-apcs-v1-2-90cb7368836e@z3ntu.xyz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240408-msm8974-apcs-v1-2-90cb7368836e@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_051158_850324_4D25808F 
X-CRM114-Status: UNSURE (   7.88  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SWwgMDgvMDQvMjQgMjE6MzIsIEx1Y2EgV2Vpc3MgaGEgc2NyaXR0bzoNCj4gVXNlIHRoZSBh
cGNzLWtwc3MtZ2xvYmFsIGNvbXBhdGlibGUgZm9yIHRoZSBBUENTIGdsb2JhbCBtYWlsYm94
IGJsb2NrDQo+IGZvdW5kIG9uIHRoaXMgU29DLg0KPiANCj4gVGhpcyBhbHNvIHJlc29sdmVz
IGEgZHQtYmluZGluZyBjaGVja2VyIHdhcm5pbmc6DQo+IA0KPiAgICBhcmNoL2FybS9ib290
L2R0cy9xY29tL3Fjb20tbXNtODk3NHByby1mYWlycGhvbmUtZnAyLmR0Yjogc3lzY29uQGY5
MDExMDAwOiBjb21wYXRpYmxlOiAnYW55T2YnIGNvbmRpdGlvbmFsIGZhaWxlZCwgb25lIG11
c3QgYmUgZml4ZWQ6DQo+ICAgICAgICAgICAgWydzeXNjb24nXSBpcyB0b28gc2hvcnQNCj4g
ICAgICAgICAgICAnc3lzY29uJyBpcyBub3Qgb25lIG9mIFsnYWxsd2lubmVyLHN1bjhpLWE4
M3Qtc3lzdGVtLWNvbnRyb2xsZXInLCAnYWxsd2lubmVyLHN1bjhpLWgzLXN5c3RlbS1jb250
cm9sbGVyJywgJ2FsbHdpbm5lcixzdW44aS12M3Mtc3lzdGVtLWNvbnRyb2xsZXInLCAnYWxs
d2lubmVyLHN1bjUwaS1hNjQtc3lzdGVtLWNvbnRyb2xsZXInLCAnYW1kLHBlbnNhbmRvLWVs
YmEtc3lzY29uJywgJ2JyY20sY3J1LWNsa3NldCcsICdmcmVlY29tLGZzZy1jczItc3lzdGVt
LWNvbnRyb2xsZXInLCAnZnNsLGlteDkzLWFvbm1peC1ucy1zeXNjZmcnLCAnZnNsLGlteDkz
LXdha2V1cG1peC1zeXNjZmcnLCAnaGlzaWxpY29uLGRzYS1zdWJjdHJsJywgJ2hpc2lsaWNv
bixoaTYyMjAtc3JhbWN0cmwnLCAnaGlzaWxpY29uLHBjaWUtc2FzLXN1YmN0cmwnLCAnaGlz
aWxpY29uLHBlcmktc3ViY3RybCcsICdocGUsZ3hwLXN5c3JlZycsICdpbnRlbCxsZ20tc3lz
Y29uJywgJ2xvb25nc29uLGxzMWItc3lzY29uJywgJ2xvb25nc29uLGxzMWMtc3lzY29uJywg
J21hcnZlbGwsYXJtYWRhLTM3MDAtdXNiMi1ob3N0LW1pc2MnLCAnbWVkaWF0ZWssbXQ4MTM1
LXBjdGwtYS1zeXNjZmcnLCAnbWVkaWF0ZWssbXQ4MTM1LXBjdGwtYi1zeXNjZmcnLCAnbWVk
aWF0ZWssbXQ4MzY1LXN5c2NmZycsICdtaWNyb2NoaXAsbGFuOTY2eC1jcHUtc3lzY29uJywg
J21pY3JvY2hpcCxzcGFyeDUtY3B1LXN5c2NvbicsICdtc3Rhcixtc2MzMTMtcG1zbGVlcCcs
ICdudXZvdG9uLG1hMzVkMS1zeXMnLCAnbnV2b3Rvbix3cGNtNDUwLXNobScsICdyb2NrY2hp
cCxweDMwLXFvcycsICdyb2NrY2hpcCxyazMwMzYtcW9zJywgJ3JvY2tjaGlwLHJrMzA2Ni1x
b3MnLCAncm9ja2NoaXAscmszMTI4LXFvcycsICdyb2NrY2hpcCxyazMyMjgtcW9zJywgJ3Jv
Y2tjaGlwLHJrMzI4OC1xb3MnLCAncm9ja2NoaXAscmszMzY4LXFvcycsICdyb2NrY2hpcCxy
azMzOTktcW9zJywgJ3JvY2tjaGlwLHJrMzU2DQo+ICAgOC1xb3MnLCAncm9ja2NoaXAscmsz
NTg4LXFvcycsICdyb2NrY2hpcCxydjExMjYtcW9zJywgJ3N0YXJmaXZlLGpoNzEwMC1zeXNt
YWluJywgJ3RpLGFtNjItdXNiLXBoeS1jdHJsJywgJ3RpLGFtNjU0LWRzcy1vbGRpLWlvLWN0
cmwnLCAndGksYW02NTQtc2VyZGVzLWN0cmwnLCAndGksajc4NHM0LXBjaWUtY3RybCddDQo+
ICAgICAgICAgICAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2No
ZW1hcy9tZmQvc3lzY29uLnlhbWwjDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIFdlaXNz
IDxsdWNhQHozbnR1Lnh5ej4NCg0KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVs
IFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQoNCg0K


