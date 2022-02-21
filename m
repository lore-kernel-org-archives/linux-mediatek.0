Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54ED9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 14:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fh7QFtRLkiGAhnqTlSuHk1eMsTy1oaxsWWnixQdaqgM=; b=MidnW8R0ZsbdxZ
	/kfzHn56Lu4pLFn2u6zL1/fu6yIYnVgKBmNeipQb/AjZa44ycpezV0GLhH+Y4yCT2/f+/1ryGKsRC
	oPYtO3QwzlNBIKRal5w1qBMVz6a06C3DrJoW3wrQGCCXnmeId9b6kMMVPiDqcX1MGUWFuIeQSDApe
	WcVX1LVB3F0NXA0V4hyrTuGcKCnRNL3p0NLWAOjhaXHsU5AQGoImxP0Ut6eIYe0r6MxIz+PYxh+/8
	o5cTShxIvCZuHAMU5r67kTI8h7XjqZo95HgVXrnjNX87p8Q8sr6feetq+H6gL57RzxB9uh0AnpUlz
	XwDpZPLgHQE4GQZ6yHsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM9HX-0067Mh-4y; Mon, 21 Feb 2022 14:03:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM8vu-005yc3-M1; Mon, 21 Feb 2022 13:40:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A916B1F42EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645450851;
 bh=+dtEQGc+iAoSujb9RCXxGPyqsje87DXa4PQPFCuMHGw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HXQCaEvDnJ7NxZe5NCiOQDyf1NUsnPaRQugb3WnTrumacN8l7UzYd0Z7qgwuQCi/U
 K39o8DEzFthVRDWbkZmBuUy7jwje8Sf20UjgI36pERPdJrJ7a2uJ+gpB3x6/VaLHJ0
 HcnVCiu13CbeyZvR+Fc4UcHMmK+NKqITtiyMlYhNNkLvDiMZaw1pOjhrinAIiHdYzJ
 gheHCJMAgj9NpiWTP/YtNzz2JZrgmL61GSvSPUJfar52RExnaEjHokOaXpj3qzwy1o
 yBwDses2tMKGUrO5CdNEdA6WdiYQAKHH/RJDbxL8hBITdzdqAUzljuhRxJNvfB1Gtk
 OLao6gKl341Ug==
Message-ID: <211bd3ca-f786-b161-6f3d-dc6b8471ffc7@collabora.com>
Date: Mon, 21 Feb 2022 14:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 5/5] pinctrl: mediatek: common-v1: Commonize
 spec_ies_smt_set callback
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
 <20220210141931.291712-6-angelogioacchino.delregno@collabora.com>
 <CAGXv+5H0OkMk=1MZH3jCFSZbauJmEcgFADfDXDPf2r1wrp8wCw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5H0OkMk=1MZH3jCFSZbauJmEcgFADfDXDPf2r1wrp8wCw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_054054_947730_58D2C556 
X-CRM114-Status: GOOD (  11.34  )
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

Il 21/02/22 10:58, Chen-Yu Tsai ha scritto:
> On Thu, Feb 10, 2022 at 10:21 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> All of the MediaTek pinctrl drivers registering with pinctrl-mtk-common
>> that are offering a .spec_ies_smt_set() callback are declaring their
>> own function which is doing exactly the same on all drivers: calling
>> mtk_pconf_spec_set_ies_smt_range() with their struct and a simple check.
>>
>> Commonize this callback by adding the ies and smt structure pointers
>> to struct mtk_pinctrl_devdata and changing the callback signature to
>> take it.
>>
>> Removing the callback and checking for the existence of the spec_smt
>> and/or spec_ies data would allow us to staticize the function
>> mtk_pconf_spec_set_ies_smt_range(), but this solution was avoided as
>> to keep flexibility, as some SoCs may need to perform a very different
>> operation compared to what this commonized function is doing.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Hi Chen-Yu,

did you mean Reviewed-by? :-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
