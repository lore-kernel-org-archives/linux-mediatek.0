Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0D4C6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 08:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R669BBscxbS+ZsUHYaUrVGTUtt7mJJVLPblrBFP2TN0=; b=C/ianTCIqJpC/xSMxfJ0yMch37
	tqj+EpEV7OFKvLyynFVnsHOSY3YvSWjL4mN8g19wiEXzzOmGts9KlcMzVRTB7D9rE4H2LBYmVJuyr
	uuXX5OTwmlibaOUA71Vq/YwarnzINCrr6CFi/jNkbD+OyCvHBS5VyocgOokuPmFlHd0f8DQzirvNE
	u3GV1vGhfXj/t0QnyfC5Lsbfm0ijWqn6dpdIcC/O89v8GvPdGGLrtz7XM5MyawAnHxFgfC9ZBlUPB
	Q524kZ4smZUvT/eDaOwZSv/koKndD6JAdV75z9cDBAk/WlUhjHkUpwnXAND9JgZCm/CiW/NtHbs58
	pj+ujz+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbdwy-004s4z-7z; Mon, 13 Mar 2023 08:54:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbdwZ-004rvR-Ad; Mon, 13 Mar 2023 08:54:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F9E26602F64;
	Mon, 13 Mar 2023 08:54:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678697649;
	bh=admtLczq/Oe08BYYh7NJZInoBni+S8Ud4YDJ0IMS12g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UwnLBdLThDgg+25+IUSw1XTQ7/OdINQyaS8DviABkAmScilRD3qHZFNReItOksrA+
	 OqeLi/0XkI/nKKgw4XZJeHTXqE+U1IkIEVMf7H1r/mpwd1tvIDwyfsGLaJZ3s0UMm0
	 ht7zP23kA1l33vKWBY6XZCTyY37+gFPDAKsZhJ5I1QXY2LmalPOBSJz8CcScP6OHbq
	 HkTswuQMBq4sRIuiAMynSMbONder9M+EkgZJPBycJKp1HDlyihRlzzdwWUbhLesXID
	 rusHiBDDYlmG/oJAwUgkfO9w3YS60KzPxP3RGDYaT3uqjQH7Q7dv4KIwI526mOluPL
	 gNkzY+aL1rdAw==
Message-ID: <d0a2eb84-4420-8b6c-bd97-e58aa47be289@collabora.com>
Date: Mon, 13 Mar 2023 09:54:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/30] clk: mediatek: Make mtk_clk_simple_remove() return
 void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
 <20230312161512.2715500-2-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230312161512.2715500-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_015418_744692_1C95022F 
X-CRM114-Status: UNSURE (   9.13  )
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

Il 12/03/23 17:14, Uwe Kleine-König ha scritto:
> mtk_clk_simple_remove() returned zero unconditionally. Make it return no
> value instead and convert the respective drivers to .remove_new.
> 
> This makes the semantics in the callers of mtk_clk_simple_remove() clearer
> and prepares for the quest to make platform driver's remove function return
> void.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Hello Uwe,

since there's a big cleanup series that is well reviewed and that is touching
practically all MediaTek clock drivers, can you please rebase this commit over
[1]?

Thanks,
Angelo

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=726914


