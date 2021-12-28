Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC02C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Dec 2021 07:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwFIIo5g3mDeWgXNJAp1k+SfcFG6T7JF7y6Uj87Tg6M=; b=3E8DVQbzNlyrCS
	uQWsuGu/B/N3J37UYPmfzUrIsn5+oybN41+oeNjyNLSZVuKSXsTAH5Gi0IPeVNW5CeBPfjRE1DC16
	BZwswM+K3B9ekXODt9fBk0BlPofpJ/qxdVOK+NecP9qE9CaXH3pjywvkBL1pRH9+TFa0OUCGAgHmr
	DS1XlJGAH40v9n14r3yzNISvbgzZdcKeEFNg3VM268TFqjHmAB897HIfLf7HDJZ0eH1n2v2DjdLH9
	Wx7WdxNwQGGg4LnsZ+X5e94mdJrJYQY+FCr7lfavwghWcu0xCYIPGaWQ/oXU2GFFs1v9Q0+l6BQ6i
	17Sw3Wqr9ase4G7ZQe/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n26eo-000LqQ-V0; Tue, 28 Dec 2021 07:12:26 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n26em-000Lp4-Cp
 for linux-mediatek@lists.infradead.org; Tue, 28 Dec 2021 07:12:25 +0000
Received: by mail-pj1-x1029.google.com with SMTP id jw3so15234969pjb.4
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Dec 2021 23:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NXYVCRlkl1arj3e8WvF9NDZ27UwRswxMzQ9HSWmcWkI=;
 b=skfkrXnoE6gcXNsZO24JsoWju8VO7ddjO/I2mgv+T/TCep2bZbtmSO1O6ccPFzd5sD
 eFevQpVM1RXH/UkCEKzds05KO+5Kw14kClxop8CYk0tOqi8JG1EZboFb1FRhnmZ46gSx
 njV/5Nc+WWANbyAfOxa0uNzAy4a2qQ93p9JCAUyFVV4Sm/YCLhmuw2UFMPOq/YYslhzn
 lVDGd2co3ae6ImuSAbr8bUHlNJ58xtdeMLBRNgy7xL/ecBfYwcqD53//q2/QyMlWRmQK
 hkYw8wmshBE/+X1bq37jhosbWYqdBFPviHqGqAOqSzvrzYm9T9jQQOT92N7BVJam27Eo
 JvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NXYVCRlkl1arj3e8WvF9NDZ27UwRswxMzQ9HSWmcWkI=;
 b=1Ffq8T8+CFxde9hjJk2OSm3+/T43WgkOIRz2fQDp0pVU17rh+YylWk2hb5jMpSxh9W
 /gA8SmDg7uKsobGeV0w6kq0iLiXhkH7iXKX8zitkB8CZ0CCC3Xu+ZLq/M2iIomZD4Qs/
 1WvEumY/r0dlD+IyqzUiNF/aVG2yQlgxRsdYO1ABH9tiB3OsBTpB0sadiGSD2vqR2q6I
 iTpM7JTmPGWsppgolqKo49mghHh7N/4o3vZnL+BRc3ZnQql8T7TVv9K6tMpn/hn3ohro
 +wgZgDD7VKAV3s4mPq/KkSYIeRmBILj3mjXn+qbm0ub6AQ+aegSC4u2k+Wf8JLGG4ovm
 EU4w==
X-Gm-Message-State: AOAM530PTA8xYTg7tWLaFUlScpJlf721dDDgsqtMtfXE+HsSK0e1VXt+
 vtedWRr24HATDD0VQ1G73tsUtg==
X-Google-Smtp-Source: ABdhPJxgKDjojCITnOzByiXyEFe4d2LD2wr+DhASX8KwbIQB+3HttKHl2m/2SwjrTuCWYzRRF+QSYA==
X-Received: by 2002:a17:90a:5d13:: with SMTP id
 s19mr25373225pji.117.1640675540049; 
 Mon, 27 Dec 2021 23:12:20 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:a817:45ab:1beb:f01a])
 by smtp.gmail.com with ESMTPSA id a4sm21708498pjw.30.2021.12.27.23.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 23:12:19 -0800 (PST)
Date: Tue, 28 Dec 2021 15:12:16 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, jiaxin.yu@mediatek.com, shumingf@realtek.com
Subject: Re: [PATCH v2] ASoC: mediatek: mt8195: update control for RT5682
 series
Message-ID: <Ycq40KwY8SxUslXC@google.com>
References: <20211228064821.27865-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211228064821.27865-1-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_231224_467374_277E3203 
X-CRM114-Status: UNSURE (   9.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 28, 2021 at 02:48:21PM +0800, Trevor Wu wrote:
> Playback pop is observed and the root cause is the reference clock
> provided by MT8195 is diabled before RT5682 finishes the control flow.
> 
> To ensure the reference clock supplied to RT5682 is disabled after RT5682
> finishes all register controls. We replace BCLK with MCLK for RT5682
> reference clock, and makes use of set_bias_level_post to handle MCLK
> which guarantees MCLK is off after all RT5682 register access.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
