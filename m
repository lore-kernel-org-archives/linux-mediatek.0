Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A749AC46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/fe9AFYvtMD25LTHX6cl54dKCaHrpbMSZ2WtynCXxI=; b=NHiZKQbNkEuiCp2lMC2ZPPhFXQ
	kwQYhc8OL+sIO8XG7s8+7ht9F+4hzyF6ERTTa8Q9f6uT8/tYZL7euW19FmakyQZzUkrVEctlNw9ne
	cZAmiijiYc10QBFHTYiddYUEHqNaaqOn07eOFnf2f7z/k1m/139FV+KT+gmOxVHLLWe9G1OU9oTta
	k0sQLnhf/f69zlP6WM8MSkAZyOWZcQN1CdTkblfyyA1QH1idD7Lc3lVBNTVKkdmPQLy51tPRICA1N
	mZlpuVyek6cjXktx9ZELiVSKZX/ajUzqIe+WpUSVkZ5xN+PpiTqC+vgmwLImYaw2c9GyO1YHGrYUn
	z5olg/hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHMuv-009hnB-63; Mon, 16 Jan 2023 10:40:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHMsw-009gm3-Du; Mon, 16 Jan 2023 10:38:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 25E086602B36;
	Mon, 16 Jan 2023 10:38:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673865516;
	bh=YLZ99BawidJKDCpxGXKiZMfzq5kAp++9PhTeUBKM434=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I6ikQxPO255fQucSWa1a44+rfxZYt8xLd3YpHECYI/3SbyboODwfy8SVHM7uMR+zk
	 RQPzGgcHWULgZy/AtjwuIFolkGjktjc3bmuHVO30K/30JtBl0YURpolHqk3tfVbDH4
	 9tHmLHiqBHlZK+7immEqEOCpajqqFSUjOyfPT+9zhifOwVIVb+CqqMwogfujLxPDk9
	 VfWzqmOYv4vaU0dAq5qiIFNA2a48Zy0CzEjIM0XoUYYXaina1FTRKYQXsnE2tr7Lui
	 gM7POFcOPF+iQaXzfJ1N0plz9Q6Mup843EntdWtdfWCoSyf6Ryk4IRBuAi7oHI5L85
	 t5WiuHdk+Q0lA==
Message-ID: <69a3b3bc-615b-851a-c275-048539e2b866@collabora.com>
Date: Mon, 16 Jan 2023 11:38:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 3/6] arm64/dts/mt8195: Add efuse node to mt8195
Content-Language: en-US
To: bchihi@baylibre.com, daniel.lezcano@linaro.org, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230112152855.216072-1-bchihi@baylibre.com>
 <20230112152855.216072-4-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230112152855.216072-4-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_023838_653535_1497E081 
X-CRM114-Status: UNSURE (   7.43  )
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

Il 12/01/23 16:28, bchihi@baylibre.com ha scritto:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add efuse node.
> This will be required by the thermal driver to get the calibration data.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


