Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3223AC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 10:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIVXARwF0b3IfS6I6wrx9Kl+fpIP8oHChbllPVpvnzQ=; b=43Q3xf35Zl2GTupzh0ZHYCjDoM
	WupblawEOUbhmQqVvI/IMM5jbvm41UJaLxu/ezBU6DoVj9TI2685zRk0xoVe0bEvY1RN9EVV3/DGy
	QO/RCSC9V+OnYS+iJodllbeDvW23ym6hLRugtW11P8GcFt+o4nZiZWFiNGDtW5vDRIjmRVVZSu+62
	E/JJoSN8HGjYoGaUrGqI+fSpQxmMXdqfhbcZ20tMAQeEvSTRxbDYiQio45+henivXnKhNJkueMrbs
	J6RQbych/NODAzgKTuGqcn+LINdxkx23tfhlw8oS8W5Xbaxy6KabSgfXfno7RQbuols2Jb/FzNtEE
	Mjl8uo3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wQ1-00DUJJ-4k; Wed, 21 Dec 2022 10:33:49 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wFi-00DNQk-DS; Wed, 21 Dec 2022 10:23:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F57D6602CBE;
	Wed, 21 Dec 2022 10:23:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671618189;
	bh=ifIfjZBJyVbQC95Xu7dvrREMT4wSVW4EPZMKg53HoQ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oPZsL4jWcm/nVl1fp6+GYfg9sjUWBOdWfeadcJm5PUFKQJpEDq/rqm5lqTSo0NNiM
	 SdFxVh6zJjO5+nHevQPRig3dXXfeVRpyu1EJWstg1/Oyb2upYYM1L5J4hQMGEDK0XY
	 L6ueK9qGkPPPk0YI7eewxQ2RTsZKaS2UIHQq+Fdm7XWgh9qDsBJoDh3CglLEDlMjTL
	 bOOxBqGqtKucCcqhx1AzMzbM/LXMdAsUGRo4sGAvOCF8PQcZJX5YeTSQyWgcGK73sM
	 C8GyQ8OBGe8nV9QQGb5CYzqkCLAKBMkv7BiWTsSNKaOi1iFcqB4l0kfbdJuwg8ZnCc
	 VG1WViI/Gu/VA==
Message-ID: <43f852a3-b82f-cd0c-a5aa-bade855ac8f4@collabora.com>
Date: Wed, 21 Dec 2022 11:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 6/6] arm64: dts: mediatek: Add the missing ADSP power
 domains controller for MT8192
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ikjoon Jang <ikjn@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
 <20221221034407.19605-7-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221221034407.19605-7-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_022310_670639_2EA078CC 
X-CRM114-Status: UNSURE (   8.22  )
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

Il 21/12/22 04:44, Allen-KH Cheng ha scritto:
> Add the missing ADSP power domains controller for mt8192-scp_adsp clock
> controllers.
> 
> Fixes: 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192 clock controllers")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



