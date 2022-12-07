Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4A8C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 13:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeYNV+jkjGA8nOLZGgfa4LVhfQ956aRcCb3cgPnCpyE=; b=iCunhzf38WPj1Taqh6Sa0xfoX2
	1n/zuo1559ajKgCgU19Ne1rquX0KOHYU2bSofRBMxXqMbZ+a/Lcc/I4UAgWNtyZyWJxMsrjf//8BS
	NdMko/GOO8Ona/FLMCQfsaSaB9HDkffNkIjed1fdhV7KAPnLrr6ujDQYhHtZQ+AFqgcb7hrM5oq3L
	jUHOacPPv7tN84vve7jo8irDlGvWnUKSc7BZYKut2r5HpP50gO1bIsxSZQfnzTV5otdUsuGAWeZSw
	qEmAhIK8NylDAeXjPn4ZAlWTroqFvKY482IYaxULFYHf/QQl0RieL3bbg2qH7YKEfuJ5prksRqm+Y
	QqKRr7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uNN-003OA3-ED; Wed, 07 Dec 2022 13:22:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uN8-003NtQ-I1; Wed, 07 Dec 2022 13:22:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 842456602BB7;
	Wed,  7 Dec 2022 13:22:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670419321;
	bh=5IvuM0VxRR2WGFZC4WAyEDPJdPLpL4jxxdvYzPTnkAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NVdEgp8g1QR/7fKNyrRd+8VM11louL3qmrQWF4rrKPMSGk7HKAOuP2MkyZARtLztG
	 f5gaXhnkZu5m1vvoUzl3bHH2Ld0qa1TXPxzmAkyKJtfsYaRoPLZL6/c5wxKazv7hMC
	 YlFuTgp3dUhZns+ssFjO3xgwnQWct076Cvo+1iUSJgpI6GRs9JfjJrLMeaOX2QZV+S
	 qa3at/oDoCqiOLoeuIOB17hDkJnAA1v/43PBHidZzq/hYY48+6CKgs9iKDy/0bUxMU
	 Gd/3RafdctTZrVARA/SJEvGLglKmlCoaSIh6BHv8L3p+6gsBgQDlYRJoSN6zbmqlhU
	 l62MoP3834h7Q==
Message-ID: <8bec1bdb-2e22-d2bd-18bf-505f6dc75024@collabora.com>
Date: Wed, 7 Dec 2022 14:21:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] spi: spi-mtk-nor: Add recovery mechanism for dma read
 timeout
Content-Language: en-US
To: Bayi Cheng <bayi.cheng@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chuanhong Guo <gch981213@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221207055435.30557-1-bayi.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221207055435.30557-1-bayi.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_052202_758785_AC0911AD 
X-CRM114-Status: GOOD (  11.52  )
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

Il 07/12/22 06:54, Bayi Cheng ha scritto:
> From: bayi cheng <bayi.cheng@mediatek.com>
> 
> The state machine of MTK spi nor controller may be disturbed by some
> glitch signals from the relevant BUS during dma read, Although the
> possibility of causing the dma read to fail is next to nothing,
> However, if error-handling is not implemented, which makes the feature
> somewhat risky.
> 
> Add an error-handling mechanism here, reset the state machine and
> re-read the data when an error occurs.
> 
> Signed-off-by: bayi cheng <bayi.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




