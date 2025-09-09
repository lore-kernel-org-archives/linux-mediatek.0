Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E4ECAC58F
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 17:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ns1iYfCvSFkNCYkJVAc6Nm7Vk7F7RTBVyV1AXzsFkVE=; b=MNktltHRWlCaYnOF1czKfX3yHO
	HwKsikNW+z7Yz64zx0GkaOL810FRwA19liDWIUmG8yNhHOd5V58NWukDVGJff0eo25ZdqKkXn2s9e
	SY6FwsWN4m1WCovSvEyinya+GRa9W3DWGsFC3MV4uu6Ancv5Fr749ObmgsDRgw1OgSjB8dV+FFLMV
	cKRNlxAqIJXRr1IX5CSKFrzp7pwsdPcWh74FU+G27Hs8gbmYwiARMD6a7tZj6/gEHz4cuUgYwLfLq
	q6ttjsuLjEh0Yq22YKBdi3fBhO1Le2g7z1cq+f2p8eEbi7B/yuFNcqRVYDnHRhtTzIgEIkjahFp0D
	EX3F8NUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vA-00000008mec-0dBu;
	Tue, 09 Sep 2025 17:14:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvw6L-00000006Zct-16ly
	for linux-mediatek@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ns1iYfCvSFkNCYkJVAc6Nm7Vk7F7RTBVyV1AXzsFkVE=; b=mr0HpLE9Dv6YrZc1t9zxFz+NLh
	5k1W3V12PIt5jxcvmmxbxMN7UZJpMXLhOqbeeYMDTqOvKejQRqCBg8ssCMXxEQV9AZ0oOalfswU6r
	Iij3M1sGH1TrQXvQv4DfuWpVoT34/TPvFR1dcYh54r9HwHkhLtD7/1uVScnFfVX7g7isxJF/D0+jF
	ENl86h0NPVTeHz5YiUqGgAnZlify3Vd4GqEa/eF9NU+grNFb2rr+d4U5JzC4dzTY1Vkoi5SJO+R1E
	jTdIINp5FJ1+I5+HAwbI1dq1iWkaoofZj8hm5IuqA2FFg7hB5scIZ5IroKDE1/MybwF5jE7uhg4KB
	M7KqICvQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvw6I-00000005Hva-0MWN
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 11:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757415683;
	bh=GwLe3BWnVqoVmWve5L+P+wWFpq3U3m3OTRVEQk0trjc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mp5GhEvgZuEF3MugtGPGTuNn/LPQmca9FT/kdi/z7f7jYK29uvogXsR42ZluToyvE
	 fWMd1+EKts0Dss/bl6Cc+7q4+VqF2KwEgq0VqJgyq85NsXlElaH1o/Rw2kzXRYA3SJ
	 ZtaQd0G6EArh6iM3G+hQMxXmg7Rl1O0ik9aD9QQYAHD+vavJ58Owi0rL9w7HfEwtz1
	 MCGJB4QWApkvHqKvBulH1jhSCSsucHhIOMV0ONF5PYSirY6Pr3IvyAJCydXvlgZMHe
	 WNsbBVVDaM13xAM43jqcl4rQ6rLctInNjc5tKvv4eY2nz8eqQVbSbYaCmtfavZsMsU
	 H2DKmW38WioWg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D538117E0C96;
	Tue,  9 Sep 2025 13:01:22 +0200 (CEST)
Message-ID: <e0200aac-570b-420e-ab16-e543e85997e4@collabora.com>
Date: Tue, 9 Sep 2025 13:01:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: mediatek: mtk-svs: fix device leaks on mt8192
 probe failure
To: Johan Hovold <johan@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Roger Lu <roger.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250909095651.5530-1-johan@kernel.org>
 <20250909095651.5530-3-johan@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250909095651.5530-3-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_120126_384922_EE8AC386 
X-CRM114-Status: UNSURE (   6.05  )
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

Il 09/09/25 11:56, Johan Hovold ha scritto:
> Make sure to drop the references taken by of_find_device_by_node() when
> looking up the thermal sensor and opp devices during probe on probe
> failure (e.g. probe deferral) and on driver unbind.
> 
> Fixes: 0bbb09b2af9d ("soc: mediatek: SVS: add mt8192 SVS GPU driver")
> Cc: Roger Lu <roger.lu@mediatek.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



