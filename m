Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B77FC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 11:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoMHiag2oFrlDLXLcPLEo8JgjR4WljiuCv44W/OOrM0=; b=dRLhK2WLNtRe+plreVOB2H6SyQ
	kqQSRli77YPD5ByqI65whJUsXweAKXJ97sQgeLpQRrLYtUnZufG3/ZrAD+7AmRL0eSWi8mJfXRyC4
	QCGCOuZQwQnX4p7rmk0tpaA22Y/Be5FEn2hex+ZRZYf5NA87fzKeXgTxzH49pbh8X5z3R3Ht7eK9k
	U4uEblJgwVr2RuC70HnHVWUIEhtWBMkqbCosv50sTX1PckzwLxLibH8OcuOHITijjaBnUnnm+t5Ms
	4ns2HNaDlXZRMCvviSxD6rnGzZoH/i1eA7zsHRu1yai4VUOF+ObUWWyvTt5pVOG1KFmZC9JEKCSrg
	UpaZQJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8K1P-007Y5H-Lx; Mon, 04 Jul 2022 11:13:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JVj-0077UU-Qf; Mon, 04 Jul 2022 10:41:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 541E166015A6;
	Mon,  4 Jul 2022 11:40:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656931258;
	bh=3ua/urEKyX5wUfZk2tt6MH9z/o6x7dJVIncqxbkKGLU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ApbaQBg4pOa1MDNULQXy/BTHaDQVem0VIgL9KsAu/ba2w94MSRtUp4j2YQNT0HDcH
	 B1VPZxb4B7SXrPfNbeGIUI0/lB38N5yPjKsuNCbmHcz/9cMn+cGyYK/DwDW6cghBY3
	 zTe/adTBMpzT/MER0bTZLXyFPnHJ0bSATY8QMO0zld37r3/Vo4rKIqtfHJOi7MKrZ7
	 J+tPuDKhKycppKIge7baWl6DLcIslHO6NfvHLYwXH7co2nw3U9tKF8+PuRtJO0Qbtt
	 Wr7AaHZwLPID2bpy24gWLE2ptFyLariWnuLJKI4YlZXUcXAy83bT05B1H0rulJ9vzw
	 qSCTsFfDShycQ==
Message-ID: <6ef1bff6-7d52-0931-15b4-d01719a4018e@collabora.com>
Date: Mon, 4 Jul 2022 12:40:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 14/16] arm64: dts: mt8195: Add iommu and smi nodes
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-15-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220704100028.19932-15-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_034100_081315_359F049C 
X-CRM114-Status: UNSURE (   8.07  )
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

Il 04/07/22 12:00, Tinghan Shen ha scritto:
> Add iommu nodes and smi nodes for mt8195.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



