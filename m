Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C2CC76196
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NqCSQ5BekUCtLDexRP3no0HV76jT+5Oekdx3fWn9QY=; b=38vUUsejLvbEMWMPZJkJ/021sJ
	Z9oUGSopEjJsVITrCqXS/VrzqmKaAvPaHtBrUSfYzRpyAdRbyxyTYbKiLBTM59nqhdzDs5wa7rI0L
	hfb0PXbX1biUO+jenRXR1mUlE6dq9ZLClKthYZU9WTJTEEE2bW+hk6EDjeUuNiZZOtcuZbUnxdEot
	7xqxTPNUbcV/xvI86tiO4zgk1nKqwvmSHso8ceUxa5Gh+yqda0/tbeTThdK/GC/nVi24JLpw5gG/x
	96aHrbbr/GMsqw7aT3tKfWW7JaR9kiFK21jmDLoHD5c0qOSSCJ3JU/DQvJHxGHPZ5Qx1D/Seu/nub
	rem3HFTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOjf-009GAM-0u;
	Sat, 01 Apr 2023 00:04:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOjI-009FtV-39;
	Sat, 01 Apr 2023 00:04:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7556C6199A;
	Sat,  1 Apr 2023 00:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06A1C433D2;
	Sat,  1 Apr 2023 00:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307463;
	bh=8NqCSQ5BekUCtLDexRP3no0HV76jT+5Oekdx3fWn9QY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MTDe+BFOErGYZi49cE6KCDS6HluSQyV1MuihS67R9e8+COq7XYjlpOtcf6i0xcqbh
	 8FY7cRqWbcFDp46CGxvfmQZL/LvuyhbAXNiE/5BD8P+vK6y4u4ZlLyvL/cPpPdRxlb
	 c7JHTcYf2RtiQKG7gnwr5TmgxIRRof2SsdOlsoctMuY/mU3mVwZFhogKFVYhKJk5vk
	 RaqMKeYi93/o0yZWG2ze03+tQGj0PE75Yo7UGyogouNUpfG732yfZHv4/jrV9DvZc+
	 M2453CtDAAeOJER04n0drPSS1Rc0J6BOHz4aunXe5k64ma2b9rqJnkD5uO+yjEUJRV
	 oawaUTTZ3yYpQ==
Message-ID: <36be11dee4f08ed8698e7aab46814cbd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-15-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-15-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 14/19] clk: mediatek: Add MT8188 vencsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:04:21 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170425_056394_95D980F6 
X-CRM114-Status: UNSURE (   7.18  )
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

Quoting Garmin.Chang (2023-03-31 05:36:16)
> Add MT8188 vencsys clock controllers which provide clock gate
> control for video encoder.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

