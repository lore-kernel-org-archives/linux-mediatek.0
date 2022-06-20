Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04174C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 08:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytMUXjmaN8uHSvhOnNn2seCP4qJ7rfDpUHNy7RTqCxM=; b=ZzIVbRREY6Z5iUS5/DiDUlp7pm
	FsRIyozu7buBzvRVuvQKTnowA2aCrl4nB3kGklWgieKo6yE7vMkH7bjFI4iqVro8X9cKYxXGiGn3N
	d4NENv/wRAtZXY7GRJb2BeiHJGXQUUU5nTMs5MUQsw1abWSn0wmj2sUkdENiM7FyH4GEAVkE7oc+9
	FHA+BKwj1mbRO+4VzsWYczDGqPCBAFqvQLyc0S0LDjp7SEvjc/j8ga9R9C/iMUyNMm69PH33uk4xz
	/w3AQP+qjfkN1ONAaZ4lomg25jjtpwRUdmpCbmSdad/iWHfTuT5oy15T7trhYPisjt0UOpKLFNTXM
	mtz7S6+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Cjz-00GshB-0V; Mon, 20 Jun 2022 08:26:35 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Cjh-00Gsa6-JI
	for linux-mediatek@lists.infradead.org; Mon, 20 Jun 2022 08:26:18 +0000
Received: by mail-ed1-x535.google.com with SMTP id e40so1478852eda.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jun 2022 01:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ytMUXjmaN8uHSvhOnNn2seCP4qJ7rfDpUHNy7RTqCxM=;
        b=hd1CcsMoEubcv6jr6mmIlVzkPnefJUP8r20R0zYK/c+jUCgKI8Q3JnLWgClt35Uisy
         4KbHXd9q38JNpI5fY6UQgh6EaWIHQxw+4tio8Di8lZre94OlHMYRIdM/jJdTFqHVz7B3
         bSbk0rAc/JmUZdW8yMVeBf8pChYxs09lHNpEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ytMUXjmaN8uHSvhOnNn2seCP4qJ7rfDpUHNy7RTqCxM=;
        b=qwKYgNhcVQbC5F1VwG+fWRI9rsCa9FH9mcyNqam2ag/zVIe9wQ1o3IGUp5ED/0a5eM
         fSGe4rzjPjEFiJukdGRFO3NGDpI5WOBpIPNI+RsB/YhU6rWm1BVmPOi86W/vBXnTe7Oo
         SXtfp/AlUtRQ1nU0cyPzE6HVXrWytdXNhz2mildSdRCMxrTx8QCxKHSUACH+DJAQuOHJ
         Oshuc45qzFkFlVLcGDPoMrasz0lNSeaxNESWWxHqOrluk6z3Gw3Sd0IdTuKiE9/CfMh9
         iE0hCgBX4I4Dxnnz7q6xjtQza2nGTuVOvjELlGYUf6U4dbgK/tjTPeRB7b9JcoS2G+1L
         jJFw==
X-Gm-Message-State: AJIora93u/4ZTgi6i+L+/f5VX2YsSG0gPjA7XgxGuu8MgmPTCKInk9Au
	1HZmCQQjBvV6/wTX/MxiBS+HL8JY1vt1DWKn+0RnOQ==
X-Google-Smtp-Source: AGRyM1sW1N2WJNAFBze0aVQVaROgZ8Ht/RO6hxNo4xmROEhN05naPzIBxPQWeqLSKYLqFDl/OC2uAiiLvkZXDWbHcKQ=
X-Received: by 2002:aa7:c84d:0:b0:431:4226:70c9 with SMTP id
 g13-20020aa7c84d000000b00431422670c9mr27849166edt.51.1655713572457; Mon, 20
 Jun 2022 01:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220620063217.9867-1-yunfei.dong@mediatek.com>
In-Reply-To: <20220620063217.9867-1-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 20 Jun 2022 16:26:01 +0800
Message-ID: <CAGXv+5F8jvzz9DkM4x0MKQ_hZGpYXwQNfOEp_Gvqr__t-WDW+w@mail.gmail.com>
Subject: Re: [PATCH, v2] media: mediatek: vcodec: Initialize decoder
 parameters after getting dec_capability
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Tomasz Figa <tfiga@google.com>, George Sun <george.sun@mediatek.com>, 
	Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, 
	Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_012617_665422_F9C8EF9A 
X-CRM114-Status: UNSURE (   7.99  )
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

On Mon, Jun 20, 2022 at 2:32 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Need to get dec_capability from scp first, then initialize decoder
> supported format and other parameters according to dec_capability value.
>
> Fixes: fd00d90330d1 ("media: mtk-vcodec: vdec: move stateful ops into their own file")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

