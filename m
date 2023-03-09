Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5068C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 11:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWJ3gP7EIm3S2akn9mqJpHJZ6lL5NjSbmZAJW3bjTvM=; b=S8+PM7FO3cZTvHF56Z4JtiKk/q
	gJZewWT/Asok2Ly5HQ/9mgL5umIzn+sG1x2BlMYsdWmxDTKMM0EjQ8DjEQ2f+EUxWX7gNt59YDSRw
	9mA2LmS0zqKG+qy+JmGSYHFzzOrUL9mvvq9tkEZ7rZeS7es8P4vRvSE6EKwKscpQyONABMGn3+L9/
	9N37XDEccSmoEnApSRXmTQIkDJaQYlMbsCA2sA6RsmZ6cbE5hftj0WgSiN7JxaaRDIW9I/gX2SCF+
	iFGQ4SeiwGZBDNAI84czvMxE4d3N8vafMatPRwW4VSywwb8X33qtrVWcnsujaHUeTHdbmF/wWXr3X
	isnxVNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paENg-009T0l-HN; Thu, 09 Mar 2023 11:24:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paE1r-009IEQ-8L; Thu, 09 Mar 2023 11:01:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A7B86603012;
	Thu,  9 Mar 2023 11:01:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678359706;
	bh=WH7TIFE7GrzDsTCUc9cs7HLmmMuya/jcFwA084XwdQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A5I2X787Xscvt2B1AlGBb7FlhcwxGmjpGVffMNNJNwSIntMJlP+Rm7B2u2+1P40cU
	 LLopXZ5GyjMHEeMOGuuH0H9aSjw07ZV++ighGMf8lzkMXvEWijGDJRMTCuTjot+45P
	 LiI/f0fJxQ1ACQtJp8fmKgziBRTVJUH2jvIktmaKt6z5ALYV9XIoxoXICSpqdJigLO
	 PH/11SSnLShIGOYANDf5kqfyXfVojLhJVn0VKbm8Va9Z8Pr6zhclHRW0TE53YuDHMD
	 +w7AJgFfMNGhSdhOwLPFoNgWmhBVmVaUXm0Le29/FHcagilMXPFA9AUKZpYofktqJR
	 zGznBeEINeWCQ==
Message-ID: <9d62f04f-1d3c-e892-58dc-b20e6162dbb4@collabora.com>
Date: Thu, 9 Mar 2023 12:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] spi: mt65xx: Don't disguise a "return 0" as "return
 ret"
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-spi@vger.kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230309094704.2568531-1-u.kleine-koenig@pengutronix.de>
 <20230309094704.2568531-4-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230309094704.2568531-4-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_030147_463386_426B9403 
X-CRM114-Status: UNSURE (   9.42  )
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

Il 09/03/23 10:47, Uwe Kleine-König ha scritto:
> Because of the earlier
> 
> 	 if (ret)
> 		return ret;
> 
> ret is always zero at the end of mtk_spi_suspend(). Write it as explicit
> return 0 for slightly improved clearness.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



