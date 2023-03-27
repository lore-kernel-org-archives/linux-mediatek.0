Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E241C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbPRik7PsPT3Pg5bbG0g2fvlHkSWXRquJmub7qTHLEw=; b=pdX6sj7ojUd7wBqtvasCTfCqgE
	3PN9XZmPa29nOtK091x+eWDjUHgH54RMJSafVhN8YbSvsErtERJTzxbTa3knNbqawedk6dib7i4Pv
	3Vqn1WhNPk1UpBhed308+yD0MAufBhUO7tUwFbskzwe5rYR/1NBrFnoksuwdk8i2BDi0K8iJARohw
	VHPsxMBPZPO601+ktq4+AQYqP9W4Jdh/Y3PIcCHOZC8OyaNzrcAIMDsRs+i13NK6pGo9f93d2KA/5
	5C5N6DzwVtzT1AwgZBcE3uOHKm6d5fLWyuMwUjQPViC1OCQBFIEw2yeAhV408Var0mIY88R5fbciG
	srMOlHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgi3M-00ACZr-1G;
	Mon, 27 Mar 2023 08:18:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgi3I-00ACYG-1P;
	Mon, 27 Mar 2023 08:18:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EE6656602087;
	Mon, 27 Mar 2023 09:18:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679905082;
	bh=+LHrAgr98tPQlFcXJ+Phv959EtKS0f5UIBT/AhH4Ef4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GErYrF/xA+2RUzBCTRyjBeurydGdT3hgslzj8asq+wY88q4Mr7T0gmHa/cFwIxgg2
	 jrENwceiNIf1BgjQVhSBOAsjAjBVegFMxyLnZCoWjoS+nsdGEuNE6jmnNRD37VmVwJ
	 Nxtzp9jKOIspER9mGp6YPYoIO/O07wp3ZTqah+e9uhe80JgZEaB157VsVU2oQLZYxZ
	 ybehftUPzKy4vHQ4vlycsQTNGEROOc2l+VlJSmTgae2JFZIcMnrRblPk5KlaZY0UzH
	 JS4FyQJn7uqph3Z11SiO8i23heOpI+mkjoOOGNB0vcGPb8ZzLX3BA9zU/CK1GcTdn6
	 ojFsk//N+gDUg==
Message-ID: <3e9652ad-1fbe-9c55-dadf-931ddb2e2a54@collabora.com>
Date: Mon, 27 Mar 2023 10:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3,7/7] media: mediatek: vcodec: Add encode to support
 dbgfs
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230327055315.13936-1-yunfei.dong@mediatek.com>
 <20230327055315.13936-8-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230327055315.13936-8-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_011804_608384_82048ADF 
X-CRM114-Status: UNSURE (   7.12  )
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

Il 27/03/23 07:53, Yunfei Dong ha scritto:
> Add encode to support dbgfs.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



