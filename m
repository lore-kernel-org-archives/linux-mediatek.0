Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249FFC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 07:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqmPyrjBC+xEKeIEZeTEIZUELBBTugyj7I1aPFqkNms=; b=m7lYBu93aHGZLQwA505R3aK9cU
	8ed17Jbulu1JPJiyYTyiIx1+LKAPysFnIT2xwMNXK8H3ZVugWdZTuNoJpeacT0RTExG5rZkmzD+nJ
	WYKKXRVujW75JDRgr5XXPbM8SQ8Bf4xEKOKlNBKGjJDmFzBzojbfNyNyUA/j18yduePJY+npH68t7
	0Jr1hrbguzgrGeFhAuCWKW4iU9hihyDWHqZWfV65uez88gB7imv533EtJychIetKudnDMVHh3bJ6t
	soVL81kxBjkpAsMCy5FQD7hmK20Yta5rXPO3aAW/nRzVpXcGiguLWFfrvJdYzMyjSSxUFCXHUPtHC
	Ndamz5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3t9V-00000006WMd-3Ok3;
	Mon, 06 May 2024 07:52:49 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3t9O-00000006WJB-0X8R;
	Mon, 06 May 2024 07:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714981955;
	bh=LGT1GNDXYrrJBQ1nZQhic5aSHxR+NTF02wCTRXYawjU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pOMpUPYIx6ugk94aVsKsSUUjQjgWcLQaZyiiTc48yfdNdzKx3/JzwVdfi+oRxyTx0
	 +NGyRTLhOjhYEfkkGE238s3cjK4wbZOPxKnBRtGfe0qLjf4RIGi6219qCe+lb7JnXJ
	 yVrdanYcKnnDR02Fh4IiSBeXdiYViceGfjI6P1xAZYtyyMSuCU2QKLKrrkzNS/fhfS
	 1YN/RbnokpHFYMM1JdFxnbJvQY7dH7j85JDT22/mrjzsQIWFNh14dlJulU0T2vo9o5
	 DhQzlPbFtPhk0yGSnMlSNBh6eKkJ4J3uQKyHyjtaAxQ2JxIlu0gTfyKBxukTwUF9/o
	 Y0p2ygABicXxg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6950937820D0;
	Mon,  6 May 2024 07:52:34 +0000 (UTC)
Message-ID: <c41fd846-1738-4f19-b1ae-bd2113503e2f@collabora.com>
Date: Mon, 6 May 2024 09:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal/drivers/mediatek/lvts_thermal: Fix wrong
 lvts_ctrl index
To: Julien Panis <jpanis@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-0-f605c50ca117@baylibre.com>
 <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-2-f605c50ca117@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-2-f605c50ca117@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_005242_517642_512A53D9 
X-CRM114-Status: GOOD (  12.29  )
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

Il 03/05/24 17:35, Julien Panis ha scritto:
> In 'lvts_should_update_thresh()' and 'lvts_ctrl_start()' functions,
> the parameter passed to 'lvts_for_each_valid_sensor()' macro is always
> 'lvts_ctrl->lvts_data->lvts_ctrl'. In other words, the array index 0
> is systematically passed as 'struct lvts_ctrl_data' type item, even
> when another item should be consumed instead.
> 
> Hence, the 'valid_sensor_mask' value which is selected can be wrong
> because unrelated to the 'struct lvts_ctrl_data' type item that should
> be used. Hence, some thermal zone can be registered for a sensor 'i'
> that does not actually exist. Because of the invalid address used
> as 'lvts_sensor[i].msr', this situation ends up with a crash in
> 'lvts_get_temp()' function, where this 'msr' pointer is passed to
> 'readl_poll_timeout()' function. The following message is output:
> "Unable to handle kernel NULL pointer dereference at virtual
> address <msr>", with <msr> = 0.
> 
> This patch fixes the issue.
> 
> Fixes: 11e6f4c31447 ("thermal/drivers/mediatek/lvts_thermal: Allow early empty sensor slots")
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



