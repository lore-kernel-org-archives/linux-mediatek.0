Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C70C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 12:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5qE1Yzg4uUDLp5cSlrxrUwdpRevNlLzCrYAaWk6cjI=; b=C7NwZViBhYOSXE2fPoph01cYoS
	5BPTzClW/yGMsSRBd5eUrNPpq3biL7DQUstvdFcMlfneJlCaUixWNH33xxpX20WoJaJmo+4Apz3HM
	2mZQzw1747MjKPRhI5HBTDNVYEEOHszXUFBv8c6vPmv3txHCI6ShS8rMYkZt8pp9TUz3U9Npyzqj+
	fZ7O4XDkfdGztFzZzXwQYOZxQAzdjOd3gdorW5VuAdLVDhR3MSKWMrJBU5LHpMOs768llkcAxrM1x
	824RrinU++LBki6reTcbqBNvjI8+p4GG0qijREoBc+Ig3Bru2YjJpJZaETbeNJQEZuOVak4KQx11P
	gdSMw7Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofKhM-005jzU-K6; Mon, 03 Oct 2022 12:37:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofKhK-005jyL-3m
	for linux-mediatek@lists.infradead.org; Mon, 03 Oct 2022 12:37:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E08D16602266;
	Mon,  3 Oct 2022 13:37:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664800643;
	bh=mUEUSYdWSHm5PqjemMFwDRgFrWK0rEzlRVBCVzPa5AY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=km4rRLgJ9osYdiqu021ka1hijqBvRELrqXVrNphErcGXJf2zBbfRY1f2tkmMWfyHc
	 gUxymPh4hVGr5UR8DTCr42sYLeY/C0He98FoPef3luP+fCeQ2sJ1usZPwGS2rv6MWo
	 +x1Q5FHRq34wpebYpk7+qH6tYRxDNwq6kun/odnwIk5ag/VTcoKtsiZAjPus77efAh
	 5sf+n5TXzBZz5d5kNcm6ElR3A1JzUd4z9GpceJG7c73H5AChPcAJYmiWkjYMBaXw91
	 bF0DmZI35LPfBAa4poewYnQ6pF2xNpxqzS2HwOsLqucWU1+h0l23eGbevqOUHaw2Q3
	 vqREkgRZPNbIg==
Message-ID: <b86ae975-30b7-5e3c-805b-0332f241db74@collabora.com>
Date: Mon, 3 Oct 2022 14:37:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 2/2] media: platform: mtk-mdp3: fix error handling
 about components clock_on
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221003070830.23697-1-moudy.ho@mediatek.com>
 <20221003070830.23697-3-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221003070830.23697-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_053726_411236_A94B44EB 
X-CRM114-Status: UNSURE (   8.67  )
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

Il 03/10/22 09:08, Moudy Ho ha scritto:
> Add goto statement in mdp_comp_clock_on() to avoid error code not being
> propagated or returning positive values.
> This change also performs a well-timed clock_off when an error occurs, and
> reduces unnecessary error logging in mdp_cmdq_send().
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



