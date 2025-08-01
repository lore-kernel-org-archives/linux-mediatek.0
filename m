Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D00C87FCB
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Aug 2025 07:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vw4RJovpPwu2NBI2UMLjSCMqpwe0x9FBGiV+Xvhipp8=; b=nanzu0v2zXuPwM
	aWNyQJ1ezUDD0zNhN+9FZeGt04phq5b3j7lbydgW5vE6pIsdiq5QRcS+i55e5SW9l3p3i+mCU/nEh
	mDikl3CT96YtrO1GNDGr47dRZHERrHIYZjCP4HFmzerWNOtFNGEJ3M9/aQWL/wE5Xy9PVrWmCsdTz
	ElL1sySq76wKKavf8wNjXhYJVShPEfxhE3iJeC2D5dVxFi4ZBvM+3hNWc6DO9UHLSqjNEmezk3jAY
	ArLZCppD3RCceuUnIfW0XMFD90logGJWimPTm/OinGb3zgiRLoNnCGazEMe66brSGS5xKrupEmhL6
	8aI05au96EjXqBxys8Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkEZ-000000058oU-1f2v;
	Fri, 01 Aug 2025 07:31:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkBx-000000058HX-0fHw;
	Fri, 01 Aug 2025 07:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754033314;
	bh=7KLAjQU7uvnuJrjcRbN+uwgaq2T+iGTStYmHqkE2XI4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P8TTs6YcAyYzT/Oz3XBZE39tCTA7VDmrnuQ+oYoFUw1BBaaQ2RPrLR0fRPSIjoPfg
	 bRzMfqLT2EEM5so0Vqk19QzUPReBKN9N/WrjNkCQc5Cqxvj4TijUjTBOLsszov7L0a
	 rFT6Qc0RoGYefG49GsFw8A5jsRnB3oualIu6oaZjhwnGIBnXSy754z6Jx4dRwEJrmu
	 3whvOfwdMkpW9X1ryA/kLuTqaqTID7B2TvL+KIsATaAsIpkzmUqFpBFySmqJLarxI/
	 TGWwvS2hN/Ji7/YKNpeYOmQy051BaukHH8wvqM0PwU1u5/0PcPs5/f8gTuNEkzdWK2
	 Ih9r/CyJn6STw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 74F5A17E0F3C;
	Fri,  1 Aug 2025 09:28:33 +0200 (CEST)
Message-ID: <489baf5c-b1ed-4605-88ab-866b3e4b99de@collabora.com>
Date: Fri, 1 Aug 2025 09:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] thermal/drivers/mediatek/lvts: Support MSR offset
 for 16-bit calibration data
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
References: <20250730152128.311109-1-laura.nao@collabora.com>
 <20250730152128.311109-8-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250730152128.311109-8-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_002837_354189_D5CBF7C2 
X-CRM114-Status: UNSURE (   7.70  )
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
Cc: andrew-ct.chen@mediatek.com, kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, wenst@chromium.org, linux-mediatek@lists.infradead.org, bchihi@baylibre.com, colin.i.king@gmail.com, lala.lin@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 30/07/25 17:21, Laura Nao ha scritto:
> On MT8196/MT6991, per-sensor calibration data read from eFuses is
> 16-bit. When the LVTS controller operates in 16-bit mode, a fixed offset
> must be added to MSR values during post-processing to obtain correct
> temperature readings. Introduce a new msr_offset field in lvts_data,
> program the respective register and apply the offset to the calibration
> data read from eFuses.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



