Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E336C88E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6gkIocMxhvdpf/NKA6qKbg3ZwMu+O+tLx3jm8Ehdxo=; b=UwmMEPy5KOHuqXRfqmqWYVAVgT
	z+rujHigk7cDEe8I/ReCF2eBW7FeaqgFvWWPF9fYfaDN2Mx0Q0gZZBlmTrwrNBM1JCtUgTa5S2tCz
	68jHBLsaIW0Ovhk+oWOcKu/KYVdXOWKGl/Tx4mrgT2UvCFf7CKyAwV3D8sD9G1r/ASscRNoI1lYdS
	JWVBuYlrVqB5eGlDXNq6jWQk9HtV6XU0hOe/IB2Vl2Eagzdw1mWz4JJ+cIPhkjUKNYVbTFnYsTGkt
	aryLTba4w4t0ndifbDU87Z2a3bHowbb3Lb3UuwQoQqJPvF54BFLteNbZ0JGu5dA8Oq4FwDnR2hJBT
	z+zU0yyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62hW-00000002sFm-3lEP;
	Mon, 14 Sep 2026 09:10:10 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62hQ-00000002sDT-2vW4;
	Mon, 14 Sep 2026 09:10:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C9A5EC5CD41;
	Mon, 14 Sep 2026 09:10:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B045F60580;
	Mon, 14 Sep 2026 09:10:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9370F11C7AFDC;
	Mon, 14 Sep 2026 11:09:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789376999; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=J6gkIocMxhvdpf/NKA6qKbg3ZwMu+O+tLx3jm8Ehdxo=;
	b=V/S0lrmmL71ZBsBR/XBCFjI98LgKkiHAv7j9dc0xrTkjkGC9lUUILnC0yOpXTDdo6Jqym+
	efzToVH1eyBm9ahiseIPrlPneDIHEWt7DqGZb6bDmy0oDinA45cHma+7+DqkRjloEf6G4P
	4WXtli+F8pHa2mmVqCJu2x1nfnLkYl9O8hXqGEWBaHmOvlr71+4u4LL0Zq9vhSM23gTlDx
	LJ4AlI90ifROUyx7NgNve5QPatdQ4yidw+kC682ul7VhVGHAmjFHi85J+j86VqIpop0Cj4
	CBgFpqr4f/HRNcCCy9bbwsy07nqo+molgZt2jZxtiBDm5iimwdzMn/T/gWxDQg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 11:09:31 +0200
Message-Id: <DLEX74H9NP51.1V8PYE64K89RI@bootlin.com>
Subject: Re: [PATCH 2/2] dt-bindings: display/msm: Use consistent
 indentation in the example
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Chen-Yu
 Tsai" <wens@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, "Liu Ying" <victor.liu@nxp.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 "Francesco Dolcini" <francesco@dolcini.it>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Rob
 Clark" <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica
 Zhang" <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Marcus Folkesson"
 <marcus.folkesson@gmail.com>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Yannick Fertre"
 <yannick.fertre@foss.st.com>, "Raphael Gallais-Pou"
 <raphael.gallais-pou@foss.st.com>, "Philippe Cornu"
 <philippe.cornu@foss.st.com>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Adrien Grassein" <adrien.grassein@gmail.com>, "Russell King"
 <linux@armlinux.org.uk>, "Simha BN" <simhavcs@gmail.com>, "CK Hu"
 <ck.hu@mediatek.com>, "Jitao shi" <jitao.shi@mediatek.com>, "Yongxing Mou"
 <yongxing.mou@oss.qualcomm.com>, "Abel Vesa" <abelvesa@kernel.org>, "Chris
 Morgan" <macromorgan@hotmail.com>, "Martinez Canillas"
 <javierm@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260913123331.100293-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260913123331.100293-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_021004_904007_320E5029 
X-CRM114-Status: UNSURE (   5.32  )
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

On Sun Sep 13, 2026 at 2:33 PM CEST, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

