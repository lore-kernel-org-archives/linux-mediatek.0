Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63D9C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 07:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6cQibpEnn6TzwWyfy7GBeifiFINVuL4mp8WjOW6/+A=; b=GEq2Uqj9MG+DqkTKUYHXFGmb5i
	5Fgo69ts9jbeysihq25TN88EMDEWYVfaZzx5bBwQH/hmKv4H1oIIs0PM6mVgB77N//5thfKP0f7Fd
	EaaTYYe4wPAT7xhdsYIdYGz0VDB02vs8A9054DfltOCMNHTV1ahDjicR1xs+J7QUdZxVV25YfADOI
	bE56V0X4rwnyVP1vcDClf3inQTTM4GN8J6v5J0T4rXHE7gPixYSn6Glwfkz9fJLnVKMZl/z8mCJ7q
	3Il9ow2WvruljcxgVYZSHkvoOVfs9Hzg0ZgbxBR29eVqTpcWnIqfpbNnhrc7sGbkkgZmVi7ya3uTk
	HOk1ijpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMhz-006oTs-QZ; Tue, 21 Feb 2023 07:05:03 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMhq-006oQi-BO
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 07:04:56 +0000
Received: by mail-ua1-x930.google.com with SMTP id e16so198747uav.5
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 23:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L6cQibpEnn6TzwWyfy7GBeifiFINVuL4mp8WjOW6/+A=;
        b=aY2W7b/4blQCDGIgYB5drvZfVY2k1DxfPUoBrZsqk46LwTuerf8K6za3EfdQdOe3cM
         aA+cyLc4KrmSuRoJPekj9H7AP/xS8aUp7lYPu5G/ZZDjNkIeUVbizBaGqfUeP6QRCyHH
         rbDR/Pzm17XsLAR/P0Ut7WyKaiEuIFl1Vcpes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6cQibpEnn6TzwWyfy7GBeifiFINVuL4mp8WjOW6/+A=;
        b=UcJyL+uBOzvPeFmapx3e6K4DOjFy9x8Jt2F799WDfteXvXEpAlLfaILoHxUd8FvKIB
         9AXNCPQbv+m25OasuKA4kf0keyeAgQKaXv4FYNZx6dmd0kHP28G8CIzYcnSzENSg1VZ0
         ye8gXzMc6GJTzwDMVdEqz2HSJ9G4HQp0eRr7LJWiTgMAmOJbcqpwkiZLs/ARgTwTupW5
         6pxBeUYIHqbo5f9FtqZyIqoLDJehQf5QxsTVs5b6N425xinm1+n06YlNvxid93NJnNB3
         LRnmSnzl2/LWC5c4arrt3gbBAvuzoo1rcrzB1Zr1mWzEBD+hjB8usCpHe26I5C8ZghM6
         3iow==
X-Gm-Message-State: AO0yUKU/inPr/qmuWRleIkTcYmv4hoURmN8x2pg9WRtbSMQPVrsngyrH
	7MRrXmoj5dwsNpwY+Uxt/+ClCSKTEfhKsNPKq7fHpg==
X-Google-Smtp-Source: AK7set/m96c8D+pKhuEJi9f+5I6u4NuErUen0os2GbN1e3EAujlpP7AGxI+8TZ8PKMuDX7wuFi92K/rMChXS4JBUZCQ=
X-Received: by 2002:a05:6130:211:b0:663:e13d:57a2 with SMTP id
 s17-20020a056130021100b00663e13d57a2mr1309979uac.1.1676963092520; Mon, 20 Feb
 2023 23:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com> <20230216130021.64875-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230216130021.64875-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 15:04:41 +0800
Message-ID: <CAGXv+5HD9a5MuJ49L_XzkY-89FDCPop6QybA4eBw-ouK9Z2DQQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/9] soc: mediatek: mtk-mmsys: Add .remove() callback
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, jason-jh.lin@mediatek.com, chunkuang.hu@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_230454_403770_B316A76F 
X-CRM114-Status: UNSURE (   6.79  )
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

On Thu, Feb 16, 2023 at 9:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a .remove() callback to correctly unregister the multimedia clocks
> and DRM drivers.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

