Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8447EC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jA2LFava6sRFRnqPf8yCF2XK7PKRsUF86VL0JW6g9pQ=; b=cwGO3wxhSGRQiZfALeDoLaGwcj
	35Xj5cjmAnVD39rd3GBpW26JUfa7r5ZIu0+y6sole1NeUQlm2bkm0pw/Z53qNIKfQAMZ5sh49Q2H5
	gGXqm/oE1SLqIrIxdvqxsMh1sPDTzub+Qq37olkRy/RTsfiGCKyrYCW1VHdCpaTS+xR7dvbmGmfJT
	uwX5DRfZSC+2SuLuejU3gn1BjPOFYsvTMRgr9ksY5psJCGEfFPv/J+453qvpKAmSbf9Z7Q+3vhfXR
	m8hrYXQF5rQHD21jEQP/YpoB7FPYhMd7kXW1NAEEuooeVF4yR+5eFCxNB/90NPUOfI/7astLWvRny
	giTkQ09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIn9X-0098VE-M8; Fri, 20 Jan 2023 08:53:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIn9J-0098Pz-LW; Fri, 20 Jan 2023 08:53:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 53BE6660087F;
	Fri, 20 Jan 2023 08:53:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674204804;
	bh=SSwbJApT+7gQSGJQ/b+H3IPkK4hbO5OL73lIyx5BgMc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kcehd1Jq0FFH+HQ+lMBOMtNqdZL8spAJ9jdGNO+emTS4Z8FfWmjNxzsZ6z91dBcRS
	 sk3QV21MV/sGyRubA2G1w7oKJC2Wiv3Ztqb+bmMgMgWnR7x5+1xolzymlS+lPXV3Yi
	 EQUliJay9oJaIGofsVKJ+pWgYMgCZd3H9U3y/49ZpACz27d8LMhAjMGusTCQulCyuh
	 c0nwhN2QoVqEshjdLoLyjdovy1IQsGbm6n4p3Wm4kCPq3RTeaNYw+tSV9BypiEZqFo
	 lGlCzin0xwqbTBqu1r4SgWoyzV/GT4sjdJf9ggFebVJpoHNdy4ZsSjmtMB/Fs4nvuH
	 Wj+8EvBtTSqLQ==
Message-ID: <23691243-303b-5f0a-df59-f272137e083b@collabora.com>
Date: Fri, 20 Jan 2023 09:53:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 2/2] thermal: mediatek: add support for MT7986 and
 MT7981
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Steven Liu <steven.liu@mediatek.com>, Henry Yen <Henry.Yen@mediatek.com>,
 Chad Monroe <chad@monroe.io>, John Crispin <john@phrozen.org>
References: <cover.1674055882.git.daniel@makrotopia.org>
 <2d341fc45266217249586eb4bd3be3ac4ca83a12.1674055882.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2d341fc45266217249586eb4bd3be3ac4ca83a12.1674055882.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_005325_891756_5DD35570 
X-CRM114-Status: UNSURE (   8.65  )
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

Il 18/01/23 16:40, Daniel Golle ha scritto:
> Add support for V3 generation thermal found in MT7986 and MT7981 SoCs.
> Brings code to assign values from efuse as well as new function to
> convert raw temperature to millidegree celsius, as found in MediaTek's
> SDK sources (but cleaned up and de-duplicated)
> 
> [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/baf36c7eef477aae1f8f2653b6c29e2caf48475b
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



