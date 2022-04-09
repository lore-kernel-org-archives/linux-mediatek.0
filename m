Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A519C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Apr 2022 01:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZ+QttjAUjklffVJt59r1R8kd0qudhywOprOkwvGxfk=; b=hwoUcuDExWGO43
	WuIBI9ZPQKrnSahoS/NDoEdVgnuFnffWsIBSjsZj285b8AAfMgBVkUSLTteECmYLZz4Cqzy/HnlO0
	gyYj2vPpLjRk4lFmIpaBzQVS25BUILl6B8k7aTD0UwDTbUz825KAFzJCo8yIwvNV7AY7qxOtje9gl
	BNpE2b5LnJRVD7V5BTBP4ScGw17tFvdwpoENZXz4sa3pAH+4sH3flmtJmInUryskuXNXH7yZCHCO5
	GkyVF3s4xTQCgWGSOjJhecfH5l+kMpeEKIE1XyDpH4XAyOKTOGE4JlkQbvjDrpo3nNFTjwnrXoA54
	MhkJuZt1XK/U9T/4fAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nczYI-001cXg-G9; Sat, 09 Apr 2022 01:06:10 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nczYF-001cX2-V9
 for linux-mediatek@lists.infradead.org; Sat, 09 Apr 2022 01:06:09 +0000
Received: by mail-io1-xd33.google.com with SMTP id e22so12533750ioe.11
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Apr 2022 18:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4KTg8PibcC8KQTgPBqCOsiC3mDCYVERkDcQnsHvYI9I=;
 b=PlFXj0irn77GOUGppxUMOrj5Hf8SW7F+QH+5hFPzJA4Ayryp5TsXijQV+Yocm3Mf69
 SxzfPnQ6Ks07h+kryRHAXafNXA2GJDi6pPDkPaL9PyuddbQw4W2skzJV5djaC2zi5spf
 7TJC1kRisK/n1XLcr61EuxSWU8AjO9wUxJLZrwL+XglcG95hUdDu02AQxhl98flbAXx5
 knwUfIDKQ+1tBIUt32nP4XtiOV7hVoIMYn+PVKJ8iHq6YpwGB8U8rQ/kb/Lk7k2gebzd
 WHyaYhd9nWuBHxE76QzM26ojDh2PAzob3bjO03FAGmNnRIO3n2ri/qWWd7WHlbUVY1oU
 BHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4KTg8PibcC8KQTgPBqCOsiC3mDCYVERkDcQnsHvYI9I=;
 b=QYmj5Iy82izjVz4aazlCc7Vd8SpvbVjFN9cEMGdWMlj9+j/8+NYlZdHKe/8nv0dyGC
 yaoRsPIAuWP/AEljJudoapjNp5qmgLQqiwbJzczsbxYzKlMtCJbknkGxS5aosAZWwJOP
 t2PoIglQMXDnfosi0WSdXgcItrdLdUy9AmEj6nICNrIgpO1kPgneKvcGPcLbVK1ncxOf
 iK6GGv2X5r7qxYQC8dhzg9uDEwLP5dBxTSSkplWhG1y4Ux1C6iAlIj4duwSwrCHPHftJ
 lAUb8g8/CKLpChj8EjZC4HaXYWeNF1EwURlyfqX/8hBC/jnIHStEm24Dfk8dQXQuT7wz
 gqUQ==
X-Gm-Message-State: AOAM5336jD4A0QVUXHzS45h6vTOtn+kKql1GPYJiaHs+J1S5Xx8yu2Da
 6iYk3WwtcREvxviUV555UV4cRFRHENQLQNGdrhUZFg==
X-Google-Smtp-Source: ABdhPJwWV1PbV74ls5FpClgb/DYi825MGm4/TudHWERdAAPIAc2vwYZYHR2MnU2d/hDKv3+J9rr4iNnh56SL2eHKdaA=
X-Received: by 2002:a5d:898b:0:b0:649:5bbb:7d95 with SMTP id
 m11-20020a5d898b000000b006495bbb7d95mr9371853iol.107.1649466362417; Fri, 08
 Apr 2022 18:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <7h5ynj5lhc.fsf@baylibre.com>
In-Reply-To: <7h5ynj5lhc.fsf@baylibre.com>
From: Hsin-Yi Wang <hsinyi@google.com>
Date: Sat, 9 Apr 2022 09:05:36 +0800
Message-ID: <CACb=7PVu6Rt3giBW78LWtkM=9xV6JzZgFSKOmUNx_26O0Wvowg@mail.gmail.com>
Subject: Re: [PATCH V2 00/15] cpufreq: mediatek: Cleanup and support MT8183
 and MT8186
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 krzk+dt@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Tim Chang <jia-wei.chang@mediatek.com>, 
 roger.lu@mediatek.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_180608_057354_D10114A5 
X-CRM114-Status: GOOD (  16.39  )
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

On Sat, Apr 9, 2022 at 5:11 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
>
> > Cpufreq is a DVFS driver used for power saving to scale the clock frequency
> > and supply the voltage for CPUs. This series do some cleanup for MediaTek
> > cpufreq drivers and add support for MediaTek SVS[2] and MediaTek CCI
> > devfreq[3] which are supported in MT8183 and MT8186.
>
> There's no upstream DT for MT8186 and there are no OPPs defined in the
> upstream DT for MT8183.
>
> In order to test this on mainline, could you provide a patch for MT8183
> that adds OPPs to the DT so this can be tested with mainline?
>
The DT change used in the downstream kernel is from here:
https://patchwork.kernel.org/project/linux-mediatek/patch/1616499241-4906-9-git-send-email-andrew-sh.cheng@mediatek.com/
Might need some update (eg. add the cci property in cpu) though.
Rex, you can also include the 8183 DT change in the next version since
most of the mt8183 dts are in the mainline.

Thanks

> Thanks,
>
> Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
