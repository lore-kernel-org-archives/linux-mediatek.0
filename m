Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40F3C27C76
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 23:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCZ1XZTCSjWNvYxTSWzJ96eH/+NdoV+UKJq6grJNktI=; b=E/cMUK8Ut1q8NHbJdzcQTwTur2
	R3VN3TwXZGN/OR9UW2toM+QKsR2Dx9efFybcbzBWVyrPH/j/PNklLF7Rm7ndAstw9x1ZTTfsTZJhZ
	KKoFUJVFcLmh4oGNwpCQ4AjGc4HTiPIHoFytQVLblsN15i1KkaJ2f7be3K1tgD5fr3uwDlq1Yf6Uh
	+8YlXUP0JLEuY+h8oabaP/Hck9fIyraDEDVrIdCqweebyDtqHP6SV2/x3e+PVSPXiG+ZMBifMOEUo
	Q8pn+lRzFGAJ+KrqtQSF08wBshUMF7ezr2td9gg/fvnLlldq/OfnKYTz2+VktVsC9KLUHqOhcDEsA
	g5kN97vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKotx-0092s4-AA; Wed, 25 Jan 2023 23:09:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKotl-0092qs-TP; Wed, 25 Jan 2023 23:09:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 07D03616CE;
	Wed, 25 Jan 2023 23:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6FCC433EF;
	Wed, 25 Jan 2023 23:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674688182;
	bh=hCZ1XZTCSjWNvYxTSWzJ96eH/+NdoV+UKJq6grJNktI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XVVbEZ2kErRVnh97BqcWzoxJC5vh7Wn67EbUPoNnLYZUoz6EHueLMmDFG+xfpX8zY
	 zp75rSQSDY21OrXuj1KKP/Xcnmh/EazCRNkl4y6RtS25VJAO4xEgIzo8lGTOM2hSRu
	 FEoD2awLy5d1XvQ74PTQM24/JZamMA/zEYebtOqSJqHf0L31jqhGKk3zSy7oYNDt5b
	 sKc/c5LQzbt4EUOCRrgwXQPX3b2ubDgh9Nfcl+7IE/xSPs21n87TS1fyLvv3dFmFji
	 9pqXQX/d2fEAqoVaw5DZbrqDHZl1ma+UG1tIgWsrW/0qXXj+ry+cEfUNaTU6LXxqWy
	 8RLQqhNcCCaIg==
Message-ID: <3dfa96e2dba814930445e8dcfae97e89.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
References: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 00/23] MediaTek clocks cleanups and improvements
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com, wenst@chromium.org, johnson.wang@mediatek.com, miles.chen@mediatek.com, fparent@baylibre.com, chun-jie.chen@mediatek.com, sam.shih@mediatek.com, y.oudjana@protonmail.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, ryder.lee@kernel.org, daniel@makrotopia.org, jose.exposito89@gmail.com, yangyingliang@huawei.com, pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com, ikjn@chromium.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Date: Wed, 25 Jan 2023 15:09:40 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_150946_006578_8333D6A3 
X-CRM114-Status: UNSURE (   8.42  )
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

Quoting AngeloGioacchino Del Regno (2023-01-20 01:20:30)
>=20
> * Some more spare cleanups here and there.
>=20
> All of this was manually tested on various Chromebooks (with different MTK
> SoCs) and no regression was detected.
>=20

Do you want me to pick this up directly? Or is there some mediatek
maintainer willing to send me a PR? If I don't hear anything soon I'll
go sweep my inbox for mediatek clk patches and start applying them.

