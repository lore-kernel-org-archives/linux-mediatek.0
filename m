Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEE3C49EA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 02:18:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92D926117A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 02:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92D926117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDU+UxFiOfyVymMAMaNQN7thiAnzItOvoQL4rrDVaYk=; b=enxSTob0IKEpQw
	JV9/P5BRmQRRxC+V0uOKam59/Qp8Gk27K7AfOCOgidmWbRU1hP/+DhADE4AVOsHAEj0tKsFR2Og7n
	jXoszfVHCBMhRx2vTabxT/+6YDNIklvAk211A+QzSkoxc7Uv/6Kx8AYE0mYEu3K7kcfFzEsncuX8e
	6TNqlU5y4pvpTFmh8fQNFgDx5BwVzHDvR6Ai4AknW72YZj8pWYCeozbFfEWEWWqyFi3ug5nlU6OI7
	//sfLjETtKhncyEhnCqqja26jH7jurPZWW2qucLhdLDkEmYkb5Pu480+hQud5c9yDO3opkhVHabUQ
	gCIP/+qCt+G3FYZG5+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lv9Vn-001sGq-KQ; Mon, 21 Jun 2021 02:18:07 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lv9Vk-001sFm-Kb
 for linux-mediatek@lists.infradead.org; Mon, 21 Jun 2021 02:18:05 +0000
Received: by mail-io1-xd2b.google.com with SMTP id b14so13964891iow.13
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Jun 2021 19:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sC+CWqmXSvQbdEzFj6mik48sZrpR2zcfHhg4ZTETBBE=;
 b=kU1bnKG9ZtCmpLWsP6YXUdugCf0ACmvDyukn1JMuevjRIfI5H8OQa4cTUPk1+nByFz
 BYt6TVpKcaY+2DZ3UElO6WX3dn8XlZTncNElItaOFM2G+yJq325tZWhFECqIytxm9zIG
 Lw9VW4OXdrx8DApt914a1xHAlvilxRVueAIK2U2oky7b/C4D7Hj2e05tLR6XV6qNVgJj
 El+gS3BtIyITh2lIfJ14Jrm3tOJ9UIvRv9T93fc4eMdfC/TLzmoknVxmnMTl/M3EXiK+
 SWZz5XdakhYh4FW1A7dcQmf095EbpDt6QlmalAQncWGAyZ38yAr21fZDbccKx56bIgdP
 gOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sC+CWqmXSvQbdEzFj6mik48sZrpR2zcfHhg4ZTETBBE=;
 b=FtWCmI3guWDn9vQ8bMBeuBCS1pRTFvUSceT0v4rqv8zhBwuI3shURMeDfo6TywLlQL
 LBtQ9l9PU+ADrJe595WFDydChHBePzENYzpH3n3ykUWQESc9j8DXF6sw65iMioJ6zS58
 K3afQZGewv/6o2XLaNqTS1KyMDA+9LemtF3dPOvsCyZ3AK3uVhilumlkXyrRY3r13Its
 rv8WrspEVOTijU1486UMJUrzOWpdpJxUSpF8c+dBhlMxlepHi5lh1kTS1qV1cYV2Visc
 3kMSy92dG2TowPxKgvL4ex1ufytFoyN6uygVfJCdlyXmkeCgKgeZd3b8Oz50z8W5mvaP
 IsDA==
X-Gm-Message-State: AOAM532MXeCr56AZxavk6gDTLsufpqje2SxUQzZKjKgozUuDBjfzWCya
 28/qb8lZKIJ+riGE1sfxR7A6FHKuIyv4ediS7DfmGA==
X-Google-Smtp-Source: ABdhPJw362ru0c9lLnP975ktgy0BRnIsfVZHKqh07ExNCmbCaUdaW2PAjvmuiDnJ0QjIWUWJZx+zduzSSz6vpSUvFPA=
X-Received: by 2002:a05:6602:38d:: with SMTP id
 f13mr18110750iov.109.1624241880641; 
 Sun, 20 Jun 2021 19:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <1624094597-23993-1-git-send-email-kewei.xu@mediatek.com>
In-Reply-To: <1624094597-23993-1-git-send-email-kewei.xu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 21 Jun 2021 10:17:49 +0800
Message-ID: <CA+Px+wUo1T6qesMudkOo7+9EP6bLOT4Akzj8DOEg5EG_kQcHjw@mail.gmail.com>
Subject: Re: [PATCH] i2c: mediatek: Isolate speed setting via dts for special
 devices
To: kewei.xu@mediatek.com
Cc: wsa@the-dreams.de, matthias.bgg@gmail.com, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, 
 leilk.liu@mediatek.com, qii.wang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_191804_741679_C153ECD7 
X-CRM114-Status: GOOD (  12.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jun 19, 2021 at 5:23 PM <kewei.xu@mediatek.com> wrote:
> In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
> support"), the I2C timing calculation has been revised to support
> ac-timing, revised to support ac-timing adjustment, however that will
> break on some I2C components. As a result we want to introduce a new
> setting "default-adjust-timing" so those components can choose to use the
> old (default) timing algorithm.
Could you provide a proper "Fixes" tag.

> @@ -544,6 +558,7 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
>                                        OFFSET_HS_STA_STO_AC_TIMING);
>                 }
>         }
> +       mtk_i2c_writew(i2c, ext_conf_val, OFFSET_EXT_CONF);
This looks like another fix.  Could you separate this into another
patch or explain more why it needs to be in the patch?

> @@ -1284,6 +1355,8 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
>         i2c->have_pmic = of_property_read_bool(np, "mediatek,have-pmic");
>         i2c->use_push_pull =
>                 of_property_read_bool(np, "mediatek,use-push-pull");
> +       i2c->default_timing_adjust =
> +               of_property_read_bool(np, "mediatek,default-timing-adjust");
Need a DT-binding document patch for the newly added property.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
