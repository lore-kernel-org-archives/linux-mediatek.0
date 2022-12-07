Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBECC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 13:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmO7lnNzHgyg/cXMrgR3KZFIHHZxhWuLKqfW27jJVco=; b=bdEJp1TmIbDUD2Dq49ojan8YPT
	ai5Gsrwm6rH6haeCCN43zsISOVY1XJ0Al5RZP+OIEynWAazsV+k5H7ylezCmhZVLH/GduUBAbzPch
	J+A5Kv2ZJL5LqwZg4zWEKjoMohAH/Pc5fx7UEkf3lm/iRN/fEme5/A5Ag6iExsGgL3NYX0j223qOT
	LB6TMNwl7QJl7gRdIP7gcA1F8FidDVuS6Vp03hsgI0pI8ZdipHZ70gmdXVsr0iKOfekTTfpKwb3vE
	fFavhEsQPEQnhyZhFNSWQ4NGgPaxq6iGUDd8yI14913N2pAsGTdJCa/5EWtRcCeqG/4zLt4S8Zmma
	JVdkl8fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uGH-003Cx2-B4; Wed, 07 Dec 2022 13:14:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uG5-003CS6-B7; Wed, 07 Dec 2022 13:14:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 506866602BB7;
	Wed,  7 Dec 2022 13:14:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670418877;
	bh=2iUfgOK9j8JufH6QlNBq2XRKpukh2AkY3nVEXgGhlWE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TqKlv2bzUiItBhcMPlYg9Y/MiW73qhm60Mz8M6aGnOoUdpt3YJwRrFMh7ysvary1f
	 ryypqtp53Zo1Tq/p6NqPGyIqp50S3K0M+pylKbSR2XmdlbAAt59VfEMJu/m+IwHynO
	 f8xzGfooisrc/g8fS4sKS0steGxabUu7T+NueW2L4IdirRDMqFYqESIBvfzshDd3Ap
	 ZxSDAOY7hr6cVsmwiW3fuA1XsDybPGhX2mHnA4JawqhhPT9Y2UZSAiv4ccXOkAsuck
	 eNPzTDoBkwUXcvmPSwe1wQk8ZHttYPKtMnBVGDjQQc00ybJLfoEgZJBXJbBk8JVnVI
	 uEOHa+XFzyg7w==
Message-ID: <1829bd00-4d6c-d49e-9251-e5f42bc40525@collabora.com>
Date: Wed, 7 Dec 2022 14:14:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 1/3] media: dt-bindings: media: mediatek: Rename child
 node names for decoder
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, yunfei.dong@mediatek.com
References: <20221207055107.11333-1-allen-kh.cheng@mediatek.com>
 <20221207055107.11333-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221207055107.11333-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_051445_556330_FA820485 
X-CRM114-Status: UNSURE (   8.49  )
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

Il 07/12/22 06:51, Allen-KH Cheng ha scritto:
> In order to make the names of the child nodes more generic, we rename
> "vcodec-lat" and "vcodec-core" to "video-codec" for decoder in
> patternProperties and example.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



