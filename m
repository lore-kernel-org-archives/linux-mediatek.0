Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0F7C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 04:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iuhGSVf7+WDtGkijUlaH9df6tvWhz5+OVPX8eGWPg0=; b=un7j4SySFrmfm8
	+oUo6nrFapvPHDpH+MU/6P/mHFvNhOMpFiBg/vzydEkTc4ooYsoBXQGkyPLDcTY1Blixho5OtDv7p
	dU1BOSkC5CDtbpIpKBteL3rAtNVYx6drV8WniJUws2SFhNEio7JQ6/wnGg8OHM6Mkbd7I5rcpHPUV
	nYQQEMRlER3Nxl/6sS1F6ltMFWyGRDEcEkQLqpqyKqMfr1xhwUivwfnPpul+bpLI9hsbKHOCYkyUt
	LEHm804/1orhT3PNE2VvprBaShZlhX+DNb1J+256MDWqo867uaD0pbLdlqSHIcS8DyBl3Zwav4WB4
	7PjT9noXhqGbl7WVaS9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM0Qq-003R5v-Bf; Mon, 21 Feb 2022 04:36:16 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM0Qd-003R1R-6R
 for linux-mediatek@lists.infradead.org; Mon, 21 Feb 2022 04:36:04 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id c6so31817037ybk.3
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Feb 2022 20:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r5As6xybMbHa3s0ZXvX3I33YiMXVbFBM/uVu6GSmj6s=;
 b=KQAkF9WmCe/QnKSzp/0OcCmZ2i7giu1lnJTkZqJG76g0Z2atpAQuJb+p+BSHEtd+jz
 kJR1XsOcZ0NJoGGUxYJWO+V1dxs3ZYCtuYBr9BTww6Xra0W4HE84l14HlAtuSZDZ8mSa
 WL1s5P8QcpAiJ78jjNvzo4AgrnLUO5q8ShE78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r5As6xybMbHa3s0ZXvX3I33YiMXVbFBM/uVu6GSmj6s=;
 b=kDQ/HEkSonWBaejjyqzMmWyH944s7zARJCoyTOeo2ORjnRI8TdZk6aOrJg4cfOiBYS
 Nuv04e5TIE5UKXMwcl0u+w60CTB53wLRYDwduF3MlE0xJxADMT9Yayvc08FT64OLWllR
 vpWfmldQnpNUsybpczKFliIK4q+JsI8QswUcJCvlxp8udeVKXCoZodgqeXJ9Rj3IJNb4
 AHz8IGRn/jGwVMKgtWGEexL4rgVJe7aeoswMsZvW2prqLtzsauDvp8AE5cbxbmT19dKL
 5b0wifx03868uQii5aI18udh7GFxtmJKM1FVSLyayqjEBy8rrSzJKhh2mpn1kdzoroyv
 M7cA==
X-Gm-Message-State: AOAM533L92Z6Yn1btx4lPpnD1CHC4Ix9Ba+1PiRHGByLNffBVCzaKe6G
 LGm/wTbSPpLE9XhtZap7QVvZ6Tj70xGyP0lI4j7kXg==
X-Google-Smtp-Source: ABdhPJx/PVV5BHv+xdUNOqNjwWrd0XWmqmIJ7BWEOj0eLrR+l3qaKvWwKMXpjaw2dzafRJLIgp5b10sJsULqf9JAQkk=
X-Received: by 2002:a25:2d52:0:b0:624:1bf8:2f8 with SMTP id
 s18-20020a252d52000000b006241bf802f8mr16353156ybe.219.1645418162345; Sun, 20
 Feb 2022 20:36:02 -0800 (PST)
MIME-Version: 1.0
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
 <20220210141931.291712-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210141931.291712-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Feb 2022 12:35:51 +0800
Message-ID: <CAGXv+5Gsa537Q7+mk_DBCBvQ8jrgHrd=m66FjL5TMuTFdBovmw@mail.gmail.com>
Subject: Re: [PATCH 3/5] pinctrl: mediatek: common-v1: Use common probe
 function
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_203603_268883_E96739C6 
X-CRM114-Status: GOOD (  10.62  )
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

On Thu, Feb 10, 2022 at 10:20 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Most of the mediatek pinctrl drivers are calling mtk_pctrl_init() and
> passing only a pointer to struct mtk_pinctrl_devdata, as the regmap
> handle it passed from device-tree, with the exception of mt6397.
>
> For all of the drivers that don't require passing a struct regmap
> pointer from a parent device, simplify the probe mechanism by assigning
> the required structure as match data and use mtk_pctrl_common_probe()
> as their probe function.
>
> While at it, also collapse the of_device_id entries to a single line,
> as they all fit in max 83 columns, which is acceptable.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
