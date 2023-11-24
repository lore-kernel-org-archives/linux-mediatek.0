Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E3CC61DF4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 14:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhOcViojT8+HFgx6FSmpZBi4UIVJpE+xyo5WsXpVSso=; b=016ZazzKAFizTOUhJczbnQFnv9
	5A4ksaLszhK1DhzNCUxZzDYJZ7q4vlDyhNH2+H2F4Bk//c4vGeWN+Izi0yLUiEw8lBtQXeo2iVjLa
	ZIYl18csqero8Oclk/E53PhuWjtIppbkxS6GHjQjjXOoJ3zhR7hSbIHzP4qYOyqGrg9/zQdfspMPL
	xF7Ubr9C/rTbD5rCb+ZhFLujQ7XhcC4pNX56wWO5N4FVdx6Rtf4srCkxR/cb+RRxVV0yuXGw6WUSt
	mPZem4iPrt4rv5jD0Nfa0GHZKv+faWbcDFyl7AsDMS4EjlaecbAh7WjghryCXC5lI6EFN9EtpUuyk
	WWfTto/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XT3-007SEf-1m;
	Fri, 24 Nov 2023 14:47:41 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XT0-007SDl-1l;
	Fri, 24 Nov 2023 14:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700837258; x=1732373258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kuw3+1Pm03Ibm+MVDWAtmPGqCx+P0c0EstmoCAQl4jQ=;
  b=Bc1l7/aU2+h1Kuv8FZKwIzUp1Jyk00Cy2zDnKK0MdMO3DJLh35kREdm5
   BPPAoecUEdL225f+bBdP5/527tmm9+X5h6orPduncmSeXIZob99MntglT
   6CzQCbIDt5Ng2HXTjELm0RIhYI4IxkLqRsw1l1UPhks5QIY9e1UCMT2KC
   yP76zEY1SkwPk7yD9hpTxQcMnCoo2TeDe4J/zou0yatdQ3AiVrMfvB0uh
   Hagw5FhOkD7BaqXMDeWi1Sp+shnw2Fa1updnl5RU2RcDtvWtMb9gCXOjN
   keu++EURDmhK3kA6hp1G1fbQZ0Rq1S+AH1i2v7VQBM7dX75t3QFIcNAgG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="395249775"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="395249775"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 06:47:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="767501852"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="767501852"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 06:47:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r6XSm-0000000Gk4Z-1lzv;
	Fri, 24 Nov 2023 16:47:24 +0200
Date: Fri, 24 Nov 2023 16:47:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v2 00/21] pinctrl: Convert struct group_desc to use
 struct pingroup
Message-ID: <ZWC3fNnYM9qDKT-5@smile.fi.intel.com>
References: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdbEoAvTs4c5e910bsBZej2Gs6H+SPLAXUnKM2qRk+5MTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbEoAvTs4c5e910bsBZej2Gs6H+SPLAXUnKM2qRk+5MTw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_064738_624512_F1DAFCB8 
X-CRM114-Status: GOOD (  16.55  )
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

On Fri, Nov 24, 2023 at 11:17:53AM +0100, Linus Walleij wrote:
> On Thu, Nov 23, 2023 at 8:34 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > Linus, assuming everything is fine, I can push this to my tree.
> > Or you can apply it (assumming all CIs and people are happy with
> > the series).
> 
> I would give people some time to test the changes and ACK it,
> but admittedly it's a very tasty patch set and I am eager to merge
> it ASAP.
> 
> Shall we give people a week and then we merge it?

Yes, and since it's again some small issues, I want to send a v3
next week (presumably on Monday).

-- 
With Best Regards,
Andy Shevchenko



