Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B5FC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 10:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=celXELDQTmR3vo7KZLEkU6NlLiLlyPaURYIfLw94/NU=; b=iLLuSfM13AkjR1oWTYXyuX3NHc
	OKRcjrebAy1a9MbL8t7ElL0AINZporOXHKJmbHODtCNREmZ1tRuzyoHwOsmtW4SMFhsiYhvIfHGwX
	0DC7GXtq0vgTHtmHkafO3RvxRrjQFaCSCUZMDp/K0AFd103SeJX9ARCicgTBAQ45gZoleBel/kEoB
	nyQ9We1AUc7a1eeIyU/3DMzyUyf2cZTnbZfw/jnkebdDH2uqb6cZJO9KHMOqIvzcoDL18ohbrglKN
	WERIgMhqves0X+BcZPQ1xrYC7PZHdfqnvD3wajTZwHiZUvD863/bhcnHmsby1hFKmI1vOrO6pn/SS
	rtDkTPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD25U-00FAMi-2V; Thu, 27 Jan 2022 10:33:08 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD25F-00FAJ1-ME; Thu, 27 Jan 2022 10:32:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C6C341F44FF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643279572;
 bh=3IabDGDX1X8Lt5ZJt6EaeuvYuynxAJ9WYVmwg7VmWFI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=A+56cwLIlE83emP51k58CylI86F66rWP4M+qdLmNZZXsyQsc/rk7rAaw9cQ9GfzN2
 NFg1ESq9RvxlhQuPqpZ83YpsLZus80W1ZC+B03U52ypPP8BL6wO3m32ed7gnMgJ2g/
 hYfaG3ddeF05kmu1TeS4zl1baGU/pyAENVuy6BHej1ROueYVRX5rOB06JdZgobg954
 3KMh+vmTcgCJdQBuNDcBUqT/aVC2iPZdL/6ZFD6RBQYPJZsXyGW6fomKu+HiEwa3tL
 uZcaLZLdxBXNXqKu4XmBlgD7wBnMkkbqvI163A8FUnXoM2gQ27qBysJBPxG+n1bS1O
 Flfp/NL33MO7Q==
Subject: Re: [PATCH v2] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org, andrzej.hajda@intel.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
References: <20220104095954.10313-1-angelogioacchino.delregno@collabora.com>
 <CAMty3ZAojTyw3H8VprH9aiyTyWjeL8oqPxNNr=J33_5FrcUj9Q@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <4b46b8ce-7300-ef42-eb17-efd87ebdf773@collabora.com>
Date: Thu, 27 Jan 2022 11:32:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMty3ZAojTyw3H8VprH9aiyTyWjeL8oqPxNNr=J33_5FrcUj9Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_023253_908249_F18F619D 
X-CRM114-Status: GOOD (  17.70  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 12/01/22 08:09, Jagan Teki ha scritto:
> On Tue, Jan 4, 2022 at 3:30 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> DRM bridge drivers are now attaching their DSI device at probe time,
>> which requires us to register our DSI host in order to let the bridge
>> to probe: this recently started producing an endless -EPROBE_DEFER
>> loop on some machines that are using external bridges, like the
>> parade-ps8640, found on the ACER Chromebook R13.
>>
>> Now that the DSI hosts/devices probe sequence is documented, we can
>> do adjustments to the mtk_dsi driver as to both fix now and make sure
>> to avoid this situation in the future: for this, following what is
>> documented in drm_bridge.c, move the mtk_dsi component_add() to the
>> mtk_dsi_ops.attach callback and delete it in the detach callback;
>> keeping in mind that we are registering a drm_bridge for our DSI,
>> which is only used/attached if the DSI Host is bound, it wouldn't
>> make sense to keep adding our bridge at probe time (as it would
>> be useless to have it if mtk_dsi_ops.attach() fails!), so also move
>> that one to the dsi host attach function (and remove it in detach).
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
> 
> Eventually I've observed similar issue on other Component based DSI
> controllers, hence
> 
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> 

Hello dri-devel,
can you please pick this patch?

All MediaTek platforms are broken in v5.17 without this one.

Thanks,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
