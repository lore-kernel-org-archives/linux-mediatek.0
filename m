Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E65CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 19:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOarTMSYQdRU9hoEtqqDDKNrO/3pxchSsAthk/AOGWs=; b=ddMabkH+p+LJYa
	HTK0rVqYEtlNttDu2IymTl4BfA9h4eXQw4znsImCqZ2f7dfThzILIwQ5q1gVZeg8FCtdnsHfoyGJV
	XIwBiUgppJvcAtlRMoZQqnraTcA8jbtFfFW+e8iKZPqNDxUrOMzztFwUcSQodztvIrACGvhB/IADi
	KvIF0AdwwrrHd9C4t1AWTPTh7IwSpfCnCuaDfzykc4tJLJk0eHBMUvAlMZWJZEgiINrgtFuerPOC6
	DSbx2RaD95w0ucXHH1NesDmHHcEIFseE1d+S9AoXNMzvsZOnqAKHz4uVfyyiuoFh+ajJs0vbXl4ja
	zMMk2ab+bJLbfBVTmb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7jFx-003b0R-5T; Wed, 12 Jan 2022 19:26:01 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7jFv-003ayt-EC
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 19:26:00 +0000
Received: by mail-qt1-x82b.google.com with SMTP id y17so4201601qtx.9
 for <linux-mediatek@lists.infradead.org>; Wed, 12 Jan 2022 11:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oqb3porLNx+xL8LPszd6cBs+HKnYfYssZ8m+DqN9VEA=;
 b=JblWP2i4DLSV2FyMNw36nU485keGSlI6pKsZ/cvydLVu6L3v0/mVIV+DFzlwPb5zqC
 6HLM7hm1YzH1Bm7u5uyEHrtXlt5U/fWRwORt7j5BvzgJCFinC4s6CWBXrE1tP2avSuYZ
 IWhxIPyAx8uAN+UB91LIGGdJXalmzTlHGbYdqqBhTeTLmfFuvbICHwUxpeIts2ilbLfw
 06/ABRLD/vLSsH1ewNN3zca9VKlBgkyEEWQz1M0vJ4W9qfu6+AKuqBKqej59yUksH5IT
 eMsYR86MqkHfuoX+UVtue+m28tXOamjsgWZJaWSF7Y7ke8I9FXDbih/bPJxLkDkdBZC0
 gK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oqb3porLNx+xL8LPszd6cBs+HKnYfYssZ8m+DqN9VEA=;
 b=k/hX21bJQnHtAZd4m4x9WbwlLd5CCvZQR4DsZtyU7oywXgEEgvS9MVZwqQwOoWgHs8
 WBGPlk0nVx1uu3gBNkJ7/2J11Kr8aspWTCl6pt9HmXMA6TNLNWLHQ2+ACCSdtHwoOmJ8
 AkggIWz0J+W9EKhhkeqfnscF8MFv9p1uHq69Tsjoff9RgWTF1EKRxuQXZJJHp9AQTkg8
 gOtsDQJrkxSVwJVYqNqhmAR9Fj0pMZcoL3zz+IsoQt87QNDII9TaI3GDaRxrGB8XP4k+
 VwgxQhpVlmdxDQ1+Y6+EHA9/f+JHjZRbNb4NyO18/gQb+mokfr7nk30IS3OxRCHf8YF7
 4q4A==
X-Gm-Message-State: AOAM531KsnpGrcO1W7jUM/VD/WWsRm9rtXATXImeWWlJ3bBISno34XGy
 FQBz46JC8xB89cyp/b5XgQ+9cy2KfLXJu1ZKcgg0FQ==
X-Google-Smtp-Source: ABdhPJyY1HDRNDcRGH2Y8HwDgStmoOsQvc5QbGqYHkwVCXfhTw8Oky+Gr6lvVhzr2CXUzxeJWT5FMQtyKlZBVm29bSw=
X-Received: by 2002:ac8:584a:: with SMTP id h10mr866476qth.615.1642015554496; 
 Wed, 12 Jan 2022 11:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20220112113247.29135-1-allen-kh.cheng@mediatek.com>
 <20220112113247.29135-2-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220112113247.29135-2-allen-kh.cheng@mediatek.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 12 Jan 2022 11:25:42 -0800
Message-ID: <CAOReqxga6hLXs4P2hD1k_X01AWesQBae5AhJTLtiK_3Ndex_Sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] firmware: mediatek: add adsp ipc protocol interface
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Linux-ALSA <alsa-devel@alsa-project.org>, 
 Tzung-Bi Shih <tzungbi@google.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 sound-open-firmware@alsa-project.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_112559_506002_7BC14212 
X-CRM114-Status: GOOD (  10.90  )
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

On Wed, Jan 12, 2022 at 3:43 AM allen-kh.cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
>
> Some of mediatek processors contain
> the Tensilica HiFix DSP for audio processing.
>
> The communication between Host CPU and DSP firmware is
> taking place using a shared memory area for message passing.
>
> ADSP IPC protocol offers (send/recv) interfaces using
> mediatek-mailbox APIs.
>
> We use two mbox channels to implement a request-reply protocol.
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
