Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840ECC7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 07:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UFD7q1285R3v7c2IOqDds9W//biiLvlFZ+sfj2/bcg=; b=y1AStq1H7sbZbbG6HrwqoaEfde
	VpCeGyyztYV7AU/cMn1Dj6P5GSQnbtR0SvmO+r0ABQwnpwznqJluE7DgCrPR4OMFlCJe20tmCRAnF
	PSQk7HQZcXDaxaCoghd/TPoiaFJT6Ddk2NM06+Y2S2TnBxN0NYdTjaNcdu55lDvoT0sxerYaddu+1
	I3LS1baN8YN9A8KMwRe5pHbQ5JxPNwr/9ed0GE6p8RnAqFJ+hbnleAQScNE22GnJP6ypt0ToXVjBK
	7ZNVd89jAeU38VDxpE219VqKrVaDxorGGAcd3ZMuDlVB18KI7mio7SZ2BLnTma0fKuB5m9zPN/Lcp
	zbnzQhjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q64lr-00EZEX-1D;
	Mon, 05 Jun 2023 07:36:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q64lk-00EZB4-0r;
	Mon, 05 Jun 2023 07:36:49 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E77F966056AC;
	Mon,  5 Jun 2023 08:36:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685950605;
	bh=J26N876qhqy+oXA3TrC9yeaPT4WUXxr7qA4zM4FsXpI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C2Z8ZECKZYSjFeJAZIJBBJWYXBQyp6GA2qaWGaPe31T4lfmm0heMZlDDhQTMFRAqV
	 fu/4W/fDYFbfetIQ75qFnNS6pzkVkFQUPpuh91Bd2j63ZgjDEzIZP8UYRGawdFJha8
	 YVhsahztRL0lLB+2bM4mVPJXZrVAhMfauyYJyuo2KVPAa0+BdwmCDsyZjpGJx2og/m
	 d/Az85yPA0enqsBsyOYxaw393x3T4khEPuDBAfbGTSD7hmp5M/SpGf7CP8ZmTSzBdo
	 ZguGSRDoVXKOZhO1cy14G9mbJY1eg/ePsVdfgxiZ3HDCQ+ZLe5vkG7YajM6YIaCEaC
	 ighBEFtWA7KgA==
Message-ID: <1423b370-6212-7f19-3db4-a70102bf615f@collabora.com>
Date: Mon, 5 Jun 2023 09:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/2] arm64: dts: mt8173: Update thermal node
Content-Language: en-US
To: matthias.bgg@kernel.org, rafael@kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230601134425.29499-1-matthias.bgg@kernel.org>
 <20230601134425.29499-2-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230601134425.29499-2-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_003648_432574_3E1F4BB9 
X-CRM114-Status: UNSURE (   8.89  )
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

Il 01/06/23 15:44, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Following the binding description, update to use
> thermal-sensor-cells = 1
> While at it also fix the node name of the CPU critical trip point.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



