Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2941FC6FD19
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 08:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rg5tdkkABbxAWTnFGpK/6gzu0k2JQnPkVJCmdfQuiTM=; b=bkb13PZ1imE6bDDpE0hlfIRKKY
	y/Si6JyPNsp6GOIGqDVS29eLgW/xT/HWp3TvvdxgW2PMkipdlg7e3nKo4zgzM0pu8LHpZ3PdbyTIj
	rDbZaEojIF7dGDIgDggXm1VSvUeeWL8uS8aRKqmdgE8f/tbm8u2KV5/7CvZbs0fnyQP316yRMuS2u
	Bp8thKs/rmrgNKUGxAo1QdCiw+fuq2LImObTsqJUil9BgfGnAFTD+6GfKstiENOrb8ELxFsK6UtbX
	Z7+XkkFYYXz87/tLkUmkY3e/2otR2jfbLMnG0NIG6pP8hIsewVrUMi64FjIWT9y0a8JDIy2GOsh8M
	ruZR0WLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjEN-00FjTx-2U;
	Thu, 16 Mar 2023 08:45:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjEJ-00FjRD-0f;
	Thu, 16 Mar 2023 08:45:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 68693660309D;
	Thu, 16 Mar 2023 08:44:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678956297;
	bh=mBF272Uv22RD+C2JSIo/V6wQ2xTMSJyHuJQJDxdUJzc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f7flbqQBE9G9uumXYQRgci8KZQqZU6MrjKG2KPRb+fg59r0zjrylsv823wlDdKNvI
	 iDJ58VV25/+9JpQ6KVmViHZ8ZLoyM8a31oantlSNzqHD7wQx8dxiA0xlj3jmqs5dfG
	 nU8TJAJ+S7n1RyySAfA6pqf2/9LgxwOBdCHHzWfIdMCmunD4/HSulF8Jwr+imVXRdJ
	 e/N474YFsBS6yilSUvXqHVt+m6flIaiDnkhea51PApoWeg2Ix5h0PsWsAIDLMH0BlG
	 +pIb+EzxGNRt3mUcUcMt+ucLGGbRtHIRBRdIt95+Eq4SbMZZjphsuPgHci1KncN819
	 DtI3ScwVipU5Q==
Message-ID: <7d3f2789-2282-9d6e-87b0-d1effe2be7fa@collabora.com>
Date: Thu, 16 Mar 2023 09:44:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH -next] remoteproc/mtk_scp: Fix one kernel-doc comment
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, andersson@kernel.org
Cc: mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20230316084011.99613-1-yang.lee@linux.alibaba.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230316084011.99613-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_014459_373811_6BCC174A 
X-CRM114-Status: UNSURE (   6.41  )
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

Il 16/03/23 09:40, Yang Li ha scritto:
> Fixs the function name in kernel-doc comments to clear the below
> warning:
> 
> drivers/remoteproc/mtk_scp_ipi.c:136: warning: expecting prototype for scp_ipi_lock(). Prototype was for scp_ipi_unlock() instead
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4544
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



