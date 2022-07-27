Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B520C19F21
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 07:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZbawSuRU443TjKi4boL0Vbr518AuKIw3zU52hGnqEY=; b=tJONUunzOPb+QMYo9ujsAwQ7cB
	8cmTyaFRjG5eILk0vpJ1sFG1PNdZwD78Oub9kAMqshvJ9B05QU85tMWkrQmT52tYd6C29ghpJLIEb
	oT25TIPQ7sT7MAlYTPAQ0+EQJ0Q+cfAoAcFyN717mzMRUotRPAaX0iuFBabcuSCkMbx/QnPLy6FIg
	3Pv12AHf6aMqViXFKvS/ktBG7K4hhY7IXLoQM0UBeGM1dv7yYA1jObkCONuYGktzdpJvPaecLLBW6
	Lq8tDQ8xbtcH75PLk/RfZTe4spJYVVdCNarp/upvNvv3mEFleWhnG3o13sYj+2Xcdr2H+3fBenASE
	0K9vN6Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGbYo-00AaBl-2O; Wed, 27 Jul 2022 07:34:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGbYc-00Aa3V-6m; Wed, 27 Jul 2022 07:34:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F3C026601ABE;
	Wed, 27 Jul 2022 08:34:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658907249;
	bh=z8qNM7YJGlGgLr5CtAhQT5G31+zHCWFzXU6yj7DoQRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=obJ1brsK60dsAyiQVGl3tC8c/dqH6jT8h6XczYe+jJWOD5TXjCvZ7k+YZoYPqv2SF
	 d9SRts3+EZEmgCfZoMBurFII3X8GYQHMwZPbP/oeCKOdiFisG+7JQOSp+/DDjGlSGt
	 YR73wFCosNkFHu3hVCwzTLyssbl+MGtrAtCqAb2YaJ1vX/zs+INb7IjHiEDgbKRgD9
	 0NZzqX7wyZmZ6sgi651J0Belo+wY+gZSsf1MK7YHPiY8o13cQ0WKfGp3E+beQqkX4F
	 umbSmHt00/x5gdhR0yCu4+gyUZ2tw6mrLUEdNUpfqH2r341YbP37ZP0jjzNV0lCX3M
	 /1hF/5A7b7wAA==
Message-ID: <62fa552b-6117-3f76-d3a1-e08a33f287d1@collabora.com>
Date: Wed, 27 Jul 2022 09:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/7] Input: mt6779-keypad - prepare double keys support
 with calc_row_col
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, Fabien Parent
 <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
 <20220720-mt8183-keypad-v2-4-6d42c357cb76@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220720-mt8183-keypad-v2-4-6d42c357cb76@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_003414_486240_6150DE3F 
X-CRM114-Status: UNSURE (   8.59  )
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

Il 26/07/22 14:56, Mattijs Korpershoek ha scritto:
> The MediaTek keypad can operate in two modes: single key or double key.
> The driver only supports single key mode. In double key mode, the
> row/column calculation based on the key is different.
> 
> Add a calc_row_col function pointer which will be different based on
> single/double key mode.
> 
> No functional change.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


