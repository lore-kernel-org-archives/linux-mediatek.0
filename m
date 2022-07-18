Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE0BC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 09:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/U1T3QL6WSfczgXAeuZeC2uroSxKpDzy0eSpL9j/Y9k=; b=pAvpHZDva7G1704g3Xoozk9UjK
	f78IOsl/qVEyeroNnSFr3H1NVfropJAs9z0Q6EtiZf8BowAzVcCgqwFO7/QMJ0DOyWrcIbP5KlbAj
	Fh7CtWZe3rIpJWerZ/dO4wHpHVsWgNshn5J1nCksW3pNj9clxW778l8TQ8aHFKnPuBjU8pfMECYe1
	IDcUC9PqmDh8OuW3G94scY/vL5SOGbX9n6WFD7mucNKKnYUtBJyCVmoILERxwB0sONxEjP87Ku3ah
	yvNdWhdedxIJ1InnwINZmiAM/v/2DHrTvZVEpR+lU4JI0efbqsigCUZ0JxDW0CBQ6Te/1ditMdcsk
	6Eg0XeGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDNSf-00CHrC-E6; Mon, 18 Jul 2022 09:54:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDNSQ-00CHjR-Px; Mon, 18 Jul 2022 09:54:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7151B66019EC;
	Mon, 18 Jul 2022 10:54:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658138069;
	bh=730F5cDo9gbvK3JLLYRq51ZQ/6vn6ZWi3Fd5hPgUBi0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XQ38RAsgcAq0F9lmw96rWFo4or6eZKty5Ykii2WvIa+ZyouuO+YEK1Fn5dnQQ2frF
	 c71p30E7qONWGb1Fc0M8ZI286D/Y1XcD5vz/A3I48KIrVhEmR6uW6+ZxziLRIeBABO
	 0k+X/9kgDkYTYlnUKtRgZC8LOql6oI0Zwlk/VsnPwL9ommCMKfNB1lzhZCzcjJREIs
	 TGhidwf9ORPT8M878DWh9W/PIFP3LMQNZiEhUcB+rZEZlTZv4XnQ0Vh7YWJH7UN+4g
	 JONyjTpOCog22tYNWlxWyIvvAvhEi+zx659mGkLfi8JqbFHR/mgX8AU6estiWoQCX5
	 ZW5peooyulStw==
Message-ID: <9075358a-cdba-fc91-1940-d78a9b58bae3@collabora.com>
Date: Mon, 18 Jul 2022 11:54:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/5] media: mediatek: vcodec: Fix encoder multi-instance
 deadlock
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220716093808.29894-1-irui.wang@mediatek.com>
 <20220716093808.29894-6-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220716093808.29894-6-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_025430_999790_1D63B46F 
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

Il 16/07/22 11:38, Irui Wang ha scritto:
> The vb2_queue lock can be set by encoder context, the deadlock
> may occur when running multi-instance encoding if use device
> mutex lock.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

This needs a Fixes tag.


