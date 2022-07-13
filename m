Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4CDC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PA4PrBF8XgFz48GW5Zzh7wZun+QICm8P3zrMECIo8I=; b=hoWnk+zxEYOK3bN87J+OC2GHJG
	7fd4XQdBke4GkhM37mGExq3BXqw6Ky4S1h17hBDfCA+9wfdMJlipa4uqkvVoqgeRF6qXDcQUzkfgd
	QkdCu1VTrpPbjcu8rRciGqxUIw2FGN5W/tR3ySl+lreX9hwouhm/+3tESmdv4oqs+E4GRRSuzRn2p
	5Ez3Ujgq/0bzwAzOQqbUbEeRGmb3u83sq1JClJbPIwEbJI8KKu7x8qLahMyiiJy3ztd4fP453s6cA
	FbSZjiB/L3RggClfM/CFsgatV+DpRlrvYk3+u8TIGEVocfdaqpjb6OWXwXx1T8Hxlup7DAtcbQymO
	W3ASHtdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXbt-001avk-7V; Wed, 13 Jul 2022 08:20:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXbb-001ap0-Lk; Wed, 13 Jul 2022 08:20:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5B3C46601A33;
	Wed, 13 Jul 2022 09:20:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657700422;
	bh=BRLu8cOK8l/4Ws4rWHe6gFK1hufYAm7DWjojesB8ytU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dhsuyUZcR58ywsv0TAFff7fIptPwtYPMaqeCaUdH18QoPb/VcB1D8Qs7x0ckX/hno
	 23co0fc3ELNH9WITEXvLX7lVtsMzUrASk5b4as2gxEOaE0fcCQH7t7h+wCF1CXSRNP
	 um0CGo5B/PIvJiavmsu1qQM+/2hWduWdSLQqdp3LoMgBwPUCKNivU+73mVnz0/uzod
	 7iWcnOSzljSnKQiK199/ejFLO45VHwjEsc/RRfAjwP5pOo1LEiK+Ch/4cxpcvF0soQ
	 MckdbMGBCMBMlZ3lesELnWkcCm27E+Vc/0tBuovkTY2qWqgJeheHbk5bKicgCKxzxr
	 zTvPvzKCNSjEQ==
Message-ID: <be0b3f03-b95b-9718-3933-8c79bbfcb3af@collabora.com>
Date: Wed, 13 Jul 2022 10:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] soc: mediatek: mutex: add mt8186 mutex mod
 settings for mdp3
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Xiandong Wang <xiandong.wang@mediatek.com>
References: <20220711123247.15807-1-allen-kh.cheng@mediatek.com>
 <20220711123247.15807-3-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220711123247.15807-3-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_012023_895214_82694383 
X-CRM114-Status: UNSURE (   7.97  )
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

Il 11/07/22 14:32, Allen-KH Cheng ha scritto:
> This patch adds mt8186 mutex mod settings for mdp3.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


