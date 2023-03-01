Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F05C64EC7
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7K9bGllkGf+R8ALtKCAG4mTqthwbUNQ7Y0ztpGghiy0=; b=niTaBpl35w0coiPB3ozypr1fi5
	+88evo1l8B8sSyy0Ww86SmaPf6axNnZcMx+bi4eIg09d59KLzvCdIWSZnQLHvnCXu2uU8lloJr930
	g66aphtALkl8aaYT4NoLUfR0UyROlqjtAll2VIVXDPBbVHYfS3AUDBCa3dsht2iRbwsoqKuj1Bujq
	CBcAO3wxwB00vrfKSRT8DzNZ12S1zd7Fll2q30siiFCdkKofJuHIUSeOSTq0kc3lLKSfCwqfGOZqg
	l3lFlMGesY9UzKgJdLNo6KU0SopAQwrCelEohC/4ivddbSv3DbXX8sRhbyUAYtUhsRlb16gHf89Br
	Cd+IEN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJMo-00Fk7P-9i; Wed, 01 Mar 2023 10:07:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJGc-00Fgew-4g; Wed, 01 Mar 2023 10:00:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CAD6E660036A;
	Wed,  1 Mar 2023 10:00:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664856;
	bh=HC6KSnhiLwT/rwuATmwOy2gOfI8Nwvc1BwEcPTsflsY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kA9Lh9yAHXIMWB4LLmy61Nhboafh+GLDlvQ6Tnaa991cs5bMbOWMyYw5pF9TDryWm
	 NFgxQVWLzohrtBdJzYuC9E8RBD/4gjW8pjTJkFzpCE/HqBurRx0Tn/RYW274io3hOW
	 jsT0ueuezgh1W21LGC/EX/SkKANAC1w73jFF2jIiX+Of3ndtJxsc3fmpP+K3RwTYtk
	 v72/1a45iIU0IbnHxiXH0oL2foXHeZX5VJlFCchLbEtiQ+x4cwY4+QKpX524VH9QcG
	 zKY/LAgBJ8mSHTakJ3+xvRCRlclZWHfVCEBfTJ41Ek6xUSmP4BwZNP9MQMjiN37wAe
	 /1dV80eowfUoQ==
Message-ID: <3d2f385e-dc85-8033-cf77-e5f0634c5be0@collabora.com>
Date: Wed, 1 Mar 2023 11:00:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] ASoC: mediatek: add missing initialization
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230301040835.6322-1-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230301040835.6322-1-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_020058_369973_19525012 
X-CRM114-Status: GOOD (  12.70  )
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

Il 01/03/23 05:08, Trevor Wu ha scritto:
> In etdm dai driver, dai_etdm_parse_of() function is used to parse dts
> properties to get parameters. There are two for-loops which are
> sepearately for all etdm and etdm input only cases. In etdm in only
> loop, dai_id is not initialized, so it keeps the value intiliazed in
> another loop.
> 
> In the patch, add the missing initialization to fix the unexpected
> parsing problem.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

I agree about this fix, but this commit is not fine as it is:
Please split it in two commits and add the appropriate Fixes tag to each
for backports.

Regards,
Angelo


