Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B72C6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 13:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1rTPCT0JRH171gB57nXMD2YZ/LVQCyO8TbslkuqCTs=; b=ZJWXCj6TVJtkT1HnbwdcfUTlv3
	D9K7dk/wHoEsI4txWgl8fdnxHOT4NUp4GEnXKDNSE6gvg00lQO6iBlxOdR5s0mJhVj+mz8CZbKNI1
	7ghnI/IS5iVsz7YUD6QTotc8xcRBXZA+hSRn28Ol7O662cuSu8QcbrnM5TYz0RguLmypU80K1+X7o
	D/2muIZ2Z2XDKdfZUQJPlLDwzYO2ltzZlEWSfLLV8lq6fI+Q32DhYd7XFYDoUI3qtaKK4M+4qmXpB
	PmsmWNCq8DhWltdHdZNuXV5fXweEZhijxRSTETgbSDGthobhA0uRREvNkvgWvU9R4Hahv7uBBXKl1
	lu6pEJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfh4L-004R4x-0v;
	Fri, 24 Mar 2023 13:02:57 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfh4G-004R3H-1s;
	Fri, 24 Mar 2023 13:02:54 +0000
Received: from [192.168.2.179] (109-252-120-116.nat.spd-mgts.ru [109.252.120.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8A0A16602E0E;
	Fri, 24 Mar 2023 13:02:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679662964;
	bh=kpqXq6UeGgXsVu6TLQM8ko29kV7748olljvXmD9n2oU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fJhdF/6EuVwtZqtUK9BHmxcGAPcgYm67pizoTOiLS9liSDI+PCTMcPyPeBk8giObt
	 6N51SXsvFnXt++WjdZLVZiBKxkCrEf3urnxFeWOwQaHqT1pxqh9M8a1IxjtCcKhU3d
	 k7MFMRzZ8bzXLYC9jwq5TkCmdptLjCRdWSe/uQlUXSFwpLLJ+5u+GpP+UO16L2DpnU
	 dUl+S4RWnEFc5tSuWFJT1WKLt5N+xstLYPLcN+K3CMNL8f7DKjRxEAEXTsDnaS7aYL
	 Vr7Tog2S9Zg7P9ovovoOE1lojrwScdl3WKEZhgPXKrTnRJeD1wG6PV7NEvTvYlcqBm
	 r1IDDo9CdQSqw==
Message-ID: <5a16edd7-3e68-1f94-0ff1-24668fc43501@collabora.com>
Date: Fri, 24 Mar 2023 16:02:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/8] media: videobuf2: Make bufs array dynamic
 allocated
Content-Language: en-US
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, tfiga@chromium.org,
 m.szyprowski@samsung.com, mchehab@kernel.org, ming.qian@nxp.com,
 shijie.qin@nxp.com, eagle.zhou@nxp.com, bin.liu@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, stanimir.k.varbanov@gmail.com,
 quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, ezequiel@vanguardiasur.com.ar,
 p.zabel@pengutronix.de, daniel.almeida@collabora.com,
 hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
 jernel@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
 <20230321102855.346732-3-benjamin.gaignard@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230321102855.346732-3-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_060252_838586_0B5E1217 
X-CRM114-Status: UNSURE (   6.14  )
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

On 3/21/23 13:28, Benjamin Gaignard wrote:
> +	q->bufs = kmalloc_array(q->max_num_bufs, sizeof(*q->bufs), GFP_KERNEL | __GFP_ZERO);
> +	if (!q->bufs)
> +		return -ENOMEM;
> +

Use kcalloc()

-- 
Best regards,
Dmitry


