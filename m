Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B525CC6FD19
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 09:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omaJGV98ZBt/nLZwT/Okr6Klt8ZnrOEX1Yyne7eWaNo=; b=usJvIgS9ljYf+7L8TcwS3kXNe3
	wYaZCWdxnPu9OnEXYUYR7CmbI7dzOwySsU1oD+jW6c0jYAGZxKT1KiwqlSF2EqmDBYI3CJ/UQVoIq
	wLU8uQXBuC3b1fvc5gxAu1wG4XspJXujdXIwu6tPcLuiWVrjyxkfTq33Acm9E/mkyfumDkny+ybJZ
	cMAO9t/xx/sNFj6hEvG/OA2qbUH0QRIk/l4M1AxryZXGELsZMiKXfzh6HYbXPkiDGCd/yXJLBpnji
	sg53HkUqvxlXlN0xEDb4V65MbVRlK1TGEkdGSlzSjbYeu4oNra2BN7hhUZH8pnn+OB3b4E4K6gn7O
	v2RcGC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjWr-00Fp37-20;
	Thu, 16 Mar 2023 09:04:09 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjWn-00Fp0x-0B;
	Thu, 16 Mar 2023 09:04:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 818A666003B0;
	Thu, 16 Mar 2023 09:04:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678957443;
	bh=RZUD6ZfSGRTeOd8k3yIR1WJ84mfgoTCh6HqZtNF8ZVw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k4dVN9ok+bwTxCcKL4jnqkfTsApX+3UunOfIVkxm2gxfkOLBjz5uW/ngAKsi+ZDIL
	 JQusrGsykE6HbEBflLx+QybiHzk93RXpA9ujRGoiBd+ElnUpCYcThfOmmkL2hUbgEt
	 IS6C98gDCrU6/otGb+lKr++pKxxK7Ywu6Ahq1Mw2fzWTdlpWCkA4mruAzXo+p/RqSH
	 nXtCy4AkvAjQhkbUxSgfG/V67cjFrVicEjb2SAzc7GvF56RQ+IK9UjY3RJiMoWKOFo
	 u39JF/GP5JMUD8vRufv4Ew9/i7lgxgV1cOsjGoUKLebiPHXZ+pwnADX/S206Xu4FWN
	 5wZuYcxgteZVA==
Message-ID: <4445a2fb-5fab-c12f-c59e-cf1e9d67db21@collabora.com>
Date: Thu, 16 Mar 2023 10:04:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] spmi: mtk-pmif: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@pengutronix.de
References: <20230306073446.2194048-1-u.kleine-koenig@pengutronix.de>
 <20230306073446.2194048-3-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230306073446.2194048-3-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_020405_218745_54757D34 
X-CRM114-Status: GOOD (  12.72  )
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

Il 06/03/23 08:34, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



