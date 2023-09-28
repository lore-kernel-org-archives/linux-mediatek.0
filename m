Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE68CE7B10
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 09:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PK3nSjyQMU/94qCm0nV7I+CIB2fMazL6XLNckjJ7piU=; b=dila8WcWkK6+U8jmg2ZeBUZitx
	MNjqwSB8YEschOjN3Gq0QCkANfnq/Rj8+RTHKmnN4/4OUuNXIrxhsjeHLLdtIPqXDRFPMzQeRlGfr
	VRlKGiWs9Dm2MiUG0VFt28r4qUWbJHlLljQBmY0lJ+j/L5xeoYoMCoaQNLgZ52gLD9mr5orWfQ8LC
	KDqgGAFUvjdMbMeE3LKl4XLskKCxmik5yN6Bq3B6ADuO5vXvBgsibcWmRIrQ1aHd6pz0mDrV7Jbxk
	iiozWEk8o3TtrmSNPId/VnqIyojk4jnByylLtjn5+48nID1yg7xqCBFzvcb8VNwXjx5DkZa7mgCt1
	6kB8KIIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnD4-002iTK-0w;
	Thu, 28 Sep 2023 09:21:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnD0-002iSO-1m;
	Thu, 28 Sep 2023 09:21:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 625E866072A2;
	Thu, 28 Sep 2023 10:21:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695892881;
	bh=Wmquj5k4fklJequpW25oG3UqElIMnj5aU5gGo6GvfPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IdwzOkViI7b01dmD/jSIGztbSZy8my/DLSq8JYYnbUNRkXGxcWIOVNEs4cI3i0f0r
	 7/oHFzMzIbMckadZBqwEZFxEeHtzRvXvusNobcukQ3kKjsujIPq5M30Uk5u3lIK+2Z
	 RR/KurrUr8vTRwOhrKo4fbvooJ28zmgEEDbXCFHFCr8VXpnyJJ+rL9bd9JcwNxnjTQ
	 F1khGrj12qpMR7o333RvE1Qt6zHGV693XjeEef2a9GimV7+GPtPpdgCgmODmhqWdK5
	 ApgZ5V4yh3Ef19LQtoDZnWgICGesO5a7a8WDxgOlOfmg4C1pL1qM6YCwNneD2bjsvY
	 pJ+suxthfAoNg==
Message-ID: <79c0e8b7-11b1-7025-47e0-402c95007824@collabora.com>
Date: Thu, 28 Sep 2023 11:21:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v10 2/9] drm/mediatek: Add crtc path enum for all_drm_priv
 array
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
 <20230927153833.23583-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927153833.23583-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_022122_838587_A0FDBAF8 
X-CRM114-Status: UNSURE (   7.68  )
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

Il 27/09/23 17:38, Jason-JH.Lin ha scritto:
> Add mtk_drm_crtc_path enum for each display path.
> 
> Instead of using array index of all_drm_priv in mtk_drm_kms_init(),
> mtk_drm_crtc_path enum can make code more readable.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



