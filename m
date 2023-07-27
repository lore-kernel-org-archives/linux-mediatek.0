Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEF1C001DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwx+3u2PKGtGptJacHFfOkeNrp4qvUCcOr9PN4/T+pM=; b=qOqCWyetBQZ3HqJgika9q+uh0J
	MYiQSJu+oBTtngJZi0bElb9xXvqKkfMe/vy7YqSQj+Qn6HH56IMo7PfzNExVFVRw05tMIN2vyLlMe
	H9DiKa7ag9XmODg4rYzDs2175U1CCn3WdJIDSZqQkrR4a9ewfCd9OQTQO9Sb6c7GQf1sESmiqMHPn
	p/aBWOX7LSog8R8PJboUre5jIAkKpGyD2oN3KG+G7WjcJCd272DjkH+TtboHW1/oQFx7eYvGPiieS
	/WR5qz/imh710SYkXieXwkep/w8+Cp06yPShc0ADULH1nXI+ONzRHCEjxqiJIhDxcUxA+gwU4msyu
	JgIXOg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxy6-00CwsX-3C;
	Thu, 27 Jul 2023 10:11:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxy3-00Cwo5-14;
	Thu, 27 Jul 2023 10:11:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EA056660702D;
	Thu, 27 Jul 2023 11:11:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690452690;
	bh=FyMX1Fm7JT1B1+S2v/xtvGbFc/F+jQacw+dZrBbBQzs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=n/bwER6jg3CkEOmqAapF2bzO1Zp/7N05FVt6SLMUrAM4LmU6PUPX6iU/b8vROvX55
	 SXQqIMAXy3vvncho4zdJokepyG3ryPuOGgzZ+P52Tb5zzzVEN32WfM6EaT2cjmAM4Q
	 VTcK/qSh/dX1B383PnaVVAysKTok6zyOuuSx2bSVZQ1uHtXr2E0cBUh4hWYOBAuFmt
	 l/9JRP7ZWK+LNdT2QffWRvrT5uciVBuMxlF4ByCvXJ9NK5Uw7/cynv5/4QlvgGGHHa
	 EwMZujxilUqerbZ7YK8XGIXUj1NZmdmMePkEFLJXlHt5U9KpR0RbDuLhFI3vJ1JRom
	 eiYK7gnIUmurQ==
Message-ID: <4ccda73e-760d-243c-d02d-7b79ce7d4890@collabora.com>
Date: Thu, 27 Jul 2023 12:11:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] power: supply: Remove redundant dev_err_probe()
Content-Language: en-US
To: Ruan Jinjie <ruanjinjie@huawei.com>, sre@kernel.org,
 matthias.bgg@gmail.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20230727082301.741821-1-ruanjinjie@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230727082301.741821-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_031135_545458_7DEA9F84 
X-CRM114-Status: UNSURE (   9.04  )
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

Il 27/07/23 10:23, Ruan Jinjie ha scritto:
> There is no need to call the dev_err_probe() function directly to print
> a custom message when handling an error from platform_get_irq_byname()
> function as it is going to display an appropriate error message
> in case of a failure.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

power: supply: Remove redundant dev_err_probe() for platform_get_irq_byname()

After clarifying the commit title,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



