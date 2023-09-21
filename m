Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2701ECD342E
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 07:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKJ7jC7Nh33IGWtTpnItU+hd1RbmSvJ71tEeuv5o9L4=; b=UDHAXfgrOk1EJz
	mR2o/W2yJv6AW0npL5uLW0qs3/oBiNxF0MMdTA/qeYSi4/9uQdckkvLRJJeQKFDWiCzjKNtIU/4qK
	2xou5tnpuBNg/Y1qteEC6xSBjNsc09spuhX5K2j44rFW2zJJnTfus72l/HTwNOhYPshtyqWqOhByT
	3Xk4G2t8xHwG3VPEzqjz5+N9mBhtVZ2aTIm7/SP9eEaUtqGB0d5tig5otvAS3ikkqWUQbelhce84k
	w3ksiZEfwkw8+nFCWDlDq83LVFhYFGGVqrUeKpRaZS37DjwY5r+vxtlvJAMuIyPG6+qufuvB8jDJO
	KnnQg2j17Cs38zycY8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEWT-005PXT-0W;
	Thu, 21 Sep 2023 07:54:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEWP-005PW2-1x;
	Thu, 21 Sep 2023 07:54:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BDBA366072B6;
	Thu, 21 Sep 2023 08:54:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695282888;
	bh=XKfV63HWdKQ6s7HPBY3YhVeOhdzebvODVX7qw3XgXyM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jD9+CmGQSfz4ZX3d2CGSp6+EHhCrCCk4YGT3vBykBF3wqdTzGOXIZCz7QCGMCAUKF
	 yY9nfpT49e8hOI1gUgZME++aIhmRLRNoXiPOyREKIUygnK3mfFMj4/yqGQ79JBK/mr
	 2c6w7osgDp6Z1woUp6qf6pWKsJk8nqB7RtNZhooW/urn9l2MQMxso2S32xIGx4PVwi
	 CINeOwpiW8/6UskufZ3bdJ3kAYbq/ODd2ko3UGc+loP4zAp6OTqiN46HwjTw09C1+8
	 1dolr6haDdAjRiWHIrog91ziBrjkseUViVBdgUSUVaJ/e/VlGg/3b+yyLlvNE0fam4
	 4tT3XHFAZeA9g==
Message-ID: <7420791d-a424-2db9-eb68-9f583735d4d7@collabora.com>
Date: Thu, 21 Sep 2023 09:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 3/4] thermal/drivers/mediatek/lvts_thermal: make coeff
 configurable
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230920175001.47563-1-linux@fw-web.de>
 <20230920175001.47563-4-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230920175001.47563-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_005449_775519_C58B0FBE 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/09/23 19:50, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> The upcoming mt7988 has different temperature coefficients so we
> cannot use constants in the functions lvts_golden_temp_init,
> lvts_golden_temp_init and lvts_raw_to_temp anymore.
> 
> Add a field in the lvts_ctrl pointing to the lvts_data which now
> contains the soc-specific temperature coefficents.
> 
> To make the code better readable, rename static int coeff_b to
> golden_temp_offset, COEFF_A to temp_factor and COEFF_B to temp_offset.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 

Now, that's good!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



