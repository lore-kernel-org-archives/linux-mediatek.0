Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB03C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 10:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVJW4ARHzhOSVYsbC2Xbvxk+Qjfnb3f8OhDA6vkAbJg=; b=kmMW8BIFlcKDPx
	X3IlVFKRxbLzGWeICnDCrYWhnNNihsG+g0Sql8tCeM8eQF8w2fk0jrc0Aj8C4Q1Odn/iFzGnPnA74
	Wy0Ki+82fWA79bsfzH3leHNTHi16yC6igSY/j1pz71Gf2HUvkxTWOnXKiVFDyf7wfHbQ7LjfOcgb+
	vzHywFEyKqmFFfnkPKYOGWUUrU4Yy4dEpSoVAD68tASikWwosR7n9ntieMNd82SZrVPqU8zdM7gm+
	jsKrP9NAAPTY8McpSG+LdXF9utBrHV41zRecTVEXLStCjISIyy9ePoUTWuUTb6Ey6aBIYT30H8E+7
	8uEaW7cxsZ+eKQu7Z5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYxU-000g5c-U2; Thu, 03 Feb 2022 10:03:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYlT-000aGJ-Jh; Thu, 03 Feb 2022 09:51:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0464C1F45314
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881853;
 bh=ipkRReMbtwAu7xVakE/HQLluSawAEt4oVRymv8x74FU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CmS4rRqAT167M1QT73NOFMcpgmpS9Kp/FtLNs/g+G/Wb7BvdYpB1s/j5qZPOoL4a5
 51OCVb74DUHNH4GTCeQY5XqGcrVZKCnsLZdG9NEmV8kN0N0JkhT7H8CNBTws9q5JWH
 IYbib783BsUjE2mZ4LwiEJVLCx4pFLmNmNRD+jFHqNWz7DAqvGtzW/KnOIqmW8VaNh
 ASNW/Ue6Jqn5nQ24u6Gyd7hNTWZ6OFDhflaXRmyPUuHtw2qpo81MShoTLfIEpd0+Qo
 4NNICSOFmsbBDVNQ+Jq2bBhKgsBMMGZKNQxmQfLLkBHmhQ1MMA1MdSQYu8/wXBrG2z
 hoH8ELUFZs5ww==
Message-ID: <0465047f-c4b9-d608-5c8e-c520d0ebcc6f@collabora.com>
Date: Thu, 3 Feb 2022 10:50:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 05/31] clk: mediatek: gate: Clean up included headers
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-6-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-6-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_015055_850086_2367F849 
X-CRM114-Status: UNSURE (   9.53  )
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

Il 02/02/22 14:48, Chen-Yu Tsai ha scritto:
> Some included headers aren't actually used anywhere, while other headers
> with the declaration of functions and structures aren't directly
> included.
> 
> Get rid of the unused ones, and add the ones that should be included
> directly.
> 
> On the header side, replace headers that are included purely for data
> structure definitions with forward declarations. This decreases the
> amount of preprocessing and compilation effort required for each
> inclusion.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
