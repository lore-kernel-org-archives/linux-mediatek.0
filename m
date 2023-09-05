Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FACC83F2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 07:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLcfhK1bxBxvs6Obq5jBen1Fjb+rMcNsFwJkIATMusw=; b=OxIWixNpS56/ilWB63r4dWDqAC
	QbmUGl+py7q3qhf4yWYTowc2MK7zooKfN7/NTv2OR9bTQEmuTJfuHk8Oqz8qTBjcUNZJGlvQ6GfO9
	lh7i8R+YypyV0pQtwPNryh77KawOcke8l6j7jXS4yIU9PkU/IRy0PXtq9SXGQb6dKVHrW4w3YkUSF
	ywHX/wSTCWVI8mQBAq7FkP/bbORNZftV9wVr/C8UC+ERRMbZ7J3+X0VJqbE1aw4itayjqXosMspxx
	bLc/6qbq6MqTBjqiDbDOsi1+tv2eO2kndTREmzaC5NNezilvfiagEkOLksAF2ugix4q+jyXrfvH3G
	AFGrCK2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQlp-005Sm6-2x;
	Tue, 05 Sep 2023 07:46:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQll-005Ski-1l;
	Tue, 05 Sep 2023 07:46:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 983E16607033;
	Tue,  5 Sep 2023 08:46:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693899999;
	bh=N17nKRenuWrXQvbPYayfAXzToq+gFoZOFDOSSc7L+fM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sb1KR0+Fo6COyGKeYr/5gd1FqmGuMYbX7f8E8C6XeU0YD74tUBePlMUpy2Bl1IY8Y
	 49JUTMhcePcdIoLYWSDFduSN4CB0PjoIfI4TT0ynjsyKtutaajlyEm4pCRIlFq0fJA
	 2edAoybmDatc71WsEzltFHixwenLSAoeepEcSzrqvsGxQde+ds8wwFJIvKzfBpF87z
	 G61nHbWrxb/ixSYusLu604r8Og3Wq647miKIoW6aVjz2zzuYzpFRA8q8kYcNwvBFOW
	 J6Q2SushZ8RJyTmNRtcFlYzFQNqVpvd92RGeiMv9MYA71Yp0z+hJnFwRipKXxHagH8
	 5TCJ2KVFrxK8w==
Message-ID: <43b990d9-7bf8-ed06-ccfd-69b2a6cb85e5@collabora.com>
Date: Tue, 5 Sep 2023 09:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v17 06/14] remoteproc: mediatek: Revise SCP rproc
 initialization flow for multi-core SCP
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230901080935.14571-1-tinghan.shen@mediatek.com>
 <20230901080935.14571-7-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230901080935.14571-7-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_004641_734702_3BBE8AF3 
X-CRM114-Status: UNSURE (   9.28  )
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

Il 01/09/23 10:09, Tinghan Shen ha scritto:
> This is the 2nd preliminary step for probing multi-core SCP.
> Initialization of configuration and L1TCM registers is extracted
> to only performed once on multi-core SCP. The rest of remoteproc
> initialization procedure is similar for both single and multi-core
> SCP and is applied to each core.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


