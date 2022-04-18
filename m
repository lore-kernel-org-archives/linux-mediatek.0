Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE9DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 06:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cF4iexXPs4luZFvyIIVq/v7Z1ZBqqGF0Nh9MUBEqvM=; b=baC7brtK9kIlak
	TlcUJHNLrsHgrfButWjJUJ3awVvVw/8Z9qxgYVcWFAbWbWYFvZupQn4zSoPR/nPHXFHlrBkQeqcZO
	GZ7zhRV4E5vAI+wvMYHEG0OkvVHxxY4L41ehDMuPGscDY8m7IicQvCM4dk7qrtirCmckw8mlTrtWH
	tpmQoxLOpBQapArjC+Vi7j6ITIcZS1DJ457qbGEADPvno6Cru9Zza5MSGQNCulD1G0yJlabPieysM
	pZZ4q4qKmPjHqhYBnOi4fUKkVZGn9kUNn2o7oDBJdEcvtqMKmwXUhbLyBqUYP8YSyGfYu94Tux+Wn
	E4BKVqLGI+wcEilr+6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngKh0-00Fkxt-LG; Mon, 18 Apr 2022 06:16:58 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngKgx-00Fkwg-Nf
 for linux-mediatek@lists.infradead.org; Mon, 18 Apr 2022 06:16:57 +0000
Received: by mail-ed1-x532.google.com with SMTP id c6so16464628edn.8
 for <linux-mediatek@lists.infradead.org>; Sun, 17 Apr 2022 23:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R0p9SyM2Gw6ezgsQBgHwJlt6cnUQdSZIr2Akmm0cjIc=;
 b=Bur8D9FzAagdjm0aTmG8lxdbZQSBX+S1iB2gHK6R/tkzttSR9FtCfwBNjrIvsxJkS5
 bZdSK7WCvDEnspxJx4B0zK+YQidIQh0FdRHVycq3xBIYuelw2lrcYBA9pVFOclpqNA7Q
 o6rr6cGN0F8093vbW3/OHtdLHM81o5SRn4cKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R0p9SyM2Gw6ezgsQBgHwJlt6cnUQdSZIr2Akmm0cjIc=;
 b=GOP28dwyHPtoyKze/l4X3BiB2iRB9Veh/c6f3xQMC8aIQYH27tqf4C4TSI2eVsBX9Z
 3wBYMQTexyeisHAPSziPdmO2L3kg+hlxAVE9Cv6ZrelO2sLeh8UCtx5d03gHV+TFnump
 3Qg9X9wSIL9WEjIyIIj+hPJUTTHap0sJnQ+m6w7LBvILH7S+//M9u4gVbMZDME0FwidQ
 /OgKaMSTAu8haylRWAX+Z/8twoEnUXhz5o+mnhwsObcwMc09RbnsaGaRTgCySy8cxjct
 kJ3oVdtIoLmv7K/LUXhUv90wGRXZg2BWhP4X8RQrQRDk9Srjp59+vqdslUHXl24lgmDB
 pTSw==
X-Gm-Message-State: AOAM5332CuEmyp2LlToFHW1IWnTwTlOQ9M5CRHUNB4hWI4PRbmuYi8Mx
 iYapgT8AbqRfHkWpcWY5x36ag+evoe+IaaZW
X-Google-Smtp-Source: ABdhPJx8JOFqEVUVIg9Y+LdIZ4Z3hTtQ4jHBwzntDHEVDrCBK+kaRPIxPQoPRu8gZfKp1hLRNFwz9w==
X-Received: by 2002:aa7:d394:0:b0:41d:799e:e5ed with SMTP id
 x20-20020aa7d394000000b0041d799ee5edmr10768509edq.347.1650262610523; 
 Sun, 17 Apr 2022 23:16:50 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 bm7-20020a0564020b0700b004230dd33015sm4151851edb.57.2022.04.17.23.16.47
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 23:16:47 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so8283686wmn.1
 for <linux-mediatek@lists.infradead.org>; Sun, 17 Apr 2022 23:16:47 -0700 (PDT)
X-Received: by 2002:a7b:cbc1:0:b0:38e:7c42:fe38 with SMTP id
 n1-20020a7bcbc1000000b0038e7c42fe38mr14247667wmi.51.1650262606781; Sun, 17
 Apr 2022 23:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220414025023.11516-1-Nick.Fan@mediatek.com>
 <20220414025023.11516-2-Nick.Fan@mediatek.com>
In-Reply-To: <20220414025023.11516-2-Nick.Fan@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 18 Apr 2022 14:16:10 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni=pHPDAJUV2b=qWm-O26fS37wQjuL014eKoE491K6wGQ@mail.gmail.com>
Message-ID: <CAC=S1ni=pHPDAJUV2b=qWm-O26fS37wQjuL014eKoE491K6wGQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: mt8192: Add node for the Mali GPU
To: Nick Fan <Nick.Fan@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, srv_heupstream@mediatek.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, 
 wenst@chromium.org, alyssa.rosenzweig@collabora.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_231655_796478_0711A1E1 
X-CRM114-Status: UNSURE (   8.73  )
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

On Thu, Apr 14, 2022 at 10:53 AM Nick Fan <Nick.Fan@mediatek.com> wrote:
>
> Add a basic GPU node for mt8192.
>
> Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
