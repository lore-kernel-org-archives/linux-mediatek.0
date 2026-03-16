Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B778F46449
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2026 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PX6qY095QlTNqwLeoocvXN8eAxzBq3xaaHLPZo3Ea74=; b=XMAsbQkze0zYTqI8/mV4Re2mwO
	AStpxGrItGnFp39004lDcK7JiKQUy5gN3JQYHRmzRpCom58p59xNtYkYtp9DEwh0B0VYpK8RXc6pK
	t6Lu/kUK50P9yGlLiKWq98diQ4Z5973+jC0rKEf904x4HRAqVzPqNRGK5ih/BuNIqWAF3W1V/tXSs
	Ci8ql/3qbt/PwZdJrWtprXOwzxjHx4D+PKvxYVRckXjw/N3gGn3y9AfIg/umZ+f5gKDfVaYk0DCmf
	pKcEsz3+wMaitNAFv8XsQGegku2crt39a3C/8J/uZP0w9ky5iajSZNsz7tLa+CODf4YwaLYA9u/sb
	TmGuRvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25Bv-00000003klA-2CbV;
	Mon, 16 Mar 2026 10:28:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25Bs-00000003kkG-1znM;
	Mon, 16 Mar 2026 10:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773656928;
	bh=QYwmO8NObPWWLeffrDa8YFsO09Wgh7fqTWBwXEH+PSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OZ3BjqEe1rjei+GfdHSX0scs+5S8pFy1YrfbCuLHXTxLeRjwkq3XqngZbLm/DvWXe
	 4FunWfgIM/s8ASMzDBRWQoFeFUZGNJEhACPy5v0qthHuhlDJbSn3Z5WKKNVuZUlg1K
	 YhG8STENM4V9vEpi70OIGX3agRXUSrlqyd7w/77sW/sy1bdIBOxdu9slnerUB/EHJs
	 ny3rRT9a+BIdQgTDBBE9iDNIO3ymOVueXKq7wHLw8SYDXVbDBHyyjXu9YjOhRaXgxP
	 R4f8B6GXp6+KMoitL1mzR1TJ+jNs6jsvUO1Rx5aJmRZRp1K2g3Ib1lXMBTBcMGsu1k
	 4cCuVhUVOY+Bw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:1431:12f6:48c1:6267])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED82817E0EFE;
	Mon, 16 Mar 2026 11:28:47 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: linux@fw-web.de
Cc: angelogioacchino.delregno@collabora.com,
	daniel.lezcano@linaro.org,
	daniel@makrotopia.org,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	rafael@kernel.org,
	rui.zhang@intel.com
Subject: Re: [PATCH v2] thermal/drivers/mediatek/lvts: add missing fields for mt7987
Date: Mon, 16 Mar 2026 11:28:38 +0100
Message-Id: <20260316102838.124163-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260312202433.39092-1-linux@fw-web.de>
References: <20260312202433.39092-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_032852_667823_D3388292 
X-CRM114-Status: UNSURE (   8.64  )
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

On 3/12/26 21:24, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
>
> Commit a4c40559499f ("thermal/drivers/mediatek/lvts: Add platform ops to
> support alternative conversion logic") added new ops field which causes
> crash on mt7987.
>
> [    1.518540] Internal error: Oops: 0000000096000005 [#1]  SMP
> ...
> [    1.564481] pc : lvts_get_temp+0x84/0xc4
> [    1.564492] lr : lvts_get_temp+0x60/0xc4
> ...
> [    1.620900] Call trace:
> [    1.631753]  lvts_get_temp+0x84/0xc4 (P)
> [    1.645471]  __thermal_zone_get_temp+0x24/0x11c
> [    1.656502]  __thermal_zone_device_update+0x9c/0x52c
>
> Add the new ops member added in 7.0-rc1 for mt7987 too.
>
> Commit 6931d597c5ef ("thermal/drivers/mediatek/lvts: Make number of
> calibration offsets configurable") introduced field num_cal_offsets
> in lvts_data. Add this for mt7987 too.
>
> Fixes: 78c24e67d6f8 ("thermal/drivers/mediatek/lvts_thermal: Add mt7987 support")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: Laura Nao <laura.nao@collabora.com>


