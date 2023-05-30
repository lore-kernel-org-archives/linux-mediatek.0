Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62A7C77B73
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 10:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZM8CczQsSalAFAnumVf7sHa8Ia2xbK5nVFJBzeV2tc=; b=iJ7EHMQTAG039K7PNMZr5wFCWd
	4JQYfBN2Sc8LIMkmkACyNJU8Bv31mg1GGENhfOgqXxGKFheAOu/2aPq+hHG9/vkRzjksl1PcXFzll
	Ld8or6LuTbL2aJizMNJkU8lWRttuN4ePHYSpgPKoh0gGpoDXPN7qLO6924AZ2C9k+lWoqF3rrIYWB
	fZTmnMlrywjFmythw85lxTDZ8BGW+ehX6CH9Tbkd906NXbn0bXq83HoRIVTA+O8pl+2KpqNAzXy0F
	Hzvc1dXaTtt8p47lOndqSyjPiowZTQhj9Hb0Xfbq1xZQTkbjezlhUvfaaSDfO1FYw1JX4CZETlo5+
	xVQd8lKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wEs-00DIkF-0B;
	Tue, 30 May 2023 10:06:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wEn-00DIiA-1T;
	Tue, 30 May 2023 10:05:58 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 109156601F54;
	Tue, 30 May 2023 11:05:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685441156;
	bh=AZ184lm4DFK2T6MKQmesqJJtsTeSZhaeVIOOM3dp9z0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ae4twUX/nzJABQDkveTl1edb3HwoQKq2r4rTJ2pipXJ74hk20r9W55vss2+cjxlzQ
	 OfZkRaNpTUHZgI+7rTMtkPH0Ni5XdoliIm4r+YiYuEDX4kjxkeYdFy9HSbN44ehOPL
	 XrZtCNvRQxX9WePNkBdiO/MRY45DrwjJxB4cd/5Wb5MsQhGwzOGjeo4WkYD0n+LAle
	 N9Ke4lbEODytoSlIzolpyoskj067UnfhPeLT6QnqZdVIVbPyKYOtw5R25h/uSdUbJR
	 ilfPdvcDoHiNHFTCCCnI7gk9mTxjUScxAPNQPBPJntBWByj1XO2tn1BML7rdkya1FF
	 TkpbQTJU9D4qw==
Message-ID: <7e83e62c-bb53-1b57-46ca-6d1e2e35aba8@collabora.com>
Date: Tue, 30 May 2023 12:05:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5,5/8] media: mediatek: vcodec: Get each instance format
 type
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230525021219.23638-1-yunfei.dong@mediatek.com>
 <20230525021219.23638-6-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230525021219.23638-6-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_030557_673510_BFEDE645 
X-CRM114-Status: UNSURE (   7.44  )
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

Il 25/05/23 04:12, Yunfei Dong ha scritto:
> Adding echo command to get capture and output queue format
> type of each instance:"echo '-format' > vdec", not current
> hardware supported.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



