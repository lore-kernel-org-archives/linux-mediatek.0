Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B34DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 10:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=si8qfOa0/9IC6B1TfdHwt9ETd+dv9DbwW7TOSDqL7Eg=; b=jfXU/5+uS4Kcf1
	09eS3DTBwZE6Vlk2bpjJ3uLcM6ePeIW9Ch7W8pwWtnOdo9W04UWGNNtGSMEJWbJXGUIZPDY4XspVW
	9c+sN7+9FQ8eoAjf/DKJh65uMRK3amHmN7f0u1OTkJ3+CNlmf6MOr6OLXwu6jeOlo2PoB0yC30N3f
	j+fOMhDhRAzpQg51nf4pnRxmE5lFaUoUFfIPwJnZ1hy9wF56va6EW8dhopeoHNlKFc1ZgzSfpYozp
	93A7neQEAENlsLggxZkKNXODvaU4QgTVFrZ6J4KqqPg4eRkKmYqPIA1UELoNPZ+KfqVA8P2L2yK6w
	IbDWAYc8UXBzPz6pXebA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYwt-000fmV-A1; Thu, 03 Feb 2022 10:02:43 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYlR-000aFE-3z; Thu, 03 Feb 2022 09:50:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5A9441F45313
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881851;
 bh=HgNfql0xDMRNN68LGiYkvxm0vW+TozB6ZDFhQ+Q/MmI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WBPnKS5GhtsUKhfJnBNLSJ2g0Rn1lA0Jq+OO9FA/tHV6Y7cVq4bBE8JEP+3yHXneX
 pRqznUvF5mhocQXKmxpT5luPZaW/7pDTOj8Hk2lm5rQIeJQxiZ/HH3eShgpxNsUldp
 RHeNKyU2WAMRt6+IDUVIIsHTjDoj7ZD8BJBeoIyMJVnI0wHFZy3TCbKGWkLmAaCHs6
 KrffmPmZYJyojT/NCmO/fICX8t/vQCkfGLg2JKMHH1brFuFUPqF7qL4J23V7X/Lt8f
 FCzbdfkehpxfpS+aUArL22gm+9rZ+gRpNDMWCLt9zUTFaWf+hKnOOO8lHwC/aPfZoK
 DucntcCYtDQGg==
Message-ID: <7fc5e936-29e2-2cbf-623e-e515de5c5e9d@collabora.com>
Date: Thu, 3 Feb 2022 10:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 07/31] clk: mediatek: cpumux: Internalize struct
 mtk_clk_cpumux
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-8-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-8-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_015053_361127_79AD1A97 
X-CRM114-Status: UNSURE (   8.71  )
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
> struct mtk_clk_cpumux is an implementation detail of the cpumux clk
> type, and is not used outside of the implementation.
> 
> Internalize the definition to minimize leakage of details and shrink
> the header file.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
