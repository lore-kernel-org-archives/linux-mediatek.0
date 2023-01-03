Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F02C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnJFlu7AoZbJBlWmy0sCBM8mkBPN6+L5TRCLGb2upMc=; b=uEpTPNGHGwl0JDSGCfu10I25XA
	FaiUv+YNyvQp/pyKxGxlNkRde/MtTRtIO+KhLhbChe9zNhXcysnfHSeZHWUm0P2udlLLeat5SKYJi
	BzhKQgywU49zk7sYXcu98neBBgUkqylulGidjJdMkg2DN4bGug+L7+yzHl1EcF4AXCbkAgNGZmVZa
	BOoFB1Ep8zs9NhT8YiMKEG1Tm0FGSkQC7h6DaGV9ynVrUBtCGcXaGKHJQ9ke2Xlxqur0RlTlIFUzX
	QSyKpeXLP02kBnEpTvmI/KjE4CbbxJp+Gd+svRnm4IZZcpXHoV2a6I7nO/uGECD3NJcQcq304EYIq
	JsjZXOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCiNo-00219y-SG; Tue, 03 Jan 2023 14:35:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCgjk-001LTl-PP; Tue, 03 Jan 2023 12:49:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E391E6602CF4;
	Tue,  3 Jan 2023 12:49:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672750187;
	bh=uwTV+RuPFTuiM9G1Rd+1IMGdm5Ve7ybFHJ9m9GOmMkU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hPf6lXuC6y2884K3PBJkFG0KdFCEwO+eDYwP1Sgj6RgGZUWTvvfwFKxl4M8jeOaHr
	 NnthYuPUqaVlc7b98WMXMu/TI9RZHckcyVkrubjRYXXlvM9E3mZiT7cXg0mh27nVJR
	 oM0eNkUeYOKrK2p+RBjH8HROF2Alb0og+qOZFYf3gZFgkGzsXPBzAc/G6We+i51WBN
	 hs4lHHie0KCh+rV648znwT8Y1aLxI4ffv52DgjPeioNvHyMkblqvHlJxm1LSEAJCX8
	 vaN/QQD/CIa/BqQaLlT442CCyFeNraBUI5JUjyw+NEmG7eTKeawGDou7fWyjOjxXID
	 +5MZIyUJ3uuYg==
Message-ID: <7f2ed4e5-cac7-332a-b975-8782a78961c2@collabora.com>
Date: Tue, 3 Jan 2023 13:49:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 09/13] soc: mediatek: mtk-svs: use common function to
 disable restore voltages
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Nicolas Boichat <drinkcat@google.com>
Cc: Fan Chen <fan.chen@mediatek.com>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221226094248.4506-1-roger.lu@mediatek.com>
 <20221226094248.4506-10-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221226094248.4506-10-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_044949_003187_9E93C49B 
X-CRM114-Status: UNSURE (   7.34  )
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

Il 26/12/22 10:42, Roger Lu ha scritto:
> The timing of disabling/restoring SVS bank is more than one place.
> Therefore, add a common function to use for removing the superfluous codes.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



