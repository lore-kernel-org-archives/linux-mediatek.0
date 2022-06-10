Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8423FC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 19:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n6NllQDO6prlLr41wtQXir0vUy/rTOnktloD4DV5/yo=; b=nZnGor9/bejJSi
	Fn56f5W4nzRAPdMRXuuq0h1oVZLKjK+8zpjBcGSFebOlkEFsdv+2iS6d4PMBTBgQd8EZYmLzVO/IT
	dhQ54BQW0TtVSjSU3XoqhagvKBOdHFri5Wq6E0ZX8/feG3p9fS7ecN0R/H2Ro622KiQuRvRDD+IOg
	xzTiBM97vW7xk1QtQOLbWgHlYTDwpfkor/WZR8T7Rb/vyQ6KMqkAkvjVarkKHEsuJfeG4E6JsSRBW
	vNtNxLBk5A7LSluUo2QmM69YU1iJIy1N/cm49IgYjQ796CFF7zp5npt+tr5WDL/mMaszysqy+bk23
	hDiCQ83Jbz1UO59tXkhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzkdQ-009aDA-7Y; Fri, 10 Jun 2022 19:49:32 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzkdN-009aBa-0X; Fri, 10 Jun 2022 19:49:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id a15so29283390wrh.2;
        Fri, 10 Jun 2022 12:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=u9muj2CCpJ3bi2OBicnt3vUuhr/462OKXXDNMSoOjkA=;
        b=nJO3QDlMK8Oo8cC2rEDrsS8zHoFWKSvz9V9tp5Slqj6XFK8gGsnauvl4/5a9Zlujsw
         CorVf5dfKaQH6teMfzW+hEHcOqhkKmK+dqKhgaSLIk2OjK2OrHpiPiYlnLwU4fkOG5Z5
         4PmGHwSchAW9lf+n6mIfhoGZyeWAKEIX9r6hS5AcDvGRjX5QHRl7KdZO9iqyazhYBNgz
         7pfLKuBvFnE/1MuQV2//JtuGP6S3TUo035W5eNVrysQCBRxAgc/0GKH+7gd2XMdw+zE2
         BOR2sXaNMk/Pkqsivac6peQf8L0kcC+Xa3RD9v9FKZpipTo6kRu9/aVYFutE3X708T/B
         a27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=u9muj2CCpJ3bi2OBicnt3vUuhr/462OKXXDNMSoOjkA=;
        b=ttMhScGeZgwegLDw667mvm92OZFEan7ioGcaz4Yhb3E6uqhS7wYeYro8MF0IpRmAxl
         HuqJk+Cqo7Jv4/NWQyxeYL7FerC44wFaO1JBlgJHYNg4/ewxep4c8Cn6rjETX1Q1O6kr
         qU0AkM0/PAU6nheszRuyiCl+0W40AbgTyVyfKRa0jP5ilcAa/poFatlzrHbniBVPnLFu
         rl0J3ejSiu9qD8nkG3N4HNm+0qlJNxw7eNuiF7XK7SrGobCHO3GEEWABGJgMutBfq7PG
         rBmdKvfa3/g4vRWBASg1g2Zr2Ui2HSia1SddvVdoVgzvB6qcmSeEV02qaLXggpdvFHy0
         65JA==
X-Gm-Message-State: AOAM5300LJ+geOj0DsN+IFHgaxnj14x6Jo921ymUsyc8NOXGxd5fLKbH
	48/wLf9m5rK9HeJTk3x8BS4=
X-Google-Smtp-Source: ABdhPJw1wyN/M1WFaQFuP+jX/NGTq2GqnLXXrOE71+r/B9uelliduc7dUH3CHihgz35kd6pD213QmQ==
X-Received: by 2002:adf:d1c6:0:b0:218:51ae:8812 with SMTP id b6-20020adfd1c6000000b0021851ae8812mr21038542wrd.178.1654890565371;
        Fri, 10 Jun 2022 12:49:25 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861? ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
        by smtp.gmail.com with ESMTPSA id g15-20020a05600c4ecf00b0039c4945c753sm4278743wmq.39.2022.06.10.12.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:49:25 -0700 (PDT)
Message-ID: <a67d3d01824db6376c2f15949021db4f2b6173cb.camel@gmail.com>
Subject: Re: [PATCH 06/34] iio: adc: ingenic-adc: explicitly add proper
 header files
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
Date: Fri, 10 Jun 2022 21:49:22 +0200
In-Reply-To: <CAHp75VcU-oV4is_y9=oaOx2ugvTEOy53h2wvbd3-Z9_gv5Y=zA@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-7-nuno.sa@analog.com>
	 <CAHp75VcU-oV4is_y9=oaOx2ugvTEOy53h2wvbd3-Z9_gv5Y=zA@mail.gmail.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_124929_076640_E121B453 
X-CRM114-Status: GOOD (  12.89  )
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

T24gRnJpLCAyMDIyLTA2LTEwIGF0IDE2OjQ1ICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDYgQU0gTnVubyBTw6EgPG51bm8uc2FAYW5h
bG9nLmNvbT4gd3JvdGU6Cj4gPiAKPiA+IERvIG5vdCB0cnVzdCB0aGUgZmFjdCB0aGF0IGlpby5o
IGluY2x1ZGVzIG9mLmggd2hpY2ggaW4gdHVybgo+ID4gaW5jbHVkZXMKPiA+IGFsbCB0aGUgaGVh
ZGVycyB3ZSBhcmUgcmVseWluZyBvbi4KPiA+IAo+ID4gVGhlIHVsdGltYXRlIGdvYWwgaXMgdG8g
YWN0dWFsbHkgZHJvcCBvZi5oIGZyb20gaWlvLmguCj4gCj4gLi4uCj4gCj4gPiDCoCNpbmNsdWRl
IDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+
Cj4gPiDCoCNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+ICsjaW5jbHVkZSA8
bGludXgvcHJvcGVydHkuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4KPiAKPiBPcmRlcmlu
ZyAoZnJvbSB0aGUgY29udGV4dCBJIGRvbid0IHNlZSBpdCdzIG1lc3NlZCB1cCBhbHJlYWR5KQo+
IAoKV2lsbCBkb3VibGUgY2hlY2sgb24gdjIuLi4KCi0gTnVubyBTw6EKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
