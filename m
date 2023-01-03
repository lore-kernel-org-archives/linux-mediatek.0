Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E84C46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3u7sQu+Ok03my25ixFOCb3k6m8c93/+skn9KYgTQI8A=; b=EPynf5jUqdqrelugm2wB3C/RfB
	wD1QKi85rPjJTJ6Xlxht/a9zj5CtWKm7DR/DAmTZ2C53ByNh5rUNGy6pvkoyPJ3AVqTfxy5ezvgZY
	oFq35ASUOMo6cyOdt0c0lWdcJnilkrtCa1+RDDOHHsFptzBX6psOWCn+XjabDWDFb5paeC6aS0Nxr
	/KhUDTO94XXuac+NjHWnCL+7vdFKgXbEDSiBcej8FhUELQ2CGzr1bDhWvdsDUyahNOo5wl4SdkD8W
	U5ULq+25klVX5K1PUeEl9kK5evSG0wNj93WTqQUAm7Em+0hlX/yNx+dhAcrZ9qn4WQSx4/kdTDB6y
	9YPZZd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCiKK-001zRn-Fg; Tue, 03 Jan 2023 14:31:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCgjh-001LSe-EA; Tue, 03 Jan 2023 12:49:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 818F46602CF2;
	Tue,  3 Jan 2023 12:49:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672750184;
	bh=cKufuK/SQXHZY7UgYbfqx1IwLxjbfTYMLGfuy2CKsPk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g1wjpLxsUYLZKEK5ecAlCc3elaIDzpmV+nLcVd07pHpAYAfnZlhe8SUo2D2UaR83d
	 NtmsO5j7vNMmKkIjCSkZh+TezHoCcnLWhHfOvznadmV/z48Rij2qZJMBF9vPDiIxVD
	 qEcjDFIY2cADv+nB87VCZPmr6uxjnJOasVOH+eb8sW8u8zZUI6+JSGm8fjl4RPIEc5
	 BMvG4P8FbSZ6SygIYensx1boE4t8hN1oMHZGiTCeg5UBYhSorkH5DhqQlIxCsxIcsD
	 VHzXkmJ0udW1GvVW0k1wHMa7b6BHs9HfpbM1lpuTew+1BR7waj2XF+AQSc6YGAvqVR
	 JtbNj6S9EgJgw==
Message-ID: <3ebb927b-d662-506f-2531-62abd851c0b3@collabora.com>
Date: Tue, 3 Jan 2023 13:49:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 12/13] soc: mediatek: mtk-svs: Use
 pm_runtime_resume_and_get() in svs_init01()
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Nicolas Boichat <drinkcat@google.com>
Cc: Fan Chen <fan.chen@mediatek.com>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Shang XiaoJing <shangxiaojing@huawei.com>
References: <20221226094248.4506-1-roger.lu@mediatek.com>
 <20221226094248.4506-13-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221226094248.4506-13-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_044945_682420_9217E48D 
X-CRM114-Status: UNSURE (   8.03  )
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

Il 26/12/22 10:42, Roger Lu ha scritto:
> From: Shang XiaoJing <shangxiaojing@huawei.com>
> 
> svs_init01() calls pm_runtime_get_sync() and added fail path as
> svs_init01_finish to put usage_counter. However, pm_runtime_get_sync()
> will increment usage_counter even it failed. Fix it by replacing it with
> pm_runtime_resume_and_get() to keep usage counter balanced.
> 
> Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



