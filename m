Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0985BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 01:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhkQ0cJWFo5/+JckmuSC374vXWxCqLkRJWGOYKujcis=; b=tArb/+nnne3bwqHvFNrtn7iMXO
	RAmQWfStJmq5JGOWSQC5LEPACxUVHncV4g5cXQyF9Y7thS/Zp1zfvVre2Q14RTpNsRt8K0HU7qLcj
	lSwamXoDeluP/m0/WyKT6ZVa2eGfhI1wtSNxMnzh9uSNAxaXpOI6fTXdMNKs0/PYioKUbL/OhaV2f
	iRkw40hcW165s+mvpA3t5djdwlSdNmYEqb0pHNhkZgU7KesRGrZwVo/gtvXzdQADz+MFM3SxYxyDs
	GvgFCBD8EE7/gOS8e9VFJKGSKX8l0lKyRbSHfFGlGsMgCc62qiXio9GEXC6ENdvgWEvCrc5/0t7tg
	/KKDEoyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1eeR-00HRkS-D2; Thu, 16 Jun 2022 01:50:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1eeG-00HRfn-AS; Thu, 16 Jun 2022 01:50:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DBCE761CC7;
	Thu, 16 Jun 2022 01:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A52EC3411A;
	Thu, 16 Jun 2022 01:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344213;
	bh=FhkQ0cJWFo5/+JckmuSC374vXWxCqLkRJWGOYKujcis=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PNl/1VYOBJX+GK1z/xA0+SyTgO77bCwmSxek9sWJiyXF3hW18+uFdu0FcHGn+4Rx/
	 Gv0XGdBins1WjCWomLRsl7tauGUnSyXxzsjmsa4vh6ZDtiQV02ChpP5fQ4ikDrDFOn
	 oMy4hfUozi4SBaiACcCWlMKILFEVurMDHqsBRen96yGLnOFELzJn4MGLJjUbho386e
	 oEU3GgbEr/t+ZN634T47FHhEgniX2FAfKEHOZbbZ2DaZnonktjtpD1Uo5+AzcVuPIj
	 RQXm75B7sBP7fUgbeBJKjGMG8Vr+Z6RaTV+9zHzO14D7ultcXw6zha8FDShsJWlmAB
	 CtdmnB63fvC7A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-2-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-2-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 01/19] clk: mediatek: reset: Add reset.h
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:50:10 -0700
User-Agent: alot/0.10
Message-Id: <20220616015013.3A52EC3411A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185016_440058_E8C4C5EC 
X-CRM114-Status: UNSURE (   6.91  )
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

Quoting Rex-BC Chen (2022-05-23 02:33:28)
> Add a new file "reset.h" to place some definitions for clock reset.
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Applied to clk-next

