Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54CFC61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74L1dM9BGOXjTsSffJIFZaN84Re04l1FvurVDDuC9Lw=; b=lANk6OL2dMbTJ/E9pk7fkyMymu
	FrsQbEUb+yK6v5qfSOhWPD47zaXJLqbua5VengORuNSMikHRcmm4SazSYxECjQWn6yg6SOG1Bedmp
	3N4nuVjz7MgSd7s+D5V9oTMGw7rge2Sa5/T9NTui4hLnpZR3RT+7VRteApvZ18D1AyLDZV2n7MlwZ
	K0ZYh153CmMySCmWyGXQV7Exku5yxrcKl56SP9+X72YxWMTg0sPLVsuSnPvW7gblWQ0yKPnHfqUfu
	tDp7QRM7liN0n8yc0+II7IX21A3NdAzCOwBwGV0VNadmLgrLQW/VC6ksY2xLNdkG9b0rH7tR6Hwh9
	1WAsSbRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcQRs-00DMlO-0K;
	Wed, 15 Mar 2023 12:41:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcQRn-00DMkH-2W;
	Wed, 15 Mar 2023 12:41:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2BA0B660305E;
	Wed, 15 Mar 2023 12:41:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678884097;
	bh=YpgkzR55vUNXg772WCzP3dnHtOqNzPmc0fvNtu9cEog=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bM45v69+qla9S5peI+S+50UIU9fEX4IW3DizilRJhF45gFyhGWZ+y9hvXy3lgGiX6
	 zfpod8KJuSbN335rzGc0iYni+0SDT4EsMIVLPk0cv6WFAcyIBVkYy0DaJZzbqCr6S1
	 FUUt6L0dXmtLjq9ePxy3P3vzUgE9KYLncgoXPeN2FvgEQIJNP/YP0SlhVcqkrzMQea
	 bEBl4neR3Qymteu9SHD9UT9ZYI5PnHztY0gYIxy4wUpcYKG/6zb3PCr28VvAocV/NP
	 7hH30YrItGdYEhhDl9rqOMjYrRiJbajS9jUu5haPRHcFgwjScVCg1cRUz8aOjbDQQC
	 qD2A+IXk3mZJw==
Message-ID: <8476933f-9723-7a06-0605-8c4fe45f3183@collabora.com>
Date: Wed, 15 Mar 2023 13:41:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] soc: mediatek: pm-domains: Add buck isolation setting for
 MT8188
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230315114505.25144-1-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230315114505.25144-1-johnson.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_054139_962390_E5EE099C 
X-CRM114-Status: UNSURE (   7.20  )
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

Il 15/03/23 12:45, Johnson Wang ha scritto:
> For ADSP_AO, CAM_VCORE and IMG_VCORE power domains in MT8188,
> we have to add the buck isolation setting to make them work properly.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


