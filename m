Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C6FC48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 10:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smMHGi5F2ov3sVha9UQofIU2mvJuFdcIJ1EBJPoLJzA=; b=UleCdT3HXvPJtXP09fhtTmMoqK
	2IhtMNJKNXUKnG5bheu2L9r/u/RqGiQ3gef98iw7mD593sjGHKtEDldOxzeow35a4hX4oz5ItsJcQ
	DQUVSPRW4/ZKb9ofvVXaQ6xRxdiq80kYs6qcs5CVQOW1zYq8xhS67F0l9f0++rqsbYCc65HPqvYTq
	Lu7Z4/5L9dsyr1Ojy1+CZSJXHAsxWxSGLAQ81+qGNmtMttik6rGPmgQjAAMm34SqKbV3574uRQgHg
	BVTnTnCGxeL75Fk6ONGMQZktiGN3vYF6Vk/otZYsR/5c4J1gU675lHTfysjNUo6hAUEr5pa2i/tyD
	ii2G++4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riB3y-000000046Nx-1e0M;
	Thu, 07 Mar 2024 10:33:22 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riB3o-000000046GK-145e;
	Thu, 07 Mar 2024 10:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709807591;
	bh=/11EFGW9tQtxagiCeplNj5Vb/k8GC/IFhN6UfdT0euE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R/6V83PP5meBuhe9HRt1vcs5Q8prTG1KTb79kb65mqzRycYsq8/8tTx0fmbR90Knz
	 0YcVos1bK9zv8hlHpEhJyd/jjmDei9MRJyatL59R9UsOWnrkU5ephjLmA/DlNZGH9I
	 k4UyMPWEmRDwfpoXVq+ZiIy21vvPWy+x0IZlFtMUfHjYVpw1/pTxyysToEMnkkoWOH
	 Qb5M76eJOqMxkJfOvTnI7yNSyPh7OIU4pWpw0FROKLegE/UdWIos4UgiDfoVxFp8kv
	 Y6UvjgZVsmyVIQXV6Z4a3tK6265ZQrkdJXnazOmuU1OxlGzNCsYCgbTQWTd6c/yv9W
	 Ad7cU9UbGGnvQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 44DB037820EC;
	Thu,  7 Mar 2024 10:33:10 +0000 (UTC)
Message-ID: <fd556d8e-f863-46f6-80a6-4369088e8719@collabora.com>
Date: Thu, 7 Mar 2024 11:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soc: mediatek: mtk-cmdq: Add specific purpose
 register definitions for GCE
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240307013458.23550-1-jason-jh.lin@mediatek.com>
 <20240307013458.23550-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240307013458.23550-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_023312_460609_F0637336 
X-CRM114-Status: UNSURE (   5.23  )
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

Il 07/03/24 02:34, Jason-JH.Lin ha scritto:
> Add specific purpose register definitions for GCE, so CMDQ users can
> use them as a buffer to store data.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


