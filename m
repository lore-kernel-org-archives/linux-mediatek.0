Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CDFC54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 09:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHz15aiqMhwjAA0gT8gZQkJz8QC8S6fVx0iYEojzFP4=; b=LSvhXIHr6i7GRHN8ltteDRirRH
	vVdTSWDjLeas4dvqtARKLbBkM36cYwYAWRbAO/WOamHHEfAMAj8bQwCNzS7stJYSk+hAnS6eKGe7D
	uladCOuwctGV4Y2RDqISdB5wghJSAvgJyveLkEUj9DMyt5kNp1XalXY/ul91LA1uYVgmDPElkhAc9
	qM6L/h3Nd/va9QoLIXdVHtP4FtSqBvJ7ZaoFjczYsL5crOlAmgvxboYOZC5v/tIio5GPeXzU9V/Hg
	FS6LVVc5t+RqCi1ujds7TZFZ99bcz2a5IaK6sa6aI/RrSNY9rF7zk9M2yFkjRz8FKMI0Wjh74YCAQ
	/EsTdXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2i4-002Mr0-8z; Fri, 02 Sep 2022 09:11:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2i0-002Mo0-QK
	for linux-mediatek@lists.infradead.org; Fri, 02 Sep 2022 09:11:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D900C6601F04;
	Fri,  2 Sep 2022 10:11:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662109887;
	bh=EbLnAfL1q9nzyDgYiKgpj5/yjDssEj9usoV+zglURE8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BjtAHi8p+pCwYDqqOIb1c2oBBuYVhEhBeMbpVvslsKBeMnrMrgQfL9R2+tCX8eYbw
	 CEfOkM+JrfKdmKY+jekkXLfZAQC1YCeEDE7cKxMkqmbGVr6DWJA96QUr12S9t0NMbZ
	 W43NyW0VUw94dcYIxNR4dJdq2EuIPLcqlc2QAFhuZ/VVpAJmY7Xh6j8Yafdcx0UZ70
	 noDkRwm6F4Lrz2WIsz7FjFFbvOfCTkPAzuVW+vFTRBeM7tdYM5IK9L53zRcsAVzT6s
	 a5fKV85IBBOZCTIIiEyR473aYVfvKkr3ors/J6YlElP/+muP9F+F8qBIaruyTMjpt4
	 VDtqaIdcDnsbQ==
Message-ID: <bd4a91ec-33fa-aa95-1845-8fd5ce70c176@collabora.com>
Date: Fri, 2 Sep 2022 11:11:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] media: platform: mtk-mdp3: fix error code in
 mdp_vpu_dev_init()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <YxDGFMwyeNXFPaig@kili>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YxDGFMwyeNXFPaig@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_021129_020863_5F0F236B 
X-CRM114-Status: UNSURE (   7.64  )
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

Il 01/09/22 16:47, Dan Carpenter ha scritto:
> Return a negative error code if mdp_vpu_shared_mem_alloc() fails.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



