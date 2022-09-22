Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290E4C6FA8B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 07:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heT1yYkOFMbSNl9p1tUeIJ+n84IMpfX542IeC5oyJ0Q=; b=X9PkH3BU+gwVNbISC9scbRXQXH
	Y8Mu6miLuF7lrPHMtz0MLy9yNGQSNEcKZt9iRFUrQCKxZYuXx0ZGsxUYRExdJCMnhJAipXNa4hg+m
	8EKYsWzEXytex9Xm3FEgbwiJyY29a0U70ulOK7N2nqQt1kvzFrHBgv/TmnEP2t9pBAMRYOUqr4LmQ
	mP8kitmF+5EGGJAZy3qzDKZMKCgLqvjf0a+prrMnm7X4qrJ02ZavahE52berNHih1x2JUSBMbHMW7
	059P+WraeLt5OoawNhDUV6Sc0vzBWCbUI4OxrPI+is5USldJtCqVZqGirOHD1byofoDkD706FpyGK
	gvetlVFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGaG-00Doyd-L0; Thu, 22 Sep 2022 07:25:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGaC-00Doty-MN
	for linux-mediatek@lists.infradead.org; Thu, 22 Sep 2022 07:25:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 29EB96601A43;
	Thu, 22 Sep 2022 08:25:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663831510;
	bh=KWphtaFojHC1LO0kVmsxuJ57Y28jan/tm0HeYuklWDE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MV/qHivnH6SHgT2+yfCnLT+HI3kYQMDRRfyUQAXm/Bq2woN6g3mIKo4FBd1vsjmVc
	 D4bB9ZzHUp89cCQilxkA7fU8v/lYvQpFH424iOziuOYlFp4qFponusugn8raUhrCyl
	 38FHuM/egLkUiuM0QglIbgIEYIIDhzXiYJ0sIrnXbH6TrjqZqeIcvkW1ygTRH4C1Uj
	 ioOvGqbz9LeOz9iJJHbK2HJvfT01ZRwm14QVQj+nazOsJJeu28qTf1X4Sh9I3Xil//
	 J4BK0V0Oji6YpLXoxtttI/jT+Pv7C/YsG1nWVmiLyFCoQ18E2IWXzJIeo3bF31ie7K
	 1NS85lFoXjdvQ==
Message-ID: <eb797605-0310-1c8b-28ae-eabc17901e65@collabora.com>
Date: Thu, 22 Sep 2022 09:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] power: supply: mt6370: Fix return value check in
 mt6370_chg_probe()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Cc: sre@kernel.org, chiaen_wu@richtek.com
References: <20220921152915.1506767-1-yangyingliang@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220921152915.1506767-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_002516_921027_9923906A 
X-CRM114-Status: UNSURE (   7.35  )
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

Il 21/09/22 17:29, Yang Yingliang ha scritto:
> If create_singlethread_workqueue() fails, it returns a null pointer,
> replace IS_ERR() check with NULL pointer check.
> 
> Fixes: 233cb8a47d65 ("power: supply: mt6370: Add MediaTek MT6370 charger driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Reviewed-by: ChiaEn Wu <chiaen_wu@richtek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



