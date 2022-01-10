Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E256C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 15:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mSrkyIVkIspgaGwTRnwcMWuWlQuPTLvBTpvZhMgI/Q=; b=mvufs7m5Awd/BUDrwfOK4OyFc1
	iKz9kJH96tMWJfm3sXGwhFZ7Ujl5du8QnlRAfNm5/lua5atV24H37/HAGu4/ocuk1E+RzM5qtDUaL
	9c+Yr3yj1wUQzZUm85tDNcYeanvgtfLSPIvouUTjelRpa5Zorlvg6ufhZSZIC/JfVIFWdJ71jO2Rg
	nxjqsM1HimYickyttqEE7N6XeMOTD0OWt+GQC/nl2Z1jaPhdTdVo3QuKcdqFCe7gOOlSL+ZyRf/7c
	6XDqRe0FoI8C+7W471pu3xvaFgF2GHESytgKViXc8L2UjYnSbpr5z47aG/fLPlzt0F7/En24t22Ad
	idTjizlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6x2B-00CDAp-JU; Mon, 10 Jan 2022 15:56:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wws-00C9ow-Ef; Mon, 10 Jan 2022 15:51:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8F5F51F43321
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641829865;
 bh=LjyJJ271iZCn/ccFFJ81ANCTkmRM1NPdpW0Gele44FQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QKA4CEexvrepIa2cBkR9+oqEjpYEeM8jeRV3jgGn96Sy6swAWLiU5s8HN5T6USgEu
 c1tbvu7116ugkSnvY5nJLsufkaCOlmqcEhOCg/NLKDxO9fev5yRQZiRcub21va+pHa
 wmkBVmx+nncNVwjj2VNx7gOJbkF+mmJez2Sn+6TM7+fhIsaRnogbLBt/Siyib5OK4c
 U/n+KkUe2GUsyJQUARJYkciJZNJw3woC+Sry5YXkfAQchU4u4xuLVQJ7dSTrSGCVs6
 vzTkQxo4AueYenGuivcHHSjw5hO8SKa6g6QJ69jSEuOtyu5voQ6N6wlDaZgTKEFvz8
 Y7R7vJg261yoA==
Subject: Re: [v1 03/16] clk: mediatek: Add MT8186 mcusys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-4-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <9f60fb73-0983-8c7f-f96b-ea625f644ea7@collabora.com>
Date: Mon, 10 Jan 2022 16:51:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110134416.5191-4-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_075106_685662_8B89036C 
X-CRM114-Status: UNSURE (   9.33  )
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

Il 10/01/22 14:44, Chun-Jie Chen ha scritto:
> Add MT8186 mcusys clock controller which provides muxes
> to select the clock source of APMCU.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
