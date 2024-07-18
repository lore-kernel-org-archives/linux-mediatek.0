Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A78C3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 14:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i41WPaRkMyjDeIAUKPHDl3Z+2q0To8ffZs+2eCH/RWI=; b=LHc+x6Uqw5Df9I9WtyPkORo5KH
	eyKvdzkzMis7lj1V9XEFv9crlQg21LOGzt2WAbhnpwQ79zR/OQkMRzcBO2+YynFHBUAxMfrce5rCC
	S/0ZqEllALONFTsMfEYv1umJPBDxMcZRfIBTGC54lvUMD+2CswM6L6K+E6EMBlKC1Go5F2pHp9WPO
	xSxDbNN8Fqf0Y5AgtXo3Q2QGp6BLs8UMS0QT7y8oyRpS38qPsIrNY0rVah7NYjwTvHFFJxAsYfbVS
	f2mLXO8MorumkLFAJlq/w8Ge0jXXy73/eqo5kvBh9sagVeOnguvkHDV+hhCPdWLWaqDXcmxqoVKF5
	oCDNM1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUSDE-0000000HHXy-0HUw;
	Thu, 18 Jul 2024 14:34:28 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUSCs-0000000HHUB-0dNw;
	Thu, 18 Jul 2024 14:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721313242;
	bh=vDAdUJt2pvl9HTp13zlAdciAJjVNdu1TFHQWklpSICU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=seapxVWpHgf9i/8qYm3YgX74ylpgZ/cM7FFB4a2ytIeKwKyGii4xuOnaOM7VbWyZY
	 Aglmm6tPkdarQmPCyNU4B9z/mzTTr9mFqOHr7oCQl85YXIYXKENtqoXwEj3NIodm2Q
	 oeJN8KgSb657epqj1OHf2YBIss0JJmuv6SITp0LExfiyoEc7bbDLAYroy5qgdlOMup
	 B3StqVgmOBhT43OTHPsKvqiQ4bCiHUAcms3cmclloGwTEVDBAoN6pVfYfri6+orsph
	 h4DGWBqx/yeBTGTgpH/RvA5P2wn6XyPmVW2G9CLySTXogaoukHoa12njnyreSQ0k2A
	 7FCMucKw0zGZQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5A75E3780029;
	Thu, 18 Jul 2024 14:34:01 +0000 (UTC)
Message-ID: <4e5c2634-b3a4-4dae-ab1e-fa11d4329417@collabora.com>
Date: Thu, 18 Jul 2024 16:34:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mailbox: mtk-cmdq: Move
 devm_mbox_controller_register() after devm_pm_runtime_enable()
To: jason-jh.lin@mediatek.com, Jassi Brar <jassisinghbrar@gmail.com>,
 CK Hu <ck.hu@mediatek.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240718-mtk-cmdq-fixup-v3-1-e3cbb75bb950@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240718-mtk-cmdq-fixup-v3-1-e3cbb75bb950@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_073406_514116_DA9E7089 
X-CRM114-Status: GOOD (  11.53  )
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

Il 18/07/24 16:17, Jason-JH.Lin via B4 Relay ha scritto:
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> 
> When mtk-cmdq unbinds, a WARN_ON message with condition
> pm_runtime_get_sync() < 0 occurs.
> 
> According to the call tracei below:
>    cmdq_mbox_shutdown
>    mbox_free_channel
>    mbox_controller_unregister
>    __devm_mbox_controller_unregister
>    ...
> 
> The root cause can be deduced to be calling pm_runtime_get_sync() after
> calling pm_runtime_disable() as observed below:
> 1. CMDQ driver uses devm_mbox_controller_register() in cmdq_probe()
>     to bind the cmdq device to the mbox_controller, so
>     devm_mbox_controller_unregister() will automatically unregister
>     the device bound to the mailbox controller when the device-managed
>     resource is removed. That means devm_mbox_controller_unregister()
>     and cmdq_mbox_shoutdown() will be called after cmdq_remove().
> 2. CMDQ driver also uses devm_pm_runtime_enable() in cmdq_probe() after
>     devm_mbox_controller_register(), so that devm_pm_runtime_disable()
>     will be called after cmdq_remove(), but before
>     devm_mbox_controller_unregister().
> 
> To fix this problem, cmdq_probe() needs to move
> devm_mbox_controller_register() after devm_pm_runtime_enable() to make
> devm_pm_runtime_disable() be called after
> devm_mbox_controller_unregister().
> 
> Fixes: 623a6143a845 ("mailbox: mediatek: Add Mediatek CMDQ driver")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



