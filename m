Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035BEC48285
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 14:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o34VPpdCES8PvbRTfFTaYbnMgqsNeOul9xvTcJLGr+4=; b=qI+wq+9LtIF/T5XBZ4QyuqGzpN
	v6KhNHJNjMYKYnVff/lB4LjK0XgFJYMa7JaOBhAqrCOg4ISJs9XwpN1tXC2AyxS+jG0x4ly1NzKKn
	g6daglQ7nxkMeoTKj3YOYZCAhojgJGKdcR1ctlqtGtG1lOWGmEZD4nPURm+Dwa/Gco29GqhQnLNtF
	2SY57TfD6zlOIZn5/PR7r28Ysn5aIlYZU+gB7VSgaWsSzmyJ3cKjk8k+PuwjWvE7yVSKffVc9X1y0
	NnnQAfZjkH1NHdekUUUzA2bngICxMFtHiylSKEAzXy/tyD/2Psva4kd5MfPLIzw0R2GTXXrVzmDSa
	5fnmbT1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0UZ-00000000Ilw-1KXG;
	Thu, 25 Jan 2024 14:14:07 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0UL-00000000IeL-3esc;
	Thu, 25 Jan 2024 14:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706192030;
	bh=/HdxlFWEigL3KWcoKYFXx+46bfXTbqJ9I/9en4fDMnI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IKDpBg9njiry3orddbTQbxj8sqPQB/IdvbtvjxTSJXSwYu+x3sXj5KAu5QUVWJQ4j
	 dXzIiAaBmdpPvA8yA14ver033kXCe3lMdbdbz/3Xk91j/H4fsU52T5+D37yjs2yXRX
	 lX2XWVsVVlfsCKB9Abt3RJShr4a0Aw6gZ5Qq/31ZCvRb/prZkZuqGDc7FuOQe+9dnY
	 ucC+g8DcXFrNSUy9u2ag5RYd2iKMsOrLvojupTc3gmz8FQhACs6b2OqkDb7dmvCl7z
	 MSSVXnmNL33PkKyWDTFMt5WI0p+1DvsDTRH0jWvJzrknI680N7Sk3ZP5rCNewqh+C6
	 s0b1zT4xkbpcA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 12BAC3782057;
	Thu, 25 Jan 2024 14:13:50 +0000 (UTC)
Message-ID: <d0a456b3-744d-4e58-bbcb-e939117376f5@collabora.com>
Date: Thu, 25 Jan 2024 15:13:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 074/111] pwm: mtk-disp: Make use of
 devm_pwmchip_alloc() function
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pwm@vger.kernel.org
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <77d027ef065580f5f29fc003bb0cad6bda1abdb1.1706182805.git.u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <77d027ef065580f5f29fc003bb0cad6bda1abdb1.1706182805.git.u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_061354_092208_CE9BEAE8 
X-CRM114-Status: UNSURE (   7.59  )
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

Il 25/01/24 13:09, Uwe Kleine-König ha scritto:
> This prepares the pwm-mtk-disp driver to further changes of the pwm core
> outlined in the commit introducing devm_pwmchip_alloc(). There is no
> intended semantical change and the driver should behave as before.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



