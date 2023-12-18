Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FD2C46CA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Dec 2023 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6otPWcn4WphyLS7c49TmSQMP1sKwTOQK++4AokGNNo=; b=cz+WKmkkbUBeZIwCOnyDhUo3z7
	i3yIdH5EY+gy24G9a2KCESxtV1xG+U8XcjJwAc8ykihSUEl5GpNvhQzr4tLVaxDJebnFh8z+PKtdK
	0v/O1fitEhbYR/d6DjA2E4ZzVuwxP/Sz4DvcfKs4e6f2rS0vZ8DoYDth4fMzWebdwnN9w/KHHspL1
	DTBRDIWnbH1atS2P2PmsYUyl23c759yZWnvhnhbjYQj8de/ZGNZuJ6hwIyerFYyeUZ5q7bTpX0Osd
	3ppzGOjK0kDDTdY+8jTcDuKCykmV4rGV/H0gOB5Te+GK8r8JX7IgPaEnBtl9pYhbnV2lO4YVW+rlf
	Uq2MjDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBRF-009y9m-06;
	Mon, 18 Dec 2023 11:05:33 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBRB-009y88-1K;
	Mon, 18 Dec 2023 11:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702897526;
	bh=VwWFVs1q6UKep98KZVV2dDt5BoOvo25qOrLbP5Vj6KY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GMOUuh8vMBtOs55pxBrvpJ5TcsJqxOkiw+ktasismeYhm7mZ6QeaR8cWLgKsi7VJm
	 BjIUHl6fanMx+OQJMi3j1+y5Yw4uJIjMgtdHiEkUc974V3BK5Pqm1JsPH/oivt+HPi
	 Z8RIydWD9hWDYrZ0QMlT5g+TOene1fu58onsBhsM/jYZA+YYfw3zlGYdTgdbFotWvu
	 ME0XADT1jOeJwgQB8FGO7bCsYBwRLGEre6oSbMlkmDhvfB/HJy9FlKzKysF14ip2ip
	 WACHHolZe5Q+3XhZi1uvfxpbbsDDWZhX9TV6pLFPI1Egb2c4k4PJrZdYsv8eKXq+BC
	 duFAKoew7jD0A==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 791A23780C35;
	Mon, 18 Dec 2023 11:05:25 +0000 (UTC)
Message-ID: <2e16d209-8b19-4f6b-8406-bbe93ab05124@collabora.com>
Date: Mon, 18 Dec 2023 12:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mailbox: mtk-cmdq: Add CMDQ driver support for
 mt8188
Content-Language: en-US
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
 <20231215070026.2507-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231215070026.2507-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_030529_595004_4711794E 
X-CRM114-Status: UNSURE (   6.86  )
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
> Add CMDQ driver support for mt8188 by adding its compatible and
> driver data in CMDQ driver.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


