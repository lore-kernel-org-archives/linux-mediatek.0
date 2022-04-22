Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71C8C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 08:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DduLRNpILY28VqCuhszBhqFLqCvKElQ0A6+xLSvRC8M=; b=hhL6uMAV17xmfF
	i45B/SpRZrH7QGEUVKPnnQJ6+1YS9kC+ZgQCjbstYmlcggVUHASOWV/DiU146prS5uVjT5gO/doB2
	s60Ehgw4BRU24cGUfy4T6s+njJz0Oie2jXOh0xx1NO4XCqXIvKkVWD3GWBCeIf9KaaFyGOm/zFFf5
	dYrmC/YCLykvH0TD8GP+mR+dyEB0NFRZppxDgvySevvVlQ4YEG6mfRqozyl+9ljDEGpx5t3ELVReQ
	1xv5uSEAZcX5jlzdJzg5ZmPuonORrYO+kUKwnxEqk5N/XnULibeim27K+UZp6zAku5yd78llbDUJ+
	hYVnH4LUs6ZQNx4a7oNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhoXW-00HDCg-C4; Fri, 22 Apr 2022 08:21:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhoXF-00HD4f-B4; Fri, 22 Apr 2022 08:21:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E015C1F46406
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650615659;
 bh=Uq22ST8tg/3VSbKXQa4LlPnOLdWxLdYFWpazq5VOgvA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PNHttXg3qvDP50AbR5o7jik6tcpUEYAbW5Z3O1+mjt8DSVD/Efz0AtSoYlbiLJAx0
 M+znfCN8R9bV0qAYw9OlumcO5Jtx5FRwps8idzv2/iTsMAHZU3I9fmkpMD7N2dCioO
 dGwH623LET81oXimpmetdPh6swbJkBE/IBhHkuc6poKHx642rxEDez+KOqyXkxOkQg
 z0l1StcONm2NrihHlRAyaIExhUGl2lGA2yIuv/PqXPo0y7HPkr+bP8NPVZkGDdJ806
 xaU+i+kReLZZ+y0Ka2TyMAajFdDj34T/5336+zPGmFEJWNQ1RHf25+cFt7JuiuOKRV
 KqjbOjHF+ICrg==
Message-ID: <a33f7217-1be9-7d8b-b774-acaf7f3a3594@collabora.com>
Date: Fri, 22 Apr 2022 10:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V4 12/14] arm64: dts: mediatek: Add opp table and clock
 property for MT8183 cpufreq
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-13-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220422075239.16437-13-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_012101_563012_FF53649B 
X-CRM114-Status: UNSURE (   6.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 22/04/22 09:52, Rex-BC Chen ha scritto:
> - Add cpufreq opp table.
> - Add MediaTek cci opp table.
> - Add property of opp table and clock fro cpufreq.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
