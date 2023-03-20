Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67B8C7618D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1sKPPToy7IMhJ+PagP+0Rmv4+wDFnHn35xaTINuQKU=; b=VEIwZQsbxPdFMj818QmAQr0T3y
	3NAffDGazdjtkzeEMU2BRDwrXck6Ar1cITO4WB4HlZytVcIIrWt4pqU/+G4WDWMnCuZ0wdgHvQMmr
	Gvmci5n9Kp1CIOxs4NwD6YDt6bkatJzG4nWFk826yiuHcxhJykQUE/lWpJ3fo/Nxph2T2dsEVb+of
	1BDG39NJh/N94z75kF4SicxsjOdQo68Qifp+aAC5dHAbY/gA6ibN0LdvkmMIK3y60WgmZwUeBJ+pO
	o8HJe4E+EcCpwhpTfhafyqwabhx/60u9JCma04nkDbcumAFNIAnu/kehB0OKmbKJOdkSD+uS+NGzb
	mhrrDaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peBgL-008SSd-11;
	Mon, 20 Mar 2023 09:19:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peBgI-008SRL-22;
	Mon, 20 Mar 2023 09:19:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 758246603094;
	Mon, 20 Mar 2023 09:19:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679303990;
	bh=utAuSiXq9t9asWlSaVXjc3XBcR0qMIczkPYrz6Mqa4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LVwHGguKGFeWIsDZqnn4aC6Ghva6sfTpwAQEo7JbwFP+Cp4DSciwsakPGIPfsDbo1
	 k4sBsEKGto6v21Vv4nq8zlbZTpBat/TmZnZU1D5LAhZvaW/qgPupOkAPq2/I27L6iF
	 7dDM++r29XEu7AAtpfaluXPot1bdPutATLQ4cDUpNGTo0bmiXKrspBRBreFPFcW055
	 Mj6PtRA8VUuTxlQQbI47N8uvWDp+PJRWdGbhnkarP0B7A7zh/gLxszIlDOLUIs+Z1i
	 EWEgmEWztrst3Mt7ImuWktfNRk1qQWTR6i42o9zhSmxHtsiwXNB9MpatbOOMz3T8Yl
	 N58/sbrz4w4Ng==
Message-ID: <582a4a00-5189-7aa7-f19c-04f006baaf75@collabora.com>
Date: Mon, 20 Mar 2023 10:19:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] thermal: mediatek: Use of_address_to_resource()
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230319163231.226738-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230319163231.226738-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_021954_799145_34E41D5C 
X-CRM114-Status: UNSURE (   6.63  )
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

Il 19/03/23 17:32, Rob Herring ha scritto:
> Replace of_get_address() and of_translate_address() calls with single
> call to of_address_to_resource().
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



