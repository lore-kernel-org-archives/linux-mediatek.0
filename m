Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6319EC77B7E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 08:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtH0oPFOTlpMEOqoowpzCejl93Q4NEC3KA91Kez9bMY=; b=NwoZQJfYTbDANz5RclHwbi0D+b
	g4SvoI4HGdrcIWD20GtjTkWX8l9VaB0Y0uHDbqqXDRXam0ZszqF9SXgZQ2d+UghzmXHPC5/LA5VnM
	C5z3wcX25FPpYcICMbCtb7v+bgZGai11I151kgicO7vFhR9Z5WyWVIYvogBPJEqy1oguTndJjvKWZ
	LpS6syznu8U0FhVU5O5A9fvy3Fib3l3aHyLG9OFUeLtsoHPT+wb4B9V5ZlWzInfEkHaTFpqbcApR6
	f11xvyO6Jcx2/CccrNnsj5uU7LAfvMFS4nF77E85eUHXZrNiTteMU62X5Psgs0mTHHZM63BZHOK9k
	dX0S0I8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q264b-00FvaS-1y;
	Thu, 25 May 2023 08:11:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q264Y-00FvXK-0C;
	Thu, 25 May 2023 08:11:47 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 34B9D6605835;
	Thu, 25 May 2023 09:11:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685002300;
	bh=RzmohAWeYHmoyTTalWjBITiii+M1cMw9WZu+K+wLm4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WA5MPZM5vJ5JD3sfXwcpUYNhmOm7pqgdbOsEbx/i8tkeDhk+Ux06w4RTMhV6LNK6m
	 5fHVxHIWOuU9o4Gj9fzlsoMnQQU/4fh+vKSkJQOVmfF1FR1VY9x68EDWjRtQzpvkPx
	 j+/zNP7F2vLgiRANraTMrk/FnSWEVKJOpJ4WOqhu8aaixx9GBTItfWLkTS5ZJ/cS/u
	 ZhvfZALya4QvnWzIVfvIqdfR5vnLNlUj3/zwAPoWM0AcmwwiZCtx8LUTeNBYsO4klq
	 MRPPbsnzY/QBlVuDwH/Rn0CE+XO8NbXjJn+z2dLhBryGXVMFa3l5zJFuFxUaAxHN3G
	 UC97F/cyGFzhQ==
Message-ID: <b32b82f5-8555-39cf-9311-017a42b24e66@collabora.com>
Date: Thu, 25 May 2023 10:11:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4,1/4] media: mediatek: vcodec: Avoid unneeded error
 logging
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230525014009.23345-1-yunfei.dong@mediatek.com>
 <20230525014009.23345-2-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230525014009.23345-2-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_011146_253332_1306A1DA 
X-CRM114-Status: GOOD (  10.15  )
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

Il 25/05/23 03:40, Yunfei Dong ha scritto:
> Since the LAT decoder works faster than its CORE, getting the trans
> buffer may be done only after CORE finishes processing: avoid printing
> an error if the decode function returns -EAGAIN, as this means that
> the buffer from CORE is not yet available, but will be at a later time.
> 
> Also change the log level for calls to vdec_msg_queue_dqbuf() in H264
> and VP9 LAT decoder drivers to avoid excessive logging.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


