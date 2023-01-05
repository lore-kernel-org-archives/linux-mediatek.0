Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC2CC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 20:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7R45mg2S+siPAPmfHimtaJX2XVhIBYuQ+i+vnijGEE=; b=qouYGrf+Jwy+fweEA0cckdMIuT
	CK0qaRCjPw0F4LdVYgolsZfV0ktmy3l1rTxNDQmRTdfCICqiK+kAXhM/Zzzw7hTRHvTy/GoF8bf6T
	p/2bO48+WtfEJjAyYWjR9XvktgaY5r8XkMPLPaswLfV5Ko1xoWjAggBpF3eEXHo+nV9w7KIpiyKLv
	lOGSwzNl6HmT6rIc3e8l/FcDhq3OBQn5Nqtuq1tKi5XdlW5kfD+x7jwMLLFNavIDnIR0bUlONAymI
	a8W4slL7/KzCoP/UNzJWd35GrQjhKjC0EAP57Ucry2JIm7v/PgKHh6uW8Ti78cN2N03VzhUZJKlko
	/2BZD6EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDWqJ-00EXxH-K0; Thu, 05 Jan 2023 20:28:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDO6c-00BRKM-8a; Thu, 05 Jan 2023 11:08:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D62196602D2B;
	Thu,  5 Jan 2023 11:08:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672916890;
	bh=1kiw+Nt5XgcB53KKtDr+R7gkEeVhhmQpgaGQMdBRJJw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A/WUTsHeShksuISQG/AgxAzAP+CQx4dsDGsshFDwf7Y+EJ0M+6JbGDxb+WgGAJchO
	 Xj52jqtomYFQt+1VcX+K067bieQDQhr8hVb51KtxInDykCrZcIGCpbEDRehVeLxXcE
	 XOUlL1WrU9oxXh4Ys9JrxLrIeuCea1/Y0FQoKeGxc69WTO1Dx86RXQEE9+LqghwSBX
	 GL0ylej9Xm8ktH+VG+nmrclvwLCjZSvP50ToR8fJC8YOhXxVDQ8t+Th4p5NCvzKHec
	 FYEXPwDGwa2FmR62+v2CDROQUOQ3rOLY0zMEt0z6OjnfqXBPiuMTcFb+7FByrrKBJD
	 vVwAqsGA0TwhA==
Message-ID: <710ca95e-bb57-a487-aaf9-1861b7dcb703@collabora.com>
Date: Thu, 5 Jan 2023 12:08:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 05/13] ASoC: mediatek: mt8188: support etdm in platform
 driver
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230105081606.6582-1-trevor.wu@mediatek.com>
 <20230105081606.6582-6-trevor.wu@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230105081606.6582-6-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_030818_604157_328ED59E 
X-CRM114-Status: UNSURE (   6.14  )
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

Il 05/01/23 09:15, Trevor Wu ha scritto:
> Add mt8188 etdm dai driver support.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



