Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975BAE7718B
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Dec 2024 08:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:CC:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljKmAB0VT2J1XoUx9siQ779m5CZ8tdsK068WTcuBiOY=; b=t1TqlMs4wI+pOotzEOfVm6bbVM
	7B2tjVhpALXVlaoo/LLNyIKHL0xqhz1ZVoUan6O9kUM3XWVjlH6DnBxWk2/myJcI85UW/9xSmaBk6
	IESHK9C0GCtxsKkAQmw6nAj8cqyWqtAvpNMxhsnyYGbJMwhB4ifdAVQv4dKQZu+TzlmhOdioGe90H
	SiSErHYciCkLt5AfnwN8spu56l3PLAG/D826x+Kwf3Qvg29B1rw7/M/8Q5mfbGytSpBo5hEhcVeJq
	b5O4vQ9+d+Ai7h+PnKcgOwMUwpDUtW5U26JCjx/AozyrAWkhm64/+NMhhViTrzCNBdK+suaikiViV
	PKGKaLfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQNAF-0000000DVrZ-13xd;
	Wed, 25 Dec 2024 08:54:47 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQN91-0000000DVjw-2N6M;
	Wed, 25 Dec 2024 08:53:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YJ5BG5FtJz1JGH9;
	Wed, 25 Dec 2024 16:52:54 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
	by mail.maildlp.com (Postfix) with ESMTPS id D7E341A0188;
	Wed, 25 Dec 2024 16:53:24 +0800 (CST)
Received: from [10.67.111.53] (10.67.111.53) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 25 Dec
 2024 16:53:24 +0800
Message-ID: <7e456e10-23a0-412b-8bf8-8860aef436dd@huawei.com>
Date: Wed, 25 Dec 2024 16:53:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <zhangkunbo@huawei.com>
CC: <angelogioacchino.delregno@collabora.com>, <chris.zjh@huawei.com>,
	<deren.wu@mediatek.com>, <kvalo@kernel.org>, <liaochang1@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	<lorenzo@kernel.org>, <matthias.bgg@gmail.com>, <mingyen.hsieh@mediatek.com>,
	<nbd@nbd.name>, <ryder.lee@mediatek.com>, <sean.wang@mediatek.com>,
	<shayne.chen@mediatek.com>
References: <20241218074552.3271542-1-zhangkunbo@huawei.com>
Subject: Re: [PATCH -next] wifi: mt76: mt7925:: replace zero-length array with
 flexible-array member
From: zhangkunbo <zhangkunbo@huawei.com>
In-Reply-To: <20241218074552.3271542-1-zhangkunbo@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.111.53]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_005331_769319_8FBDCB47 
X-CRM114-Status: UNSURE (   1.96  )
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

ping gently.


