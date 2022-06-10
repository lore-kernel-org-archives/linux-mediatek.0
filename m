Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26656C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 19:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jfSlvxPkSLrpnDnNK5/Odaa+tw5JvoZaBA9VVRGny4E=; b=RIAYjVtyn9BHLY
	d/bR364zrXnLrk0dXQuovKLyvT967Nc8F5yuPUTQjBhH8d5xXH6Xixc9ESdNL7ZHTNRHqp+tfb39q
	S6irO/7v4AX9lBzw9AYeLhOfONhDDsqfVcGjisWy1qf486tMk8HsoD/dBMnC6EayvQe482YwFF0is
	XP55Oonf78B0BOPVa9MWbQB0AMXB6g2NwG57FGDbVpkxb4MXS38wrDyL6nwi+q20w1ihOnWIVfneI
	db3jj+T9y9xlbeTLFEi+lHcIuPRjrYWNJNoYfaAYjiSqJ7sFQXQY2/KisdkO0ZUqpwXdS148PF4x4
	BkllkD8EB4pLTNSOEN8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzkWo-009Z70-5T; Fri, 10 Jun 2022 19:42:42 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzkWk-009Z65-P7; Fri, 10 Jun 2022 19:42:40 +0000
Received: by mail-ed1-x533.google.com with SMTP id z7so182555edm.13;
        Fri, 10 Jun 2022 12:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Y54GLtlH6LdYaPPW/vT7zN8oinpgFewT/Kozy6U1sr8=;
        b=iWSpr/Kt7gr1R9ypw8jSjj+iOo2ix1stq9TO7FQZo6FT8oajeYFmxMX5790+z+QVIw
         C7Ph+qzRUt7nF1vNHdfJ0/2YZ2pZ+XOQ62dOWxjQJtnhLEBN5faftDizO1QR7VcaY1th
         B2gMlUAyrnpPEnSuXIjg0v7ebGj0D7jFND7r5/1yIqLtNPorMEV563M1TGbB6y5QzIzb
         69uRffN14fsfXA3NOeVWJp0NxUn7g4a5ccquY7moBAfqWHgcOt7DGfcfretFbABXDM7C
         mJOIUP9o2bGzA7CZMkUvUUHb0Oaw59fP1sckcKbdvg0t/ddeKFE7FxUbxOVDoWa0tvSp
         3ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Y54GLtlH6LdYaPPW/vT7zN8oinpgFewT/Kozy6U1sr8=;
        b=uIJX1gcW1JKfJJwBcfui6tudnv9bAWL7e++k7FDaN8uFUsCgWivSsJoTNvSsdpa4U1
         c0/cyaMFbCpE0LlX85jcsQ3DXe0mV289+kJHhmRtSlvy0cukW2/oIvYVjJip0Pg4hFrR
         7mb9YR0AFoZ5J3nxliYK52+049k1GCpK8/rk87qdxwk35kqMObQS4pi0SpON7XV5oNbF
         26uCnNQ0UewfvEei3HHBz4bCL9B3wDlb+7yGo99LwiQyRrMuLy9gfMEsgv7WIbDl6dT+
         tzpvgLcYWd60nvPxoH9biP5TTKP/Wb2L0QTmUkkyHtgRdEyyEcmGCM9dyIzaHAiN3uCq
         x9fg==
X-Gm-Message-State: AOAM531Lmjkbg8lyYt/yiIzAZ6gm5uwdDDZEuaK09bK5AXLeUpFL0PuV
	WZrkKnWfovk45Yzbepg2MWg=
X-Google-Smtp-Source: ABdhPJzmp7JEbyf5YC9B40GJWfUYSStWlZjAXDQjdn7K/oR4H50lmJrnbL72tBcPT/obo+EANAlJ1A==
X-Received: by 2002:a05:6402:5c9:b0:420:aac6:257b with SMTP id n9-20020a05640205c900b00420aac6257bmr52750712edx.128.1654890155771;
        Fri, 10 Jun 2022 12:42:35 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861? ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
        by smtp.gmail.com with ESMTPSA id nd28-20020a170907629c00b00706c50870a0sm4261637ejc.194.2022.06.10.12.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:42:35 -0700 (PDT)
Message-ID: <b2260504dce967f3ce8b0bee190ab81464b01f3f.camel@gmail.com>
Subject: Re: [PATCH 25/34] thermal: qcom: qcom-spmi-adc-tm5: convert to IIO
 fwnode API
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER"
 <linux-mips@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, chrome-platform@lists.linux.dev,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cai Huoqing
 <cai.huoqing@linux.dev>, Benjamin Fair <benjaminfair@google.com>, Jishnu
 Prakash <quic_jprakash@quicinc.com>, Linus Walleij
 <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>,
 Andy Gross <agross@kernel.org>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>, Benson
 Leung <bleung@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,  Christophe Branchereau
 <cbranchereau@gmail.com>, Patrick Venture <venture@google.com>, Arnd
 Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Gwendal Grignou <gwendal@chromium.org>, Saravanan Sekar
 <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>,  Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Thara Gopinath <thara.gopinath@linaro.org>, Avi Fishman
 <avifishman70@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomer Maimon
 <tmaimon77@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,  Jonathan Cameron
 <jic23@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam
 <festevam@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Eugen
 Hristev <eugen.hristev@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Date: Fri, 10 Jun 2022 21:42:33 +0200
In-Reply-To: <CAHp75VdYsPAS_1KZCrWvK5=By020Xxtw_FtogZwJQ=Srajdjbg@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-26-nuno.sa@analog.com>
	 <CAHp75VdYsPAS_1KZCrWvK5=By020Xxtw_FtogZwJQ=Srajdjbg@mail.gmail.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_124238_872506_4F978DEB 
X-CRM114-Status: GOOD (  10.54  )
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

T24gRnJpLCAyMDIyLTA2LTEwIGF0IDE3OjIwICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDggQU0gTnVubyBTw6EgPG51bm8uc2FAYW5h
bG9nLmNvbT4gd3JvdGU6Cj4gPiAKPiA+IE1ha2UgdXNhZ2Ugb2YgdGhlIG5ldyBmaXJtd2FyZSBh
Z25vc3RpYyBBUEkKPiA+ICdkZXZtX29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCknIHRvIGdl
dCB0aGUgSUlPIGNoYW5uZWwuCj4gCj4gX29mXyA/IQo+IAoKQ2xlYXJseSBub3QgOikuLi4gV2ls
bCBmaXggaXQgb24gdjIKCi0gTnVubyBTw6EKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
