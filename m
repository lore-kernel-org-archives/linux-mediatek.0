Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59225C48285
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbq6i7gYZAzGnzmIgUUI77aDCl4geiNGkgnLFTMdF04=; b=i64x2J8oG5JyrKPbPMmTxdLFxt
	qG8kmYMX8M4LOPn9VvZnS1hxxJ1GkPXiQxlo/O4vHF1oTyN0nLYKSNH2IRXTx5TYMQ6uo8BX9kmoF
	8PoLyIj0ZVfy9MyTzPtvLcOg757cRX+T5M6UY8+Qvmetm6Lf2Sls4lP3yj+f7HpE+z7I0I/8oWyZ6
	tzNREEcP5IEm7iWQhnHt4bf7wMAJbOiV2BRDQp3JZa7PJJobr986ju6FPGPxTheZxkvTnp6ZqqnN7
	DqicPiZYsJ8/E3nJvtGPaRz2pjC7KB/fy8f6UIznpJScuuMZGfNTDZ7O2iQAlf+enK9eZ2kfTLuBe
	t9Na8eeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0Ue-00000000Ipo-26tJ;
	Thu, 25 Jan 2024 14:14:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0UO-00000000IgA-3LR4;
	Thu, 25 Jan 2024 14:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706192035;
	bh=jKQrE4Opvi83GnSvOecQn5WCn3KGRH8+nQTk7o5aKuQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=to9mna+zvXObqkiyRx10HvrMZqUQ+JTuJkq/pM5EhFtnovXXxv/68nvOTzaxO3rxx
	 TifkAmhOkrmDn7pRbPPln9j4nynEeS0WB2zpLfayvkuNGTVMNbmt13JRaja7BtO/zT
	 YPf+NNEAACRfsC4WsCHDRw3+p0FRb6vaXKb2qL4nPopXlNxsECu/J+6vAlDcT4wQde
	 sPpjNalVUgl25G1TH91rxcJ/T7wirD/27CwLSyIo6OnRe7RqEMaxHvMhzqpczB5jb2
	 A8E4ev5gLptfmQowoKP3qGYY9egXStIWlEFweP39bEvNpU3UxfpaXFrFJrwnTkwKYj
	 iKNK/dceXzPoA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8B9DE37820C2;
	Thu, 25 Jan 2024 14:13:54 +0000 (UTC)
Message-ID: <2277f739-e1d4-4ee3-87b5-43c0229d05f1@collabora.com>
Date: Thu, 25 Jan 2024 15:13:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 018/111] pwm: mediatek: Make use of pwmchip_parent()
 macro
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pwm@vger.kernel.org
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <a8659059ce62805d5a499edb823ace388f374d6c.1706182805.git.u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <a8659059ce62805d5a499edb823ace388f374d6c.1706182805.git.u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_061357_014948_2545D7A0 
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


