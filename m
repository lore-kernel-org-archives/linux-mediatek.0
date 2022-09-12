Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B10AECAAD5
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 10:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mW8rJXOdYePJsySLwZBYq0baYTnTTctj1Lb6RMqyucc=; b=g+F2T/IFaJnU7Eb+APB+5YnQOj
	IEyKMNLnrX3Qrx5JAyi5qLN3Ulw3CTYGzW2lZEMGbvBgnHKfTYP69BJWuXsmLTVwCuyiSL0BUb/dd
	gEA3w+Llg+wkzNwMgab91quMBbd8RV4TkeUwTGkpk0sVRxju6ftpatTam4RYZcXC/xyjMBPkbPKJk
	2oK4PxlhiaaHlJ0fnHHNRPKJBt7th99vIwyjnreE68xAqMXUdehcrTeALG6C4/gBbwjZoCNtdINFs
	COjWL0ZcG4qDMXvm2ra3+FgoPfWex509rdDDuDmWGn2I+Iw9Y91LWDK5Rwgikk565yVhi4h19mF+u
	jqHbRLjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXglR-008njc-QE; Mon, 12 Sep 2022 10:34:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXgeZ-008ji7-OU; Mon, 12 Sep 2022 10:27:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BA5DC6601FDB;
	Mon, 12 Sep 2022 11:26:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662978418;
	bh=lsakC5tXlXnwjZ+SXxeOjNZ2MoFmMoIsT0zJ4vJo5oc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IoVq3MfDQ8Lq/69DJYionI4z0bCBxPZDwZDZXcK6CaMLDtptMrQZ9S5NcGnaCpV/E
	 WO5+MytT5DVhIi0Us7pHAB8we6kAYnpaWwY8hwFgcdCJXVEyLK6c0ducJz8cFqkxeg
	 XE2RyAGtqXhOSFTYIpcGorjtbtlc9AlwWH3OS9nfuSilhbqWdj7um0BRsHpGNuAaGH
	 7Nq0KTNWdziVMeQBdRRiLd1yjPga0SpRCN5OtcSgBcZcIfXkMq2qw0tUeRKkBAp2Ve
	 Q5s9ciPg0dH1qDawwpsraC04BLszfQGAERB7tF3uOpLxCQJVs+WAzITzDPOu+hUvVF
	 tBHfe49Mvg7og==
Message-ID: <ed7ca57f-81c8-514d-2c64-26a4aa8e75d2@collabora.com>
Date: Mon, 12 Sep 2022 12:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 8/9] drm/mediatek: Add clear RELAY_MODE bit to set
 gamma
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
 <20220911153734.24243-9-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220911153734.24243-9-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_032700_236567_B6B955E8 
X-CRM114-Status: UNSURE (   9.28  )
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

Il 11/09/22 17:37, Jason-JH.Lin ha scritto:
> Since the bootlaoder may set the RELAY_MODE to gamma be for the kerenl,
> we have to clear the RELAY_MODE bit to make sure that the gamma is
> enabled correctly.
> 
> Fixes: b10023b03082 ("FROMGIT: drm/mediatek: Separate gamma module")

This Fixes tag is invalid. Please fix.

Regards,
Angelo


