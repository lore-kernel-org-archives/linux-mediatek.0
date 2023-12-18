Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC304C35274
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Dec 2023 11:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+Ju0MhbsAu+khCQTt64WhOiN9pA4uMhS8AV8QBDnnM=; b=Ep0Tn4CvMb6WnddZz3QFs6Gtav
	/gPUv/m0IWWPkhqvBXZF7DOAfEjCzowgf37/U3XOjKbfivO6OpKzDo/PWou3oyocB2wDh//v3Wtkk
	bQ0271YooHyHbmX0NghZgi+2twAE2dXltAoLWRRcyU+uEwd4CTDbfNhcmh3Lhc9W6qWmsf23L0Zi/
	XKGMeXlbt4Sqv7n88TLvuGeTk3+mgJkCOBgew1cosvamMiqgDNh69xf/RRARaYlbFmxoqTFQisMyN
	njg5PJ4njDstXDIwBBv1/B+3C7Qu8a76dOOWmv3WoZMiDvJgOyy9/5zHgBFc7M7U4wKAgEM3DJrDq
	BiQ1DxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBRQ-009yDK-19;
	Mon, 18 Dec 2023 11:05:44 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBRC-009y8E-2y;
	Mon, 18 Dec 2023 11:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702897528;
	bh=xnwCF2ST5oBXkKdgDZLeNPOzu1UJmbO078KVru0GHvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kBmOc8UrX2F9SGb5DkjPOHFiqVbCCtF+icoH7RsYrUgg5D2biS+nZLs5KM3FwVumb
	 uB4fq0zm1Ne5xsHmddD9AiJKGH2eR3dkvqlx+wRtt3b4KrwR4C51gOPXN4g5bO0b7O
	 jOqHO1GFqXLA/PJ9vNOQMZuF0HpZ3KUdoXFrJNZRFaThxaM22PIUjJb6qYhV8ib8ql
	 xEHNT1BRR2zYwXuBGsY9/QLA29Is+BNhmZOoahsfFC/srpijX7gwCdoQk4GTIOcjVu
	 UZqatJOoinvMq4R3xY2GDwj84jyeHeRQgUxghE+RaqcWNScilIx/9XAcKhg9Pq7Wbz
	 Oeuhk27LsxuOA==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9861D37814A3;
	Mon, 18 Dec 2023 11:05:27 +0000 (UTC)
Message-ID: <10fd4fef-e71a-44bc-b80a-a4801e730039@collabora.com>
Date: Mon, 18 Dec 2023 12:05:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mailbox: mtk-cmdq: Rename gce_plat variable with
 SoC name postfix
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>
References: <20231215070026.2507-1-jason-jh.lin@mediatek.com>
 <20231215070026.2507-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231215070026.2507-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_030531_088166_9C602195 
X-CRM114-Status: UNSURE (   4.69  )
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

Il 15/12/23 08:00, Jason-JH.Lin ha scritto:
> Rename gce_plat variable postfix from 'v1~v7' to SoC names.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



