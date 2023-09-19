Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D82CD54A9
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 09:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6P/vIhPf0hcg6OELFVUNFN91rwX0HssVb9WZ855EiU=; b=CdU6R5vM0+4HOzMWAlTaXy0StV
	5T8+j1zb9LradANDU1dJgKWaJHvlMurZ2Z0HgEc8W6l/HLV+FhLiO3MsA/hynxdJ87Au0nvAaYZn6
	SbkgwxPni2sF4sIIW7Pk7mRLN8OpVbJyN5otbSPthRkmRhmCMQDObNDVlJbK9CsdAeHpl2Um5igp6
	2nbvELUBKBucj30GjLjDgeYaQ02+olDBbvWXf1OxflTgJPVetvEcY6JrYF8eL1nYVQ03/Y8IJMYbq
	2Rld/DPpqnTopf4JE78Pn+AyCU1oZeWeTIP6Z2lT1o+XhHf5UhhAzFKvs0FBWs8+iWtQIBVqDMgGw
	3LkP5VIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWzr-00HSDb-16;
	Tue, 19 Sep 2023 09:26:19 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWzn-00HSB5-29;
	Tue, 19 Sep 2023 09:26:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D88376607079;
	Tue, 19 Sep 2023 10:26:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695115572;
	bh=Tf/Prg/AWcVMPn6dgYGWrU1QgYEEKFn1/Ywarvh6ym4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HDUhaWZt8TuD3XKxH/iiRo4TzTt4G/JlQsAcpK4cSv/F9wbyi/Y/8/4hS+fH8t9B/
	 mfO4hvMtfhKGUPKxDQzFZAdKt3v00q9EuHvZcTs9fDOcYeCRpMJOf77AaraQgtjQ0z
	 eQlV/c28MwSvr5zk9nbt7mAZZIgg6pyC6bdbZBisigrClo+ZMDtUrOnEUlwkoGjBfk
	 GXsOgg4VUSEO5SE1NE2G/mACTqYwzqG9Cl0W8A75yHHBWNtJoR9ZUxnH8yVUNUBQmy
	 30gV8II1kz2JAnzuw7uDINiucKXaKW4A6PMEBGSla0VM9YsDNrMpy4V/IhHthw3PQn
	 lKB82uA+cxEFw==
Message-ID: <13843095-0906-804e-ffbe-36625ebe05cf@collabora.com>
Date: Tue, 19 Sep 2023 11:26:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] remoteproc: mediatek: Detect single/multi core SCP with
 rpmsg-name property
To: Chen-Yu Tsai <wenst@chromium.org>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Tinghan Shen <tinghan.shen@mediatek.com>,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Laura Nao <laura.nao@collabora.com>
References: <20230919050305.3817347-1-wenst@chromium.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230919050305.3817347-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_022615_847866_0BE9CE2A 
X-CRM114-Status: GOOD (  17.28  )
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

Il 19/09/23 07:03, Chen-Yu Tsai ha scritto:
> In the just landed multi-core SCP work, detection of single/multi core
> SCP is done by checking the immediate child node of the SCP complex
> device node. In the original work this was done by matching the child
> node's name. However the name wasn't previously standardized. This
> resulted in breakage on MT8183 and MT8192 Chromebooks while the driver
> side changes were picked up and the device tree changes were not picked
> up.
> 
> Instead, match against the "mediatek,rpmsg-name" property, which is
> required to be present in the rpmsg sub-node. This makes the
> aforementioned devices running old device trees working again.
> 
> Reported-by: Laura Nao <laura.nao@collabora.com>
> Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> The patch is based on next-20230918 with a whole bunch of local patches
> stacked on top. None of my local patches are related to remoteproc, so
> it should be fine.
> 
> I tested on both MT8183 Juniper and MT8192 Hayato and on both systems
> the SCP successfully probed again.

Instead of checking "mediatek,rpmsg-name", I think that a better way of checking if
this is single or multi core is to count the number of cores...

I've sent my own version of this, please check [1].

[1]: 
https://lore.kernel.org/linux-remoteproc/20230919092336.51007-1-angelogioacchino.delregno@collabora.com/

Cheers,
Angelo


