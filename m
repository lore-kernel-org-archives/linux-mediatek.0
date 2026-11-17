Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672CC606A339
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N4RXUU1t;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=H5wPKqgA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CboLC5QSvHLts6ZlQcICg7LChxHmvhJ3KQ+aPxCl0PY=; b=N4RXUU1tTKAu4r
	Jx5hGrBvhEO/yvw6JLNJMto45eG4p+L7PPl1EEdpmZxsnL8euVNThE1HrYMOt/84BWT0Y9DKn8Ibf
	tH/RLqset2WV6+cR9BPfC8r8GOybe36tZwdzC83LzmukZYuZ2OoPukBJv3P8DmChyCegl5FPzhz0W
	RA/G4eCYbRXDgWYVZA68PgjSuU2sCnVEOeAn7O4COfO9hGHlTufAtv6jtyPG4CVsQSPvloV+M17dy
	yPVtQK5lmrn/fEhOrugvLFU5tomV/ZbScY92ScOoEF3rFPHH8agBGoyHV2seBtu6J73r7WwvMl4o4
	A9HAfHUbcJJrKf8n7fvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHQr-00000005SGL-41Zw;
	Tue, 17 Nov 2026 11:33:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHQp-00000005SFE-0jI3;
	Tue, 17 Nov 2026 11:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794915177;
	bh=YgsE1D4jE1y2PCk2DdaKnIk1JqojvotIfqG4VkxS+ac=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=H5wPKqgAYr/7V+t/AtyledjUHXdXfGpJR62CvwPIMojQMtYaUx4UA/6xCY7iWKZ+q
	 T8NthVONRC+6N1+jB+9CjDb7Nhpqaz4MOK/iI6nNxslaHXpgFhqGaJgPNJjLygMZ3g
	 OOTNPG4BoSw+t4Aigf38kw1kmlaNSyB7cTh3maYi3bmy7pVBYe52dqsTF9A2EpvlrO
	 HnM1uk/fJjrCvV6+XZ++keCUP56RRYpsH35qnYhBgq0734K0aDg1qdr6Nu3GxCcfqh
	 MkcKfWYLhwlsYgxcHB8OV+jBX9J4NDoXmzS3NG3UUMfjW9zahTBHTj6MU619ZjjnKG
	 Q2m1xKugJzhFw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64C5817E04B4;
	Tue, 17 Nov 2026 12:32:56 +0100 (CET)
Message-ID: <f738d2c2-5e3a-47a9-a499-a9ee284f92d1@collabora.com>
Date: Tue, 17 Nov 2026 12:32:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 05/13] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
To: Kyrie Wu <kyrie.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 Hans Verkuil <hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
 <20261116013402.1273016-6-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261116013402.1273016-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_033259_390080_60A0E3A9 
X-CRM114-Status: UNSURE (   7.47  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/26 02:33, Kyrie Wu wrote:
> Make multi-hw component devices own their clocks and suspend callbacks.
> Keep single-core clock callbacks on the master device.
> 
> Stop new jobs and wait for the active job with v4l2_m2m_suspend()
> before disabling component clocks. Runtime-PM references keep clocks
> enabled until job completion or timeout.
> 
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


