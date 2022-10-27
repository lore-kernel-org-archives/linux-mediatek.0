Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A548CECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 21:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bqMYfhBoMQBNclMwiXInuF4126VdbEDPwSYcMlTatk=; b=ibgS7SsaCQ3BTB9QaW1BGAaHk4
	S9V64BO/iDD4h+gzE9d1jCOe1mtYE38N2b0U7jeLQy31XgLaIIF1M5hM3Qgh0vSI3nHDGCDDwK8nt
	njjy7nmNeXuXFMxtAchSiIboVFlK7b2uhxexUktWZfFbk7D63TJdPSFID4dg1M7+vhVWjN33an45l
	2v1okWsD6/EV9jZopaAMzK3xV8bOmRhVVPlEuQHOUnCdEOahDjOAfatKqhzIrcUHsw7vbERCiSnT1
	vsJuvAkj3NYyNKGre8+rcEZunpwnExbFmbfboVGXKbf8StomsArHcdeuYjm1+Dmg3dEBSLbOMYGYs
	lG+UB8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooAdZ-00EwBS-GP; Thu, 27 Oct 2022 21:42:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooAdM-00Ew9R-Kk; Thu, 27 Oct 2022 21:41:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B7346250F;
	Thu, 27 Oct 2022 21:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F112C433D6;
	Thu, 27 Oct 2022 21:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666906911;
	bh=+bqMYfhBoMQBNclMwiXInuF4126VdbEDPwSYcMlTatk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CJRlxu66YR1gJs+s/NRcf9oKssdDMmsNjr8UoEhMmO0BXaC5th/zLePkc9dB6Kfk1
	 x6OmBiPkcO1KJDdZsxscaN8ZlqWvZdoHZbgds/k2Bvmgj9Dl3Yb9Cl946pyKrj2rat
	 hJHXHbwRo0MRo9ApgPkb4JO8xANJvDN8P5wR7cSjTWZEe5PmONuVZ7Y1GuEt0HcG6e
	 lbK6VL4KcBv7hSwPl2IRLroc1paBs4BmP9IMRzPc/BZ3xeTBHlOLDamhgj8NTRcuhL
	 jiHOk3G3pyDA5u5k6bnWMVP2zIMEJ+P9TxPvw7uzqzOX0iica03IJcc2g0VXYzlm1r
	 a/PEVvzF7+4bg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5e55012567da74870e1fb2edc2dc513b5821e523.1666801017.git.daniel@makrotopia.org>
References: <9bde77be-f4ec-11e7-e645-7c4465bcf6db@collabora.com> <5e55012567da74870e1fb2edc2dc513b5821e523.1666801017.git.daniel@makrotopia.org>
Subject: Re: [PATCH v2] clk: mediatek: fix dependency of MT7986 ADC clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: Sam Shih <sam.shih@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>
To: Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Thu, 27 Oct 2022 14:41:49 -0700
User-Agent: alot/0.10
Message-Id: <20221027214151.7F112C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_144152_758949_E45D9856 
X-CRM114-Status: GOOD (  11.02  )
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

Quoting Daniel Golle (2022-10-26 09:18:07)
> It seems like CLK_INFRA_ADC_FRC_CK always need to be enabled for
> CLK_INFRA_ADC_26M_CK to work. Instead of adding this dependency to the
> mtk-thermal and mt6577_auxadc drivers, add dependency to the clock
> driver clk-mt7986-infracfg.c.

Is this a cleanup patch? Or a pre-requisite for thermal and auxadc
drivers? I don't understand the priority of this patch. Should I apply
it to fix a regression?

