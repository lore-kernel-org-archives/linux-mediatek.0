Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4630AC5321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 09:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZZyF6dedgj23sdPiGyo4rUgfPr07mT5DxgXUDI+MZGA=; b=USZUGfdnidcb1G+9Ddvgi7Aicx
	hcWB0WV0HUPdKi2dcHeV+MkGqVne+4yWzBoFQjQsOPE4D1vSw1xWnK3iH/0gM8Y5nKGuVpvbj1a0Y
	PYKlALIeIkrwWlEuN2BsbT4SbuvNGZOzVF896Y6HBBAw4QaxZzNV4NhoeU998VMZhcbwf13KWCkAx
	0j9FHTvW8T0zl9swjirJ9HRoBDgfyDpUVbEwDhiNb7wmTLg7FhOk7AGP9E8I526FjSM0/LsBdu2S7
	CGxq6mA1ZuWLxApnYE4S3JOywVpm5SMepBmBdIlwCa4zwY7KWOkm6Py5QZHwKwqq7QHcvlWmmzWoB
	8WrSHHiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siW21-00000006f8T-0O41;
	Mon, 26 Aug 2024 09:29:01 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siW0Q-00000006eN0-1VJu;
	Mon, 26 Aug 2024 09:27:25 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WslZ60Qb2z69M7;
	Mon, 26 Aug 2024 17:22:22 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 906BE1800A7;
	Mon, 26 Aug 2024 17:27:09 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 26 Aug
 2024 17:27:09 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <chris.snook@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <lorenzo@kernel.org>, <nbd@nbd.name>,
	<sean.wang@mediatek.com>, <Mark-MC.Lee@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<liaochen4@huawei.com>
Subject: [PATCH -next 0/3] net: fix module autoloading
Date: Mon, 26 Aug 2024 09:18:55 +0000
Message-ID: <20240826091858.369910-1-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.77]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500020.china.huawei.com (7.185.36.49)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_022722_732086_6D9E7468 
X-CRM114-Status: UNSURE (   6.16  )
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

Hi all,

This patchset aims to enable autoloading of some net modules.
By registering MDT, the kernel is allowed to automatically bind 
modules to devices that match the specified compatible strings.

Liao Chen (3):
  net: dm9051: fix module autoloading
  net: ag71xx: fix module autoloading
  net: airoha: fix module autoloading

 drivers/net/ethernet/atheros/ag71xx.c      | 1 +
 drivers/net/ethernet/davicom/dm9051.c      | 1 +
 drivers/net/ethernet/mediatek/airoha_eth.c | 1 +
 3 files changed, 3 insertions(+)

-- 
2.34.1


