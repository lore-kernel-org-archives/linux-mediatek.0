Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22164C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 00:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFO3bBALADbFwWhPkfNHoIeT41mZ9NFXH86k/07wZys=; b=ynLTBN1UvraPCa
	BLN4tFVNQtV07v1Cm7PMkvuEFSpfldibVadzM38Qglb/tN7e7Xm2yCTy4hLYkp87jdsZb6Cb4P1gy
	AP4iFZ4YKakCpKmGYIdz7lbgEgV+kLpKpvZl3r2tBE/k+q+/rX/mlMezmosR/mW3T4Rl1/A24dNLM
	wJ03W28L5fqcFvr6JByAamjhmv/qdT13mtnjRuRYzOIdHm2jlxJ9jqLHyGzQaiX3YAwn+S+lbtGl+
	UQfONq3gzAqeTcAp4Nkl+TSQKHrL7VW31LdZ1a4WBfs6CJ68YLEpeh8JhWaaDpV7aXmjKyFEqv6n7
	RobcBatu4pU59XYHXYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msZWG-00AMxd-Nm; Thu, 02 Dec 2021 00:00:12 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msZWD-00AMtd-BV
 for linux-mediatek@lists.infradead.org; Thu, 02 Dec 2021 00:00:10 +0000
Received: by mail-qt1-x836.google.com with SMTP id l8so25890777qtk.6
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Dec 2021 16:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YzFMI5oWE2o+jFyOP5vbILw8vGd41FKbBUY66oRdEQk=;
 b=HVyEG20SBKF/jqmTGVh7Dh/M0D4FVk1nCzH++iKpmlf4sjOzLgIFju63Hl9Ed9BGhp
 m/HR14Jg/zzhVH6f8hsABaAUF0TrZGvGQ7qOxJWv1GPxlYKLiMTwAiS1Ujvt8ReOCeBW
 Zk0Wf82z+4aMUjNuedm8E4Rft/118UNq0bX0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YzFMI5oWE2o+jFyOP5vbILw8vGd41FKbBUY66oRdEQk=;
 b=M6XdubCi6iBHCnNZHmp9IbSYWAuHF8YtawykX+BIl6pI+OINRewgtApdGr5RIYH+Eg
 /95NdLJXbre/VDoNuteLFayIx3lxcdVjIiFlPpVpqwO0m+GiHWR+2+RnIhFeRkPRtR+W
 b8Wyv29S+olMNW6IC5ZJ3OB95qQjOz6o/c4ei9My0Py+mKwiSgAh7YfLdI12PbuiwT6k
 v5kUh7TO/0oHDlEibOdZ7YmKWyXLPQVdbtlo45gRQ1WCFZ6l936fZ26Ou2YnJqKcRnSQ
 vatfQ5wLh9gkG6Wzt9yGiOUeOR4sVUED/eAyPMN9L9gP2or0sUhMWWZqi/gA8/DndoGU
 x2pA==
X-Gm-Message-State: AOAM531lJwk9hWp7m1WmFiGT+0NOmwXKgzKVNeGhxZ67jr6h0U3436qq
 WJs2OIo5Obtc9ZuLworWy5Dv8oSGIdXSTpAl7ik04w==
X-Google-Smtp-Source: ABdhPJwuwORHr25rSusAmz6Rw8B8e2m0YmLSJeSuvEmJ4pbHkBNQlMFlJSCM9HXMUs06MfzXrMPJl/3J77nepYoci9c=
X-Received: by 2002:ac8:5a10:: with SMTP id n16mr10785131qta.278.1638403205087; 
 Wed, 01 Dec 2021 16:00:05 -0800 (PST)
MIME-Version: 1.0
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-5-yunfei.dong@mediatek.com>
 <8a5afa81-71b7-ba42-d1ce-2bbf82a7e557@collabora.com>
In-Reply-To: <8a5afa81-71b7-ba42-d1ce-2bbf82a7e557@collabora.com>
From: Steve Cho <stevecho@chromium.org>
Date: Wed, 1 Dec 2021 15:59:54 -0800
Message-ID: <CAC-pXoP2nn-DdSJTWDES19UdMp9A5unj9u7Bs=Qw+ex9=HvyVw@mail.gmail.com>
Subject: Re: [PATCH v11, 04/19] media: mtk-vcodec: export decoder pm functions
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_160009_405888_5E843DFE 
X-CRM114-Status: UNSURE (   7.68  )
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

Reviewed-by: Steve Cho <stevecho@chromium.org>

On Wed, Dec 1, 2021 at 4:09 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/11/21 04:41, Yunfei Dong ha scritto:
> > Register each hardware as platform device, need to call pm functions
> > to open/close power and clock from module mtk-vcodec-dec, export these
> > functions.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
