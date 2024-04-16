Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7587C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 07:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11Y55v0AlzuRPO7ifOFiCZQ7lrJESQhpZwvX7xtpFpc=; b=CCerv+ye+I9mhN5ck7ryygF3Ro
	b1iTJmpfz+kPUihlr/LypUo6jYfnG8BHeqRmKYBgOSLVlN66I3Ucy/l1udnK22N2oNhcw2E+0bIQ4
	OGsH+Y3J7dGxzyArefAR6rI6LdWt66tKD2OKi10/uua0OWy+/tczlF8HBxy1EwGsZUXk6lDnN+W+k
	p6lCZag3/FwcSqQ6HeENwXSXOuayf8F3fxUZzuWW4ccnDSPv3Ae0tS8SNvTK/94Ohw2JEiuDh/FA1
	dzCy7CFMBL3vzOwSitasRk3eu6PrLoXSnFbi61W01/aj8zTT3V1bWChaFKqz7qlrFaI3NDEn8MDP0
	OgMYaQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwcsS-0000000BAZe-2E14;
	Tue, 16 Apr 2024 07:05:12 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwcsL-0000000BAXF-2D2y;
	Tue, 16 Apr 2024 07:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713251047; x=1713855847; i=markus.elfring@web.de;
	bh=11Y55v0AlzuRPO7ifOFiCZQ7lrJESQhpZwvX7xtpFpc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uYYpoJTmRqgk2fHBG3KnNz2CLPavpRrEfJtq6/fkxsSHPHo9hr9qcnbetfR4rbAv
	 WWYYcMCU5QC3KoHYZsERO/uCRV2oxChX6X+Rafq4yYRbQohsxFKvostPltnlOgZUZ
	 uF9kX12zxQQdi44vnDxMP2KDpxbIBaLpo5hqzClbmR4INeL93ovd+wCPNkORolTKA
	 RsWEq1pb7kj6jurgWDs/BjuRAGZTklJtZ686dqKAidxv8QQmS4EmEZg2pw3cisyw+
	 IuhR26xDJ4uJ6w3UN1gJ6I/LtVomRg8m99Raf/c0Fc4QVAeD0lf4ST2m6UyLR9hF4
	 nOhZqEsl8lmkPGi/9Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mvspv-1smFwO1js7-010uHt; Tue, 16
 Apr 2024 09:04:07 +0200
Message-ID: <e0377059-4073-4779-8385-506b9b39301e@web.de>
Date: Tue, 16 Apr 2024 09:03:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Alain Volmat <alain.volmat@foss.st.com>,
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
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, Sergey Kozlov <serjk@netup.ru>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
Subject: Re: [PATCH 03/35] media: uvcvideo: Refactor iterators
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sHR+TeGSFgoxPZvFUHAPIEuDVzgT2GvvVwRx2R0bQhoUCLrY21q
 4aVwGDwLU20D7GafylHrOJidGYSPJoSoIzoqf+nPfG0K+ORf8VF8LHB5EhsUv86XaNhisus
 3kmBAPbDemt8Lc42bbQEjY39bQYWH3PtxU6pQC03uggivELLPehSfNoyDhXXBzC0UmXhKFx
 xJrtOT5azfeT6A+OIpOdg==
UI-OutboundReport: notjunk:1;M01:P0:03HI85af2Ns=;yQ8sKTONouBI76raH8Z58fLgdPG
 cDRdjqAFM/3eXwECjUZI9h4p6mlw8k+SOXiyN6GfwXod9KAZJOxaNqbO06huy2pgBzYXWcxaK
 1yvcUyUm5nteIAvRh5GEJ6k2V8yU4C8rRXv94JjainnOHsSdDuPbk0aZXSWp65ziquDFaUUDN
 YJZN7AsXSRRYZMDVispdvHubrvkMarfGAxoCn4+Sw/adTSJ9UOxI6QREc49RSDDGj50+NsVZA
 I9/YrIlsRw4OeLnNC7dBSfeh2gas2lmTVPAdeZE5dk0sIs7aiTx7Cpr5FEHhCUFXrkReal3EO
 gELP/4ATALLJIJbZL8oac+FZhSpqW5irTqlO//L3y6eUAaDcuOSIPWLoaYJ2J97IzS1c9eCBT
 dPZVw6RcJR7I1g+6lDJwbla9AWsE0cHKjE7xI2z8RiMQz8Rg1JfobeDUi4lCAeun4aY23r5ct
 YWwBdDrs6QXbNlkfk+vAwFpDgJQbH27hI7BnJLDoXByi4vvXAuZw1dpfEkQ80cUKCCCXCdn7X
 PvxRBpoBI4VG9b+hFjsF5IAAMMrnv9iTADoQIOgnuUIHJ96lnDCSfdzxHRFAWt2M+05cdkCb1
 Xd22EYiLsJxLnQ9xjjeW2wTuQRB2DVUy1LO2KuI3z2ZDeT+FU9j9vuFhJTTTlhlzwnv9ycOI2
 FCqhmVe/n6PxH/5bS4hKkm4lYwNU/GheqGDyJrBHSbogo2OEAjGtEGI1SveFeBPQ/PKRQkiQ8
 msmag1gLjDLzUZ3GnLIpmC2bTBr5sENz7Knm/uddln2TX5kDsFZDCPf9L9KYANSpzIuCxNgkh
 +sdpCGJrmyr6dMFVvuLSI8fFEJx9x6/qw+iAMnV+HSLrk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_000506_182250_F656F7F0 
X-CRM114-Status: UNSURE (   8.56  )
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

I would find a hint for a variable change more appropriate in the patch su=
bject
instead of the word =E2=80=9Citerators=E2=80=9D.


=E2=80=A6
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
=E2=80=A6
> @@ -2175,16 +2177,16 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *ch=
ain,
>  	int ret;
>
>  	/* Find the extension unit. */
=E2=80=A6
> +	entity =3D NULL;
> +	list_for_each_entry(iter, &chain->entities, chain) {
=E2=80=A6

I suggest to move this assignment into the definition for the affected loc=
al variable.


By the way:
I see another source code adjustment opportunity in this function implemen=
tation.
https://elixir.bootlin.com/linux/v6.9-rc4/source/drivers/media/usb/uvc/uvc=
_ctrl.c#L2165

Can it be nicer to use labels =E2=80=9Cfree_data=E2=80=9D and =E2=80=9Cunl=
ock=E2=80=9D (instead of =E2=80=9Cdone=E2=80=9D)?
How do you think about to increase the application of scope-based resource=
 management here?

Regards,
Markus

