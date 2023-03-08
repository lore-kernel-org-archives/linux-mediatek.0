Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC77C678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 09:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1nrGsQlrC7hqRqPSsAK2Ji28nQhrid6Ckt8xhuu298=; b=MHha2pozhVNfMDHR1k2HfQ8TS+
	nRWiCdGCi9hITqjOSPtfitNf7wkMQIBvcpZYtEzyYTEVuKEFV/wy9k71GezSFDw2IxTVbyHRlqHto
	EPYPXRkdiiNrJGwpnZpf58l+sqC6KjzbRnWN1IoXBPCTv2z473lXGNwl7dXY7wbYuMbOFGb/vJR1r
	JtbNu3Ayt9rn8EMkgFh0MLscBlvau3fHnsXbd90UIEyh0oEXIhcgspP0fU3iq8HUHBiE4+UrU6rwL
	0dtdp2DDDV6OzdFX0jH6qBhaJ5XbHEpP6y3uzxnB1WsKmh/aUIQJLal9jUMyYJWMsv8N97SEqc3s4
	NXYHutqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpp6-0047Yh-12; Wed, 08 Mar 2023 09:11:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpot-0047Tu-48; Wed, 08 Mar 2023 09:10:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0020A6602F64;
	Wed,  8 Mar 2023 09:10:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678266638;
	bh=oZpxuChfh/t93Mus5+/9plHeSiSfNTCOmsCVmHDTRow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZNstprf46gnbu3obY8tXh1p2qMlk2DtYmHthKlfqRykaK6NM2aUOcP2VznPB3R0qB
	 IRGUT40uSg9UyFv7Dt++qtcPs3In4Nj6OIZvFcJEWuf3ry2m2OHtFkgMyJUBLQk/T+
	 DJNuKK+N6lXz6dIdOVFmC461HTj7zTcp6sw5Kab3pdhh01val6h0RXORYTSQcahHXK
	 i0IyuLp/1DdBTxxYaSCv3wefK73B5zD4dSDdnf1YFm/POgP2JPUk/9GDZKjhwg8uGE
	 r5npst+gdkx6SpXe/A8qlp4FwwaAHB/fZD+C3TxOGXdiDhPOM8ZqIDhfyhNZMe0VqN
	 vzqnE/r6E/nng==
Message-ID: <1af76fd0-ea27-da60-cd22-8a65a8ef369e@collabora.com>
Date: Wed, 8 Mar 2023 10:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: fix memcpy's
 number of bytes in lvts_calibration_init()
To: bchihi@baylibre.com, daniel.lezcano@linaro.org, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230126161048.94089-1-bchihi@baylibre.com>
 <20230307134245.83599-1-bchihi@baylibre.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230307134245.83599-1-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_011047_347509_98CF68D2 
X-CRM114-Status: UNSURE (   6.19  )
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

Il 07/03/23 14:42, bchihi@baylibre.com ha scritto:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Replace memcpy 2 bytes by sizeof(int) bytes of LVTS calibration data.

sizeof(int) is architecture dependant... please use a fixed size type instead.

Also, shouldn't this be u16?!

Regards,
Angelo


