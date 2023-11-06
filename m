Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56CAC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 12:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6iH/2izOChoX7ZH5+n+nJsRoJZXfUIRdYD7fr0knEI=; b=P+2IK6quu/jtfOPP0ELWwyN5Il
	/zhSov0is6Bh2gdeEoARKGn+14Mv7ezIy6CERaBQVvqi0HqkHzxL4EzzFizKdtlpyKc0Ff4HX2sdv
	FSjBAEEfkmNDmV1BeUhh3Clq0ps2JIz0mc/nxFi6GVpogQPPmyMd8oOnVPzk/1eLkzFi1rSNmWIAy
	yzAuxVOVCaVgErr3zLjJaBhSdB19sfEk1autXQzdChb+dt7Jj55Laryi7ItfK0aLKNJ3j1XriRCJ/
	hC6PGIWmNeR2qKgbddsxfaUyeM4kku8S8AYr+XZ9E6Hj+sry9fBSJXPVzqgjSHsON997is0fquISv
	X1hffpTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyc-00GfOD-0w;
	Mon, 06 Nov 2023 12:45:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyY-00GfHq-0l;
	Mon, 06 Nov 2023 12:45:07 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8DB146607482;
	Mon,  6 Nov 2023 12:45:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699274705;
	bh=BE++N/R3Z8tlFXv3NYPtpy58c1LwoYYD+sya+RbUiuk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NGAquP44zc9Qr3xIrK0+9U5KXCH26uYtbcttjn2fi5tEWzJu5BB4gmycI2qjfa9nw
	 XjeDdGl73uzc73Ic/TNRXQPjxRUXtaA4g4I3Mi14M6oO3F9pS1daoX6C2A3FN2sL94
	 XGVtthfF5A7g52LXAh0QE9zPowNZxpD/Wqg74UqZtWaWLotPARt9ZUH+RgR3/FCarO
	 qg2dPXNLHLBo+SGh/53LxhmDXrtxNnY4Lnc7QHfNoYX++zR37guf+p/2JN5B3wgIrd
	 bMrlf9SlvLFgm4nR4KZAKCKTMIL5lu3Eki0p/x4vy/I2yVwtdR5qDoGknsCBWET5Ja
	 yphz+jBPUp+mQ==
Message-ID: <c1fbac22-c78d-4f4b-aae2-fa87a81227cb@collabora.com>
Date: Mon, 6 Nov 2023 13:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/12] media: platform: mtk-mdp3: add support second
 sets of MUTEX
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231030100626.12564-1-moudy.ho@mediatek.com>
 <20231030100626.12564-3-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231030100626.12564-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_044506_416191_7CB6A904 
X-CRM114-Status: UNSURE (   7.03  )
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

Il 30/10/23 11:06, Moudy Ho ha scritto:
> After setting up the second set of MMSYS (VPPSYS1), it is necessary
> to have a corresponding second set of MUTEX (MUTEX2) to assist in
> handling SOF/EOF.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


