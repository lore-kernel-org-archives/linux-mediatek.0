Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D55CE79D0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 12:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ow4BV+a2Lq44SdhoBrYK7gddtnvHdx1k5Mc3XwJB7LQ=; b=aqOyZmiLTQJlu5Qy25kypWqpxI
	3HR1IOWjIQ02TLtJPDpG1gW9CabQ4B86EaeSBOrP7JEFmhdT/U2zSih2O7SAAdaxfeGrEvQ8MwiWD
	yOO4IY8gfSsBIL9bsyxINJgpkm5X+0+oiN82V7x8dH9WJ48pi8eDo1oVYnA9hP/t4vmVvsLK97Jur
	OnLHAOgdIulW5yPJZABOM9K98LeXEJcAumpi885arLirT6y2gQG/3C6to6q1lYw5la9X/aA1FFXT7
	HhK5PWYtEtG8DrQnhh7mgkzz+xAJpOHjcJg7C1bVG85TYhKLarJJTiMzCTjNJQ8bJv9CC7azqnLTE
	tq56KyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwVR-0033zw-23;
	Wed, 20 Sep 2023 12:40:37 +0000
Received: from devico.uberspace.de ([185.26.156.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwVO-0033xm-1N
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Sep 2023 12:40:36 +0000
Received: (qmail 11716 invoked by uid 990); 20 Sep 2023 12:40:29 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Message-ID: <b96daf56-8ca3-4527-adea-d96937c8343f@lausen.nl>
Date: Wed, 20 Sep 2023 08:40:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: MT8192 panel_edp_probe trace due to Unknown panel CMN
 0x142b
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
References: <ca32347a879c794577f272a1473e44ee39f2acdc@lausen.nl>
 <6dd87d1b-255f-aeea-0445-37d34d242282@collabora.com>
From: Leonard Lausen <leonard@lausen.nl>
In-Reply-To: <6dd87d1b-255f-aeea-0445-37d34d242282@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.22044) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -0.31044
Received: from unknown (HELO unkown) (::1)
	by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA; Wed, 20 Sep 2023 14:40:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from;
	bh=HYAfRhXW3+fSJNB7JcVwgI/6cZJPCwWaAnpZPm6RMfg=;
	b=A86MvfwTGNMv2+EtS1Vw7YhtfdbVWiGDlG1L7Wx2YTWtvfCWC4Cb6BuRE/oZVE8MfJftlGlivs
	uFpjYhYaEczyP8OsF7hYUIlUFW3P0kOdV03Rln04uOfW2p7wl0CzKJS/GFyHKzsFuWzN91VIWzb1
	N5uhiI/GG1jGEETVRcGV3VuQy4G1FxoMYiDGIB0YxOKEJsjObHLRLXJMWnCKtwiDA63U+izkaQyi
	HZ6rxhMfQ1JAqgM8YwVtbqhNt+ZZBr3gkf0UflnbJvi5kLqdf7GQpq9F23ku9mvitJkjThVyXpV3
	0Dh4jfWIHAq6iog3ofjf0ojd4SrXH98cbcRuEiM+JzLfuHDLCzNbRqvO5t4vTdWkvjBzHKW+Benp
	arM154+Kp+QUqVih8TLiru5QACz8drY3LoasIA2hY/Lynt+/QTQqchF9BesVNBGyXpEWAswESftl
	Dg4pzCRQeWKij5FlK4Rs8+7nk7Q0VHf/WX6kk/6Ex8XIZTfFQk8u7ID5GQChBb0zW+mHHeQC92q2
	keCPaZGa3QA3+e8tkN4BWyi+rthUetEI6EwukManW0JX+EckXCGGBk8hX8Csogh6GnLfhX1cET/v
	HDFo+yhVlwCQOF5aa2DVrKb0UQoiGVgzV7mZkTmzUsYFQuUqRLLLT0VcbWkZHm+cenD3poL+bLQk
	c=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_054034_930401_9303A651 
X-CRM114-Status: UNSURE (   6.23  )
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

> Hello Leonard,
> thanks for sending me this snippet.
> 
> This is not in any way connected to my eDP/aux-bus patch series, infact this
> warning happens because your machine has got a new/different panel, read below:
> 
>     if (WARN_ON(!panel->detected_panel)) {
>         dev_warn(dev,
>              "Unknown panel %s %#06x, using conservative timings\n",
>              vend, product_id);
> 
> [    4.089721] panel-simple-dp-aux aux-3-0058: Unknown panel CMN 0x142b, using conservative timings
> 
> I'll try to retrieve informations about this new panel and add it to panel-edp
> as soon as possible.

Hello Angelo,

Thank you for taking a look. The Asurada Spherion is sold with either a
touchscreen or non-touchscreen panel. This one is a CB514-2H-K2HN without
touchscreen functionality. Hope this helps.

Thank you
Leonard

