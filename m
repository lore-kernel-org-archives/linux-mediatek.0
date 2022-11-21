Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E347C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 15:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGebd1rUeOMj770NrIE5vgThdwkmsTmGyemQcE1Q1ak=; b=ctRNZHeFqF1e5ewwaeHfIQoV+B
	EhCppW4VaG+QSGFOZbmMLYc9z3pkgCbRYg0GJGiryITgh+kWAPUBYfjSPrAIKMCCRl/WGo/AB8bBe
	hMEf5qgqKmlUL6zqiRCRbQSJ1U1IyX4Vz4tWLQqRtcnqkWrJRL1QPvNYEY5B3RGx8P6fU+DC7Mfr2
	rWoxeGjdJnKQXatkVge1KZk/F8k3DrryAqbDN9HCEPiiV0cVX3ttF6N29tbrntf3xsLcJElH+26kJ
	393a6SDziCYj5TRSLI8EQLuJLdhV0GILuGA88/9gjCE4+zaMlBV/36iXlLu1unmOeBku0TR+sku2c
	yOS+w/Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8eg-00F8uZ-5Q; Mon, 21 Nov 2022 15:24:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8Ol-00F0Nt-IP
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 15:07:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5614BB81059;
	Mon, 21 Nov 2022 15:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C22C433C1;
	Mon, 21 Nov 2022 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669043268;
	bh=XCK2rE8lqFjARxnE3wTynZRLe02wfehU9M5s+cBsfng=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=msGnioqL0kQMTGlFbKAWlEEgigrzzJDswh7OLTbQMDV28I5gRXDo1Vw5HSk97S32L
	 ciPWJX2GJa1sR9eUiXhpiOidEW8AI2/JS09T9iF788+KuYamOmPDVDSkLR+cDHB4hT
	 uWT3YDSJLV4RC3wbcUZXZIH8Yq32QAeUxFyAbrn+NeDl1kW3ZbN9OaVEePcu17DimV
	 kJwcFqRmUi8AKOOXAm7pDAKEj5zAn4BJwOG+rGrJlhC5+Ewv27CrWBFMQhDWdcjHSm
	 ID/K6wVRHPhCAGx13SPnHN+bzO34QHmURkaCwzWnhlAiwhVrkWM/D/iC2JTsPk4vP3
	 lofEO/GCFwvYw==
From: Kalle Valo <kvalo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  linux-wireless <linux-wireless@vger.kernel.org>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Ryder Lee <ryder.lee@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,  Bo Jiao <Bo.Jiao@mediatek.com>,  linux-mediatek <linux-mediatek@lists.infradead.org>,  Peter Chiu <chui-hao.chiu@mediatek.com>,  Howard Hsu <howard-yh.hsu@mediatek.com>,  MeiChia Chiu <meichia.chiu@mediatek.com>,  StanleyYP Wang <StanleyYP.Wang@mediatek.com>,  Money Wang <Money.Wang@mediatek.com>
Subject: Re: [PATCH v2 9/9] wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices
References: <20221110093525.29649-1-shayne.chen@mediatek.com>
	<20221110093525.29649-10-shayne.chen@mediatek.com>
Date: Mon, 21 Nov 2022 17:07:40 +0200
In-Reply-To: <20221110093525.29649-10-shayne.chen@mediatek.com> (Shayne Chen's
	message of "Thu, 10 Nov 2022 17:35:25 +0800")
Message-ID: <87ilj8pcqr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_070751_953112_83FE3668 
X-CRM114-Status: GOOD (  13.15  )
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

Shayne Chen <shayne.chen@mediatek.com> writes:

> Add MediaTek new mac80211 driver mt7996 for Wi-Fi 7 (802.11be) devices.
> The driver first supports Filogic 680 PCI device, which is a Wi-Fi 7
> chipset supporting concurrent tri-band operation at 6 GHz, 5 GHz, and
> 2.4 GHz with 4x4 antennas on each band.
>
> Currently, mt7996 only supports tri-band HE or older mode.
> EHT mode and more variants of Filogic 680 support will be introduced
> in further patches.
>
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Co-developed-by: Howard Hsu <howard-yh.hsu@mediatek.com>
> Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
> Co-developed-by: MeiChia Chiu <meichia.chiu@mediatek.com>
> Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
> Co-developed-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
> Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
> Co-developed-by: Money Wang <Money.Wang@mediatek.com>
> Signed-off-by: Money Wang <Money.Wang@mediatek.com>
> Co-developed-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
> Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/Kconfig    |    1 +
>  drivers/net/wireless/mediatek/mt76/Makefile   |    1 +
>  .../net/wireless/mediatek/mt76/mt7996/Kconfig |   12 +
>  .../wireless/mediatek/mt76/mt7996/Makefile    |    6 +
>  .../wireless/mediatek/mt76/mt7996/debugfs.c   |  851 ++++
>  .../net/wireless/mediatek/mt76/mt7996/dma.c   |  360 ++
>  .../wireless/mediatek/mt76/mt7996/eeprom.c    |  229 ++
>  .../wireless/mediatek/mt76/mt7996/eeprom.h    |   75 +
>  .../net/wireless/mediatek/mt76/mt7996/init.c  |  816 ++++
>  .../net/wireless/mediatek/mt76/mt7996/mac.c   | 2468 ++++++++++++
>  .../net/wireless/mediatek/mt76/mt7996/mac.h   |  398 ++
>  .../net/wireless/mediatek/mt76/mt7996/main.c  | 1325 +++++++
>  .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 3428 +++++++++++++++++
>  .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  662 ++++
>  .../net/wireless/mediatek/mt76/mt7996/mmio.c  |  385 ++
>  .../wireless/mediatek/mt76/mt7996/mt7996.h    |  516 +++
>  .../net/wireless/mediatek/mt76/mt7996/pci.c   |  222 ++
>  .../net/wireless/mediatek/mt76/mt7996/regs.h  |  533 +++
>  18 files changed, 12288 insertions(+)

This patch is too big, please split it. One patch per file is a good
rule of thumb.

I did see some suspicious static variables in pci.c, but otherwise I
basically skipped everything.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

