Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B833C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 15:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzQfrUoDB567BhcrupMhqZRRWj/+kRTaQHZSxeWSgSw=; b=iIjjS3OiBGmhe56aWLVdTGvBfV
	XvsyWqbq78JPrK9WmhpmzF4ZGl96mf3JQjsym73NNpImcUSs6iu9jNHBikYHsQPQHEDgOvZVXw4Ap
	N45CE7kSsOsOwZ3gOoR4aYpGtYLhmiVPZsDLgu/o7qMUJc2gDrVyeC7NQD+bix5kahnJ3Cty3jwfH
	SgfS5wrU1IzMKaF/FuFaEctBxVZAHUWEP3ko9c2pljzly+n6IHlo84nkVaZYWQBoLjdP6TA+BskmY
	RORotwSF336+Vl/k20aDmu7q+fuk3fN8te1JXF2eN+X2un/A5xvkGtf9S9825o0HexVBBg6FMbesb
	6uN7QnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Til-00AbK7-05;
	Tue, 23 May 2023 15:14:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Tih-00AbIe-2n;
	Tue, 23 May 2023 15:14:41 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BDF586601EB5;
	Tue, 23 May 2023 16:14:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684854876;
	bh=2aHgngDY90rcz6eiJl7lXujREWkfwzn4RDYYWdp0Nuw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gad/oaxnevggDfqtWB0MCzKsmih2/DtZujGpBn+dmfSUnVo9N+2RMgcy0Qz0970bC
	 XPmA0kh5xe+HXRYs3y96KITC352gagXoDp/MSRyxd4zssaDQ4U+gkJmkGeyOwjwmWt
	 /pPbGJrsS/YwjEw+6Ifm3YYOOusDhhrs0UKPQxPVVbMRV5KPg5xET2T6OMeXnl/V+j
	 X58xQiQxHRUEiysN0YF5OwKnwlhWrcEJ46sBw7QKzyNeuNcm5y70+NB6QHBEMQCJoE
	 ZjUEEQMJjRIIimIdRwuwi/pv3A+JNH386Bab/E0RIYJ4+SFJoFNyREyGUJ9+gL32l/
	 sKN/fKaIVAIZw==
Message-ID: <bb755ac0-a32a-57f9-f348-d9dd4f0dc697@collabora.com>
Date: Tue, 23 May 2023 17:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2] media: mediatek: vcodec: mtk_vcodec_dec_hw: Use
 devm_pm_runtime_enable()
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230515141610.v2.1.I0d1657be3fea5870f797e975a7aa490291e17993@changeid>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230515141610.v2.1.I0d1657be3fea5870f797e975a7aa490291e17993@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_081440_216602_F4E98102 
X-CRM114-Status: UNSURE (   8.08  )
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

Il 15/05/23 08:16, Fei Shao ha scritto:
> Convert pm_runtime_enable() to the managed version, and clean up error
> handling and unnecessary .remove() callback accordingly.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...but I was probably too late :-)



