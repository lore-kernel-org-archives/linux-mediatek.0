Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D77EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 09:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMjJ0qv1InzbsP5bplLav6fImdfHV6jqYOQ7yDUQksM=; b=xm9xOUHvhVDGzI6LkObP/TllX9
	NJul8tY95iWMUXhyn7xxAXrbAbHPJW/QHrGFTG28LAjc1dEQbUe2/sfNRFYK/4JfOfEaRROQe7/h3
	uHWYBnmGqKT4cDzqRDMYTMZomabp9TTgMB79T0wUaw6fnpd0f95RkwzuJIU9Oh5hzv40mwKPI5xq2
	tCqsJAw41wq4P6byI3NiGUXJ/tQgZS4SrDTsSwDON3Eu5RGsksB+hgW05uZSZBc54eaAaS7lJM/an
	OHZZ/xYl3I2T81Mws4ob6h/pLtqR9P4/9MPj12BYMPpef+Uq06nznf7bpA1e9sSlU0Tr/fOkkaW9k
	GXXEqGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGybx-00FKER-1k;
	Wed, 05 Jul 2023 09:15:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGybt-00FKBP-2z;
	Wed, 05 Jul 2023 09:15:43 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 46DA16606FAB;
	Wed,  5 Jul 2023 10:15:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688548538;
	bh=wu7jA7pmNFrTtnaB97p8N+D6KB8AW8qZJUh/GbTvwLk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mmToGDbXW46XuaCj2y/5+tHF03ejlw0AlydzB7tVJ0UAdfgChAh+i46Qz7PK7YYtk
	 CWIdzdcI1R+UDGkEEIpwAQuecrnwkoiWz6z0u/Fq5WiZ2BnXhBZ7TG39Z61p/coL8n
	 GcbIc4/V16mxikzBpOdfvR51UwB3QnUQIsUJkpk7FVfycP7XiR7SXQyWcukXqQokPl
	 mxeNXt+HqgjAIyWsXwMIwCTdK9E2K6aqIpklWLlF5Try5jRrit7N9OVDERpk9Gf5MR
	 POb+rHijsdh/ByFpSMJcx2TwiSDotKBNj/qlr8bnPsQGnR1tMI1pCTWz/QpNhyFTO+
	 I8NCM6qaBDt6g==
Message-ID: <23e8fbb2-c127-17ef-eaa3-2a6193db7f79@collabora.com>
Date: Wed, 5 Jul 2023 11:15:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3] media: mediatek: vcodec: Return NULL if no vdec_fb is
 found
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230705091441.16926-1-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230705091441.16926-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_021542_091567_EE73B18A 
X-CRM114-Status: UNSURE (   8.24  )
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

Il 05/07/23 11:14, Irui Wang ha scritto:
> "fb_use_list" is used to store used or referenced frame buffers for
> vp9 stateful decoder. "NULL" should be returned when getting target
> frame buffer failed from "fb_use_list", not a random unexpected one.
> 
> Fixes: f77e89854b3e ("[media] vcodec: mediatek: Add Mediatek VP9 Video Decoder Driver")
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


