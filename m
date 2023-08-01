Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B14C001E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 12:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+th+aWZ3O27UWlE6uee+T08Qnh46aAnPRjm10588jIA=; b=AXqrg3EIvqDr5XbFNMGhFaa+a3
	QyILN4wKBd/ghs9RDW3rYVsHkMFmfUoFVfr3Wq+1Kvvq6qc7UH56RsUUUg75x0GbnPOqR9mCyJCYq
	ifsTQDTzAv0Fxn0LIn+bIQfalHwVZ0XEcz0+Gf5s5ocs8Mai/c726F7TDF96OKkrExiiLI/UOu0gY
	+zmHlTnzFryeFwjetaYzcm9lsUQl/1IfKTKk2VG2wi5or3oJPUStD2mHomnJjfHj0IWGBGAZS34Hd
	onByPK9SANytOBobSqi1ygkTIFjp4rIt4wnCUZhyHEXHx/dZA3uax4ZzDmdt+aYE+/lE5gqDWqQve
	3bIyLwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQoyT-002PRz-2T;
	Tue, 01 Aug 2023 12:59:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQoyR-002PQ9-0z;
	Tue, 01 Aug 2023 12:59:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 47E6E66003AC;
	Tue,  1 Aug 2023 13:59:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690894774;
	bh=wcMBx/ohaotvYjHRfPSVtaceruas7z+3W5OIceB8WzE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=agtQ4HiXkLHJajRKm8TEMi5HmYzmISAmo+2VOKRRrNUCoGO0sToSrR+OymkD6mleN
	 fXV3gzK82vVVCLlF1ivdrDP13xKzjZg9NnYdbMJvoD5rW/L5Y+WaxPw1BIGcchctoF
	 i3zLMWN5zO+P4+w3F1+TvZBpcAe2bLWy6qocn9cj+IGxtQ5GcosdiiORu3Sq8hMuNP
	 aLgYPO37plgio7D0CjVac+QxqLSQSIdVCDqQGCouFTRot1pGXSCr7utC9ykNwpEw8h
	 naWq2/vmxoVTmaNA0qfF4bgrSZs0G9oUYmbUh+LP6E23sF470jw6zGspjRvB0atC+C
	 /GTA6/x/pJnvw==
Message-ID: <75ebcfa1-2413-76b0-4573-0ebf70fa59ad@collabora.com>
Date: Tue, 1 Aug 2023 14:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 07/12] drm/mediatek: Convert to platform remove
 callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jyri Sarha <jyri.sarha@iki.fi>
References: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
 <20230801110239.831099-8-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230801110239.831099-8-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_055939_518426_A2FCE0C5 
X-CRM114-Status: GOOD (  13.30  )
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

Il 01/08/23 13:02, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert the mediatek drm drivers from always returning zero in
> the remove callback to the void returning variant.
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



