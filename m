Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043DCC41535
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NWt1WKEK/KoHEZ7wq7TIMjD1tJweqcb2ehZOKVdjNE=; b=fGnYoXsPA9rRkKifLXgqyYwyOa
	1UkdwPnTIYZZqSXtLOJ645YUtca2E1v4AD3/qy2PG+rz70MIm3gXclkNNPtqs76J2XMCCBasqETe8
	7Inq0nQKZi32hMJGDeXft+ujz0oxm70eTEO4wcAQSi9kykyV9KSIasGWQIz+jishHY84l9ZnXhgkD
	p6V78GOpIRbQQ4QQQZpatGLgxIj43HjXGf8mCOU+PGbpJSXEF5c8X8kITyR68c8Lyjg2gUirlo980
	2nwl40rJYUBQnsrVMISfOkC1Iz5UpRmVsT9keoh748BxzTmHHdc5Cqj9UwZLKFo7mF4s/o4nLmX15
	xBII9WAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyY-00GfJP-1r;
	Mon, 06 Nov 2023 12:45:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyU-00GfDi-1s;
	Mon, 06 Nov 2023 12:45:03 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D334C6607485;
	Mon,  6 Nov 2023 12:45:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699274701;
	bh=HMBID2wavTIzdRH2nqkYR05h/eLJ8dQzC78ntnNIf8g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NOEDbqU4dykw5RVCGPDw3pdB8TohBlEdlcAyK5HyIJvoxplxYZmyEv3FNxzvkjpnC
	 xWlTmHz1k8X9/cFCVMObKDgtcohZmkTe3bKgya2yMoCG5JLDxGqURpJ61IG4DHywcw
	 yq9cDWBgUm8pyx9T+4Vp442g+9r1hSulVTHaBJXXo1k6X04IQvoe2Un1uugJaQv0LB
	 9oIQfmXhFTZMo52NL+vXV+Wu0urZ7ZWNVjVsAh9mrhaoJ2dHTIMt0kq2LksFDfvuw7
	 OtxgwWurEN0PvP8oHzmWQDWmw7yFixosYkn2SBtChtCg9piV2CiJZ8l4/n57Tmll6Z
	 0mylws24MJPVQ==
Message-ID: <ee0250f1-007f-4b02-96d6-c5bc26da9c8b@collabora.com>
Date: Mon, 6 Nov 2023 13:45:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/12] media: platform: mtk-mdp3: introduce more
 pipelines from MT8195
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231030100626.12564-1-moudy.ho@mediatek.com>
 <20231030100626.12564-4-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231030100626.12564-4-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_044502_792039_00302DE8 
X-CRM114-Status: UNSURE (   6.15  )
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

Il 30/10/23 11:06, Moudy Ho ha scritto:
> Increasing the number of sets built by MMSYS and MUTEX in MT8195
> will enable the creation of more pipelines in MDP3.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


