Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92078ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 10:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhsTijnwfKI8OQyYakPV/bcx1YdOCINO5Sp1b9Ooe8s=; b=gsHWpYIGHcr9dKLHzHzlGsK0EY
	KkmTUvG1OHQu/ar7JumcNurBqmk4Ns1Fs1+3S78GI2go2Y/1R6ufpt3z3zz+gC3czWCMOJ/0bq9kk
	B8CKopSGlLY3RzOlv9qLb6DwseEGE538/UNdTQ6uPQUKk08LwDBUoNeoH2/TCh752deKMD9skWuzz
	9DKT1uBIfUVcLbx648E3ebd9BDE3A59ju1IRnVExMW9DT3SBd3lSd9Z5xi2/J0a3g1w6xnaOxGxeX
	PBKsW0qWsYepY+E1aZA+CxUfLUO2z8sNY/+amD4y+cNYjRp45DH6x6S+82VwFAP5JbQ/Sw2xYycv0
	e0a67zng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSyp9-00GICl-On; Tue, 30 Aug 2022 10:50:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSyc1-00GDPi-5W; Tue, 30 Aug 2022 10:37:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 307116601D92;
	Tue, 30 Aug 2022 11:36:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661855811;
	bh=rss5yhhAOkOZgTjBZofcKSYZN8+ajXcvMRSruFr6dis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RUAjO6OG7y1chiDV49ps6XX8amWr8x4vu6e0hPO26PpmdZwFEmx3SCcn4hZDfj9+u
	 ktpfka3e/PYETn0wBuskZycxoQ2crlpZJpeahGRqi7tWwMv/mwh0GZL5kyJgBvGxp7
	 eyUaOgRaAwVRePrSHz5RfJyzHTjiSGcFA0DCvNaIT9sUd0hiZSYKJjcrCLsUQ8teUQ
	 fyiz/vEqUwq4Y1ASnBVumYPy1Rm/YDZOehKWxj4e3hmbwiYxIJJNvPKgToU9uDsS6Q
	 ovMYZpcxOwqQfvUDGK/ERFtuMDJr+c3H5RksGbrBpCt90NQRWm1ON7Y4aPxX7EhBhH
	 jVuCTKY53gesA==
Message-ID: <814291c8-e24f-ea5c-8f88-af978f72e335@collabora.com>
Date: Tue, 30 Aug 2022 12:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] pwm: mtk-disp: Fix the parameters calculated by the
 enabled flag of disp_pwm.
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1661745852-27323-1-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1661745852-27323-1-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_033701_409442_95CA5B73 
X-CRM114-Status: UNSURE (   9.65  )
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

Il 29/08/22 06:04, xinlei.lee@mediatek.com ha scritto:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> In the original mtk_disp_pwm_get_state() function, the result of reading
> con0 & BIT(0) is enabled as disp_pwm.
> In order to conform to the register table, we should use the disp_pwm
> base address as the enabled judgment.
> 
> Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
> 
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

This fix is valid for all MediaTek SoCs that are currently supported in
pwm-mtk-disp (and some others that aren't supported yet).

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

