Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18AFC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SOkudb7jCRkkwPdJIKK3fGDlZMHoteIc99Zf3nnIOU=; b=VLW3AO0lTyH3FKa8FX8NQTdy8g
	eK18/GZfuqLsJmiR78LkCO/j72RjXORupQ83VL94Oz/8KtoY4tBOPDHSGnYkFpOnvdellGh+1486e
	3rVe5GrBVy99qMEVwY5h3OeNSSQjj4nDSFrXjyJpe0nLmt7SD933ltzI+SRV2ZY82JjuPftb6zSOs
	dEj6ySM86tNFoLGSC3mUG84p2wEA9gxXnDfrr1JFcOcHbLEdWe8zU0J7TOjKaFVRmHCctHOB4Z2Ws
	4Z/5iQ24dmD3JYdRSDWtkey2xoW/rhczwrlsUPJJEk6UkfCgKWc77dr7Zp5nxL1gMvW5CyK7mh34i
	0rQBfwmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyQ-00GfAW-2U;
	Mon, 06 Nov 2023 12:44:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyJ-00Gf2y-2X;
	Mon, 06 Nov 2023 12:44:53 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 19A806607484;
	Mon,  6 Nov 2023 12:44:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699274690;
	bh=/ve1qszLWFMMS1pdGd5yB6VKVfq2jTqgc3rC4GdiN5I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AVpem+LkSTtLEh3xRiohuQhQpKc6QVFFaQdLG63mQcjt/NWSn7UkokL6dGLVK/yMt
	 IBTtaG22azx06ln4dxSK7BGBW8qulYjSGtvHKWG5+4xcIhmRoJnUDWok4GPO/TJumU
	 qZQR/Tp9fuPorEBByzDls5kFBqdQo4muKglsyIX21j+bJQMsFmuQ9vxVpftckVaORN
	 IMnos+b+R5FxOskMFgUOCHFaHsTKZghSfvqhsSgz2yFowUCoxCBqGatAx+4oF9Z/3/
	 C0ku4OFvaeAUgYaFoIc7VoRLr2M56yi0s7sfrLSoB4ReIjj2iI28oEf3gHFjhgZOwM
	 EB5m281syiIAQ==
Message-ID: <99cf5d49-8216-4a87-8f52-78588e97a0de@collabora.com>
Date: Mon, 6 Nov 2023 13:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/12] media: platform: mtk-mdp3: extend GCE event
 waiting in RDMA and WROT
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231030100626.12564-1-moudy.ho@mediatek.com>
 <20231030100626.12564-8-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231030100626.12564-8-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_044451_963146_511F5FF2 
X-CRM114-Status: UNSURE (   5.46  )
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
> Support for multiple RDMA/WROT waits for GCE events.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


