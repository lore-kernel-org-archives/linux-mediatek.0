Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524B1C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 05:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SdDgKb/8CZXVcKHrb27WnrCNDKmHhMmCt+ahSI3BnQ=; b=fKMdSCYfT9gmpz/5K4n2zpApE3
	6K+kKb2adapm7LiA+3LeDWk715Z1er5jcmMBnvNfhLjyZ0Cs8rIC33V6sMbGZyRDNT/LhJZ7rXTsd
	hLrtxDhzo1ZO2rxq6GB8eHIZzi0feEF4SKasjEnha4Wj2TB7ehBK40YjP27SdUzzHC9yhItgGgS5X
	KjWEQ4Fv/ua/pk4IA0zNrUarlkbRNsRL06J6oLymmyVR68CkCTdXTgohQxKVwzlJx+k2hNzmHGEHY
	89jLfr7WDHZbNEmRJzX+/o2SSF39EjdRLm3bE3ShTTiu4nEI2KPjuzq4b+v8fTRIH5sDMdCLB7r0b
	US8jly/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pStZK-00CrKH-Gz; Fri, 17 Feb 2023 05:46:02 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSsPd-00Ch1n-Ua
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 04:31:59 +0000
Received: by mail-vk1-xa31.google.com with SMTP id bs10so2462956vkb.3
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 20:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4SdDgKb/8CZXVcKHrb27WnrCNDKmHhMmCt+ahSI3BnQ=;
        b=FMljJubHsaElsWtwyMPXulZVx0IzoKTmNdVRohhh7riEQHGrlvGIBoR3sB0Mu/nIFm
         A9y0Ki7HGc48I3sBUHZ7bLd3wMFIGTw11+I2NmLAGHq7AJq7ueVSGe9M7K2Ju1j/JfXX
         l09jZwu6wpq959VEoDXibwYYLzczlamKVQ+g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SdDgKb/8CZXVcKHrb27WnrCNDKmHhMmCt+ahSI3BnQ=;
        b=FulvQeH6SBdJBSbbkRUW0PJjaqAxxAU3YXlk5bySapmqwjfXTP+Khc2oGV+YMGfRiF
         d24194YD7E0VL1sBmmFguGyerESDzcumFoYoO/XuLoCFUpNNfxwfkHypQNpYksIpJXYp
         KlOuddGcpnHqv25+m1zCj0ODpx40VviaXVVTSTeFibLNwnEuBgrAI6K7ElEyybAKoPv4
         SFkHdOQeLloNZDIaC+aD1J4EwE29rCWaTWe8mjU5iuXGQCEhOCgm4zvqWfCIHsj8TcpP
         el1d/d3OZOIinSxXP1B/PN5ICkwWhLkDVVnyQ7ZrJ2r+N6Td75UF9ntuqN+WyII2Jvuv
         QEUA==
X-Gm-Message-State: AO0yUKVbge39a+ziZ+5Nl0OWhAvnE05vfI7XvGezv3Lx1Pnx/CBJsNi5
	8n0zVEw5k/KfM1GYQXxD4h23JwXrq4UUy5VsWgIc4Q==
X-Google-Smtp-Source: AK7set/LyxXRr+sumZROeJO4s16ExGKjzu7tn66ff/AESIRiG79BXtzTjOtZ6FIsoLoMABtdoYQCkZ3lJRoMNXtGZkk=
X-Received: by 2002:a1f:a447:0:b0:3e8:66ce:a639 with SMTP id
 n68-20020a1fa447000000b003e866cea639mr1327876vke.2.1676608315967; Thu, 16 Feb
 2023 20:31:55 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-39-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-39-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 12:31:44 +0800
Message-ID: <CAGXv+5GVzk6ZXfhgCRkK7HbjQq0K6geFjw7Fhno02cdNtKCF1Q@mail.gmail.com>
Subject: Re: [PATCH v2 38/47] clk: mediatek: Allow building MT8192
 non-critical clocks as modules
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_203157_990514_C94F8E73 
X-CRM114-Status: UNSURE (   6.17  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Allow building non boot critical clocks for MT8192 SoC as modules by
> changing them to tristate.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

