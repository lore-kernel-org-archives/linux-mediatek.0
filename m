Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1987C77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 09:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFLkdQxQwIy0kwyYHkCouJTe4tR41JTRH3lRK0CUzjk=; b=Yd6xUQiwg7Gqy7hKdat7J/XWch
	8t5KU3vlxfwlVGdzIjRO+Sq5bqJzo89iEHGO9L+A1hxHg9z/Pf55d6A/uOBb88BwFPLPOOUzvt23M
	m9e384maW6aUoyWMMx9MVj7MI5ThblnWxLLjPYBusDBH02UgSoDbBxwFxBtyD0KmCC+JhNG4HhaQ0
	1jpSpNp3hunwwKuwXMyfmCmv2TCw4bkA3pFIS2fYk7ifVkMyRh4cYZuJfrusls5cU8BQ+ikFqmzSV
	W7VjfzelZvHiyeG3eK93BCJ1eL81ejXq+Wn6qtfMt7rxIl6sREYQCJ0tKP9FWqttPCSzT9sdkC2oV
	lSECZ8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poL0D-00FV0f-1Z;
	Mon, 17 Apr 2023 09:18:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poL08-00FUzN-1T;
	Mon, 17 Apr 2023 09:18:21 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 115E3660309E;
	Mon, 17 Apr 2023 10:18:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681723099;
	bh=B6LbGft4HxAIqoilnk5IC83grPCkk/Hif1oJBGNxpWU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jebdwN5kgEG64iYOCZj683+YGj3wMzGsaamuIPbrw7rTfny4mghm2QLnsviE9sNuV
	 TLUfGHqyQZvtoMVtvnjYLI210dt4ZZupgQ0WHJNrgBpnha92v/5dx251GIkO1OX38t
	 CLR3CAd1YLab+xYyY5unuL3GgDAMKU2eJvGZJhyJy1CeUMoGD33aMXhW8OXH2n77je
	 vjNudg7KXB/jWsj5P96Yz9zvgxRzfad6MvpYtv3+vY4KEdvT3P2tNs1gi4K7tMgMv0
	 ocBThx1DCx2vT6aSVt4XK05xHxlZA6zO2heIV19bFQBN0FUNAUmzd/eFH9Xc+fb1KX
	 fEEdYW5UOdqrQ==
Message-ID: <37b56f69-99c2-adf0-cc9f-572fbdaa2eee@collabora.com>
Date: Mon, 17 Apr 2023 11:18:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/6] media: mediatek: vcodec: can`t regard getting lat
 buffer fail as error
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
References: <20230417054816.17097-1-yunfei.dong@mediatek.com>
 <20230417054816.17097-2-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230417054816.17097-2-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_021820_627483_31598EBD 
X-CRM114-Status: GOOD (  10.07  )
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

Il 17/04/23 07:48, Yunfei Dong ha scritto:
> The speed of lat decoder is much faster than core, need to get trans
> buffer again when lat fail to get trans buffer.
> 

The commit description is misleading, looks like you're doing functional
changes, but you're just changing loglevels... and the title is also a
little confusing, so.. I would propose:

media: mediatek: vcodec: Avoid unneeded error logging

Since the LAT decoder works faster than its CORE, getting the trans buffer may
be done only after CORE finishes processing: avoid printing an error if the
decode function returns -EAGAIN, as this means that the buffer from CORE is not
yet available, but will be at a later time.

Also change the log level for calls to vdec_msg_queue_dqbuf() in H264 and VP9
LAT decoder drivers to avoid excessive logging.

Cheers,
Angelo



