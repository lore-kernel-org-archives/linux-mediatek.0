Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE697C83F01
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Aug 2023 03:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SQg6/5s0DAxSRnynQ+ObZdY4y7I+FuIlreCTWWlPhAc=; b=N2C3d9l78oeozaN579QvkP4oIN
	0RW+CnxohCq6z5JVF/PSwB3YWqiAUmDZvgwdRoD2cv3tLDYQM1Yp+YL1IQkL1oxjEeUzgWXLaODnb
	Gt+EBWiUKQ9XibXIa+F4+oIUDzHq/63OTED7YSHSZJz/6VGqmg2T4O28eKtOYQpJ1IgKwC1MT4A2w
	j7K4u178qohn7aiRWEJZw1I+bvMNLxklwOfElquWZ0qqip7n0DxoSSwxLYX1yEwXPhycaQozmp59z
	PaCIZpJyiYF5gwA+14nPQ27Zg5XQfWbyOCys3hJ7jNiYWLVu5Gk6CJOIt0jjkUtf8Uh/aUF9dKl3i
	t3vnh+Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZkNk-006OUK-0n;
	Sat, 26 Aug 2023 03:54:40 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZkNX-006OSZ-1G;
	Sat, 26 Aug 2023 03:54:29 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RXjXK6yFPzNmsP;
	Sat, 26 Aug 2023 11:50:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Sat, 26 Aug
 2023 11:54:17 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <linux-iio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 0/2] iio: adc: mt6577_auxadc: Cleanup with the helpers
Date: Sat, 26 Aug 2023 11:54:00 +0800
Message-ID: <20230826035402.3512033-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_205427_623317_3F6CCAE3 
X-CRM114-Status: UNSURE (   4.05  )
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

Use the dev_err_probe() helper to simplify error handling during probe.
This also handle scenario, when EDEFER is returned and useless
error is printed.

And use devm_add_action_or_reset() and devm_iio_device_register()
to simplify the code.

Jinjie Ruan (2):
  iio: adc: mt6577_auxadc: Simplify with dev_err_probe()
  iio: adc: mt6577_auxadc: Simplify with device managed function

 drivers/iio/adc/mt6577_auxadc.c | 60 +++++++++++++--------------------
 1 file changed, 23 insertions(+), 37 deletions(-)

-- 
2.34.1


