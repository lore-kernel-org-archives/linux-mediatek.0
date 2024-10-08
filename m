Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60543CED274
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 07:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cvlps11fBJRNfYHYhbNrt25m6N6b4aUU69m73IXRFms=; b=bjsnemycC8tBHKWgPXD4dGSJrC
	wV9KsanIIbQwt1Uetam/r/PeTXI8NLs8AM++vB7kKy0zZTIMQrq/rwVujSKEKfcBEL50wqxtKAutV
	GcpyOQGDj6vHYKuzdZQKIrywfD2h0dfYWHZaMzWQu9HSejOa3kpvKNbQymabNk9wxSFTsZIPUeQxy
	mdLGds/KIoIvaVzLmLLuRya5+vVvv2Qla8Wbbf1GmgJ+nt/49uvEXPhYMUyMrL6tTN+qsiR2Mk+7W
	qImK5fxwwZnVz9ErVwAXea46ab0z9i+4RuAFX5Fsk8EbVmKHF6LZO+79uZLb/d2Uxv9a5NzJ8ZXRv
	i9Qp7yJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4lP-00000004oik-14sg;
	Tue, 08 Oct 2024 07:36:11 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4ie-00000004nz6-0ZPO;
	Tue, 08 Oct 2024 07:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728372787; x=1728977587; i=markus.elfring@web.de;
	bh=Cvlps11fBJRNfYHYhbNrt25m6N6b4aUU69m73IXRFms=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EjHjvpN0GLFQAjGi7MVF67u4+QmtUmpaSVRBo5CQt4aVej+DT3fus7R4AIM3KzV2
	 u8sF3hnrPjkJhORb1ypKvEmyZ0QR9txoaqnheWJkBr3VYx2A7JB8ye4H1O9y51z9o
	 kJjWHD3YUARo8NaOKJOZaDQSQZZMT7ZKidPrEuc0GvPxkUFFdRzEPOBvRZrGM4klM
	 O8Lhh5sOWBPJf8gxfnxkLRewTnXasqjneUUTh98upA/vlnQ8xbIhelbakz4QUKYP7
	 INoGDz2mG6wogLNwiOc9hPnJxu8tlheGqTP0wysacEyCNh4DVwiwi9YhRhGKO7hd6
	 Uft+IzT/ghLyhmeggA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYcll-1tTcDQ0iqh-00X02U; Tue, 08
 Oct 2024 09:33:07 +0200
Message-ID: <0379b3a3-9ab0-4b08-adff-59fc8ff98844@web.de>
Date: Tue, 8 Oct 2024 09:33:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Adam Thiede <me@adamthiede.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>
References: <20241008064716.14670-1-jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v10 0/5] Fix degradation problem of alpha blending series
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241008064716.14670-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qj1iAxZU5UbJCMxFoe9Iz5waTfsYw2nGih47OSLK4wqrVTydawt
 vpiwPseNZPOF9JluNA6lc012WGZCE/8DY1NFX0YqKif2Qo9uBn2cTB9k5qZ0HjApF2KjoAU
 shINrmK++1xM42gaVfB4EqiNkTB/E315CB8KuUc9XdtI0IHKH0VIcuto3HHI+96uBGeCP0A
 Fi0gCv22K4sBfL7FMhlLA==
UI-OutboundReport: notjunk:1;M01:P0:FTXtS/iD7gw=;KycOVj5RcErMRwfHtkm0NC6CG45
 3j3lk1oAf8tmJ3SwyUe86+3mZK8+wfc/tTrHJ+we7p5g0MQ3/La/2/CivdO4UKAQrQShavAVS
 lU2jLQcLcceLEfDmlkhxZdfmDG0SLmgJ5W4hJjj+TNoGDLJXk/hzvXPX6XjywkJ1scRX3kzUo
 y84cwrffKYPm2sOlkvIN139A2C7lhHK095MIXSZIfTatNezZCDGoMfAa4x4SA3TTomw9H+OtN
 Mn8BQuIc/ETtco2QAU4icZS0mQBaMFsv+QNHUjZuzNjYD4iWiW5ZISPr6ItTNQwoycypHW1z4
 qDkpBb9zLoWKeBPjzk3sy+P8JO+ThJabtLqNYg8nz959IzRcycmvFKc0yDWEoW7DxkeUVrR2L
 gC84/s6gZda0t8Y4uHSNR+VMT6LajldwdJ+zqXH4tZDBxHVW+9aFCsktlpDgORQALahD/IMmj
 FgxzeidCSjBlSOSFwHCN+6Abf65BCd6RVhXCmLnBog3U/4ErgonAUFVUwttKd8nRlacraD0Vn
 RIkIxxHfyoyqFyf80jeL7KsrFxulvU87udSejd2pyxnU1f1OZWzb9lVnATstCcGm/fvUqnjRP
 LrnkOUfUI98t00Ox4uevMV52aojsSOtWgcsmQYfs5hdHOxZ2Vtc3ejczq561q93nq+XnjuLPl
 es+T4eNZDr4TrgloP1rMpQ9NGmsTXSkJUN57nvseab5tBVbK2eP/CCw40oVcvQzGqLo2UcHWs
 lJfdxPyPztqtSyTnlBNgMMPbDFn1r69bw8jaqt8MuMfCalahHaElQCs/gc3XxfotVm+Hat9Ph
 N4JzNE49xITTTwxfs+sn29qA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_003320_608333_D80F52DA 
X-CRM114-Status: UNSURE (   3.17  )
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

=E2=80=A6
> Fix the SoC degradation problem by this sreies.

                                          series?


Regards,
Markus

