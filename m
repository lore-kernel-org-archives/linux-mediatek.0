Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF529C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 13:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20Tas5GOMFm5j7Vy6wo8j3W5tppdj+LZZNN4a4V1uKE=; b=Xoz+CQEb0rZf3v
	Y76/2Vh5uFGZQcPbYqVObkk6McfOW3F5iOdXkGQME/nPZTM2OyFAh5bcCnN5NaMuMMKY7EmaFpzRB
	zmafNngFk9h062yjNdmwNgvBFyHqKa66ftnljwqymWLux9iDjewxC1ZPxB4K95HCSsDAF5KyjeEOM
	nsJJyzXSXdtJKxsRODNl7XbZzSeRp+Cx7k5v8Gn2hPZM24FXR3Vux35LqUzfz7tkgK/9qkeAbrQqi
	803jRmWXuwjeud9dFOX6CvQmV7dgzleGtK30MMh7x1ji5k8FZ07UHvLszsoxWep32aNK9+2Sg+nRv
	L0E3GtDhLjNXYlHPWWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngnUb-003ggQ-Sm; Tue, 19 Apr 2022 13:02:05 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngmMk-003FoG-Bo; Tue, 19 Apr 2022 11:49:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0A8C71F42295
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650368991;
 bh=Pi7GPCmSvHdvR1Ecs53jheIVCw4lXdkX58W3D+whacM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ac5VlRksWcTJyr755h6mA9syvqZNifNIe88McjmaqzoZuT+dnL7nPx4We/fmgK9lL
 1KnGmgolPgLqN8VFxqsgd8Q0xXQ8td7NJUP5JxKkXg5F+2Zbf8bnzWBXYG1hwJZaqQ
 HUOsdCFS7klx/ip9rUV7IRxygaCBFeaT94rJpmi0JavW6ufQ67WPN0RNkqwLQonDv0
 maETNGQHZRySuiOjgNbpeE0xeujfaZIZDMphlddPQHikUDzdXOtmVQ6yB5H3abJVX3
 CwGOdW0PPgvxkdbv64IdxEz+KElMTKXO1/ac7hCPY/Z+gk00E6QMNJX078nBLQONN3
 19A2DAiX/Np6g==
Message-ID: <aa952c27-0ea3-19ac-3fee-eff48b920985@collabora.com>
Date: Tue, 19 Apr 2022 13:49:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: mediatek: add
 firmware-name property
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
References: <20220414122140.6114-1-allen-kh.cheng@mediatek.com>
 <20220414122140.6114-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220414122140.6114-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_044954_805245_06361137 
X-CRM114-Status: UNSURE (   7.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 14/04/22 14:21, Allen-KH Cheng ha scritto:
> The SCP needs firmware which differs between other platforms and SoCs.
> Add a new property "firmware-name" to allow the DT to specify the
> platform/board specific path to this firmware file.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
