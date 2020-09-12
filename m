Return-Path: <SRS0=bsXk=CV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2950BC433E2
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2020 09:58:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B659B214D8
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2020 09:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xx/1SdTP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bNkjodzg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B659B214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bKprGtgoGdtEvxJ5V6JlSH12u1zXZ9k6iNliD2RCw4U=; b=xx/1SdTPW3DChT3YuH2hU+GDJ
	JL3q4qlbu/3v2NhJ4I95z0xZK/w6OYIEmXJsMBUgoNfk/8cvsL/DUow+bopcoIxtWZPlFnFaTD72j
	AWMRuUo060MlsnM3hG1zethxhO6Hl8IkmUnybS8OEGCq2jYGb7JjUptSGVtSrOMwS8Rk/2tyvVr7L
	VvLnUlFy2zh9/g13GdOKPH4+gaeqT8GrrKHwftVjRXY5/7744Jr9pft+OmVZy/yI2Ev3TbWXlW5Ja
	BacuB9/4BoWYfHgciemuWnJFvAnzMgGf2JX6xGLHphX4n9r0IR757sY9alAhddInkIlALSUQn2/Cs
	y7DTCbQ8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kH2Im-0000qv-VS; Sat, 12 Sep 2020 09:58:37 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kH2Ik-0000q9-IM
 for linux-mediatek@lists.infradead.org; Sat, 12 Sep 2020 09:58:35 +0000
Received: by mail-lf1-x143.google.com with SMTP id b22so4781238lfs.13
 for <linux-mediatek@lists.infradead.org>; Sat, 12 Sep 2020 02:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qEROEvI5Y0fCmozE88h0a1g1Y25QBKKf6eIHwJfruhM=;
 b=bNkjodzgEyCHQlbMXE1deFOC+aEb+jZ/eg8pcskEb63rdUJ+ZCeEv0qADusqXyFQlc
 A11APrQ8MRSDsiGuWjfcWfUicTuhJdcfAwBCzSZF3AI2dko5bJJE/+P6P2RvpWhV/ZJW
 cfRKDxMcMAwi4jqwEY1QL3E8PLR7qOl6D3LhtSY1EQ6kna+PNpHDhnbZq7o1e4oNRtIS
 k1tXIBeWW3YzjbDT0D4KMDI1g6L5EVxNLSjlbe+aE1Qp3BB7uy1GKQ1k68s6iGK5THKQ
 hs3cS8rZn+V42ez4GUuUuM1DpR5Vs3XOaoHye7MswUQ7kohVMsfNhrpYFV4O+DHq4uKk
 M7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qEROEvI5Y0fCmozE88h0a1g1Y25QBKKf6eIHwJfruhM=;
 b=r7LfbMbOJA3L4Bq+zoycFNiCInKfEqYJSPmTzLpUkoOY6M8ef73TQ5D6BHU6T0W7um
 5zBT4QpVm45/cqWRB5wIzOd1/IGhQJtwfndnl6iNsQm1OShaBU26VMOE+52R8bg+7Qtr
 H8+izwRVW9jp5BESSYK/cSEiTfsub0sEsWfgPpvtZW/E7Eh1xhVsd8OS9PxW6SPa+fnS
 USnJufqzTtNIT+qvCvyRvcKyqp9VLlfuwRR59Zgjr9jAPuFiapJ6144WeRZlWKckL24u
 JMIAA2DgnDTPr+IQtpkVKP7PO4RtDCw9V50MhxX8taX3bdmOuwJDIIFYA4bBrLlMzra3
 9Pdw==
X-Gm-Message-State: AOAM531ze+Kk/mzZMq4ZOvynd5XIO7dyOSkEanAOMfJC8DBm/jmAbcot
 FuWFfresgSNMBfyI4maZNIvnhfEn22qe+SlAlqIuOA==
X-Google-Smtp-Source: ABdhPJz2DrvLqFno9Czac040PFbYE4v0es0Eq6+34Rf534KupzpDXiQZE1x4bI74fTkUy2VMuaKKZBCTxqQ4dSSRceI=
X-Received: by 2002:a19:520b:: with SMTP id m11mr1358539lfb.502.1599904713123; 
 Sat, 12 Sep 2020 02:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-3-krzk@kernel.org>
In-Reply-To: <20200910175733.11046-3-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Sep 2020 11:58:22 +0200
Message-ID: <CACRpkdZXu2J4z=1j-syxSbz2x-QiLeTBpwHSOVNfmZ31RgM6Ng@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] dt-bindings: gpio: convert bindings for Maxim
 MAX732x family to dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200912_055834_907093_45D9357B 
X-CRM114-Status: GOOD (  10.56  )
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Joel Stanley <joel@jms.id.au>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2020 at 7:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Convert the Maxim MAX732x family of GPIO expanders bindings to device
> tree schema by merging it with existing PCA95xx schema.  These are quite
> similar so merging reduces duplication.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Can I just apply this one patch to the GPIO tree?

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
