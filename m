Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22890C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 09:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3ricIK9Ozt94pFcRiVdJZEpZ95QGCCglgpOuhvtSec=; b=AFfLpdqRQLu6q2daUI08dZEINi
	XtiaAea3gkWXAwe9GGFFQVoFNf2j2WJ8FtlpNkzW96cKf5PPIdXl5McdVsAu1w6WOXrCs2IyoBKzY
	fKulPSpGd5mj8M3V/HKrHb7s/DnNQMDItPmsna6i84wRPkqJtCSTZl4yGvyNVe9+R5AkPNgV07Zsi
	RZG/boDn9ez6bJFRrJ3ckGfmfb96ed4WaSs4XoVK3f09iw2RVWHf5e1YCEUeLPQTKDAy96WsGCsFq
	RuDNYlZw1n1vgnkkwiaP+AzEZ0yGlw7eLi9yxpTPjAhT9iqObyx7sWol9TWzUGI+DSru0Aiom7lI+
	umzvAR1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNVa4-00F6Sp-Ao; Thu, 02 Feb 2023 09:08:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNVZu-00F6Qo-0x; Thu, 02 Feb 2023 09:08:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 719246602EDA;
	Thu,  2 Feb 2023 09:08:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675328899;
	bh=5IakbPPTAHlstWlMaParv0t58Oe6vt85g0wiRgRU03M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AhJLb6xZ/WrXG051Pd9hnZMFZididw3HEhWfNcyYmcyYlxZorcpLJ43/xX4lHOkHm
	 T7an22q8EKxOvfoZaT7MzjEC3zZr25DQC5iiTGrr76VQ6TWTSUcrSI8UIJ41lFUSan
	 87WsaiLeOOB0TOOBeIswrszW2PdYwP/UNQPE8qJI3xFMoBv/U8FYkfSPVA2fJrGlEW
	 f2oNjJi9cIwRguMO7le/Y7krXBonv6PjymZWsVyRelhDZgHTiztw/2U7ySsoTarioO
	 ojIUAPMIdNcjCMIZOsQoIgP+DRyZrZRXMyiar+6GKNyFavbySmPJv/j6R/+FLXz/Io
	 IR8ovNuCfoRPA==
Message-ID: <4db8fb55-a02b-d98e-65f4-1a095c43104f@collabora.com>
Date: Thu, 2 Feb 2023 10:08:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] MAINTAINERS: Update entry for MediaTek SoC support
To: matthias.bgg@kernel.org, arm@kernel.org, soc@kernel.org, arnd@arndb.de,
 olof@lixom.net
Cc: matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230201152256.19514-1-matthias.bgg@kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230201152256.19514-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_010822_224920_66311292 
X-CRM114-Status: UNSURE (   8.86  )
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

Il 01/02/23 16:22, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The linux-mediatek IRC channel has moved to liber.chat for quite some
> time. Apart from that, not all patches are also send to LKML, so add
> this ML explicitly.
> 
> And last but not least:
> Angelo does a wunderfull job in reviewing patches for all kind of
> devices from MediaTek.
> 
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Is a R-b tag appropriate here to say "yes, go on with setting me as a reviewer"?

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

P.S.: Thank you :-)

Cheers,
Angelo


