Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88C3C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 12:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NoPPuT+9akuPB87e9q151T/e8Tw0y4IItcMEkXmHV58=; b=C2IC9lrF2HJDQM
	PFKgK7oeqVV+YBG5JxeWGJmqN5DUC2mzBOWZgfMNV4keycZtq+Wgo4ivksvB+0QPf80JsHFpWGb7E
	neCz0Pk53ZH/aCOU+tXJ+wBRH4M60F5LCfkPtHAaTmY3U57lpkXf3ae0l8uI+UUlfyXzUHBX1mYSR
	8TMlNTXACLjAG7PDnAn8ttEVViWBKngYcYtDAOTPCQ6PvL/poN25xNtyMQlvWsqY0SMzuu7pVuE19
	fohIggLwx1fqJjPgSibVmoILI1YeGPd2UHJIM/rGFDH4LT0p89eaAl1aB5PtBlbWrFN4/RAyl8RFu
	Mb1lSk/uQw3Jm6zT+8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np81E-00BpJM-Ku; Thu, 12 May 2022 12:34:12 +0000
Received: from smtprelay05.ispgateway.de ([80.67.31.97])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np810-00BpA8-Gl; Thu, 12 May 2022 12:34:01 +0000
Received: from [89.1.81.74] (helo=karo-electronics.de)
 by smtprelay05.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <LW@KARO-electronics.de>)
 id 1np80o-00011Z-6Q; Thu, 12 May 2022 14:33:46 +0200
Date: Thu, 12 May 2022 14:33:30 +0200
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Alexandre Bailon <abailon@baylibre.com>
Subject: Re: [PATCH v6 0/7] Add LVTS architecture thermal
Message-ID: <20220512143330.3d54a71f@karo-electronics.de>
In-Reply-To: <20220512122433.1399802-1-abailon@baylibre.com>
References: <20220512122433.1399802-1-abailon@baylibre.com>
Organization: Ka-Ro electronics GmbH
MIME-Version: 1.0
X-Df-Sender: bHdAa2Fyby1lbGVjdHJvbmljcy5kb21haW5mYWN0b3J5LWt1bmRlLmRl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_053358_616750_EF8C9299 
X-CRM114-Status: UNSURE (   4.48  )
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
Cc: devicetree@vger.kernel.org, amitk@kernel.org, rafael@kernel.org,
 khilman@baylibre.com, linux-pm@vger.kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, michael.kao@mediatek.com,
 ethan.chang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, krzk+dt@kernel.org, ben.tseng@mediatek.com,
 rui.zhang@intel.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksCgpPbiBUaHUsIDEyIE1heSAyMDIyIDE0OjI0OjI2ICswMjAwIEFsZXhhbmRyZSBCYWlsb24g
d3JvdGU6Cj4gQW5kIGludHJvZHVjZSB0aGUgbmV3IGFyY2hpdGVjdHVyZSBMVlRTIChsb3cgcHJl
c3N1cmUgdGhlcm1hbCBzZW5zb3IpIGRyaXZlciB0byByZXBvcnQKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeICAgICAgICBeCiJsb3cgdm9sdGFnZSI/CgoKTG90aGFyIFdh
w59tYW5uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
