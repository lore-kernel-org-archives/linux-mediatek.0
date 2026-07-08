Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEF6C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 23:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkrEjWV2T4kZn9l/EN1RfmTfNtrV7m8I3DpucB/PUhw=; b=C93pddHzHAVyjidXNG/z/HisVu
	LZp6+4ELoT6x2tw6zhLZZoTjHNTEaeLF5PBYmeAUBSMSCN11fKmIUNaMD0qrjGGtEZso8b+wohV6r
	dHGH32cH+y+lJFJvXlfRbHHbC9QJCjgZuKiLCA2ZiSJRnn9b3QFpETjAbBrXefHz8jSNwiIlB5YGp
	kfNzOAEPrxSj58pIjHQjyZZEDk83i26jp2X7uS4sc7yIBotzazWb4P+n+cZI3Gel/AZW4qvvUzUIX
	6QrcBeKe+uacc2qhV5p1tQ/SKEmfLctJb9Tk4dy8CFKRI6cG3MoJKO82NqFFaz8HbES9H+PFAyrxN
	tF3zYMRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbmP-00000000bGf-2eNa;
	Wed, 08 Jul 2026 23:34:13 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbmN-00000000bFm-0Dy5
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 23:34:12 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ccf2360620so9799775ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 16:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783553650; x=1784158450; darn=lists.infradead.org;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tkrEjWV2T4kZn9l/EN1RfmTfNtrV7m8I3DpucB/PUhw=;
        b=OcCRxX0joBcyMHCbkK8Sc9SIRhzsjP6bNAt5hn5xZkt4nq5CfNTYozzofPf0x5mQN2
         xWfckgzMM9rcb2bW3f/W+iIg6LZR4R0ZcoxW7qJHJW/HrYimKjdZYxKss4wYc9ZhGy1w
         gw322PK4YP2pOtnFVKgdEvxdkyKEtglwYhwFvOs/belHXs6q4WB2FCLAXgFwY8c73JPV
         yghVJhHusyggoAjbkj40U4/at56tO4fAnO5KoayQSyPD4dYc0UJh146TlLmBIey4g/OK
         GcxQmGH/+BcCtuRcKmqFR8iBUouafrvi9NLalX18u4d4Wv6oVOATP+vEnYbsoLLOxscJ
         D8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783553650; x=1784158450;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tkrEjWV2T4kZn9l/EN1RfmTfNtrV7m8I3DpucB/PUhw=;
        b=m0PJpxnhsO6YYf/eHgnTQNLK3Sx5OFfnfbEQfARFAooUiibF6L2XPV9lFX93ONpJAy
         rqC3kU0JFGN4fhlu+v+/SK1emjZTMHBTKTn7uOG9FAjs33n+M1tRiXy+nfdudgGSPVLk
         8HRpFjISf9FxNtXsyRpoC28wSj7hnNMi72Mb2MZhmL+lzlycm4xOSGXPDG1bKcTQXNZg
         i73lPcv4sfnnF78YwuHT8gemgyTpdjgOTbuKnAx0LAbZhnoCW03bAZScCfahlwBLSaHQ
         mmEf+xR5XyQ3YaF7GnVJbmEW3Lc64l0KjR2F5I6ZRT4uSRp2POWdD7LTWlWLkB2+7sSA
         dVcA==
X-Forwarded-Encrypted: i=1; AHgh+RpmC6I5PX0TnhiiIiW0lGhS2OC2GOqTMpoA7GLJVcSwuyZiymeUKyZPTRfUY4tW2ApgqJpiI0Qseq3ev3jRCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfb+QKKc6dyGFr9CaU7pcvSX6OmvjctYeTh3PIavncob6eQ6B8
	ctedOBTVXvN3n0GjneDk2WLBV4a5JqT6pZCE1qsZ34lTy6YCcElrLaVt
X-Gm-Gg: AfdE7cn0uxt76AyKj9QICl12vDh3IuSXXFECqyFBbJuHkL4xf5etkCvfzHUP+BtN6po
	y5wjWpPbdpPRYSNYYyPpz8iAi2XwVOvadzttAXS7rVqexcEGt1v1CPRjAV9OiJQ8Dltd9mt84x4
	YOHRY49KQ9n2Jixl/XSQHl5Jmkqu0ACoZPZYRpSej9aOA2SXVReP9/gwf1U/4w6J9wXBPj4w2xf
	tzrRVymNCWRAywCIH+X9nrZaVC1+5vaqLhOCuxocK+3aWozqitsKf5OMoIVdiEp1fdzkhNWNEr4
	NRNZATI/D6QbmHp/DIrdlk8KZ+HvIO/calWJV0MqI5XbGia4HRLe7pmV+6AjQzCrNUj/hlXEkgW
	rwoXyoTELUvDOrk/k5BCFrM14JTPDA6oeeHdFc6XeqygIFlmTrIamjqk1K805Z++yk31L28NMxr
	oQ8u+lMA==
X-Received: by 2002:a17:902:d58b:b0:2ca:cb8a:f26b with SMTP id d9443c01a7336-2ccea348afamr45697605ad.10.1783553650075;
        Wed, 08 Jul 2026 16:34:10 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb56fsm34840455ad.15.2026.07.08.16.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 16:34:09 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 4/5] net: phy: mediatek: add calibration logic for AN7581
Date: Thu, 09 Jul 2026 00:30:00 +0800
Message-ID: <178355364330.113879.7307879640095189809@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
In-Reply-To: <20260708102341.53919-5-ansuelsmth@gmail.com>
References: <20260708102341.53919-1-ansuelsmth@gmail.com> <20260708102341.53919-5-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_163411_119825_6FA150BB 
X-CRM114-Status: UNSURE (   8.78  )
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

Hi Christian,

Thanks for working on this. One critical bug found that will crash
on probe, plus a couple of minor issues.

1) Uninitialized shared pointer in an7581_phy_probe()

The local variable `shared` is declared but never assigned before
use:

    static int an7581_phy_probe(struct phy_device *phydev)
    {
        struct airoha_socphy_shared *shared;   /* not initialized */
        ...
        ret = devm_phy_package_join(&phydev->mdio.dev, phydev, 0,
                                    sizeof(struct airoha_socphy_shared));
        if (ret)
            return ret;

        ...
        if (phydev->mdio.addr == AIROHA_DEFAULT_PORT0_ADDR)
            shared->phydev_p0 = phydev;   /* writing to uninitialized pointer */

devm_phy_package_join() allocates the shared priv data internally
(accessible via phydev->shared->priv), but the local variable
`shared` itself is never populated. You need to call
phy_package_get_priv(phydev) after the join succeeds before
accessing any shared fields.

Fix:

    shared = phy_package_get_priv(phydev);

should be added right after devm_phy_package_join() succeeds.

Without this fix, the first PHY to probe (addr == 0x9) will crash,
and all subsequent PHYs' config_init will dereference an
uninitialized phydev_p0 in every calibration function.

2) Typo: mdi_resister_type -> mdi_resistor_type

The field name "resister" appears in multiple places (enum, struct
field, config_init, FIXME comments). It should be "resistor".
This will be baked into the ABI once merged so worth fixing now:

- enum airoha_mdi_resister_type -> airoha_mdi_resistor_type
- shared->mdi_resister_type -> shared->mdi_resistor_type
- FIXME comment: "MDI Resister Type" -> "MDI Resistor Type"

3) Observation: mdi_resister_type is always MDI_5R but tables have
   MDI_0R data

Currently the code hardcodes mdi_resister_type = MDI_5R, so the
MDI_0R entries in an7581_tx_amp_compensation_tbl[] are dead data.
The FIXME suggests this should be read from SCU registers
eventually. Consider adding the MDI_0R branch now (or at minimum
an else) so the code structure is ready when the SCU read is
implemented, and avoid shipping dead table data.

Best,
Wayen


