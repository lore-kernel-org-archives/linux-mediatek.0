Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB03F327B3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2026 07:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAPZKAtP//rRCXv0419WZMnL3zXq81n5GtlNLrBk6ws=; b=ykNWDQHBej6Vp5qpQ1VlxIzfkg
	Bp2+7hlT1SNFCPVPeuCLczr09zriD0tXoc7cv5EPLOTEqrU1CBkd7ETUItVcZHMuIGECMQdZP4M1x
	VWNT7NyPNw9xTBcf/hraRv/wwkqkKKayS0mV/EThVaRtFUaDb1TKABpn/sTCJTEdf+JYHYu4wFFhP
	QZmy4rNeOgtRQYDpYNxeGcWLBg7KKe9O/7VIo6AsFdPu11du+tvpXwVh/VCOdfSxE6uXaq+m42XKv
	XI+8+105TJ24HXib6/87bLTamTI9D4xelv7+O0hlJoCEAJLd5Cwvulp/PTW38WDPg9NcV2a7ylOM9
	fBtM+Jfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5Jw-000000089KK-2mMH;
	Tue, 21 Apr 2026 07:14:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5Jt-000000089Jq-3EHv;
	Tue, 21 Apr 2026 07:14:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9985D6001A;
	Tue, 21 Apr 2026 07:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA60BC2BCB0;
	Tue, 21 Apr 2026 07:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776755692;
	bh=NUanx7qGcEqtnsDYPbtKV03ieoaKJQQYKCPCmeuCV9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJlNhX+gnKiGA56fWSwRjmzRlwB+m7T7RbDPJ3dBRfsI//7LAcU3XkZ5QNuyoLYxt
	 MVqdegtTgxId+uM6/G5T3K6i0qPqWW/5hRzGDMgakTCTQMai2a0IPaEdD2phm+vPNF
	 SI4Bhk4OsVisYTwpKWJ6QrJlcOKvJ/YvBb3DDYYNc0ICW936YxN2OuD1X1PUuEZHLE
	 fxM2m4h8C1Jd7fA5GEVIOyNQ9s7krKXEkwlE2GFwE1VVyxMIW2P9rmdAV/AaeXlLvi
	 FjNKkFtUiGrfnvbtdYaIaX/AEnt4t1eqzPTu9/gr608uMdGsyoWFGQEmDVlJdd4cih
	 QzKGs50zUU5tw==
Date: Tue, 21 Apr 2026 09:14:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Val Packett <val@packett.cool>, 
	Julien Massot <julien.massot@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Message-ID: <20260421-elastic-just-barracuda-45d0da@quoll>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
 <20260420213529.1645560-4-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420213529.1645560-4-l.scorcia@gmail.com>
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

On Mon, Apr 20, 2026 at 10:30:02PM +0100, Luca Leonardo Scorcia wrote:
> Add bindings for the regulators found in the MediaTek MT6392 PMIC,
> usually found in board designs using the MediaTek MT8516/MT8167 SoCs.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../regulator/mediatek,mt6392-regulator.yaml  | 76 +++++++++++++++++++
>  .../regulator/mediatek,mt6392-regulator.h     | 24 ++++++
>  2 files changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
>  create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
> 

Your patchset is obviously non-bisectable. This must be squashed.
Test/check individual patches please.

Best regards,
Krzysztof


