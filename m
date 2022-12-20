Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A6CC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Dec 2022 09:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDDYNy1b0XkZdjjvrCl09TU1LI7t8HCJqfJjCzs3myY=; b=1JTdgTzO2zEaJSKDcmmfTnlpUA
	5mnyCswYnBzpLnu0ow93EJEn2oD3gk7sfvWpZW0jE6fKSHWKOAo+ib5cG3qeCqBrp9/yBbmFdt1jU
	rYS88iLUvyo7xEgo2RuFYev249wrIY70YrLYP/JpwxOFwXIOCmhW1moXImQcHG9yi7bNtvR1C9UkS
	k+dYEf6dne5za1whF2rg0i8YUsn3eaA/uPFHR4MwrAaskTiSJb2gRik6aLTZ6x7cT5wo7Dk0njfwU
	N50meoQGD7I3Kg43W1t+5w8gwnlcGafzlNXTKTJFsEYk426iqcC5161/KGjudwMqhgt/2FuIijEeD
	rblkcVBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ZBX-00D0VL-PW; Tue, 20 Dec 2022 09:45:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Yzj-00Ctt8-UA; Tue, 20 Dec 2022 09:33:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CCBEC6602CA9;
	Tue, 20 Dec 2022 09:33:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671528784;
	bh=cPmHanQZhpaMeloA4YuqbX9hWdKVZC+OMPtTvkU5JYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AFerUAX+nsqY0zpCFJNHABUhd7thRzGQsaJ1e3iksqpNA7q2ECsP/OOV48yMMOXgy
	 vlubnvMt9E3wx83w6nq66qCrpySpeHwTCHVQ2jm+rLfoJUqE2KPCZaj7rogHZqYPsx
	 IJujvCFNJBWVtVQehIQbo8NJk63GCvSgkORu07Pb4xXrOHzsC/urU30gi5ze+uZsbJ
	 QcU8iXGOAi7Ssmo+18xTj6iYCcl9raHWhfG4MJVCnTxCgfdRESdP8m96+FcrYpFeC6
	 6cqAfbDDasb3QKZYM4QD4JJT8a/68k6FwGyOuu4jts82ExsRCONZBGPv9WwHXZJPzR
	 SmU6VGYJfL+lw==
Message-ID: <aac93a83-11d5-bb4e-f79b-cf706323f47b@collabora.com>
Date: Tue, 20 Dec 2022 10:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2,1/7] media: mediatek: vcodec: add params to record lat
 and core lat_buf count
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221219064332.2124-1-yunfei.dong@mediatek.com>
 <20221219064332.2124-2-yunfei.dong@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221219064332.2124-2-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_013308_231653_E88E2786 
X-CRM114-Status: UNSURE (   7.79  )
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

Il 19/12/22 07:43, Yunfei Dong ha scritto:
> Using lat_buf to share decoder information between lat and core work
> queue, adding params to record the buf count.
> 
> Fixes: 365e4ba01df4 ("media: mtk-vcodec: Add work queue for core hardware decode")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



