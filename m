Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C96C7EE2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OhH1jU8AgmAgOVpG4hop8EdAX4EfoKjZv+7LY8dwAb0=; b=RQ5/Mlu2DemX/FF2vd2WRRAOcH
	FgaUJDwDZiYdy9MGk7mbtJKmCVn7jwN/4MO1+0FTDzxzxfNzbk/1jQWUNFjrfQgpMrI/70lZF0NTg
	AnbmD+CYKusk4f7cMCPm5qw+4d5i40yd+XWCOo6wQP0ijijEg1C2GgSPSsZA6dwXz3gyaAv6BZvHu
	rMwAOzf99uA/awZOcRSc0DVGg+M5s2xdXnkYgWGgQGAAxIBeXCMRfKjUM9E8ktFBCs+D7bqMiPADs
	fexgRZbi3/hNJ9Q4GS4od0by0GWjtEFdBn4crtVkQgelCh4IPDMahsariupW9Obx4cRrNtroC1pPb
	qBkJaiHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZUWB-004wrk-0m;
	Fri, 25 Aug 2023 10:58:19 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZUW6-004wki-0E;
	Fri, 25 Aug 2023 10:58:16 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RXH1H0TQ4zVk5T;
	Fri, 25 Aug 2023 18:55:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 25 Aug
 2023 18:58:05 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<Michael.Hennerich@analog.com>, <heiko@sntech.de>,
	<yangyingliang@huawei.com>, <robh@kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 0/4] iio: Use devm_clk_get_enabled() helper function
Date: Fri, 25 Aug 2023 18:57:42 +0800
Message-ID: <20230825105746.2999548-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_035814_338515_CA4F32CC 
X-CRM114-Status: UNSURE (   4.25  )
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

Commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks") provides a new helper function to prepare and
enable a clock which keeps prepared (or enabled) during the whole
lifetime of the driver.

Jinjie Ruan (4):
  iio: adc: at91_adc: Use devm_clk_get_enabled() helper function
  iio: adc: mt6577_auxadc: Use devm_clk_get_enabled() helper function
  iio: adc: spear_adc: Use devm_clk_get_enabled() helper function
  iio: frequency: adf4350: Use devm_clk_get_enabled() helper function

 drivers/iio/adc/at91_adc.c      | 38 +++++++++------------------------
 drivers/iio/adc/mt6577_auxadc.c | 17 +++------------
 drivers/iio/adc/spear_adc.c     | 30 ++++++--------------------
 drivers/iio/frequency/adf4350.c | 20 +++++------------
 4 files changed, 25 insertions(+), 80 deletions(-)

-- 
2.34.1


