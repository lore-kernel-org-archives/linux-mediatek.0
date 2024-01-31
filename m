Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D42C48285
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 10:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8BsEeKvOGuZicxJt/DNW215z/tJ9zsaxXjzNcIMWwo=; b=e4PPsF18hJ2IFMFPVePAMdT/VV
	RGBGJ5pE3gR+TKaKyfP8fSHIyprsQmeIaFDS7DSr4XtPBab+eoXi1oysLmFqG37JHSchzGM9RH6NI
	jVCCqxbqbCjufgUleAh0WYOlMMfVXTekXtsXd9Te07ZQdBTpd62x6pjre+PS/7kiZ+f+9GhFCRukB
	jpvTO19wE5rrFekHSzKE44yimyR0qYezGgYIt7+iYsByC/0iyuyFvdc5mAAVZ3zwh7N8jaRN4Dj7H
	bum+YEACXkq2fI1g0VBo5778v0K8B2Dk341QJ31+LKdeILFEGxohU9tPKlCmHrwT3yMIPF+bBu/6w
	c2sBRtJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV7PX-00000002dQW-3jDC;
	Wed, 31 Jan 2024 10:01:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6L0-00000002FhT-3dLc;
	Wed, 31 Jan 2024 08:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=j8BsEeKvOGuZicxJt/DNW215z/tJ9zsaxXjzNcIMWwo=; b=ZMqE1Eu4u+u/osAUWFiGj2vMWZ
	yI+ndzmTjKh0EV6AnY0Dw1seEXZr4Jb65Zrgckc9Vh1+ApvsCX6c8RFytKpc9fedKLTSV4OWGbfut
	RVloDQ12PgnLRhzopONyUHPJCIRIAPzMZ2T2PPgvFu2Iu+5Suhb75DRvACQqZJmdTtCvJsjqdrDWq
	d6xPUCqAf1NFn+eJyzaOzeVsOBAh66g6xOuV6jP2C3vZktCcukcfxgFqR0fDS1QOAToUez1PrRkvm
	cL7LuQKCwZtPawY+xp5zwnVT8hPSJU/XmiTXVjR7ZDSa3YY1Nt/io+olcJPohyCdtEnVJqJFM/u7H
	b85IQuDA==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6KU-00000008rEH-0BRP;
	Wed, 31 Jan 2024 08:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706691117;
	bh=mOtCKhhHIB3ZM5PotnN0PRvzmIAiHxDMRzCZ2IsNDCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=es7soGMY/oKsMroUJr9o7eQcx1CrEr7vxkbw0DXF0dCeGmd/FuvsVJP7pHOjZt4vM
	 cUbRRUmcF43q2xinkmJ+Q0dss23x3+RAFZbgs+Nkm7fnj98lrf0+p2JWFbjSnyYk9Y
	 hPPEWy8nUDad4sp+LCuillltJio3EW5zOiviWOwOzsY4vEpP6jHYNS90CvxNT4deSC
	 kzeXTtXMwf1eq7hJh5vTpHjOMeGuh2vhBjfKz4a3+Yi4rxZehyxImCcdDYVUfs53Rc
	 iemTjm0Bk//Vf6PMyPrrn9zg3vJuXzcySymWNTBcO6TcPOAD7wOPBnlMktCxWftscV
	 IlCp/JNjdgPHQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6E3D837803EE;
	Wed, 31 Jan 2024 08:51:56 +0000 (UTC)
Message-ID: <0dd06636-7f24-4723-87bb-485b7a34498b@collabora.com>
Date: Wed, 31 Jan 2024 09:51:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Drop bogus slew rate register
 range for MT8192
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240131071910.3950450-1-wenst@chromium.org>
 <20240131071910.3950450-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240131071910.3950450-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_085223_495484_959D465E 
X-CRM114-Status: UNSURE (   8.61  )
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

Il 31/01/24 08:19, Chen-Yu Tsai ha scritto:
> The MT8192 does not support configuring pin slew rate. This is evident
> from both the datasheet, and the fact that the driver points the slew
> rate register range at the GPIO direction register range.
> 
> Drop the bogus setting.
> 
> Fixes: d32f38f2a8fc ("pinctrl: mediatek: Add pinctrl driver for mt8192")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



