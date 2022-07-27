Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636D5C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 09:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfUC97IgNueY9V+VPx1DghfeYgSR89ZL1oaDA3jd4f4=; b=bMQ6Q/I0A2kDo95YfSKdb/Z7Ys
	83rYT/rEJ87mUK9C5+JRKQxy8j/V4MPHG08rs+47R5UaM9wiJ6v1cuPNIob9luIzWl3VwSMc92EWl
	dazB+CdrIZ4w9G5SjE6JaDusvtrff6e82ntYbVYZzr+T20YJgjAHOUJYg8oJVTlzBUsPxYasjM9So
	QBs/lvKM0xXgjUAvJ2aboXAr2frF20juKpCCYNaguO69jsp8Q3ZUNnJinlLWFJKqyPEI6bZ97ONEP
	7rm7MwB7wJcNs6l54FmPPLGoSRnBujkXzFz8/w6gk2MNbFRPh/3qrdiA2OOVe3IPwQqc0tlBxixcf
	/j24nBDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdRH-00BpHj-43; Wed, 27 Jul 2022 09:34:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdQz-00Bp5q-Tm; Wed, 27 Jul 2022 09:34:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B29B66601B20;
	Wed, 27 Jul 2022 10:34:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658914465;
	bh=re1AAxEYmTd0QiwLwExzRHmr/caYRFR3LwatCDthflQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ifcai99apGuxDyGJyBX3PBhR56PMkciZfnPA/j/IaDAAfLzOTUBMbcbEq7eA3p0CR
	 Ryv/KPtT9FvopGSPbjlVdUWM6AUmnzDH6BWY4BrM2JUeQWVgm0sEbGZJkjz7P22MWb
	 AkNbqg3G6pErGj7FRTvFLxsbRk1xDw5v/Y7tEpYn0CQprTQxNsut+5+/2g+cA6/bt5
	 9vsYzBrvvAFdYEGI9jjA9Ygvj0nvTxe5Gib/cJdmCNxkp8L5Pdwg2+uNk1SLtiS9qY
	 VGQusEg4pgNW8isGfPTzyLDsAdvFtNY81SQodUpnkdLQya06qhT/pRzenFr5Lk5dAZ
	 OyVrLNXKg5nEQ==
Message-ID: <936f416e-2141-ed33-d0e9-33becfb46ba4@collabora.com>
Date: Wed, 27 Jul 2022 11:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v15 03/11] drm/edid: Add cea_sad helpers for freq/length
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, liangxu.xu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
 <20220727045035.32225-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220727045035.32225-4-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_023430_131656_010F080C 
X-CRM114-Status: UNSURE (   8.85  )
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

Il 27/07/22 06:50, Bo-Chen Chen ha scritto:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> This patch adds two helper functions that extract the frequency and word
> length from a struct cea_sad.
> 
> For these helper functions new defines are added that help translate the
> 'freq' and 'byte2' fields into real numbers.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


