Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6172CC87FD2
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Aug 2025 07:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVZplkCOafw9PXy6Wjs7zS2Pde9qiPq9k15TqHCbQFk=; b=w3UAnE4Uq8zXQu
	XFFsTsTp2RTPd96EiV07BhwkkUwkMIrrIt8VWD73X+SoB2LIGi/ZViHj9HS6d5HWpX7c6VRCsYKnf
	cjp4vN+nf7qQyPj96h9yD62d1yqZbaF/x68E2AEw0onsBNJIvpVHwsQifll3JpqfUrHxeKk/U3RSI
	Y8wTtlwnVMPxIWNG0OArFv9+D4sw+OGXCqDi1X23Aqo2H5Ypqrjyb4p26n9KxeEXSfMW7Ajt8+AjA
	xZHgQua/zBMME9gd62GHm8y6gDu3WC7oUq3RY2UPpBk3BEgsUNusq0tsQcZqCOxjeCkMeT1fTx0o1
	u1B8hbgpFaYEr8SRwyzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkOn-00000005AA8-492t;
	Fri, 01 Aug 2025 07:41:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkC3-000000058Jd-3jqx;
	Fri, 01 Aug 2025 07:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754033322;
	bh=cJOZrJVqTn54T1sWZZNpKwPvvOjubd5GMfcP+9HSNaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gtRDKKJb99HJ4Q5f3nHAVfpIo6Te/52HnDNPZguqiZ2hp4a4UkKINSMnggYExK8RJ
	 u1m3P7sKs4IKnyNC147SgsSHpbJiWHiV+IT5TfhJRBfIso5u4pTuCz++GtQvJFAyqh
	 /ZTndMioD5AsdLL7FCIXmhAhOyo/nGiljKNYUntnb4eMtNj4hwKoRLPIa+Qf9A4Zhj
	 TpiYX5H4Ip9nLnDSuYV9RXdSXCaj4Tuqg6AYq+ogTPjQ9teOcPNwLgzqbbVDj5L+X2
	 O0zJr2p5f5Z+XRdY2TxRjkJFBrAho+217t+8/OJKJv2Q+C39JWjIxf77N0suUK4oBF
	 nNIP2XPSp3r/A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8007717E1319;
	Fri,  1 Aug 2025 09:28:41 +0200 (CEST)
Message-ID: <062a44cf-eae6-4d5f-a736-8242a606ca5b@collabora.com>
Date: Fri, 1 Aug 2025 09:28:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] thermal/drivers/mediatek/lvts: Make number of
 calibration offsets configurable
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
References: <20250730152128.311109-1-laura.nao@collabora.com>
 <20250730152128.311109-3-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250730152128.311109-3-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_002844_080707_72F435CD 
X-CRM114-Status: UNSURE (   6.58  )
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
> MT8196/MT6991 use 2-byte eFuse calibration data, whereas other SoCs
> supported by the driver rely on 3 bytes. Make the number of calibration
> bytes per sensor configurable, enabling support for SoCs with varying
> calibration formats.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



