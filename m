Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAE7E706FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 09:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qejtWP5ENHc3+n2Fogs/TziTDgT0FuBJh+Bf+NtuemE=; b=xWGEY0XooIB5HUwSwkhHLCVkW4
	HAU+youyVAFZhrkaU/gfPWo3Uc7+JRWle6D7GTyhua6ae0/Vx+GmlfxjiRXI6zwnJ8xd8kOdAQ30m
	+vIJAH0NBJgWJnWSVh3XZ9ZAG7DhX4bbNIB+SDDEli4eI+qoFApHwXh5DXQk/2J9yEPk3gTK5/2nV
	rHxmQQJBk50X/lXGU2jWgI5iEqcxL8sJe/XSE6p/f3rBj+cmcljQcKXrJ1JfFhKTCBNMBUhvydh9C
	ww206jr5N97XowuJJN7ikFVoor15x90cHHA2N9oO4+jfXmQjyhZBK7GWsh5Ub9QxpdP4/b179f331
	jq1lJAOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjFkG-005YtG-21;
	Thu, 21 Sep 2023 09:13:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjFkD-005Yrp-1Z;
	Thu, 21 Sep 2023 09:13:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4164666072E7;
	Thu, 21 Sep 2023 10:13:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695287584;
	bh=q5YJhSxiDShzZxa0xIGydYZu/ODFTndBpUE8JLIrRNc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U49KQ/44xmIYP4MQa0FYJ0juSJBWTgwHVl5UfqfexBzZXxfjJTQA8xc3wsqYH33bn
	 PYql/zoXVQsOSNh3NV+bJrrmR0z4vfRDCz7tBuIui+lZQiEXL8MYKHY2gaE2oQs8cZ
	 1G4H/8Vl37DlFdYjR+1WfM1jDAf5ioiPeU4KC2TF+oEBT8NtIgjRtRYX0S2YDxSVP5
	 xsALTNYLQbfAIIW/CSc3ja+PmGZlFfPOnUFBw3J+dNanpIyp3HMoXvANGzLDLgnRyq
	 YzzAUkQpplN7MmX99iK1ytA5LDdTyBHI38xSOfBploxmZborTdYew7i2tpWmhP1DF4
	 xFVqsuZ4FYTTA==
Message-ID: <71906f4e-8875-7431-aee5-57eae1f55d65@collabora.com>
Date: Thu, 21 Sep 2023 11:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 3/3] regulator: mt6358: Add output voltage fine tuning
 to variable LDOs
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230913082919.1631287-1-wenst@chromium.org>
 <20230913082919.1631287-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230913082919.1631287-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_021309_710371_DBC44B20 
X-CRM114-Status: GOOD (  11.61  )
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

Il 13/09/23 10:29, Chen-Yu Tsai ha scritto:
> Some of the LDO regulators in the MT6358/MT6366 have sparsely populated
> voltage tables, supported by custom get/set operators. While it works,
> it requires more code and an extra field to store the lookup table.
> These LDOs also have fine voltage calibration settings that can slightly
> boost the output voltage from 0 mV to 100 mV, in 10 mV increments.
> 
> These combined could be modeled as a pickable set of linear ranges. The
> coarse voltage setting is modeled as the range selector, while each
> range has 11 selectors, starting from the range's base voltage, up to
> +100 mV, in 10mV increments.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



