Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A36BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cE9b41C5cW5CRhydcP0WnB8Gcm71f+8ZsZIGdjKUMag=; b=iv1C9i0rJHTKxog0kFwAcPBPPV
	cIq4FbG4c2oZZEhbDjZtSW773cbC+60oTs72QENFCvU3+/5+8fIQHssD2KFXO5ztTlujaZk7/0Lrz
	tWqo3/E693Z6jJaz0hHx3GDnX3EU2p6C16/LRIVHQ9bE9tzhYTwu6Sdj90rqK2VuUrbnsZcpRur9d
	F3o11sgJftUfESNBnkIZBm6wM56Asl9v7Vjk1cUyC4hK9ParBqwsrJvUlz4gR4wSP0Fq2T/jZvr8o
	q2f5640AzyuSesT0TnjqzRtLbkx4iOkJkpgt64OIX7RzuSht0ofwxUaIaQpSE/qpgA6h5H5BV+AHG
	QF/c9snw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXcn-000MYU-Sp; Mon, 14 Nov 2022 11:27:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXcU-000MKp-6Y; Mon, 14 Nov 2022 11:27:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0803D660231A;
	Mon, 14 Nov 2022 11:27:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668425237;
	bh=W/eMVrR11Od7JZQCct4/zNx543YpRujvCd1hkqUVrto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YH7HOET2OGDnH9Ejq5lOpu8GEWIY+WF+wgZubX3ZPpImi67vzoJ/ja3VorAQX6yZ+
	 xiYXXOpWOh9xBIev1mj1JAY6kMrRwZwYlZMhu1FhYCIqbnAmtsVq84bwrlqjNqnOqP
	 XGXW8g4gr/b55rrs1GUKxxgPZwCltj4H0UWuSWPjLSp4n5/bUJRH3hSImI0d1/4yks
	 PtZ3g8UpZYoXd46cEF6l53gE6bO3j5MTRjkGDmIeKWYwBGSisPMr/g1Ch87OrsERIB
	 JYdS0z9Uzn/9CfVmvbuAUAFxl6zkfF7BbsOh2tgJb/fZtDCLIpfTHuVjekQWgkRZEw
	 aP9ckstRxlLSw==
Message-ID: <f809c518-a1e1-40e2-2f52-176ed08da701@collabora.com>
Date: Mon, 14 Nov 2022 12:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 5/5] media: mediatek: vcodec: Core thread depends on
 core_list
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221112094144.4256-1-yunfei.dong@mediatek.com>
 <20221112094144.4256-6-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221112094144.4256-6-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_032718_399231_F144A910 
X-CRM114-Status: UNSURE (   8.66  )
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

Il 12/11/22 10:41, Yunfei Dong ha scritto:
> Core thread will continue to work when core_list is not empty, not
> depends on lat_list.
> 
> Fixes: 365e4ba01df4 ("media: mtk-vcodec: Add work queue for core hardware decode")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



