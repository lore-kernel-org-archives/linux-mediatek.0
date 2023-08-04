Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D833C001DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 07:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGrDh/1hSwr3pJmv2Agn/SebV7nRrYJNL/2nYoem9Qc=; b=N6LWiZ84vOl+DY29SumdIk9zNy
	7V61a2xSovIg+1fXxgxUW/Tw3mleZWbymuuRd8+9NIBPMdaih7r8s5VbE4rg2KTe02rlCMUDoQTTy
	/3I2IG5Jh7iA/7NS+sBG007RJDSqDdyZX+yAWAuXlngg3Qp0yH3kVYXK6vmbeFH9HlWvxXNjSZWxD
	GSJdUSqYGH6FPEI4w8UlqNQ9WhaM2fWotNJb+ZvCqN+cCp1a6QqqUn8nR4zNDtBK/dl1eTmS3G0PF
	yPSe05r1l2w+v+UK5DQSxwD7gudZ4MaXLwGvMMK5sGDxYGDPgMjeCL+E7coF7+yNyKHdturrqfBXA
	/fwdK0mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpKo-00Bnuq-1l;
	Fri, 04 Aug 2023 07:34:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpKk-00Bnu0-32;
	Fri, 04 Aug 2023 07:34:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B6D366071B9;
	Fri,  4 Aug 2023 08:34:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691134489;
	bh=MXbusVUsaCgkKBWlp45fgfQiAF4swbRrk9BMMk9IFdM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mq+OvgPmNdNb5U2BdRb7h+9YCFOmonTNcfmb6SEl352eZJBvgy6lCgJADLaU+XCtl
	 WufTLrs/KPODEoOh3DGPz9FIquGjpms8x2+u4HGNluiFQy/JrGOsaW0moyx2K8blAl
	 JRfCTTMp7PR1d0+L5mRmITZVBr/LPiCA2/YqiNIiCP5yBBhG87GX9+s9G+INO61gKD
	 TjAD5qYOFB4GT/3YJSjTUq1C4JCpvfrlzuQtkupYu2xcXhWDpBPvZSEBXn2FYyNDFG
	 Oa+COXPZh0UOqoai2z7nwKLu28ihrwj5lLmHfr5deUKt0wiAz8w+nH8EegePDa7fTO
	 D8DPraXxpCHPQ==
Message-ID: <52744f4c-9344-d49a-755a-cc7f7962bc9e@collabora.com>
Date: Fri, 4 Aug 2023 09:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/4] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
Cc: Phi-bang Nguyen <pnguyen@baylibre.com>,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>, Conor Dooley <conor+dt@kernel.org>,
 daoyuan huang <daoyuan.huang@mediatek.com>, devicetree@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Louis Kuo <louis.kuo@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>
References: <20230630100321.1951138-1-jstephan@baylibre.com>
 <20230630100321.1951138-5-jstephan@baylibre.com>
 <0430ddab-6a6c-9fa3-95bd-05ce8ac5b94f@collabora.com>
 <iq7jffjeaejdfb26a4ysjgjzuopov4ji2ecgzmv4563tdveaep@hh2gzgzkbdzj>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <iq7jffjeaejdfb26a4ysjgjzuopov4ji2ecgzmv4563tdveaep@hh2gzgzkbdzj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_003451_108569_E1B6AEEF 
X-CRM114-Status: GOOD (  17.23  )
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

Il 03/08/23 11:53, Julien Stephan ha scritto:
> On Mon, Jul 03, 2023 at 02:21:17PM +0200, AngeloGioacchino Del Regno wrote:
> ..snip..
>>> +
>>> +	mtk_cam_init_cfg(&cam->subdev, NULL);
>>
>> mtk_cam_init_cfg() returns an integer, and this is probably because you expect
>> it to get logic to fail: in that case, check the result of that call here,
>> otherwise, make that function void.
>>
> 
> Hi Angelo,
> 
> mtk_cam_init_cfg returns an int because it should match v4l2_subdev_pad_ops->init_cfg prototype..
> 
> mtk_cam_init does not fail, always return 0, so I though it would be ok
> to discard the return value here. What do you think?
> 

Right, I was thinking to make a void __mtk_cam_init_cfg(), but as an afterthought
it's just better to leave it as it is, let's go with your solution.

Cheers,
Angelo

>>> +
> 
> ..snip..
> 
>>> +	unsigned int bpp;
>>
>> Can we get any format that uses a billion bits per pixel? :-P
>>
>> u8 bpp;
>>
> 
> I am preparing the driver for futur upgrades.. in a billion years ;)
> 
> Cheers
> Julien


