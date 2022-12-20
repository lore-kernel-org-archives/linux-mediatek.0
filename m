Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C177EC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Dec 2022 09:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuVA6fNObhnZruG/JbGx3/MnFJyFIgRlhc677EEebuI=; b=r4zbSWfpCOrJhNPOStSlUGfWvX
	e+uLEi/zaVVP1j49RyNzeKFcZStzHvp7naCeeeV5f7sH+UmcgVkvgp0V3TQ/hjQxnTVyvhJo9bXPg
	Qn4PUYSk+R2yo2y8hvrorOFwqkOY6l3HCg250/Fsvb+XY6HxidZgWFnJuCMvJchZHkGpkrlt34+L5
	XouHIrehbU1S82506Wds2A/9gZ3popJoh3zVLJ+DqgLGPmToB+lgJ4UYCSITkSCgf9yEivq6Q0T1L
	CyNH6OaVaU0I7ohLENwKJwHrxtq6tTJlu9fLWmeU6HhA5Mr6fmtV0ieEhO/3J64vpLiOQmN01Zm6c
	YbKHQ9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ZBE-00D0Ju-Fi; Tue, 20 Dec 2022 09:45:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Yzi-00Ctru-M3; Tue, 20 Dec 2022 09:33:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 948C66602C4C;
	Tue, 20 Dec 2022 09:32:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671528780;
	bh=NfDoU2VGx/bPmc9O90rykHOvdLmE9SU5j8BSusYhG7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=doWJNENXTeEbtUq/ZdiNgsIQJORSvV3mk5LPVuFHxKnellKCsoYdCng0vTtrpAmZA
	 GtGS9lMcmEo6LtWo1uecI38nhnqiAN6T6VKFlKZYyASsu0CRtsuLbd2ZDTTzwPAU4x
	 eyMSyNyDtWinEaN36uS3KLMO42mSbdZf/VuK/L9fj6b9oJG9EsyaILppaBydxVRZVi
	 jUx2L3TBJiZxfloK1/OW/kbInrmzkdCMHiax4WE99RygpJ1+0Q9fkm/K5tKRs5fLv+
	 kYhrZlUSowjda67yROzDmsSrawwhI2sZVC6jsRs+OYtKw+yFHXeysIW7XCMldsbODJ
	 5leHMxUFIejUg==
Message-ID: <56fb0497-adb0-4f31-7051-b3324372ff58@collabora.com>
Date: Tue, 20 Dec 2022 10:32:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2,5/7] media: mediatek: vcodec: remove unused lat_buf
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221219064332.2124-1-yunfei.dong@mediatek.com>
 <20221219064332.2124-6-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221219064332.2124-6-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_013307_019869_118B2B3E 
X-CRM114-Status: UNSURE (   7.88  )
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

Il 19/12/22 07:43, Yunfei Dong ha scritto:
> Remove unused lat_buf from core list, or leading to core list access
> NULL point.
> 
> Fixes: 365e4ba01df4 ("media: mtk-vcodec: Add work queue for core hardware decode")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



