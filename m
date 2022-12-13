Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB62BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 09:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9SsNmeIJOfUwMjEIwU5v1KnBp6jW/qGoghojogUvjI=; b=vH81/K7yPXYYArYnFbC6gov3RE
	KNU6ZMY7DrLourl7lkELatKHQuBJT4I41dp10TLXjG4zc5jIyd60QZ5eoJcW5blc6jj1nU88ar7l6
	PXQVAZyp29UbnbDHiHKB+tTAAKzy6BL6aBN/g6gfOxdilQS/uMurpUobWACXeaD3hNxoqdv8gVm6Z
	p4LGwAlSSkcVn9vByOe6otkbuRgmebmoBKU9Oxe+tmUHL3yc/eKoSFPARJosUn4R9R2CCiVg29jU9
	EmmVlJC24tGiupPQtHqq9nOVZRFm0l5EUNUOrcAZD8fZ4kEc5AmInijnUPc6/cDQme7tprhLFtqED
	u22WNS5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51vu-00F0Yx-RP; Tue, 13 Dec 2022 09:50:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51va-00Eztf-Qu; Tue, 13 Dec 2022 09:50:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 135BA6602C32;
	Tue, 13 Dec 2022 09:50:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670925021;
	bh=HS72oKm63w2LMEbxOfImNuaKAF4fpLQ7wU9oXHA4roE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RtHJ6ooTaXZdj05uQbT7acXUw89mJS6ITx6Q1+RL8+PauvSKj0GnkXuMiS7D2GW/n
	 Ff0q+hMsMGz0Ud71EVrgO2QJmM/VOMABPSe2ZB/1W5kYhIkVSmGrkh9wBBHgILk38/
	 qtng7/RaKsmJkDUHFG6kJTTGJPQHA5NEtSSwtrlM2Uw4vdpC76y7t0NQYBzz+D+YgJ
	 wSq1CPLm+CIP6yUNM5UZOcxrimnq23attlWv+wrqCZJfAcLTi8DI9W+jiOCh33cN4g
	 S2nPNphL6f5JxOXVLkqpK9FM0Rxqu+IMQR7yzOuCJnVq9qRfjAtHTBE+7f8t9c1xar
	 RyPqsRiqi7+bw==
Message-ID: <0670a966-2449-977d-a791-4b1c4478524b@collabora.com>
Date: Tue, 13 Dec 2022 10:50:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/3] soc: mediatek: mutex: Drop empty platform remove
 function
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
References: <20221212222549.3779846-1-u.kleine-koenig@pengutronix.de>
 <20221212222549.3779846-3-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221212222549.3779846-3-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_015023_056333_0A8D07E1 
X-CRM114-Status: UNSURE (   7.52  )
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

Il 12/12/22 23:25, Uwe Kleine-König ha scritto:
> A remove callback just returning 0 is equivalent to no remove callback
> at all. So drop the useless function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Totally agree.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


