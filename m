Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CE4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 08:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBJLSS41GYNuql4Rrexoq7wAy0YIgobeqV81FvR1Kts=; b=owGdcRXdaSH4WG
	kEQNTMnp3WWohCFaeNAIc2ORXhfkKnG5fGsNPqKlgzwoEYelXMUYLz1LL2mlCayUvKM+hQN8LkQ58
	mFULt+ZqGqnixXsb6dX6azkb0RQ7iST3z5ypH13EL8cHi1acUCZCzu2MbOp3+LtWlvBOjl9LVqVu8
	r72ccfdayyYoQUgf6mtSJp9sSiNSDbQM1dZuh/WSqTxj50M2cLRPlWJurUIUU39/YTZXmPRXJyW8D
	CGNmas9zIZDR2DtAf2PvzX3JUQNJK8lB+wz4WejxFZcM1kVJi4PL4NYuev9SPLijJ1TSuw2XplxBL
	8cfVKHHw6kewILsFcl5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmtHd-0024Sx-S1; Fri, 06 May 2022 08:25:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmtBO-0021uV-Ln; Fri, 06 May 2022 08:19:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6DEB81F406ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651825162;
 bh=EKku66uCUZdhACj9FDdRR9vSI5fzEhyGSjYJzQuulqs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=brGZxo5j/RPWYugIKdPNHQNpFqi4PYyD2ei3rTUFFBf9H+w5un+k6VfkAb/5ZDycl
 ky8AjIyHHYdC/bPd1JVfE5PpsmTYGgFUmisqumxh0+bRLxvOK2OEGtGkWDIjipsqbv
 cJghLnUwztsXbMwBmgOJb1uVH8Btw57xViLx58u0JyMvHxpLB+i8KZgo3e6aRyKpYF
 1LPf6vlhTxdRXeI4DdoHZbpq5/X5bL8eAbQZoUOuEpX2TUzdjvtA+Fag3/O5V+vEFo
 vEMJkCVX7D+u7KtF/souItZ1HdTDQuVgx50Y401E9StoU0zT/piF0PdN0betlHGBq2
 2ceuvQblhPWMQ==
Message-ID: <7a4e7d71-4460-21f4-35fa-d3b11559785b@collabora.com>
Date: Fri, 6 May 2022 10:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/3] soc: mediatek: devapc: Separate register offsets
 from mtk_devapc_data
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: runyang.chen@mediatek.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220504115501.3490-1-rex-bc.chen@mediatek.com>
 <20220504115501.3490-3-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220504115501.3490-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_011926_993944_32191B55 
X-CRM114-Status: UNSURE (   6.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 04/05/22 13:55, Rex-BC Chen ha scritto:
> The register offsets is the same between MT6779 and MT8186. To reuse the
> register offsets, we move these register offsets to another structure
> "mtk_devapc_regs_ofs".
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
