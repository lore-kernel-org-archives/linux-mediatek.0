Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2531DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 12:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZV06C7I/F2scn4sgwAXK7R2wH3l+z+pnvJjlUEC0p8=; b=TiFhSwMbB9sFuobSROYSmBnF4+
	1gaS5uNTg9vwMiPHRCzR95UtmPs50MPUyvAnJsVJJYp+oqW07/zA47CQpdT3bVnA6jLCIqpgsiZWK
	Dp1IW1mJV5fcODkaIxAK+27wFk9hrGKUmL6yOhu11zWMt1/l9YDamR+QeSaLMzBmkssakoMRpo9hf
	CeNbf+3aVmcEOKJxL0xx9+3hDWvW0xmA1WuUfEAVCGh9MqHHMh+Uur02ga4XO6BCYtX+8Bm9freI/
	Vi3XaYWAIZ00plqLqPVzpqjlb9b4REY+wEwx4bpiXCRNaW6+CT6q/lm2hJgMEiAp/F5QSGJbyefHn
	hSJbr3WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeEuP-00947p-B1; Fri, 30 Sep 2022 12:14:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeEuM-00946V-6U
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 12:14:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 95B4066022CB;
	Fri, 30 Sep 2022 13:14:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664540061;
	bh=8tHGfCw+vp0FbI3nyOeiRtXInzXUqDHc4IFqsrunjAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LPSdUI4KWdjHB68Y6tW7m60Moc8tHqLmw9cOcww6sglB9r43oXpRCPAVFDC175qBv
	 0lrXfjQhaywhC+anRphKC7hWmdVu7tD4ZeeoC/RCwnrtGcQK/h0FZudXwdLbkaA+ml
	 pD3y9wXGiwDyQRgpCi34+Md6zAdSwAuxqgXnhiBHkn6bl4erLM4FB9RYfeBmTPAlLH
	 FYm7Cx5JOsxJad+5NtqQDfVZEofK6OCQ6kCsRntBKFBBUCI8oqzBVUunaB3D28ipS/
	 VmSeCbv+0R+dIKVSzR/M0PIhn9/gohjqrPth9jwzPzdPGuH2vgpDokWzdtAjyRt9uo
	 3M/5r1lLCo1JA==
Message-ID: <6eab4410-0284-0b09-e810-f979b8ad1d57@collabora.com>
Date: Fri, 30 Sep 2022 14:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 1/2] media: platform: mtk-mdp3: fix error handling in
 mdp_cmdq_send()
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220930102306.13201-1-moudy.ho@mediatek.com>
 <20220930102306.13201-2-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220930102306.13201-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_051422_396387_335DDBAF 
X-CRM114-Status: UNSURE (   8.10  )
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

Il 30/09/22 12:23, Moudy Ho ha scritto:
> Increase and refine the goto label in mdp_cmdq_send() to avoid
> double free and facilitate traceability.
> Also, remove redundant work queue event in blocking function
> mdp_cmdq_send().
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



