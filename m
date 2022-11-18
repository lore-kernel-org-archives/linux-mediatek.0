Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FB1C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 10:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5udbPp9IEbZ5plV2vGtucHLA6WtEBxQ7Ni1536n+QU=; b=N/XMMQe2Q7mFzxSb8HawaUO+kp
	swAMkClYJmwszOISogQYZ7xFfCcIOYoDMdhCCsg/PQTQjvrjeJhKce+9m4pkT9aEBrxyizk+0BQ/7
	tppqnvItqNf7WpjYXJ7S41UJup6sX21+JmWgbZCXGYVpOLeVAqFSNeUZOXSoH2gf5HCVwfY0olQ/n
	3y6BT4GUkYlWDsXydvMqqZWD45Hts938QuFTPeNIk1yaY6nGvDzllZJLwWaBwj8MA+fd0Ap7L7ZmS
	FxzJi/koLH21yYbZiPISwn8fDpd0an8+gEbcAZIsFGThglJbDgFnzSctK1a7B/F6tSsDFXXgEGvsm
	81k27kLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyjr-003PHr-OK; Fri, 18 Nov 2022 10:36:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyjX-003PCW-Vi; Fri, 18 Nov 2022 10:36:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0BD026601639;
	Fri, 18 Nov 2022 10:36:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668767790;
	bh=+FQixfeJw7S8UNiAgxgWfk4PwAnxtieDJTIkSPIUbLw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HPVfzg+1wkbMj+lOFSZEUmE7i5MMBAAt8zXMGnq7T4nTRkejRN3FOmSoM3Lj8358Q
	 z/GVUw50rXH3TfONlaxgbkxhx5VbkpJAsB5XC0O/RyIH/pzosCqkTNQpZQkLi+tjfF
	 bb/CmCJNVcaDnRS7+U4JTN+HM8oR4yrrtY13cM0bRbrD1oZ+3O1a+cCKdi4CX7TYIK
	 3n/kdhfNe5O3Z6F3prETg2kflLeLRC4nwv1kKsv8zyXKV+htYctM+16KhYFr8XYokG
	 Qi5t7hWAw+k+wkQ2jAZhuIt5Gjz5dqFoP3sKCClDKn43tPjjg6ymMIfQQxQIW41yoO
	 V4F6Lm0LigdMw==
Message-ID: <90c7e6f3-ecf6-bb90-5a9a-3fa1eb4b9d5d@collabora.com>
Date: Fri, 18 Nov 2022 11:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1] mtk-mmsys: Change mtk-mmsys & mtk-mutex to modules
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20221118063018.13520-1-yongqiang.niu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221118063018.13520-1-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_023632_181964_807B9443 
X-CRM114-Status: UNSURE (   6.12  )
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

Il 18/11/22 07:30, Yongqiang Niu ha scritto:
> Change mtk-mmsys & mtk-mutex to modules for gki
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



