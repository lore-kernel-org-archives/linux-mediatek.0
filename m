Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406E4C54E5D
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 11:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2y7iQqN0zIOfSFBr//LrpCVht/Iolo+P4MvFe1FIoQ=; b=imE600T7EAlAExWiR71z0CJhwk
	s/Tmg30TNBHTuT2c+AXyiFgTo3BqiFfHRajHE2bt0ibc/i+JlvjK4Zy12BkPc2ahc+QJMgx4GBDbW
	anuo3nJ8xkhsTiNMPcX82BkS5mvXsSHk6OPVaL+sfpL3zrvceblZ2RXvebR0sL1YgiucPSV2M5RuX
	+AFMrCTdzFxm4ZfSSAuHCEyr3z6IxQPbokNVho+mJaBgU6CMpE9FbDcQ2bBtQAyvLSxNzDYF+j3X4
	g5qnVwVdUOGS8obSWyCLqicf5LSsC+o1TcSK8Vbe25JuKVnyHw1j2ohWpKMGoxRb4pgW+sPPvg3c4
	wjIVEBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmXLh-0000000CQHE-13RS;
	Tue, 19 Mar 2024 11:09:41 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmXLd-0000000CQF4-1q2f;
	Tue, 19 Mar 2024 11:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710846571;
	bh=DourA/0qtqJccY0YwtslIRYxVpkSt+PiPLohgHqz3jI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xhypjOnk+pB7osBDF4GazIcsWVe6YP3lytU59L1UBjtopOTFqfMQcj37T+VuFvtOF
	 op0XYNLKWaJDaB8sSbTFI6h1Qf7BAkaVsqK8XpGyztkpb9k+FKBcZCQNANJtSkl/Jq
	 V54plTgPKG5RrRoh1vx6sA/mzkD7L4873YF3nzXwofFRgeNcZLwiwR8x/Agw224DC6
	 I0swBt9Z3q957naTiwIzOewJp4LQUKmNTIz8AMMPyQC0hTa6rSLZrw5okh7YJz8/rf
	 o+NEGMy28qg6ugKb0YnzzYlXmNUt4fxrP3fwZVUuyEGxxfvY/fgi2Igy1buRjla+pY
	 tOqo08tka2e/w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 38DAA378149B;
	Tue, 19 Mar 2024 11:09:30 +0000 (UTC)
Message-ID: <06bdefc8-d953-4475-b46b-4a728af58f48@collabora.com>
Date: Tue, 19 Mar 2024 12:09:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] drm/mediatek: Rename files "mtk_drm_plane.c" to
 "mtk_plane.c"
Content-Language: en-US
To: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
 <20240319070257.6443-12-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240319070257.6443-12-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_040937_643936_F9D4CA57 
X-CRM114-Status: UNSURE (   6.39  )
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

Il 19/03/24 08:02, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> 
> Rename files mtk_drm_plane.c to mtk_plane.c and
> modify the Makefile accordingly.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



