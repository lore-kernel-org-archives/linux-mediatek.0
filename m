Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9409BC77B7D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 09:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2egC4hNrYWFpg2ICwD9ww37EKKh6y9kObt9oqk6dg4=; b=XmQPya30+cbwVSN6Ely291As29
	hekeDUA3rM8wVEiQAMsXmyYIDpOZtaPSx+rfO7NT/dL+wQ00h7HOVNOMei2oLx1pMO/wOYxZaEthS
	2cj0Pr+T75/DZXkSjYOj06KnqapiMSnym/DX5f2OutLPdoBvXml/5bq8FLxv7ND878Y6ajTz+flkK
	hThS+GXBAUdJCKrRJoilGw/KPSezLEtYRfhPVaFYc/75Tx0a/DZ5uONRW0+oj88SqsRWO0RQMrV3y
	C4d1bCtn4dPyycN6ZfRXnsEqtwODV7ycm4wWebDlqnNLHiBKqAg7mM7c4cdASrx6+Tr56uUwQGEC6
	iCnhZYFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pza2f-00CTSu-2c;
	Thu, 18 May 2023 09:35:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pza2c-00CTRh-1i;
	Thu, 18 May 2023 09:35:23 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 690476605861;
	Thu, 18 May 2023 10:35:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684402520;
	bh=oL2En3yRR8knnoB60ZscJ7BTUbvS7K370Aaxx3iso24=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ksNchRgLVqMAcIOhWKBeezRW23u/UNXgmNQw2eBUkqq5toVMDhMv+C80ZCRREvjRf
	 oVivXiycpuPkOKCqrX1gpv8+WNcrdPOuRl8DkT3svemg7hy4fKX6OkYtAR+6jMXjE1
	 ghVHKzAu84DQn+ngf06g7scRETxfHnc2tlKRhX2oSuYci6Hb1N1YjEU3QyPDMILe65
	 nbVmKTGCbj1sEUjRao0WGLFLpcyGBqHpg24kKlGSnZngMmrXYsJNua+vOpTcoCai7G
	 UyLPam8dydoejmig0fWtCdBsjmVU4OK1PXc3w8pTcUvYwMJxhdP0wMmbK0Ve74toVW
	 csDLSjQ9nPwSQ==
Message-ID: <f0628691-e76d-8c31-5c70-5c188d9b96a3@collabora.com>
Date: Thu, 18 May 2023 11:35:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 82/97] usb: xhci-mtk: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@pengutronix.de
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-83-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230517230239.187727-83-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_023522_698086_EBEDF166 
X-CRM114-Status: GOOD (  12.76  )
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

Il 18/05/23 01:02, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning) and this typically results in resource leaks. To improve
> here there is a quest to make the remove callback return void. In the first
> step of this quest all drivers are converted to .remove_new() which already
> returns void. Eventually after all drivers are converted, .remove_new() is
> renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



