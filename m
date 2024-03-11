Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F6BC5475B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 10:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqZk5vnFJ+qQyTMPdGhS1TGrvTSqb+svyT5tVIPW+aY=; b=Ojc9HOubCX2GGdMzRWodvTee/G
	9hdBenJ8oqKFPgXeIIKjBoNjWsin9DZ+W1m/MjztRYMJcHAyvObbttjM84cClXyvgE9sXR3JLOzOa
	woeZedYW1vcefofvAldHUiGqxYVlvuuP0/sjFWu0p/UtJ+rQ9x7h5w3TlgnzEhVHGMysAnkovBJjp
	mHjaGOY80UjYvi1InukySnw4hU9OwfP8KAruNtCjQvN7Cu5Ix00qxBPYWFWbSF1r6KywkxE7NbcC5
	g+DX810Yvz9z2My3nl5vxuK/Hpy9PEwmXjO6eaei3bWq1zTJG45ZzQEwgilzo7Va+mYV6me4UGNsU
	Mwlrzsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjct1-000000016JH-2uMq;
	Mon, 11 Mar 2024 10:28:03 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjcsx-000000016Ha-1H6q;
	Mon, 11 Mar 2024 10:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710152877;
	bh=Fgkwb/7yCvzFKvDQtJ1OKLGB5SBm7Cf1d4U3o19ANm0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IbVh30D1g/pEERm13Uj1SwlryBdRwfdYZ/5GpC0yUqsoEfKEk1zgHw72ThIXUnOZJ
	 WYLTmz+JGzVDoVNIyhKyC5H7auJ/aj9iAjmoxdtJl3DvfyCfF5JHMz7/V2ngac0Qb+
	 qy+jEBhJkozyrA+6xG/a/mdGfT1MVXvJfVd4je2YRVSt+5ucJO8Q/xgcD6/QvhLeKz
	 sYi1YnVVGKI2MPZRPYA4/jaSNwLNgQFufAPnAskO1zcsyAnpJhA5+E1AmpHdRD49ZQ
	 fgCFJc0B2gMQSxcKcSBLMvZYNgaznddSun1sV5U/00ThkwlgqkKt3ICyxIjVdF2J8G
	 W6quzf2Z7rFEw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 310133780629;
	Mon, 11 Mar 2024 10:27:56 +0000 (UTC)
Message-ID: <e701d13a-44e9-473a-b0fa-f6cf14efae28@collabora.com>
Date: Mon, 11 Mar 2024 11:27:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: mediatek: vcodec: Fix multiple typos
Content-Language: en-US
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240309-mediatek-typos-v1-0-fa4aeb59306c@collabora.com>
 <20240309-mediatek-typos-v1-1-fa4aeb59306c@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240309-mediatek-typos-v1-1-fa4aeb59306c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_032759_592941_BC05BC19 
X-CRM114-Status: UNSURE (   5.30  )
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

Il 09/03/24 16:08, Sebastian Fricke ha scritto:
> Correct multiple different typos found in comments or function names.
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



