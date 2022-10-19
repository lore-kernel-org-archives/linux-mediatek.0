Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927E9C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 13:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOfBa7+7Ac5J9E9dOike9309BkGfqPd11AE88K1rKqE=; b=HeUibnfVt+dxt/AA01eS0KGHKF
	QIdRv6LZmNRIUiFcVhCN8RS6J8iCZJOtkpze+l0w9DuiFakwX59OWNWRS46iBzf+c1DsJT2aFLHaE
	8Vyru1gB+0xj5lNLH8oyyin0ibO4xQ9zUYUFYyMGhOCFbPq6Y95vyMM9SiJz66kCDIEUOv/cWqm7l
	3+Kc6CSy7z994AmG0LLVKYnMd+nsN8OS1SuE7nWdH8hAAeED8Mie0mihd6xJtcu3ZTt1ChWYvB+VQ
	C/z2afASBi038SCPOtE151D+0ruTI3M9F/4mSkZ3LkJxITnGkTrsD3zEBULyF37LCp81Bul0cvocx
	dJ5XfE4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9Qn-002Fu9-Kc; Wed, 19 Oct 2022 13:48:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9Qd-002FiE-5s; Wed, 19 Oct 2022 13:48:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C1607660238F;
	Wed, 19 Oct 2022 14:48:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666187291;
	bh=JRFBIEM/o3vlqulr1q6kOtGadUUgU5fFs6PkyTMxPoM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UCmD794vdXoT52u4B6OT78/64SmEehyANCMurAXV+o/M6BESNlUbHQOjv3jkxrL3K
	 9BHh5/+85ySWzuLpP7nrVjysxQQG7CSGjLuo/NzoPd9x/rv1kKajohe3gYwOmMUAKQ
	 VZ3Y7RSFJYmJRoqWW+Guri4l1q1fr2KAJSCn0OBVhTPBohP1KiapOQGFTw5tbiBD+l
	 LgC3Db3v/ivXnLilPWVuqrwBSxZ9YPhBB1c/VAinDz1eeUhf2Ha2DZfJ0kCg6LaeHl
	 gPpqH+TTY9yAIc9ni4o+ZaG0n2zBsfLoj2KLMROl8HFiNwYlX+ExHYApUr7XZtuTaJ
	 u9ZL2m9yX1X6A==
Message-ID: <56042926-4921-3e77-ae0f-3bc6c462bb5e@collabora.com>
Date: Wed, 19 Oct 2022 15:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4] pwm: mtk-disp: Fix the parameters calculated by the
 enabled flag of disp_pwm
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1666172538-11652-1-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1666172538-11652-1-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_064815_373912_FBE600E7 
X-CRM114-Status: UNSURE (   9.54  )
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

Il 19/10/22 11:42, xinlei.lee@mediatek.com ha scritto:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> In the original mtk_disp_pwm_get_state() function wrongly uses bit 0 of
> CON0 to judge if the PWM is enabled.
> However that is indicated by a bit (at a machine dependent position) in
> the DISP_PWM_EN register. Fix this accordingly.
> 
> Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




