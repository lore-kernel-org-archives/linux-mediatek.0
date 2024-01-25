Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EADC47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 14:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbq6i7gYZAzGnzmIgUUI77aDCl4geiNGkgnLFTMdF04=; b=I9HFRa/pWpS7vBJt8idB0vDTjC
	pP3Kukhd/9og3W48WvNB26wIupKggq0/JnXy417oN9mLENfdy2gotPDR1fqBAWLlDBAxzulvQsFce
	E7OXdeW15T9q9TJau2lshnLNr3sFSX2WxE4BSLOav//tK80MRgLXRLFa1nhMnip08kX41UBRUlTxv
	KxyEcjtXw0vBXZZTIAWLOnjOtgmZTnmx0QXnVltPi7DuGpsLx8vCRLBbo8OJccDfipxS+k+IKsc3R
	5aZPSqbphZXzP/JVq0EU6v+mXI9FFtsbhHMzdWwdnv5zbbNSB/bZtT84PeSMSeMqbboU4P1kqFcnr
	lfbtHNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0Uc-00000000InZ-0SVR;
	Thu, 25 Jan 2024 14:14:10 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0UM-00000000Ife-45X8;
	Thu, 25 Jan 2024 14:13:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706192033;
	bh=jKQrE4Opvi83GnSvOecQn5WCn3KGRH8+nQTk7o5aKuQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MS/F7D5z1wGut6xcl6AhDbGSLg4Xyc9AdVdHrix76OrCInF2IVsT3/yauIfPWiZ2G
	 GO3Q5ZeihHPA/AJob9mXVQt+p5jx9vQYIODGvlzPJuIQ7g78bDJbJ+dxhquXdsQcp6
	 cahN4yEQ6Mvud8bIJigYlbzAHTYgqEGwOsybenHP9RJnIxRRQd18M8oYw1YKKwcxOW
	 aEIa2FsgqxltrftmKYVBghnbdtXxLsV61hkV5yswhPpY2Njm9GkZGGXm/vFpndGq0d
	 4EhDSlrU+K19s+OOq2G/sEWAQyEZAQsfi4vJnnYOFEkOBOpiQ/eDufILcWfdEivEGK
	 QTZIlkp2pUxMA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5E1F737820C0;
	Thu, 25 Jan 2024 14:13:53 +0000 (UTC)
Message-ID: <1c9b0338-a095-467a-9b2d-4e152eed6e74@collabora.com>
Date: Thu, 25 Jan 2024 15:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 020/111] pwm: mtk-disp: Make use of pwmchip_parent()
 macro
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pwm@vger.kernel.org
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <0ebb99812e0d563437d2cdb8d980e89461e28a6d.1706182805.git.u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <0ebb99812e0d563437d2cdb8d980e89461e28a6d.1706182805.git.u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_061355_195413_BDDADDA8 
X-CRM114-Status: UNSURE (   8.30  )
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

Il 25/01/24 13:08, Uwe Kleine-König ha scritto:
> struct pwm_chip::dev is about to change. To not have to touch this
> driver in the same commit as struct pwm_chip::dev, use the macro
> provided for exactly this purpose.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


