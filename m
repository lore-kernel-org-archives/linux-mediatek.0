Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D95C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUz+cSg9qmQjsB/pkUHHWeMCJFOPfkWaa0plxQ2oILA=; b=mVObAKNL1gIkdDVwizFIr8+Hyn
	TOAehcwNRa/LoWr8ou5ZRnGiGFXhwrIniVitUuxrzNxR254tYzC+5FKMrEOP5SJWFJLA+3xJLu1MM
	ewSyIXEEr/FK1B77lpT0JFEXR3fhnHQ4jz5rx4P6CkfP9WVDypb6nyRSQ1a3bEuy8t8NQ420F68H4
	aFF0EIu3jp6VL1lEFyHwTzf1D0nnu43mTAfWdtY302xrsQAozX5WWwXCVbhxzuOniqKT+VPG2Qr1h
	wFgiCnhzSca+zb+5BqEziY2Z9DmO6KpDgCd2Nj7IeocK/04NdoBr5nnoKdwxt9p9gGqt3MCGZheHb
	5CULKPTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCiQj-0022gk-LN; Tue, 03 Jan 2023 14:38:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCgjn-001LUy-Uw; Tue, 03 Jan 2023 12:49:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 305F76602CFA;
	Tue,  3 Jan 2023 12:49:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672750190;
	bh=kLb7ZxO/t10qRzNfWMcuhgJ9EXOlFXY8vbB18QInejQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dqiCSMgQvi/04qrMXM6nENACo5DfvsyNuLBxHdjm3iaDh+jiqP2f+pEGbpB5tKNMm
	 CeNrXN8Miys+y2TnDxifNRqNSS5y91iRZxqE/syBbreZbXoH+PNCJ8rMkgUmIEF57y
	 L2g5z5fVE3XQl6xV0WABHmbUM7H5HbXwnGQcRSe6y7klzW0CUmQxXbxC08ZJUR+Ozy
	 hC8xuurNE4CWoffNSwqdp7SjhyDWmH4F4sgvrDdYbeWTvZ93GXvbuU5n9nFWnz4ice
	 BbfrWupgmsJBDWGmNYV5bNxTXJ3pSbHGi/Y5/tXeW+CjoTCS5qbS7rrVLQUtT1WZlX
	 G97ur71uMRGmg==
Message-ID: <ce7698f3-8b40-1394-342e-e6b099f9f77e@collabora.com>
Date: Tue, 3 Jan 2023 13:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 10/13] soc: mediatek: mtk-svs: restore default voltages
 when svs init02 fail
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
 <20221226094248.4506-11-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221226094248.4506-11-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_044952_207898_2D30C5B8 
X-CRM114-Status: UNSURE (   8.20  )
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
> If svs init02 fail, it means we cannot rely on svs bank voltages anymore.
> We need to disable svs function and restore DVFS opp voltages back to the
> default voltages for making sure we have enough DVFS voltages.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

This needs a Fixes tag... and it also needs to apply to older kernels, as
MT8183 does use SVS in previous versions.

Perhaps you can send a different patch, without the cleanups, only for the
backport?
Otherwise you'll have to duplicate svs_bank_disable_and_restore_default_volts()
again before cleaning up...

I'll leave the choice to you.

Regards,
Angelo

