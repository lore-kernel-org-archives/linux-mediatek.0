Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D1AC04FF8
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Apr 2024 14:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGFEHaSAYJNx3UiIUNYR80pXYXBmvUUDb2g2ErCYGyU=; b=ocdsmrNyukjnTi4Vbtue4C/eR4
	NfmwzXb0KrDjX6vnw7J2YKGX6IXX8wi75nyoXsSrpll8nnQZeAhIP0Y/aZMC+RyHd2RFH1Us1vwZW
	K/zeqboz2oiHsqSfyR2OKXnPf2i7vgLksrmo69OnRqx60Rh9O7FVRAWeQcVOfTUMiTW80zYGVOxon
	058P3elWFLti4aBL1DjXDuF+KaqK2iUhdT91FPPL64wGX8M1zUSRodIW/LwvhpP+0wBwHan/Bavkd
	Ly0gRrJM2306qN/TNc3xlFDAYMMUit2TqvG3Vw6xNoPpB8rF88rxhdrJFjiUgb3yj/hgvgR8oXkVz
	8wITdMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryXrK-0000000AdAv-2AJ2;
	Sun, 21 Apr 2024 14:07:58 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryXrG-0000000AdA6-2PP3;
	Sun, 21 Apr 2024 14:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713708433; x=1714313233; i=markus.elfring@web.de;
	bh=rGFEHaSAYJNx3UiIUNYR80pXYXBmvUUDb2g2ErCYGyU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tQYCgFiDBtzuJtaPSJ86VUUlnx3bXoxnIn1J0YHGl7VF+oYJVzcRSwD+G2zZBzgc
	 uTB8dvnwWkDivQsAUzxLsiwv5flkheBVFHvsQiOfznxtj7fLZB3M8RFbR5o6aFner
	 Sj1t1PzkywvlBvwKXs4Lr6JhavodozKnL0Svdq+lChYVhVirwNbPz6tS+gVYWlXqa
	 95mVIMsrQSmRFKT9TUNwZGTilthpjTn79LrHyCd7LFaP6wfUdMG/3T6vJ4rOdi4dH
	 iwGmCcl6aPaM0eI/pxYxleUmRrN9tSkK8x+A6S2Z4uZFiufNUmPWXhufwg8tihQys
	 I2EGKqoXEcArn2eUPQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MIL0Q-1rt3fo3mEe-00EaEg; Sun, 21
 Apr 2024 16:07:13 +0200
Message-ID: <8da94316-239a-4870-a29d-02a685ac9ae5@web.de>
Date: Sun, 21 Apr 2024 16:07:06 +0200
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
References: <20240419-fix-cocci-v2-26-2119e692309c@chromium.org>
Subject: Re: [PATCH v2 26/26] media: dvb-frontends: tda10048: Make explicit
 the range of z.
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240419-fix-cocci-v2-26-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ITKldMmeWvicPfSwk1lGM7Lql2Cm3DyJ9It4EIHpN6gg859l9MR
 aVD74QMk+LR7UI7fCic1Ij6uvX8fwvnr7wmvQM8i2QbG3+d/JBqLNeRM3I4bZa4E34XPC0i
 SYsbUCsj7/cRMEyPRu6MKnSrI42n3gk8CvyH//Tym6kHgNuHGbXy4egSum6bjeRch61q+dN
 e/VFoFn+HOp3S2jycBj4g==
UI-OutboundReport: notjunk:1;M01:P0:aX93InMPE+A=;h+M1UNdgZoIAePk/gLkMPUcnWFE
 5gaoXXP6v2pwlnxGO6K7et1oLiL8TIAKeJnHv51y9QwquJqybP572QDhkhzEsuPTkoIRzUN/7
 mShPYDLUIN00VsLwJwEmnundkTslk9hH7wxBTGzqOXKZ5TY5ODDTJuvlXRSs6Qt0j6Z/P7XXu
 15PpEI3BzQ9oSDuGd4BeLDWBmnFddw2ZuXCPSrm3HnBRmIp4rcHTseicBP7mUCsPTUTDT+3Y+
 vWHqY5jFyqwmk7ss25eqM/46T0rHpKxI0nKyahCwXvP7DUiZ1GPEITM3E7kQt4ALfzBy8uKQ3
 /QbGwtOhCqs5WJIPQAZqJR6XUwVGf7oZKojimwo3AaT5UA3U1JOPBrIBsYOKM154eq6cLRhb7
 iq3PcpnWcp3XY2aFQX8MCVRIVXgd8lxxQdtn8YCerRLUuZvtUlbR4R5j/YvI2UKy7FgzUXB1x
 3Bhlx0CwbqmbGIefOVLAyR4cfc+nIFs51pRtQ8+ewYveJRDBdeXtJMHFEz0n4phTP8RtZsl/0
 gBuiCYpYSSRcLDJIy3sB4G28Z9bjW/ocQDIUzqRvU2jwtnKM/PbNp1oZAjsy9Ua/wqTwFL3Yy
 D08zYttD1lPwxETSj/WDnXQ3ihq22+OycigTle4pH0Fu9sjflBCpMtE0wevQzd9/RPzz87VXO
 1UKjbmrDXvCF8Uxa9dvN/3c2y+mOW1EZ9w+T50Rgk7lXX021VRrmvb28kFBahImqiPOj/VuzQ
 kgKYpxl/BMOIFE87FcD1inozha/zbBUBsau+PpHyJL+sc7SUX97HhHV18g4SNex2a01C1nw4y
 muG/WBbFF6tZ2iO9s0OozwYOGKNkAjvz3gnxDEJWMz9DY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_070754_925428_BC2695C4 
X-CRM114-Status: UNSURE (   4.50  )
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

> We do not expect the sample_freq to be over 613MHz.

Would the summary phrase =E2=80=9CMake the range of z explicit=E2=80=9D be=
 more appropriate?

Regards,
Markus

