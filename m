Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8778E77188
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwGZbiweMs5EjvNB4ryH1GeG13sCDZR+1XlYad2d8x0=; b=1zHVrJnG9en1D3rDV0Cre90Kvh
	b/AD+UNpplBfl50vOR8yS8caNiTBYt2agsBZbs2rgcOALLYJiHLHXwzOUXC7/DUFQHwmdi/VIm3B+
	RTqBsYwQMKsxghd5P8ojno+LvV0ecYviiM29HDOSvN/eHLqoWZKuOlxxVq1jZwVR66iTN6N9sK/CA
	/FMFWsqeH3RXKrgK5Tv9VlstQ/aJ96zk3HlR+5WJVJp7hAnISZMXUp7oJdM1w41uMRfONV869dOxh
	1j6Fa7WkZtfw0e/cR8WpEz/a6YmxaraFcvRCwYDl7VLnzKgn6boezpENPVV0f19oPMPDPZ6nRT1NZ
	5xjMX/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXe58-0000000855M-3qj9;
	Tue, 14 Jan 2025 10:23:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXe2g-000000084Sj-36jo;
	Tue, 14 Jan 2025 10:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736850058;
	bh=IYlbVe5DU6XQUgd5tARuIdrrDgjuvb0HCtEJqBoglO0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M1KJbA90IXJClB1WqW8CYk3B0ZU1vGxNvXqpLbbsxD9fW8K+o7yNtfC/VbjPkGaoA
	 CyiEESYqixdHhKQEEK7inZM4EpaefCgQINHreQvaG0nX1TGIm+yQN5bYXjMBPa/ND3
	 siTrIIlM7MNksaekrqN60GkfwDuvRxbrTuMRtoA+pytBNN6wq9TaVAHCUlXDIjttvg
	 HTvOSvKkURI9TeoC0WIjLJzmmX+REKokjk6DQCfFnszz3qg0rKFuYv3+xiasLrKihw
	 CjFX5ucDsl+KyuN4PDyPrMMQOgtDPNGrDXEJ2nZIyFgdTgXuMsk3+p4Rmm8pv+Oscp
	 RpinaVRm7UMRw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B3AA17E0239;
	Tue, 14 Jan 2025 11:20:58 +0100 (CET)
Message-ID: <60f4e08d-240e-4a06-b825-fbe04086c43b@collabora.com>
Date: Tue, 14 Jan 2025 11:20:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: mediatek: mtk-socinfo: Add entry for
 MT8390AV/AZA Genio 700
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20250113-mtk-socinfo_genio-510-700-v1-0-cf5112b325b7@collabora.com>
 <20250113-mtk-socinfo_genio-510-700-v1-2-cf5112b325b7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250113-mtk-socinfo_genio-510-700-v1-2-cf5112b325b7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_022102_952097_3A3A3A63 
X-CRM114-Status: UNSURE (   5.09  )
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

Il 13/01/25 17:13, Louis-Alexis Eyraud ha scritto:
> Add an entry for the MT8390 SoC with commercial name Genio 700.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



