Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEECC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 08:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZwFG0RagAT+PCxA3A1Yr8mEeFWVppnLrDl/OFjNdRw=; b=UWMWFnDjEgjJMHFAMJerGvLVTH
	AUz/KZqvxQaIUKrU9JeDc4RouWgRh4uzyLJij34HNEoqKfoEI2lrXSNT4AQcRCfJBkGmMVHFVeb78
	9dVDujS4ntOYppcbs8DL3R/bsZLana9pVOWojSZAVd0NuQUlTaEdXIUGl6bSrV+hWbTtm+AoLUoW2
	buBQ1sE8OA16JwnhEuYI/qSaIOSKcquSCSWYCcRGKu45JOSgvZI4Yg8zgovTdOLr0p7nFaA+/+FC2
	Wd6/VdJMfvUFM+WX+STZvmawlpUQKvhLWHkLmWhdEZnpLHuwFPsm4Ecf5fXM7r/EDyZVhiCGCORuS
	yx25nl4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogj9b-008A6b-Vw; Fri, 07 Oct 2022 08:56:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogj9I-008A0J-Qo; Fri, 07 Oct 2022 08:56:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AF8FB660232A;
	Fri,  7 Oct 2022 09:56:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665132963;
	bh=eQnYDUglnn+OiK5+/TOurG2r3pVBcawFO1+tNo83sxU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FXNiWPZsX96QQWET/TBivzsajY8eR7KlP49kFKdHeWf87uZwErzzCJ7wOFHw2UJC0
	 D/lI/qxQuvIP/jVo5/hB/ueC/hP60gizSgZ0wlK0ZlHijuyMA7OzHzAJ3GP/nF5iDc
	 VVBwf+eeIyYiL5pAfil3Wlkpo3YOOQ8N8H8s4Yy5b/0tBWcY7+ePs+i0VAIhegLfpw
	 w2SetvWQfo9bKobmHUPwtDSM+9MFKOqUStBBNybgC+cWDZtHg9U8mN0N3xe0W/RJiY
	 9QzSroXZNtCweeFGOhTsAKTjBDhjCJK0JmTSevrpocRVzBz2xNpt+8LJoMmgxEDuIG
	 awQIVrJ9vT6lA==
Message-ID: <399d5e6f-009e-210f-1ed5-88fd2aa5d3d1@collabora.com>
Date: Fri, 7 Oct 2022 10:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 3/5] arm64: dts: mediatek: asurada: Enable internal
 display
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221006212528.103790-1-nfraprado@collabora.com>
 <20221006212528.103790-4-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221006212528.103790-4-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_015605_013932_94E893B4 
X-CRM114-Status: UNSURE (   8.06  )
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

Il 06/10/22 23:25, Nícolas F. R. A. Prado ha scritto:
> The asurada platform has an ANX7625 bridge connecting the DSI's output
> to the internal eDP panel. Add and enable these devices in order to get
> a usable internal display.
> 
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



