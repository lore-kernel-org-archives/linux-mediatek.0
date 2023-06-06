Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6C6C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 07:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKKeIytOLEWonj/bB3dVg4vn1icNcmxi8iThXwpO8C4=; b=pO2zDhr9eib9/ugp//S0pBZFx2
	qTJ3ILW8nldAt9z0v3z/sNXXrfICFMyjmHcSoh/wfNViJEESgs73g662gFuA/cO2JeJrgMDpcwWRH
	09BEQXSSs/8ERdtsN1AB/DImORoqAd/JD2Ui0mV44i8KCg1P/HSu0PXc/QeypRoRwaciQy7LdBXuG
	/wp4UehNM+EPlq5Mgk+fHx7l85nUacM7sQ960kij6gvT7192Ntg+VFQAP8LsBASEaaz3CScd6gV0n
	Eh7xX4YEFkX7+735W7dE3nNz/H78f48YBskxHdd3eKHa4/TqN1nwHOTbY0Pletvgu+D+byzL3EBYU
	qEWsgo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6R7U-000X9a-2K;
	Tue, 06 Jun 2023 07:28:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6R7R-000X7z-21;
	Tue, 06 Jun 2023 07:28:42 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 118C96606E97;
	Tue,  6 Jun 2023 08:28:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686036519;
	bh=sCI6lngnOrIXqzhTxdoFGGgVc/zpGhF+N2dU2WfwsKA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VOE4wCk+nFZhEZtm2s9rRq9asMbsRFoprdD2PLHU+57QeTv4vXo02I+IXZ2kODuWE
	 C+Lc90m5V20NhOEfkcoi5CKb7d9OgughYQ99iYkfoOBro1KP3ygxdi4aIVGQpR6He0
	 AsdQ+f7NaQu263/uH1Wjcl2DbNmxOoJmJGf54zblN2NBwam4mbiUyI4YFlbUVepCzD
	 wmgIXVqiXHJIQUEhxflbtBhvNQjtOUFQ1zKw3Fp+3Z0L3i1otwJLubOZu4ZBP4mZcD
	 xMumbCwWqGgl61oP1Ov8zfFXeLVUZRwkFiW7ng77txFOOn4jkWSwlXYY37bPEGQ7Wj
	 xdMDBcljeNHrA==
Message-ID: <34023365-48a5-3c66-fc2e-6dbce8366af5@collabora.com>
Date: Tue, 6 Jun 2023 09:28:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/6] media: dt-bindings: mediatek,vcodec: Allow single
 clock for mt8183
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230605162030.274395-1-nfraprado@collabora.com>
 <20230605162030.274395-2-nfraprado@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230605162030.274395-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_002841_802039_E0BF915A 
X-CRM114-Status: UNSURE (   7.64  )
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

Il 05/06/23 18:20, Nícolas F. R. A. Prado ha scritto:
> MT8173 and MT8183 have different clocks, and consequently clock-names.
> Relax the number of clocks and set clock-names based on compatible.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



