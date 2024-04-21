Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC91C4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Apr 2024 13:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evdFeQD/L6zQL0Vd61pp1Z/7nDj1MNxAxQVGWpoT+5Q=; b=mqrNfeuZxDhs8nhUlohhNN765m
	SbcQ+adyWgYYcdfh57+7lw9TSDyLaIM5HgSCOH5C1cTVGRpLDXBptwsloZbv0WRjZa+zNu6P4lFok
	KJr5PqGsbsSAcioBTP7iQyFLZ2XcEEI7Bx0qi/3riAfqfAJY2VBx+waIA8zH/5Qk8Ity/ZqJQuIy5
	y9vnYTNng4yNLH7OhyBkIzrxOekPY8UkoXjqOelsj2hHfsdaQz5NwtLGGYVAWee91ZMNNZoTIaT90
	DFSmLxQMLvN3f0/V9b/j2bOpRhTmUsE33U3e7/9zKAAOV5GDGv1eyR1cdxP5qYgA7QVxyxw5GrUhs
	gjV/HX+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryX8M-0000000AY3H-1qdG;
	Sun, 21 Apr 2024 13:21:30 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryX8I-0000000AY1g-3KDa;
	Sun, 21 Apr 2024 13:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713705647; x=1714310447; i=markus.elfring@web.de;
	bh=evdFeQD/L6zQL0Vd61pp1Z/7nDj1MNxAxQVGWpoT+5Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=wSbQqbr1RYsm3tjLf190P21u4mfqY5aRfGWHBCzP1Tz+qjJbOZNzusg383orT8WI
	 tSzdWXRHMEiwSiFpRqoAZlK2q3ooF06CVAShhoh9FDKzJ7lO8AVijWqJrghP3TqjE
	 0CBARr3a/umf8F79eZvsTVGkG9sjPSZGc7nJIhLmlAHuZm0PT9F8+NAZhZBc/8JHc
	 2UNOy1XBc2dA1dXwhRMgAh9OMOoW2TbZX8ry3KKlJ6o37U61JfoXnLc5thhP6xQ7O
	 LurcAQzJ57IXNComwOPeRrOpYUYPpfUMzVV8kVAuyMwp6oXEM+g+072xqnSzrm7XA
	 KIgAy+B5QXtJEpR4xA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MG994-1rvGOR2UaS-00Gm0I; Sun, 21
 Apr 2024 15:20:47 +0200
Message-ID: <de7d846a-01d9-4fdf-bc9c-86de86daf4a5@web.de>
Date: Sun, 21 Apr 2024 15:20:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abylay Ospan <aospan@netup.ru>, Alain Volmat <alain.volmat@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, Sergey Kozlov <serjk@netup.ru>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240419-fix-cocci-v2-23-2119e692309c@chromium.org>
Subject: Re: [PATCH v2 23/26] media: venus: vdec: Make explicit the range of
 us_per_frame
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240419-fix-cocci-v2-23-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MbmB4lbr0en+rNEVuMVQKHm+9+SobHtxinkTBmRYl4i4b+31EqI
 eDwjrXrIaKZp+/JDMGyO9mK7R38liq/GAdwkTbVh4sU1ZIHKBPZL6Gz352kCK8X+Ott1p0I
 Zv1ZyMxrJePW9LRPcsVaIQBR5rTY4R57i5DKnUO1EgZCWx2pdd7i/yiO++WyTX9PkWwOwgX
 MxKtk9/Gp6Qa/8l3U6jHQ==
UI-OutboundReport: notjunk:1;M01:P0:dATBYSaFibE=;Jyz5Mi9ajE9LhE5N43qTaPY70xl
 gVnbMBqQ5QAVpzMNHzeG1wkunna8DaKO0ymMAIZrSDfx0FleIE5fYhcVDypdKp8lR0v4WHcJj
 bF1xILN9gvohbueA/zfLRvRWF/gnoBdL1aWPZIPYB6kW2aEMGTFMghdmtL5DzlX7WZWxY85WW
 7/rtRlA3gxcuo0iB5+M6gRylehhBreCGYF7EHnbs8rT3Qcx1II3k2Dyqm8RBDtSXvU7dv1N6U
 wajFglzV/nmJbI63wkecxwZpApsrBBwyGVnTzWSBdoBfU3C4RujxPe3Y17PUEOT3Qfcr+lWft
 Spgzxaaq6PmSulrGutImZxLGx6OdJEuFSUMxgD+J+EvG6t/pjkHn+vOgN3GI/ReQMP3/AaEI3
 DPD60h7q/Pfljd4BWJDamWuEcR+oILfmcG5AxOGnq3FQjtZH0ODtrTt96/lbKRZ81vYH+CXDU
 8hAuZwDshKlLcPUF2fWSJ9ntrW3rHm2W1nJQqIqZYiPZ8TEAYD2X0816c/Ntrsq+7FzTN/6tE
 juSDURgQk1ei57P0vsoouKErDTufZMRKnfag2p9ne6EeSN9khMGduG/U+G+v+uFKk8ERONGSO
 +6CgcGekJA/w17fJKphVwZPdG45Dp1ebt2C8pS6Nexw+Jhi+ko/DkvucwTGBphBPr8jlq4zHw
 RAOu1GUx/DwMa53tKCYa9ud2jOpt5G23ikqn34bwaNYhEBmgXqWZYY0SUcrMjJssH12bp8Mnm
 KyOHm0Qd0TkYbjXImY8P4Mo7M0Itn4iAxgjNzq5zbjtPyhRSe+ycsO/K8UZEm1x8LUST+Tq7H
 N6Tf56yDUtKLeIYD1zeJEW4KcLnGLGsBFNG6+hHWAgeA4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_062127_508853_64637687 
X-CRM114-Status: UNSURE (   5.88  )
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

> Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit nu=
mber.
> Make that explicit.

Would it be more appropriate to move the word =E2=80=9Cexplicit=E2=80=9D t=
o the end
of the summary phrase?

Regards,
Markus

