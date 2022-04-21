Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A159CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FF7pwCXUztG7Bb123K8ZMb+XXFnU9jhqc8Wx62WxPlc=; b=wk/1sgr28ARu0e
	8BGZ+guPSXepy/NVX1iIQ6xFeJSX9gunFGMZIF0Osh+9Nt0PJjgOoN7g3QNkNODNnZNnHFJqDj8Vy
	yE3oDOodyLwuQ+W6g7mzFHDV1uaawEawd6BM8iC3BwaCJspUzrI1/U2uIURnE9kcg37FThsUdRoJN
	IkyryhG51DH+FRGuBib/dAoexFGd9TvI3QZ80qzdKtxGpdg2KtVXQhHREHK8NJGS570xdhtdBcTO5
	RWPnIxCtiA4OkMJhHmjAocCpgYH7fNHXMtfi6bs+ZPm3YqA8kH3dbjeeq9OWrfJ3TcrpO58KvBxUK
	SlI/X4SQY728+N43yeng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSnH-00Caso-GZ; Thu, 21 Apr 2022 09:08:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSms-00CagS-S4; Thu, 21 Apr 2022 09:07:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 091361F45276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650532061;
 bh=Q3gSs0jXHQnQIkOYfBPlaxuHPudA0U/7l72NqP6ADKw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GW6dlLiWlWOixTnEGzpPVV719g8zBEr8Csp/gp0woqkyt/VHp6ei06aC8Pucd8kHT
 33mbXsidihBpo6LNkpqMB/MVkW20wvH2sJb72IZfcY4cC31cFxaExO0W8eiT38wJVU
 6ftkTZqtC5i7MdydUgIEX4RnPYVK8NiPP+S8+7JFPe/DYI4c1WSMIsyGmqmsH+yogE
 TWtFmnJbRfgsjuynT2CbMIQB58iHyRuI9aKzGBk6iwwihH5J3LbLYniPhJjKwWQNTn
 3a7LaEPlRufWajJwXlt1OFuOQW7oKvfttnuDifpDpe2oC2zPppSWnvJKNYhANUMYFk
 edXbEx4qZoeHA==
Message-ID: <36b46e3d-ddc0-d934-ce02-185d4aaf5790@collabora.com>
Date: Thu, 21 Apr 2022 11:07:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 11/12] clk: mediatek: reset: Add infra_ao reset support
 for MT8192
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-12-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220420130527.23200-12-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_020743_086346_39F0B8E5 
X-CRM114-Status: UNSURE (   7.72  )
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

Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> The infra_ao reset is needed for MT8192. Therefore, we add this patch
> to support it.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
