Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3477FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7pbMqD22Kz58TZug55FaVU1Phqbh3m9vqFmQora16k=; b=quoF2PJ+ZCvgP4
	HGGegvVe7C5HTUvkLml9yCb/h+5B4puLGPwXMbz1vKc/2owCchVjIgpR24/0vNfM77HubCBKYopdn
	DuYaaM04IzJAqWRTA5HfcXIQK3YDaaUkj5i1wqqb8nX9G6DhuSu6Hl5gUMOA4ivttzWiB4ERLZdOl
	36GgztvnwCk9OLOI4KIiys5mYVUcellCJxEZE4afDV91gtqbapMAdpF1Y1ppJhSyyPfnRw4jJbOxd
	wMp/VTJgAIw6K0y3S/G3BMWWEcQPEy5BIc0h56NlEPPJyxYeKLklttaQ8r2w/7F2Se06uQJ/W8fnx
	yr5TB2qlg/nmaeo+wlcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmctL-00GUEL-B6; Thu, 05 May 2022 14:55:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmcsx-00GU0Y-Vq; Thu, 05 May 2022 14:55:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A139B1F4588E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651762518;
 bh=GSjTTKSKlxp6CGEr4r1uWboFqF4OcgikJc5WH+aZ4/g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SJeHf6jcioipzxnqvWHiLnb/Q1GKNNe7Torc+t3v+XGkNPVGer0XJqqww15x5s7++
 JFVRgNpIP+Uc6vgIjALYu2ncBzZ3/LQXXxXNG9/ExD/YJf0JsfQREX7Hr1X+dIbBX/
 hxuX9tcfhgKIRXdimnMVnWVT/TV9CUqZYzyX/OyUYtJHMGIMlPOHd8cgraOuI6zkut
 pkfBIvN+sFxwp0xQni6t3OwL9IsKrdKDDtqizkhc4iwPy+aFTn7X7gnL80sftX4T/o
 7wLjXssOAYv+zaDjFBuhexxy2v6rKxBgxVgu9OkgHvyWsepWCdH3Y18RcMkpajzI4c
 56GWuJLcMAA+w==
Message-ID: <977dc0eb-fb3e-85bb-43a1-929da9aef307@collabora.com>
Date: Thu, 5 May 2022 16:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] rtc: mt6397: check return value after calling
 platform_get_resource()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: eddie.huang@mediatek.com, sean.wang@mediatek.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, lee.jones@linaro.org
References: <20220505125043.1594771-1-yangyingliang@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220505125043.1594771-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_075520_214579_647C5264 
X-CRM114-Status: UNSURE (   6.44  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 05/05/22 14:50, Yang Yingliang ha scritto:
> It will cause null-ptr-deref if platform_get_resource() returns NULL,
> we need check the return value.
> 
> Fixes: fc2979118f3f ("rtc: mediatek: Add MT6397 RTC driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
