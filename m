Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689EAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 09:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dJO4r1Mqvr2pui4WPhX6EWTS7DiyheoYTWjGN9k9Kk=; b=neGNZp8Za4lZJZ
	iLQaz63DCWjyqWpyE3WDim7wY9JhnIHVtf5pEB/OmCmQMZazQlFZwfRHs5bfJF+5cjFDZUcuyfFZq
	i0B9o+T8sS56IbpXdE0l/ozxDwiOEAJBQFf2rDGhqC4XYZACZ5QqcCwl2Ogpv7VemFXNPkiWkeuvv
	BE1BSCPchLd8BHYxNKEFcILe8QpZBLxasF84po/d31RSSL8YQ88CH9J9Blba1M6GD5I46g+OR/04Q
	vAB/E6iV57zd2ZwtjgDmTL2eD12x7Ij8aSarmh1LIiPndmS9oQSiVZzGZAhOC2e7ivukkt1KuZ9xD
	3XaLw4LHRzvUm7+sHawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKdIP-009kOY-2y; Thu, 17 Feb 2022 09:41:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKdIC-009kKU-Nn; Thu, 17 Feb 2022 09:41:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3881D1F45872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645090898;
 bh=EDIdEKK6SMkldx032oK0H4yJOSkKYBHmETqLtrlrpCc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U0Ok2m0J+4ywDbMgEt7+gsj0pQnXax/cpyKK5DurNiUTA9VO39y1yxK1JBy7PNUYc
 Va54+5g9YQb530pPhWUCQel+shjAmEYVzefjYjfIwBdAQx3xFAxveyc9qqRYW/kM/E
 sL7PmDlHxIU4i56f53p8pMfX7CHx0TViYL/wU7k4zA2ZGrVJ6e4acFxqJfFTNkvRZO
 M/uXAl78w2I97KNYob7zFVumC6/Kb8Bvw8itjEaQ9cHxJSMOtdLuk0JfYgNhvi9JN+
 voHTH822yjlPEHafN5W9RKfgnGoDvS52s+BuMcyU+yf/jFLglP1jBNtIFjK0FX2/vn
 O/6XGlN67zcyQ==
Message-ID: <aa54361f-6a8f-a616-640a-b9a098d82cba@collabora.com>
Date: Thu, 17 Feb 2022 10:41:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v6 3/3] arm64: dts: mt8183: add jpeg enc node for mt8183
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 yong.wu@mediatek.com
References: <20211206130425.184420-1-hsinyi@chromium.org>
 <20211206130425.184420-3-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20211206130425.184420-3-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_014140_981206_3E28900E 
X-CRM114-Status: UNSURE (   6.85  )
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

Il 06/12/21 14:04, Hsin-Yi Wang ha scritto:
> From: Maoguang Meng <maoguang.meng@mediatek.com>
> 
> Add jpeg encoder device tree node.
> 
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
