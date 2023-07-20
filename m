Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8EAEB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/S0JE6N8XqTJ/428vSeaNCOpupWCrmYxXVI497Z11K8=; b=BTFQONYk54hDUzEbsS8hkTUuKF
	rku2W+RrzdIae0WhfGOGxAa4uFzsGahK8pqE+wwb+q1/QMjoCS0b6VvV4mpgiBwHg1PX7lw5q1JxJ
	907+O1ooLcHnlXBGJiGutseqQ7ejZFj+iR6q80hhCtDB1ciFmUfZYBGvdqkJAF8EgyEBEko9sBn+G
	Yh6WkTFruUaprsj7Hye7HMa5xTQ+IphqkFtnHLfZ7Une/a6B5r9Iw+jZIeMuAduazhW6r3nLPJ8xs
	FJNb19sdBm9xza9WBRYwiQl/fgnH34bqgGZcniZJCXgvMOpsUcGoYMN3uWD+e1mCwWsgbP/Il/89b
	wTRXmIRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPxg-00AWkN-2J;
	Thu, 20 Jul 2023 09:28:40 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPxd-00AWjR-26;
	Thu, 20 Jul 2023 09:28:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7EAC566003AE;
	Thu, 20 Jul 2023 10:28:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689845315;
	bh=/fmhkfXqLxYUE88SAwWdEzOCDwmhfmSVE7H3+k13wsQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CAIkKnCCw++xNSk6DMeMVGTtR6LMHQ4LluzEJvw2CK00Wzo1+JkP2H0FhwccOgDc5
	 ZdbPuhbjQmlI++UJRcoD9LJYHOUsYizTGB14Xe9N8MMoktRVBbTc0TDrdKmgB16WH/
	 fzY23holXcJydzD+tq2bbCuYwVJDGsq3CgTP6T7KbjMaePjpip0Gnjryqb+BvqYuOb
	 2+flXGYL34ONytFH75GxR6+mqGzOMPX4V49hqv++uCWR5ilkyR7Us+61Qm+8+JQVzu
	 ajjOohlVC3rxZPVgYM5kw527tiWR5nBrmTBpohwfUWMbevC9oVEvzY4sl2uV/sCvwb
	 eH/v5iUL1G/TQ==
Message-ID: <faf44774-624c-b29c-8661-60dc1f1a0457@collabora.com>
Date: Thu, 20 Jul 2023 11:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3,2/3] drm/mediatek: dp: Add the audio packet flag to
 mtk_dp_data struct
Content-Language: en-US
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230720082604.18618-1-shuijing.li@mediatek.com>
 <20230720082604.18618-3-shuijing.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230720082604.18618-3-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_022837_853376_4B0BFB39 
X-CRM114-Status: UNSURE (   8.01  )
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

Il 20/07/23 10:26, Shuijing Li ha scritto:
> The audio packet arrangement function is to only arrange audio.
> packets into the Hblanking area. In order to align with the HW
> default setting of mt8195, this function needs to be turned off.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



