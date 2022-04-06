Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E5DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8d5seBMyY95438jYm7/pgrNYa5zZG9vuGCSTi9i9F4=; b=p9fMRzhbEhLeeC
	CP0wxRAB2oZQ/ou0t42Y0kbgXm7r+3excVy9VEmrOEyVio2+7quRZhtaM1Z+azTSXMrcz6CqyULk2
	xi1B9D4ilP/FpfZN8w35N4nwq08jPPuDzrl9HQnPwfbPX+MdHO9/oVpKMxqMzDHZNi+HBCNgv9tpz
	WPO538d2UcmW/45yi4m+FeCO/SApdHPay4lJbhwFsiXxiEcca0gFXRWcr0wERFURNnPEvwt3L3Bb/
	3VHUK9XSMcub1Kjz+8+xbGRkvPfNM9LpAnd6NNdp2S1B+ax4vnRBftBpGoFs6MrJmMrr/0CrL/0cd
	g7L7gsCCZVYJdAV68l8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc38C-005U5C-0X; Wed, 06 Apr 2022 10:43:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc355-005ScC-7n; Wed, 06 Apr 2022 10:40:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2C0281F40636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649241606;
 bh=7x+nafxlBp5slkvgaNHZ+WTlE5AOPwQOWURWpk9wYds=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WvM4AxJT5v8G2rRw2CopA5DESuuTsABtYXNNfCttxpuRH+ot2RvsHNdm7pF8jFyq0
 SaIi66hQEifySViIVm2zfQjRbV6nG2VuxtRhTZsXu6DMVLxGyYvUmpChMS985pUaEx
 OXTHxqHJOKQ1BZWRwur5ThF4Bc0FXNb6xSbXMtDTjZnUB7mSl+KxUCork3hCZ/8ZcS
 BIhkE6NnMpZKlqBYEsdYVdL92IRpIc+5/nvpzJKbh6twDjDeI0k/iSRXzLlfq7mT8a
 CJ5vFAbWlvxyDuui7dFiisEDmelHKSIVQH1z0V47tTRATOaopLFUdk1976fNevc8yH
 pcMAfA/mwu+vQ==
Message-ID: <2449070b-d7e1-122f-abe6-4148855a9aba@collabora.com>
Date: Wed, 6 Apr 2022 12:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8192
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de, airlied@linux.ie,
 yongqiang.niu@mediatek.com, jason-jh.lin@mediatek.com,
 nancy.lin@mediatek.com, allen-kh.cheng@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220406094654.29722-4-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_034007_475755_0CA0690D 
X-CRM114-Status: UNSURE (   7.34  )
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

Il 06/04/22 11:46, Rex-BC Chen ha scritto:
> The driver data for MT8192 is the same with MT8183. Therefore, we
> correct it.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...though, from what I know, you should also move MT8195 down there!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
