Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC53BC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjlf1qbUsSX/dHePc12AqffdpRxYQD4xxMi5XnQoSQg=; b=nXNGPz5zaH/s7Oh2JcT7cqTvfA
	lyAovBUxfAPMGiAzU5kvNF3+BvASqY/xFC2wKb1kk80sEb0SuMdTBgWD/df5vo+bmgY6qT+AWxaFQ
	Wlfd2e5ceTGtKNljuimZyjhDOBUbS9iOq7L5/dPzepWTHf0FoqkcOi10dozFxVVSm42QLjN1sl/fA
	vy2eckA/LloZB1uC0cCoXmz2dlddHFYDwTG5JMNZoDNHb+oezppFb9N/YKYbg1itUJdLstYNzCgFB
	O2M/Y1iWM//JiBB63/pkXjVPRdhoYVcKnEsO0MDdIF5O0EEpqYyRnvOXGOgdYU1QjIx8QPDluJyBw
	oYyXkLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8OV-00A34y-TN; Tue, 27 Sep 2022 11:04:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8Nb-00A2hh-2L; Tue, 27 Sep 2022 11:04:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0B73E6601F41;
	Tue, 27 Sep 2022 12:03:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664276637;
	bh=bOuC85Nc2LJl1a5+ZAIvCRp5wCwoRyVkfdHqWvXVydM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lTL5YDBSzKgOt3xax0YnEmYId5JmVtx7muiUUyRAWCECGJyr7Af2AF6uj2AC6AtCq
	 gr4ZxW9l4Q8eSH2tk4n6m+39XfZz+yeERWaJw8IUI60T1YLdMSuu32nWx2PBmtBlNU
	 TsBAAgqy0xYWsQEQOzia6t6e6mGZ4VzxSwPyBRz8SNZNmR/q84iUctxxC8sdAsVbfs
	 EBO+bnmfZrcpTZ96s+bVk/v91ZcbmFVPqkubj/e0mT1YqJOpcnzGLvP6ojA3hDCNw4
	 KTh4lqrYPlNnFAKMy41gvrUnB6w79c2pP4tcSF9tnHrYDHKbBI5GD4Kan0AHe7MTu4
	 VgMVfVyVqyZGg==
Message-ID: <da5dcffc-746f-207f-eee7-f47e2550eab0@collabora.com>
Date: Tue, 27 Sep 2022 13:03:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 04/11] remoteproc: mediatek: Remove redundant
 rproc_boot
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
 <20220927025606.26673-5-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220927025606.26673-5-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_040359_278364_CCC7797A 
X-CRM114-Status: UNSURE (   9.71  )
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

Il 27/09/22 04:55, Tinghan Shen ha scritto:
> The video codec doesn't need to explicitly boot SCP in its flow
> because the SCP remote processor enables auto boot.
> 
> The redundant usage of rproc_boot increases the number of rproc.power
> over 1 and prevents successfully shutting down SCP by rproc_shutdown.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

You should Cc stable on this commit, as it's a quite important fix.

Regards,
Angelo


