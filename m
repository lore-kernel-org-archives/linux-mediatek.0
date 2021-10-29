Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BCBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 17:00:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1746860E8B
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 17:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1746860E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLPkzsmH+OhllU1xahgqK9J6NCMz1kHZjhlV4LbMhAQ=; b=YakegkVVSkSaGYUanbAlPXgyKD
	R6Q9Vx3XPqV2j+HFEwdnhlIpObVmM9AWrLQ4lEx2JD0Oia5/Q5XHQgljZnAcBoSVpZfZxCeGObda3
	QXbNfahXtpd8UdzyIhZh+5F2JXf5O6YkgYM1MNbiH/TbH8z6MU0zalOkKhliMxebUAw/3vvIov+Ef
	rz11PuLpwNkW3G7g37m8TRdt3+7LrOPEOicG6YWqDMrXit2yJB5p8Zggfkk8otVy1E6EVq/7CKi9K
	v+fd3rTmselC8k1FMnX3SQ0ALP5GoMcRchAjCNbZRoX3EbJLogTMz+BHHKFOh1NYEEqTN4ZxFDxdv
	JMLD2GHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgVEw-00BWzg-E9; Fri, 29 Oct 2021 17:00:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVEj-00BWxn-Gs; Fri, 29 Oct 2021 17:00:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9A92C1F45BC6
Subject: Re: [PATCH v2] arm64: defconfig: enable regulator to fix mt8173
 regression
To: Adrian Ratiu <adrian.ratiu@collabora.com>, Will Deacon <will@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, kernel@collabora.com,
 "kernelci . org bot" <bot@kernelci.org>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>
References: <20211029153947.225416-1-adrian.ratiu@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <7d2c1339-2580-d9fb-64ce-b2d361944eff@collabora.com>
Date: Fri, 29 Oct 2021 19:00:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029153947.225416-1-adrian.ratiu@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_100013_730660_32F8A65C 
X-CRM114-Status: GOOD (  12.03  )
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

Il 29/10/21 17:39, Adrian Ratiu ha scritto:
> A regression was introduced on some mediatek boards starting with
> v5.15-rc1 in commit 109fd20601e2 ("arm64: dts: mediatek: mt8173:
> Add domain supply for mfg_async") which effectively changed the
> regulator from the always-on dummy to DA9211 without explicitely
> enabling it, causing failures caught by KernelCI on Hana
> Chromebooks [1] for previously used dummies like:
> 
> mtk-power-controller 10006000.syscon:power-controller: supply domain not found, using dummy regulator
> mtu3 11271000.usb: supply vbus not found, using dummy regulator
> xhci-mtk 11270000.usb: supply vbus not found, using dummy regulator
> 
> There might be another bug linking these power domains in the
> mediatek PM driver, but that is a separate issue wich needs
> addressing, for now just fix the obvious regression due to the
> new regulator requirement.
> 
> [1] https://github.com/kernelci/kernelci-project/issues/66
> Fixes: 109fd20601e2 ("arm64: dts: mediatek: mt8173: Add domain supply for mfg_async")
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Cc: Guillaume Tucker <guillaume.tucker@collabora.com>
> Suggested-by: Enric Balletbo Serra <eballetbo@gmail.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
